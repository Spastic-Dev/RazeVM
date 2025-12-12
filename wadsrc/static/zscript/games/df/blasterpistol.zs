class BlasterPistol : DarkForcesWeapon
{
    Default
    {
        // Identification
        Weapon.SlotNumber 1;
        
        // Ammo
        Weapon.AmmoType "EnergyCell"; // Requires a custom 'EnergyCell' class
        Weapon.AmmoUse 1;
        Weapon.AmmoGive 50;
        
        // Pickup/Sound
        Inventory.PickupMessage "You got the Blaster Pistol!";
        Tag "Blaster Pistol";
    }

    // --- Primary Fire: Rapid, low-power shots ---
    States
    {
      Ready:
        PIST A 1 A_WeaponReady;
        Loop;
        
      Deselect:
        PIST A 1 A_Lower;
        Loop;
        
      Select:
        PIST A 1 A_Raise;
        Loop;

      Fire:
        // Basic shoot state. Uses A_FireCustomMissile for a custom projectile.
        PIST B 0 A_StartSound("pistol/fire"); // Custom sound
        PIST B 1
        {
            A_FireCustomMissile("BlasterProjectile_Primary", 0, 10, 0, 0);
            A_GunFlash();
            A_Recoil();
        }
        PIST C 1 A_Refire;
        PIST A 1;
        Goto Ready;
        
      Flash:
        // Flash state for the primary fire
        PISF A 2 Bright;
        Stop;

      // --- Secondary Fire: High-power, high-cost shot (AltFire) ---
      AltFire:
        PIST D 0 A_JumpIfNoAmmo("Ready"); // Check ammo before firing
        PIST D 0 A_TakeInventory("EnergyCell", 5); // Consumes 5 cells
        PIST E 0 A_StartSound("pistol/altfire"); // Custom alt-fire sound
        PIST E 3
        {
            A_FireCustomMissile("BlasterProjectile_Secondary", 0, 10, 0, 0);
            A_GunFlash();
            A_Recoil();
        }
        PIST F 1;
        Goto Ready;
    }
}

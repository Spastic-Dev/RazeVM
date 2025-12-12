class AssaultCannon : DarkForcesWeapon
{
    Default
    {
        // Identification
        Weapon.SlotNumber 2;

        // Ammo (Assumes a custom 'AssaultAmmo' class)
        Weapon.AmmoType "AssaultAmmo";
        Weapon.AmmoUse 1;
        Weapon.AmmoGive 50;

        // Pickup/Sound
        Inventory.PickupMessage "You got the Assault Cannon!";
        Tag "Assault Cannon";
    }

    // --- Primary Fire: Slow, accurate, high-damage projectile ---
    States
    {
      Ready:
        ASLT A 1 A_WeaponReady;
        Loop;

      Fire:
        ASLT B 0 A_StartSound("assault/fire_slow");
        ASLT B 3
        {
            A_FireCustomMissile("AssaultProjectile_Primary", 0, 10, 0, 0);
            A_GunFlash();
            A_Recoil(5);
            A_ZoomRecoil(0.98); // Less screen movement for slow fire
        }
        ASLT A 3;
        Goto Ready;

      Flash:
        ASLF A 2 Bright;
        Stop;

      // --- Secondary Fire: Rapid, less accurate, rapid-fire burst (AltFire) ---
      AltFire:
        ASLT C 0 A_StartSound("assault/fire_fast");
        ASLT C 0 A_TakeInventory("AssaultAmmo", 1);
        ASLT C 1
        {
            // Rapid-fire shot with some spread (3 degrees variance)
            A_FireCustomMissile("AssaultProjectile_Secondary", 0, 10, 0, 3);
            A_GunFlash();
            A_Recoil(2);
            A_ZoomRecoil(0.9); // More screen movement for rapid fire
        }
        ASLT C 0 A_Refire("AltFire"); // Allows holding down the button for full auto
        ASLT A 1;
        Goto Ready;
    }
}

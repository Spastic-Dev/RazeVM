// dfweapons.zs

class DarkForcesWeapon : Weapon
{
    // Define properties common to all DF weapons
    Default
    {
        Weapon.SelectionOrder 5000; // Place after Doom's default weapons
        Weapon.SlotNumber 1;        // All DF weapons can be categorized into slots
        
        // Custom flags can go here (e.g., if DF weapons handle ammo differently)
    }
}

// KyleKeteran.zs

class KyleKeteran : PlayerPawn
{
    // Define properties specific to Kyle's Dark Forces iteration
    Default
    {
        // Player properties inherited from Dark Forces
        Player.DisplayName "Kyle Katarn (Dark Forces)";
        Player.StartItem "BlasterPistol", 1; // Starting weapon
        Player.StartItem "EnergyCell", 50;   // Starting ammo
        
        // Match player speed more closely to Dark Forces (may need fine-tuning)
        Speed 1.1; // Slightly faster/different feel than Doomguy
        
        // Define Dark Forces health and armor settings (default 100/100)
        Health 100;
        Player.MaxHealth 100;
        
        // Custom movement flags (e.g., if you want to allow jumping later)
        +JUMPSERIAL
    }
    
    // Additional Inventory and Powerups for Dark Forces items
    // (This section would require defining custom inventory classes first, e.g., 'DF_Armor', 'DF_LightAmplifier')
    
    /*
    States
    {
        Spawn:
            PLYR A 1;
            Loop;
    }
    */
}

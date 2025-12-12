// dfprojectiles.zs

class BlasterProjectile_Primary : FastProjectile
{
    Default
    {
        Radius 5; Height 5;
        Speed 100;
        Damage 5; // Low damage
        RenderStyle "Add";
        Alpha 0.9;
        -NOGRAVITY
        +FORCEXYBILLBOARD // For a classic look
        
        // Set the color to a deep blue/cyan
        Color "00FFFF";
    }
    
    States
    {
      Spawn:
        BLST A 1 Bright; // Assuming 'BLST' sprite
        Loop;
        
      Death:
        EXPL A 3 Bright; // Assuming 'EXPL' sprite
        Stop;
    }
}

class BlasterProjectile_Secondary : BlasterProjectile_Primary
{
    // Inherits base properties, but increases damage
    Default
    {
        Damage 15; // High damage
        Speed 80;  // Slightly slower
        Color "00AAFF";
    }
}

// ... and then define the Assault Cannon projectiles similarly

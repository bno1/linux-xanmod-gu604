DefinitionBlock ("", "SSDT", 1, "CUSTOM", "CSC3551", 0x00000001)
{
    External (_SB_.PC00.SPI0, DeviceObj)
    External (_SB_.PC00.SPI0.SPK1, DeviceObj)

    Scope (_SB.PC00.SPI0.SPK1)
    {
        Name (_DSD, Package ()
        {
            ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
            Package ()
            {
                Package () { "cirrus,dev-index", Package () { Zero, One }},
                Package () { "reset-gpios", Package () {
                    SPK1, One, Zero, Zero,
                    SPK1, One, Zero, Zero
                } },
                Package () { "spk-id-gpios", Package () {
                    SPK1, 0x02, Zero, Zero,
                    SPK1, 0x02, Zero, Zero
                } },
                Package () { "cirrus,speaker-position", Package () { Zero, One } },
                // gpioX-func: 0 not used, 1 VPSK_SWITCH, 2: INTERRUPT, 3: SYNC
                Package () { "cirrus,gpio1-func", Package () { One, One } },
                Package () { "cirrus,gpio2-func", Package () { 0x02, 0x02 } },
                // boost-type: 0 internal, 1 external
                Package () { "cirrus,boost-type", Package () { One, One } }
            }
        })
    }

    Scope (_SB.PC00.SPI0)
    {
        Name (_DSD, Package ()
        {
            ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
            Package ()
            {
                Package () { "cs-gpios", Package () { 
                    Zero,                    // Native CS
                    SPK1, Zero, Zero, Zero   // GPIO CS
                } }
            }
        })
    }
}

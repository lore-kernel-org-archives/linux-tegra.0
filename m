From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: GPIO/IRQ expander cannot map interrupt
Date: Fri, 25 Nov 2011 11:45:11 +0100
Message-ID: <20111125104511.GA16748@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The following is an extract from a device tree of a Tegra2-based board I'm
working on:

	i2c@7000c000 {
		clock-frequency = <400000>;

		keypad1: sx8634@2b {
			compatible = "sx8634";
			reg = <0x2b>;
			interrupt-parent = <&gpioext>;
			interrupts = <2>;
		};

		gpioext: gpio-ad8p@41 {
			compatible = "gpio-ad8p";
			reg = <0x41>;
			interrupts = <320>; /* gpio PU0 */

			gpio-controller;
			#gpio-cells = <2>;

			interrupt-controller;
			#interrupt-cells = <1>;
		};
	};

	i2c@7000c400 {
		clock-frequency = <400000>;

		keypad2: sx8634@2b {
			compatible = "sx8634";
			reg = <0x2b>;
			interrupt-parent = <&gpioext>;
			interrupts = <3>;
		};
	};

So basically I have a GPIO/IRQ expander on the first I2C bus (gpioext) to
which the two keypad (sx8634) chips are connected. They use GPIOs 2 and 3 of
the expander as interrupts.

This all seems to work partially: the gpioext is properly detected as parent
for both keypad controllers during I2C device registration. Within the
gpio-ad8p driver I register an IRQ domain (using irq_domain_add_simple()) in
order to allow the OF code to properly map the IRQs for the controller's
children.

The problem, however, is that the keypad I2C devices are registered before the
gpioext device is probed, which results in a situation where the IRQs cannot
be mapped because the gpioext device hasn't had a chance to register the IRQ
domain yet.

Is there anything I can do to make this work? Perhaps the OF code needs to be
patched to ensure that devices which have the gpio-/interrupt-controller
properties are always probed before other devices are registered?

Thierry

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7PcbcACgkQZ+BJyKLjJp8dlACfUg0vcFqATN5FiAzTyJphmFpO
/mQAnRHSjeSDNkyWq48pY7m8OHmmysKK
=GD9P
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: obtaining a regulator from a phandle
Date: Mon, 5 Mar 2012 16:21:57 +0100
Message-ID: <20120305152157.GA12927@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm working on getting DT support for PCIe on Tegra working. The Tegra PCIe
controller needs a specific voltage supplied by a regulator on the board th=
at
I use (Harmony-compatible), so what I did was add DT support for the PMU
(tps6586x) to provide the corresponding regulator:

	pmu: tps6586x@34 {
		[...]
		regulators {
			...
			ldo0_reg: ldo0 {
				regulator-min-microvolt =3D <3300000>;
				regulator-max-microvolt =3D <3300000>;
			};
		};
		[...]
	};

Within the device node of the PCIe controller, I reference the ldo0 regulat=
or
like so:

	pcie@80000000 {
		pex-clk-supply =3D <&ldo0_reg>;
	};

This all works well, except there seems to be no API to obtain a regulator
=66rom the DT phandle. I'm wondering whether this is because nobody has had=
 any
use for it or whether I'm using it wrongly.

I could possibly work around this by giving the ldo0 an explicit name via t=
he
regulator-name property and then look up that property from the phandle and
then obtain a reference to the regulator by calling the normal regulator_ge=
t()
and passing the name. That seems wasteful, though, because I already have a
direct link to the regulator (via its struct device_node) and all I really
need is to look up the corresponding struct regulator.

So my question really is if it would be acceptable to add such a helper, or
whether I have completely misunderstood how this works. In the latter case,
could anyone point me in the right direction?

Thierry

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9U2hUACgkQZ+BJyKLjJp/oLQCfbiXZusw+m1c87uC0A9oMI75a
PQgAnA8hyhaU8bSnrya4ABKSmbqWXYYV
=n+I0
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

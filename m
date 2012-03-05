From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: obtaining a regulator from a phandle
Date: Mon, 5 Mar 2012 17:55:14 +0100
Message-ID: <20120305165514.GA21298@avionic-0098.adnet.avionic-design.de>
References: <20120305152157.GA12927@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BE861C09@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BE861C09-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Monday, March 05, 2012 8:22 AM:
> > I'm working on getting DT support for PCIe on Tegra working. The Tegra =
PCIe
> > controller needs a specific voltage supplied by a regulator on the boar=
d that
> > I use (Harmony-compatible), so what I did was add DT support for the PMU
> > (tps6586x) to provide the corresponding regulator:
> ...
> > Within the device node of the PCIe controller, I reference the ldo0 reg=
ulator
> > like so:
> >=20
> > 	pcie@80000000 {
> > 		pex-clk-supply =3D <&ldo0_reg>;
> > 	};
> >=20
> > This all works well, except there seems to be no API to obtain a regula=
tor
> > from the DT phandle.
>=20
> regulator_get(pcie_dev, "pex-clk") should work.

Ah, I see. That would call regulator_dev_lookup(), which would call
of_get_regulator() which will lookup the pex-clk-supply property. I
will give that a shot.

> Of course, the PCIe host on Tegra isn't yet a platform device, so would
> have to be converted.

I've already converted that. I was going to send the patch when I've tested
that this works in a DT setup as well. So far I have only tested it on non-
DT Harmony.

Thierry

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9U7/IACgkQZ+BJyKLjJp8GbACeJm3xKHBKYAxCfHVb7mSk7ir+
8OYAoJHKVJrMxX+/BwwfoS6Yeg2cy1jT
=YBMB
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

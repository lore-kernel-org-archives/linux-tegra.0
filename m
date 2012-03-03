From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 07/10] arm/tegra: Add PWFM controller device tree
 probing
Date: Sat, 3 Mar 2012 23:54:05 +0100
Message-ID: <20120303225404.GC6661@avionic-0098.mockup.avionic-design.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <1329923841-32017-8-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E67@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E67-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Wednesday, February 22, 2012 8:17 AM:
> > Add auxdata to instantiate a device tree for the PWFM controller and
> > include a corresponding node in the device tree.
>=20
> > diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30=
=2Edtsi
>=20
> > +	pwm: pwm@7000a000 {
> > +		compatible =3D "nvidia,tegra20-pwm";
> > +		reg =3D <0x7000a000 0x100>;
> > +		#pwm-cells =3D <2>;
> > +	};
>=20
> The compatible value probably should list both Tegra30 and Tegra20, so
> we can know exactly which HW is present, just in case we need to turn
> on some bug-fix only for one of the variants:
>=20
>     compatible =3D "nvidia,tegra30-pwm", "nvidia,tegra20-pwm";

I'm confused. If I know exactly that the hardware is Tegra30 (which it
definitely should be if I include tegra30.dtsi), then why list "tegra20-pwm"
as compatible?

Or did you mean to list tegra30-pwm as compatible value in the PWM driver?

> Could you also write binding documentation, in particular explaining
> what the two pwm-cells are specifically for Tegra:
>=20
> Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
>=20
> (although perhaps that'd be part of the previous patch which implements
> the driver)

Actually for Tegra the values would be those documented in the generic
binding because Tegra uses of_pwm_simple_xlate(). Does it still make sense =
to
add a Tegra-specific binding?

Thierry

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9SoQwACgkQZ+BJyKLjJp/kiQCfd0NYL53dTVgm77J/jF4zKZrx
6EgAoIqGrvZOIFEX5RW1T6q7G3/bM6XK
=x0wv
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--

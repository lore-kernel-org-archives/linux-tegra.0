From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 07/10] arm/tegra: Add PWFM controller device tree
 probing
Date: Mon, 5 Mar 2012 19:15:55 +0100
Message-ID: <20120305181555.GA22459@avionic-0098.adnet.avionic-design.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <1329923841-32017-8-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E67@HQMAIL01.nvidia.com>
 <20120303225404.GC6661@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BE861C46@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BE861C46-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Saturday, March 03, 2012 3:54 PM:
> > I'm confused. If I know exactly that the hardware is Tegra30 (which it
> > definitely should be if I include tegra30.dtsi), then why list "tegra20=
-pwm"
> > as compatible?
> >=20
> > Or did you mean to list tegra30-pwm as compatible value in the PWM driv=
er?
>=20
> Standard practice is to list the exact model of the HW as the first entry
> in compatible in the .dts file:
>=20
>     nvidia,tegra30-pwm
>=20
> This is so that the DT always describes exactly which HW model is actually
> present, so that if HW-model-specific WARs/... are required in the future,
> the DT already lists that information up-front.
>=20
> Then additionally list any older HW models that this HW is also compatible
> with:
>=20
>     nvidia,tegra20-pwm
>=20
>=20
> This allows the driver to list just nvidia,tegra20-pwm but still bind
> to DT nodes that are for later HW.
>=20
> So, in other words, you end up with the following in the .dts/.dtsi file:
>=20
>     compatible =3D "nvidia,tegra30-pwm", "nvidia,tegra20-pwm";

Okay, that makes sense now. For some reason I thought you were suggesting to
put the same into tegra20.dtsi as well. I'll add nvidia,tegra30-pwm to the
compatible list in the driver and list both values in the tegra30.dtsi.
Thanks for explaining.

> > > Could you also write binding documentation, in particular explaining
> > > what the two pwm-cells are specifically for Tegra:
> > >
> > > Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
> > >
> > > (although perhaps that'd be part of the previous patch which implemen=
ts
> > > the driver)
> >=20
> > Actually for Tegra the values would be those documented in the generic
> > binding because Tegra uses of_pwm_simple_xlate(). Does it still make se=
nse to
> > add a Tegra-specific binding?
>=20
> There should still be a Tegra-specific binding. Without it, there's no
> definite way to know whether the "standard" properties actually apply,
> or someone simply forgot to document it.

Understood. I assume that both the Tegra20 and Tegra30 variants should have
explicit bindings then as well, right?

Thierry

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9VAtsACgkQZ+BJyKLjJp/z6QCbBWwynajXvEr6lwjVzqlzrZj6
FbQAnjAtI9l6yPrnQiEAuWmwHtPx9ssm
=yMMF
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--

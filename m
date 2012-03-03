From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 04/10] arm/tegra: Fix PWM clock programming
Date: Sat, 3 Mar 2012 23:47:51 +0100
Message-ID: <20120303224751.GB6661@avionic-0098.mockup.avionic-design.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <1329923841-32017-5-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E52@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4795719046094957232=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E52-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============4795719046094957232==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Wednesday, February 22, 2012 8:17 AM:
> > PWM clock source registers in Tegra 2 have different clock source selec=
tion bit
> > fields than other registers.  PWM clock source bits in CLK_SOURCE_PWM_0=
 register
> > are located at bit field bit[30:28] while others are at bit field bit[3=
1:30] in
> > their respective clock source register.
> >=20
> > This patch updates the clock programming to correctly reflect that, by =
adding a
> > flag to indicate the alternate bit field format and checking for it when
> > selecting a clock source (parent clock).
>=20
> tegra30_clocks.c needs this change too, although on Tegra30, it's bits
> 29:28 for the PWM, and bits 31:30 for non-PWM.

Okay, I'll add code for Tegra30 in the next version. I won't be able to test
that at all because I don't have any Tegra30 hardware.

> > diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/=
tegra2_clocks.c
>=20
> +#define PERIPH_CLK_SOURCE_4BIT_MASK	(7<<28)
> +#define PERIPH_CLK_SOURCE_4BIT_SHIFT	28
>=20
> Why is this (and the flag that enables it) called "4 bit"; the existing
> code supports a 2-bit mux field (4-values), whereas this new code supports
> a 3-bit field (potentially 8 values, but only 5 actually assigned).
> Can this be renamed something more accurate, especially since on Tegra30
> the difference is only the bit position of the field, not the number of
> bits in the field.

This is taken directly from the Chromium tree, so I don't really know why
that name was chosen. But since the PWM clock source register seems to be t=
he
only exception, how about calling the flag PWM_CLK and prefix the shift and
mask with PWM_CLK_SOURCE_ instead?

> > @@ -908,9 +910,16 @@ static void tegra2_periph_clk_init(struct clk *c)
> >  	u32 val =3D clk_readl(c->reg);
> >  	const struct clk_mux_sel *mux =3D NULL;
> >  	const struct clk_mux_sel *sel;
> > +	u32 shift;
> > +
> > +	if (c->flags & PERIPH_SOURCE_CLK_4BIT)
> > +		shift =3D PERIPH_CLK_SOURCE_4BIT_SHIFT;
> > +	else
> > +		shift =3D PERIPH_CLK_SOURCE_SHIFT;
>=20
> I think you should assign a "mask" variable here too...
>=20
> > +
> >  	if (c->flags & MUX) {
> >  		for (sel =3D c->inputs; sel->input !=3D NULL; sel++) {
> > -			if (val >> PERIPH_CLK_SOURCE_SHIFT =3D=3D sel->value)
> > +			if (val >> shift =3D=3D sel->value)
> >  				mux =3D sel;
>=20
> Because in the new case, bit 31 isn't part of the field, so just
> shifting doesn't isolate the mux field. In practice, this probably isn't
> an issue since bit 31 is undefined, but better to be safe than sorry...

Okay, I'll fix that as well.

Thierry

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9Sn5cACgkQZ+BJyKLjJp+j/QCeJ9gx2sd/etpPggkDMY9kPeos
nDgAnReCUHw7I7jTqpSaC4P67236KTzC
=QXSa
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--

--===============4795719046094957232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4795719046094957232==--

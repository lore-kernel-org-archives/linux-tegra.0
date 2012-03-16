From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 09/10] pwm: Add PXA support
Date: Fri, 16 Mar 2012 09:29:34 +0100
Message-ID: <20120316082934.GC6458@avionic-0098.mockup.avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-10-git-send-email-thierry.reding@avionic-design.de>
 <20120316081222.GE7758@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120316081222.GE7758-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Shawn Guo wrote:
> On Wed, Mar 14, 2012 at 04:56:32PM +0100, Thierry Reding wrote:
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> > Changes in v3:
> >   - update PWM ops for changes in patch 2
> >=20
> >  arch/arm/plat-pxa/Makefile |    1 -
> >  arch/arm/plat-pxa/pwm.c    |  304 ------------------------------------=
--------
> >  drivers/pwm/Kconfig        |    9 ++
> >  drivers/pwm/Makefile       |    1 +
> >  drivers/pwm/pwm-pxa.c      |  244 +++++++++++++++++++++++++++++++++++
> >  5 files changed, 254 insertions(+), 305 deletions(-)
> >  delete mode 100644 arch/arm/plat-pxa/pwm.c
> >  create mode 100644 drivers/pwm/pwm-pxa.c
> >=20
> The patch should be generated with "git format-patch -M", so that we
> can see the diff like below.=20
>=20
> --- a/arch/arm/plat-pxa/pwm.c
> +++ b/drivers/pwm/pwm-pxa.c

Yes, Arnd already mentioned that in the last round but I forgot. It usually
takes me a couple of weeks to prepare the next version and I try to keep a
list of TODOs but that doesn't seem to be efficient enough yet.

> -int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns)
> +static int pxa_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> +                         int duty_ns, int period_ns)
>  {
> +       struct pxa_pwm_chip *pc =3D to_pxa_pwm_chip(chip);
>         unsigned long long c;
>         unsigned long period_cycles, prescale, pv, dc;
> +       unsigned long offset;
>=20
> -       if (pwm =3D=3D NULL || period_ns =3D=3D 0 || duty_ns > period_ns)
> +       if (period_ns =3D=3D 0 || duty_ns > period_ns)
>                 return -EINVAL;
>=20
> Then I will have a question why "pwm =3D=3D NULL" check is removed?

Actually, as I mentioned in another mail the idea was to put these kinds of
checks into the core. They are still missing from the core, though.

Thierry

--bAmEntskrkuBymla
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9i+e4ACgkQZ+BJyKLjJp9lNwCdE9JTr7yuYWc+lMoofAXZox0D
vmEAoIVvUU96r/aBX21W4sO1/7xjz4sQ
=k0YR
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--

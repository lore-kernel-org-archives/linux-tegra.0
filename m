From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Mon, 4 Nov 2013 08:18:28 -0800
Message-ID: <20131104161828.GK2493@sirena.org.uk>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
 <20131031162029.GF2493@sirena.org.uk>
 <527737C5.5080901@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JUntuW47Nl+13QpX"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <527737C5.5080901-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--JUntuW47Nl+13QpX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 04, 2013 at 01:59:33PM +0800, Wei Ni wrote:

> I didn't find the generic DT init code, do you mean to add it in the
> customize_machine() in arch/arm/kernel/setup.c ? But it isn't only for
> DT systems.

We can do it as part of parsing the DT or deciding to parse the DT.

> How about to add it in the regulator subsystem? I mean we can add
> following codes in the regulator_init() routine in driver/regulator/core.c:
> +#ifdef CONFIG_OF
> +regulator_has_full_constraints();
> +#endif

No, that's not good - we can have DT enabled but boot on a non-DT board.

--JUntuW47Nl+13QpX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSd8jRAAoJELSic+t+oim9MK0P/2gdtHKMEL8INXlqGcQs8TOM
dvXCKYeXxVdtw+kjEMBmMr5FbbvaRVlLHGYWW7Gimb2URxkZncnmMmDwGLBYVlNS
31Z8njUOYY/SSLVfied01R5joRwLSpHzzL4Ng2k+b3gMUAYPeyQyoXKjaI0d4pJH
zIbnR4a1sHTbaGlszl+4VWNAEjSUDleCjUdpcnG/5jAcFPSXM0kxdYndO7/UOdXN
NmppNXx5anc78gvZSRLAzxzaFMQPsbBpIkASmYZivhnj1OhwqJ0MTSWMRX3Jph6+
WfBcVwH4BO8JuOgN/V+3BeAKhIiMUbEQZMi3zXYt54MgNFy74aaczapVLJO8bABp
YxsEhiyabkH/J/1bxaWFQhdTzBTxAGehCzcLV4Dd0D/TDooy7KZ0Q/B2hDDc9ozG
EMFUf0OxcuM05w+fnc+5/qej6NROkweGpPnFD7zQnNkI7qg7cYeApLFwwpeBM38O
dUlJduwAHWfWwGv4IzLGhVeVmrjvBY2ZnCWkL5HNo2EQoS9285o/EajQDR8zmISm
oKTJFeqU4b0hcshLaEVwNBb+l6To4UX2R5vn0d+/ZpkJjfBOaQiHp6MaYMngPs35
8DdVjFCsM0o1cX22wp/AZ7Zgi3UodTCzStWV/maevRD2hubAycvOfaopAd60eKdw
bm0DGgsXtCtDVh/wfjb7
=K4HX
-----END PGP SIGNATURE-----

--JUntuW47Nl+13QpX--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/11] ARM: tegra114: hook tegra_tear_down_cpu function
Date: Thu, 27 Jun 2013 12:13:36 +0200
Message-ID: <20130627101335.GB15081@mithrandir>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
 <1372152475-18617-7-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1372152475-18617-7-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2013 at 05:27:50PM +0800, Joseph Lo wrote:
> Hooking tegra_tear_down_cpu for Tegra114 for supporting cluster power
> down when CPU cluster suspneded in LP2.
>=20
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/pm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
> index 94e69be..a0668a2 100644
> --- a/arch/arm/mach-tegra/pm.c
> +++ b/arch/arm/mach-tegra/pm.c
> @@ -52,6 +52,7 @@ static void tegra_tear_down_cpu_init(void)
>  			tegra_tear_down_cpu =3D tegra20_tear_down_cpu;
>  		break;
>  	case TEGRA30:
> +	case TEGRA114:
>  		if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC))
>  			tegra_tear_down_cpu =3D tegra30_tear_down_cpu;

This is getting a little weird. Suppose I want to build a Tegra114 only
kernel. With the above code it means the tegra_tear_down_cpu won't be
hooked because ARCH_TEGRA_3x_SOC isn't selected.

Perhaps tegra30_tear_down_cpu() should be built unconditionally so that
it's always available? I suspect that something similar will need to be
done for future chips too, further complicating matters.

There are other alternatives like adding another Kconfig symbol which
doesn't cover all of Tegra30 but only code shared with Tegra114 (and
possible future chips) or building sleep-tegra30.S if either one of the
ARCH_TEGRA_3x_SOC or ARCH_TEGRA_114_SOC symbols is selected.

Thierry

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzBBPAAoJEN0jrNd/PrOhSWQP/1cJmWQtt1EKkqU5GaMUATKO
24/cc6LQcAmIQc3Asu/sNwyAcpaMi/KJieGtIdBGJb+2yfRon7fU5eSqMyCHvvtu
noHVGzOVh8qJvKo1dd7/2aEWSvkOrBhC94fibAdECnXFFKEXKeNkFh3nbIuvgEcL
j7TCya3253DcZEHxaoLF3fVuqw3XJTZ/bdBp6Ol2ny2+p7dD6tNP76MUZ0kJvAdv
IDmrMF8y8MXKaXsUpTJ7V/bQkn+GFNH6DDU+cK/vopvXKONjC3vwJ7HDUI3VY4lK
gbSL5U+Xn8shx6+1R+H7m2plWvUbkn50mKtmyxFLO+QKhXnLov54i0YW6alIMGyB
NR1eTmZkKY9P3pXJprJVLgQaU5DHulLfGQ8FFTQy8PHAw1dAcWPmYyXF+HsqAjTJ
AgNx1lk/xKkRtODLtGC7nIPTqIene3JTEsMaMH2eb9930Jq9oXnrOFX4oykHGwkm
9HQNZaSvcdcZtROqAkii+7st9jNy2trjXMtyIyJPjkdKG9S87Z6JI44NbeNivG1n
W12YuEbNIyUFYnrYmVrA00TxuzU56nEQX516ZU4qGCZiSYGTkFFqnalfeyaOVKpw
i/2NsgHzbKjK+ZhqEsLIaKOd5uz2vtCPozZeCYGBAqk9ICtLgYSAcGxaL3WoT3js
EA2PjbWsiYKtjLIZCKAl
=j2N0
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--

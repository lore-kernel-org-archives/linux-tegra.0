From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/11] ARM: tegra114: hook tegra_tear_down_cpu function
Date: Fri, 28 Jun 2013 20:34:24 +0200
Message-ID: <20130628183423.GA15416@manwe>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
 <1372152475-18617-7-git-send-email-josephl@nvidia.com>
 <20130627101335.GB15081@mithrandir>
 <51CC7B01.30503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51CC7B01.30503-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2013 at 11:48:49AM -0600, Stephen Warren wrote:
> On 06/27/2013 04:13 AM, Thierry Reding wrote:
> > On Tue, Jun 25, 2013 at 05:27:50PM +0800, Joseph Lo wrote:
> >> Hooking tegra_tear_down_cpu for Tegra114 for supporting cluster
> >> power down when CPU cluster suspneded in LP2.
> >>=20
> >> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> ---=20
> >> arch/arm/mach-tegra/pm.c | 1 + 1 file changed, 1 insertion(+)
> >>=20
> >> diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c=20
> >> index 94e69be..a0668a2 100644 --- a/arch/arm/mach-tegra/pm.c +++
> >> b/arch/arm/mach-tegra/pm.c @@ -52,6 +52,7 @@ static void
> >> tegra_tear_down_cpu_init(void) tegra_tear_down_cpu =3D
> >> tegra20_tear_down_cpu; break; case TEGRA30: +	case TEGRA114: if
> >> (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC)) tegra_tear_down_cpu =3D
> >> tegra30_tear_down_cpu;
> >=20
> > This is getting a little weird. Suppose I want to build a Tegra114
> > only kernel. With the above code it means the tegra_tear_down_cpu
> > won't be hooked because ARCH_TEGRA_3x_SOC isn't selected.
> >=20
> > Perhaps tegra30_tear_down_cpu() should be built unconditionally so
> > that it's always available? I suspect that something similar will
> > need to be done for future chips too, further complicating
> > matters.
> >=20
> > There are other alternatives like adding another Kconfig symbol
> > which doesn't cover all of Tegra30 but only code shared with
> > Tegra114 (and possible future chips) or building sleep-tegra30.S if
> > either one of the ARCH_TEGRA_3x_SOC or ARCH_TEGRA_114_SOC symbols
> > is selected.
>=20
> To be honest, I wonder if we should just get rid of ARCH_TEGRA_*_SOC,
> and build everything if ARCH_TEGRA is defined. tegra_defconfig enables
> all ARCH_TEGRA_*_SOC anyway, and I'm afraid I don't test other
> configurations very often, and I assume that distros will enable
> everything...

The same thing had occurred to me as well. Obviously there could be some
savings in executable code for people that really only need one specific
generation. But, without having any concrete numbers, I suspect that all
the ARCH_TEGRA code is less than 100 KiB in total so I don't think it
matters that much given that there aren't any devices with less than 256
MiB of RAM (that I've heard of at least).

Thierry

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzdcvAAoJEN0jrNd/PrOhqd8QAKHf1+WydDKqOPoMzCrkxi+2
hiz4t9vkifnQ4Z86gJk/31i+f7N3aUNGsIxiEnnUJp6vtl6uGQheOR8I57YtTbmk
lwCHGHK/UbiQu1ttUVPZlyKF5ErBn6bSsaIhotG0MnI/zus7TlFrAcbFSHS3uk36
i5iXqU3ycVByaOudPFqN10B2GlL4YAWxZQx1YY5RwqR63yHLEiPyyFTdbwdvOvkI
BrjQAR6Y6IG5Tv4dmwGzqIeRZfY0biGuFegu6zbjYc6HCQnCqm0gO5Tmw7PfPmLY
yfd0xiI9jHdWv7TV8PniqIudTAJQ6Re38f/Wvrb9Sm24rNZWcQgoXzvYDQhXflgT
Pr1qbP/bVf78arwZPFlMvOzOt16HvldLPWdrX5YXMgkff6hFXyVBayl3A6zTC6PV
kZNcVmxOJglz5jYlduZw1BNQAnFcsiekIDOAGCDlG0GdLSMhU5JBWNcyPNbVDSBh
L+QHTY0JrfipzkdvC5BIbhqD9lUVfHXxEXRMjaJDVL4ay3xbK5cBGfIyNpc1MR+6
ULBSIEGI5YJszJvQuty4ApBRj8rMwZm1oeLgc/Z22qSTEvtiiv+zapXhiUIPGkIc
mEMnwuUoUw97Dl5v4WpIrcEaH1SlGTj+LszavgpJoAHsCtED9bSsMFqtPLMiXbQN
E3hNXeaBl4Y0Hm6C546K
=o9Eh
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

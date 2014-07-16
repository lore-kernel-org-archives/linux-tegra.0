From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Wed, 16 Jul 2014 15:22:41 +0200
Message-ID: <20140716132240.GC23384@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <1405080971-7609-13-git-send-email-thierry.reding@gmail.com>
 <201407161356.44693.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201407161356.44693.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 01:56:44PM +0200, Arnd Bergmann wrote:
> On Friday 11 July 2014, Thierry Reding wrote:
> > +/*
> > + * PMC
> > + */
> > +enum tegra_suspend_mode {
> > +       TEGRA_SUSPEND_NONE =3D 0,
> > +       TEGRA_SUSPEND_LP2, /* CPU voltage off */
> > +       TEGRA_SUSPEND_LP1, /* CPU voltage off, DRAM self-refresh */
> > +       TEGRA_SUSPEND_LP0, /* CPU + core voltage off, DRAM self-refresh=
 */
> > +       TEGRA_MAX_SUSPEND_MODE,
> > +};
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
> > +void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
> > +void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
> > +
> > +bool tegra_pmc_cpu_is_powered(int cpuid);
> > +int tegra_pmc_cpu_power_on(int cpuid);
> > +int tegra_pmc_cpu_remove_clamping(int cpuid);
> > +
> > +void tegra_pmc_restart(enum reboot_mode mode, const char *cmd);
> > +#endif
> > +
> > +/*
>=20
> This part is causing multiple build failures in the randconfig tests.
> You can avoid them by removing the #ifdef.

How is this causing build failures? I only see them used wherever
CONFIG_PM_SLEEP is defined.

Although I guess tegra-pmc.c could cause sparse warnings since it
implements these functions regardless of CONFIG_PM_SLEEP, which probably
is the bug that should be fixed.

Do you have a randconfig that I can use to reproduce this and come up
with a fix?

> On a more general note, why are you adding this stuff into a global
> header file in the first place? All users are in the same directory
> in which the functions are defined.

That's mostly preparatory work. We'll need to move tegra-pmc.c out of
arch/arm/mach-tegra at some point. I've proposed two patches already to
do that, one move the driver to drivers/soc/tegra and was massively
NAK'ed (I'm still not sure I agree) and people requested that this be
moved into drivers/power. I then posted a 2 patch series to move power
supply drivers into a subdirectory (drivers/power/supply) so that
drivers in drivers/power didn't have to depend on CONFIG_POWER_SUPPLY
for no good reason.

The latter series didn't receive any comments whatsoever in over a week,
so in order to keep things moving forward I respun the PMC patch to do
the conversion without moving the code out of arch/arm/mach-tegra yet.
That way moving the driver out of arch/arm/mach-tegra will be a simple
matter of moving and the rework will already be done. You were Cc'ed on
the second series, so if you want to take a look (and maybe help get
things moving) the patches are called:

	[PATCH 0/2] Restructure driver/power and add Tegra PMC driver
	[PATCH 1/2] power: Move power-supply drivers to subdirectory
	[PATCH 2/2] ARM: tegra: Convert PMC to a driver

Thierry

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxnygAAoJEN0jrNd/PrOhndQP/3Cva2Pc7sM2AFxPB+xJDcwX
Kols4DtNuhcwjbpN5ApXK+4EqkpR27tctA5hSDlgCGkLWQomSAE+07nfPEuQQziv
uq7u7sB3tvRwqKZIIOh4B6/8+fB0GgrhIJ8QK1o9ZWyjfxv7GQJbIXTtAbkOeJ70
jLwLlJg5+XMVoJbGfREVSdYuIuRlLGyPPYaZoayrmbKGMHYGhQMWxRvddt1s9Ejm
kI+mCNM7Eq6uLOwieOi6Cz9KoVTz4ghTyZFMAPezjQaq3DfJ6lyuMN3GFmdLq546
NsMzILojpkXW4OfSsWMpu9eMbEUjiRUQFFFmwt+mcffLk0euzb4ul4Erf3ltaQmM
UpTb2/9WSaS/CSK+WIxj1bgIMWnsh+WAtCzYza0ts1pFf9zXpRwEDx39me+UH1w+
r6qzKS9bbcdgR22A+nSveoql+cUIVrQ0d4K67uWThssVsNm74yZJ7CjjnDDpxADH
xB/0Tl/MKP2WaN1AUtith16I9mMuNGGcKEWDyQBcdOl5N8pAlASmzQwaS23islDd
gvW01Srejg/c3wL4Jt56FE7XANEaiI2FdywsSmoZh9KAsXJLJyRPh7jcAcHHuZOX
PnCkP8C6WkAjYK+nEl7iCnFmPRTRq92lEWWWalEs85wAY9xUoEvsxdq6ooDBlwIB
C+OLvNYeWLlt3oYSbHHX
=vxE5
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--

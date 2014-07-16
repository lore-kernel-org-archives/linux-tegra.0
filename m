From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Wed, 16 Jul 2014 17:14:29 +0200
Message-ID: <20140716151427.GA22027@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <201407161356.44693.arnd@arndb.de>
 <20140716132240.GC23384@ulmo>
 <17053542.QUGvfkeRmc@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <17053542.QUGvfkeRmc@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 04:12:29PM +0200, Arnd Bergmann wrote:
> On Wednesday 16 July 2014 15:22:41 Thierry Reding wrote:
> > On Wed, Jul 16, 2014 at 01:56:44PM +0200, Arnd Bergmann wrote:
> > > On Friday 11 July 2014, Thierry Reding wrote:
> > > > +/*
> > > > + * PMC
> > > > + */
> > > > +enum tegra_suspend_mode {
> > > > +       TEGRA_SUSPEND_NONE =3D 0,
> > > > +       TEGRA_SUSPEND_LP2, /* CPU voltage off */
> > > > +       TEGRA_SUSPEND_LP1, /* CPU voltage off, DRAM self-refresh */
> > > > +       TEGRA_SUSPEND_LP0, /* CPU + core voltage off, DRAM self-ref=
resh */
> > > > +       TEGRA_MAX_SUSPEND_MODE,
> > > > +};
> > > > +
> > > > +#ifdef CONFIG_PM_SLEEP
> > > > +enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
> > > > +void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
> > > > +void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
> > > > +
> > > > +bool tegra_pmc_cpu_is_powered(int cpuid);
> > > > +int tegra_pmc_cpu_power_on(int cpuid);
> > > > +int tegra_pmc_cpu_remove_clamping(int cpuid);
> > > > +
> > > > +void tegra_pmc_restart(enum reboot_mode mode, const char *cmd);
> > > > +#endif
> > > > +
> > > > +/*
> > >=20
> > > This part is causing multiple build failures in the randconfig tests.
> > > You can avoid them by removing the #ifdef.
> >=20
> > How is this causing build failures? I only see them used wherever
> > CONFIG_PM_SLEEP is defined.
> >=20
> > Although I guess tegra-pmc.c could cause sparse warnings since it
> > implements these functions regardless of CONFIG_PM_SLEEP, which probably
> > is the bug that should be fixed.
> >=20
> > Do you have a randconfig that I can use to reproduce this and come up
> > with a fix?
>=20
> I got this error (always):
>=20
> /git/arm-soc/arch/arm/mach-tegra/tegra.c:165:13: error: 'tegra_pmc_restar=
t' undeclared here (not in a function)
>   .restart =3D tegra_pmc_restart,
>              ^
> make[3]: *** [arch/arm/mach-tegra/tegra.o] Error 1
>=20
> when CONFIG_PM_SLEEP is disabled, and also this one when SMP is
> turned on in addition:
>=20
>=20
> /git/arm-soc/arch/arm/mach-tegra/platsmp.c: In function 'tegra30_boot_sec=
ondary':
> /git/arm-soc/arch/arm/mach-tegra/platsmp.c:97:4: error: implicit declarat=
ion of function 'tegra_pmc_cpu_is_powered' [-Werror=3Dimplicit-function-dec=
laration]
>     if (tegra_pmc_cpu_is_powered(cpu))
>     ^
> /git/arm-soc/arch/arm/mach-tegra/platsmp.c:110:3: error: implicit declara=
tion of function 'tegra_pmc_cpu_power_on' [-Werror=3Dimplicit-function-decl=
aration]
>    ret =3D tegra_pmc_cpu_power_on(cpu);
>    ^
> /git/arm-soc/arch/arm/mach-tegra/platsmp.c:129:2: error: implicit declara=
tion of function 'tegra_pmc_cpu_remove_clamping' [-Werror=3Dimplicit-functi=
on-declaration]
>   ret =3D tegra_pmc_cpu_remove_clamping(cpu);
>   ^
> cc1: some warnings being treated as errors
>=20
> I applied this hack locally to work around that:
>=20
> diff --git a/include/linux/tegra-soc.h b/include/linux/tegra-soc.h
> index 70a612442cda..a89fe9e588ac 100644
> --- a/include/linux/tegra-soc.h
> +++ b/include/linux/tegra-soc.h
> @@ -73,7 +73,6 @@ enum tegra_suspend_mode {
>  	TEGRA_MAX_SUSPEND_MODE,
>  };
> =20
> -#ifdef CONFIG_PM_SLEEP
>  enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
>  void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
>  void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
> @@ -83,7 +82,6 @@ int tegra_pmc_cpu_power_on(int cpuid);
>  int tegra_pmc_cpu_remove_clamping(int cpuid);
> =20
>  void tegra_pmc_restart(enum reboot_mode mode, const char *cmd);
> -#endif
> =20
>  /*
>   * PM

I pushed fixes for these to Tegra's for-next branch (and for-3.17/soc).

>=20
> > > On a more general note, why are you adding this stuff into a global
> > > header file in the first place? All users are in the same directory
> > > in which the functions are defined.
> >=20
> > That's mostly preparatory work. We'll need to move tegra-pmc.c out of
> > arch/arm/mach-tegra at some point. I've proposed two patches already to
> > do that, one move the driver to drivers/soc/tegra and was massively
> > NAK'ed (I'm still not sure I agree) and people requested that this be
> > moved into drivers/power. I then posted a 2 patch series to move power
> > supply drivers into a subdirectory (drivers/power/supply) so that
> > drivers in drivers/power didn't have to depend on CONFIG_POWER_SUPPLY
> > for no good reason.
> >=20
> > The latter series didn't receive any comments whatsoever in over a week,
> > so in order to keep things moving forward I respun the PMC patch to do
> > the conversion without moving the code out of arch/arm/mach-tegra yet.
> > That way moving the driver out of arch/arm/mach-tegra will be a simple
> > matter of moving and the rework will already be done. You were Cc'ed on
> > the second series, so if you want to take a look (and maybe help get
> > things moving) the patches are called:
> >=20
> > 	[PATCH 0/2] Restructure driver/power and add Tegra PMC driver
> > 	[PATCH 1/2] power: Move power-supply drivers to subdirectory
> > 	[PATCH 2/2] ARM: tegra: Convert PMC to a driver
>=20
> Ok, I'll have a look. I think when this becomes a separate driver, it
> should also have its own header file, so maybe you can in the meantime
> make it a local header file in mach-tegra until we have found a good
> place for it.

Why do you think it should be a separate header? We already have a
couple in include/linux and I'm not sure it's useful to add even more.
If anything I would've thought it made sense to move the content of the
other headers into tegra-soc.h.

Thierry

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxpbTAAoJEN0jrNd/PrOhgBkQALabGb0+nTbJpE2jXKuDg1n6
qAQ583rN0f924htceujl10x6UZfslcF2xqGRqa50SXayTVXw7mcGivC8VopOHJoy
iXy67uiRbzk2brBT4XFV52INV4n24DwTCL3oORxt3Ooe0edZXSZpI0XTphtz/1Mv
icQRs7hNNngsoYEvauiMv1POHUHT0Z5In9mMweOvsrE5oeKOTd8Kg+Q7F4c2vgeQ
O+AxR9kGsop6xsJfYpNZ5XAYDhq9ou1/ssIUKsCoFo8dInfgk7WgawySi9efh7+G
VTvw2lof6IEn/cwYylaKz7BtJIpZXWuZYd5j/Ylb/DXcXVraoruzudnmNujUifc7
pzz6DJaufAbmz22fhGcYfO47hcifUDKCqQ/SZheSYS8+w8Am6JgIiJu6B4+FNovU
eIpNmHc+zZ2+i46YNs++mhk61Dsm13/FBYrZKaOfsTFUtzju0akaRDidwp5BIU8e
oY++5glCAO4xpbmLpAIa5CPZoVaMd9Vf9VAx71EhUZKmhn1RY3u74KmotSPEEaLV
R07wQ+vGaFKqUHBA811iUxtckY0gfpLNcpOIi4akl4z6scA/n8DMcZ2QNHzSKnCr
5Lt3xthN06MkPjwrKsxGS1jDiTbhnP0JqXJ1AQEKK+RITuApeEco49vizlTYOsMa
QRlx+zVOWdvc4d5x22JB
=D2Rf
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--

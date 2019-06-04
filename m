From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 14/16] PM / devfreq: tegra: Enable COMPILE_TEST for
 the driver
Date: Tue, 4 Jun 2019 16:50:04 +0200
Message-ID: <20190604145004.GA3208@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-15-digetx@gmail.com>
 <20190604112026.GN16519@ulmo>
 <ed2c502f-8f49-d89b-32c6-4b5415e1fa47@gmail.com>
 <20190604141031.GB397@ulmo>
 <20190604141824.GC397@ulmo>
 <02a6651f-17f3-2e79-7780-57657596ba23@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <02a6651f-17f3-2e79-7780-57657596ba23@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 05:41:53PM +0300, Dmitry Osipenko wrote:
> 04.06.2019 17:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jun 04, 2019 at 04:10:31PM +0200, Thierry Reding wrote:
> >> On Tue, Jun 04, 2019 at 04:53:17PM +0300, Dmitry Osipenko wrote:
> >>> 04.06.2019 14:20, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> On Thu, May 02, 2019 at 02:38:13AM +0300, Dmitry Osipenko wrote:
> >>>>> The driver's compilation doesn't have any specific dependencies, he=
nce
> >>>>> the COMPILE_TEST option can be supported in Kconfig.
> >>>>>
> >>>>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> >>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>>> ---
> >>>>>  drivers/devfreq/Kconfig | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> >>>>> index 56db9dc05edb..a6bba6e1e7d9 100644
> >>>>> --- a/drivers/devfreq/Kconfig
> >>>>> +++ b/drivers/devfreq/Kconfig
> >>>>> @@ -93,7 +93,7 @@ config ARM_EXYNOS_BUS_DEVFREQ
> >>>>> =20
> >>>>>  config ARM_TEGRA_DEVFREQ
> >>>>>  	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
> >>>>> -	depends on ARCH_TEGRA
> >>>>> +	depends on ARCH_TEGRA || COMPILE_TEST
> >>>>>  	select PM_OPP
> >>>>>  	help
> >>>>>  	  This adds the DEVFREQ driver for the Tegra family of SoCs.
> >>>>
> >>>> You need to be careful with these. You're using I/O register accesso=
rs,
> >>>> which are not supported on the UM architecture, for example.
> >>>>
> >>>> This may end up getting flagged during build testing.
> >>>
> >>> We have similar cases in other drivers and it doesn't cause any known
> >>> problems because (I think) build-bots are aware of this detail. Hence
> >>
> >> I don't understand how the build-bots would be aware of this detail.
> >> Unless you explicitly state what the dependencies are, how would the
> >> build-bots know? Perhaps there's some logic built-in somewhere that I
> >> don't know about?
> >=20
> > So looks like COMPILE_TEST has a !UML dependency, so this might just
> > work.
> >=20
> > Acked-by: Thierry Reding <treding@nvidia.com>
> >=20
>=20
> Thank you very much for the clarification! Certainly that would caused
> problems already since there are such cases all over the kernel,
> including Tegra drivers.

In the cases that I'm aware of we used to explicitly list all the
dependencies that would've otherwise been pulled in by the ARCH_TEGRA
dependency to make sure there were no issues.

Now that we've been discussing this I vaguely recall a discussion about
the only real issue nowadays being HAS_IOMEM and since that's only
missing on UML, that may have been the reason for why the !UML
dependency was added.

Yes, looks like that was it:

	commit bc083a64b6c035135c0f80718f9e9192cc0867c6
	Author: Richard Weinberger <richard@nod.at>
	Date:   Tue Aug 2 14:03:27 2016 -0700

	    init/Kconfig: make COMPILE_TEST depend on !UML

	    UML is a bit special since it does not have iomem nor dma.  That means=
 a
	    lot of drivers will not build if they miss a dependency on HAS_IOMEM.
	    s390 used to have the same issues but since it gained PCI support UML =
is
	    the only stranger.

	    We are tired of patching dozens of new drivers after every merge window
	    just to un-break allmod/yesconfig UML builds.  One could argue that a
	    decent driver has to know on what it depends and therefore a missing
	    HAS_IOMEM dependency is a clear driver bug.  But the dependency not
	    obvious and not everyone does UML builds with COMPILE_TEST enabled when
	    developing a device driver.

	    A possible solution to make these builds succeed on UML would be
	    providing stub functions for ioremap() and friends which fail upon
	    runtime.  Another one is simply disabling COMPILE_TEST for UML.  Since
	    it is the least hassle and does not force use to fake iomem support
	    let's do the latter.

	    Link: http://lkml.kernel.org/r/1466152995-28367-1-git-send-email-richa=
rd@nod.at
	    Signed-off-by: Richard Weinberger <richard@nod.at>
	    Acked-by: Arnd Bergmann <arnd@arndb.de>
	    Cc: Al Viro <viro@zeniv.linux.org.uk>
	    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
	    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

Oh wow... almost three years now.

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2hRgACgkQ3SOs138+
s6Ge3w//TpTw2alVI55O/u5vd2xiR8t594YrMwEWMsFu0qbPPt3wDvsYROJUdHFg
cNdAJCJbcZeOCP/ZKtfoVZtV6zO2+hgjS27cgahMPGsAJNgO+GmGFAy0kpzSN7Kz
3lP3tM0h2xKc+3dYZjD4rcoaufet+gE8Lcwy/ngIEiZGZW2HxXd/+InA7nSnN3qv
Ko+XCousnBZbUr9KuGjFHVVFH/nZf9n1SthvF/vBZMmcM4xQIFiuuX2v75WOvogy
RtkSf+vxHjA/+GbUTrzE/RDPiLgpTELo8dNxECtY4VhNyhfnvTqI2JfyImDFdiU9
T7mV74WgKlPAobTznhXULzDQ6oXuXfeytIEJh+XwGX7jiSys+4jI5rOGPSWcH+CK
WI7Tnu0XwtpkLH7LsggH9WFqAPByIAC0jTI5T/Q9M9r2Asga7gHc9x+Zm/bpHJJW
xEwROfuhct5qe/aLkJAodZZZf0BWaJj2zwLsRgpsIW8ubXT2Sh6leliZwZGVUOWx
D6G4L7Qeczg8A9VzaATqtXL3+ES0VyJ7o2ITT48JQbbAMZH+DyyRuv/171ZrGFJ1
+lq9UGEny0gsfxjfiEAWkHh1Z5JN+9xYliwBrmowPL5bUYngWw/0FhjAOs5BfvQf
0oTxYv3MsaO93+z22PJCbnubYC9iwaGfrFcbduajtd0Z/31zvKM=
=jp8D
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] firmware: Move Trusted Foundations support
Date: Wed, 10 Apr 2019 17:31:55 +0200
Message-ID: <20190410153155.GB1460@ulmo>
References: <20190410085708.10798-1-thierry.reding@gmail.com>
 <20190410085708.10798-2-thierry.reding@gmail.com>
 <b0b88e3b-405d-6199-71ac-07e15a29eb9a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5664218325825580995=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b0b88e3b-405d-6199-71ac-07e15a29eb9a@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============5664218325825580995==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2019 at 01:36:35PM +0300, Dmitry Osipenko wrote:
> 10.04.2019 11:57, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Move the Trusted Foundations support out of arch/arm/firmware and into
> > drivers/firmware where most other firmware support implementations are
> > located.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/Kconfig                              |  2 --
> >  arch/arm/Makefile                             |  1 -
> >  arch/arm/firmware/Kconfig                     | 29 -------------------
> >  arch/arm/firmware/Makefile                    |  4 ---
> >  arch/arm/mach-tegra/Kconfig                   |  2 +-
> >  arch/arm/mach-tegra/cpuidle-tegra114.c        |  3 +-
> >  arch/arm/mach-tegra/pm.c                      |  3 +-
> >  arch/arm/mach-tegra/reset.c                   |  3 +-
> >  arch/arm/mach-tegra/tegra.c                   |  3 +-
> >  drivers/firmware/Kconfig                      | 15 ++++++++++
> >  drivers/firmware/Makefile                     |  1 +
> >  .../firmware/trusted_foundations.c            |  4 ++-
> >  .../linux/firmware}/trusted_foundations.h     |  4 +--
> >  13 files changed, 30 insertions(+), 44 deletions(-)
> >  delete mode 100644 arch/arm/firmware/Kconfig
> >  delete mode 100644 arch/arm/firmware/Makefile
> >  rename {arch/arm =3D> drivers}/firmware/trusted_foundations.c (98%)
> >  rename {arch/arm/include/asm =3D> include/linux/firmware}/trusted_foun=
dations.h (97%)
> >=20
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 054ead960f98..f006b3c69247 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -899,8 +899,6 @@ config PLAT_PXA
> >  config PLAT_VERSATILE
> >  	bool
> > =20
> > -source "arch/arm/firmware/Kconfig"
> > -
> >  source "arch/arm/mm/Kconfig"
> > =20
> >  config IWMMXT
> > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > index 807a7d06c2a0..05ecc004de86 100644
> > --- a/arch/arm/Makefile
> > +++ b/arch/arm/Makefile
> > @@ -290,7 +290,6 @@ core-y				+=3D arch/arm/kernel/ arch/arm/mm/ arch/a=
rm/common/
> >  core-y				+=3D arch/arm/probes/
> >  core-y				+=3D arch/arm/net/
> >  core-y				+=3D arch/arm/crypto/
> > -core-y				+=3D arch/arm/firmware/
> >  core-y				+=3D $(machdirs) $(platdirs)
> > =20
> >  drivers-$(CONFIG_OPROFILE)      +=3D arch/arm/oprofile/
> > diff --git a/arch/arm/firmware/Kconfig b/arch/arm/firmware/Kconfig
> > deleted file mode 100644
> > index ad396af68e47..000000000000
> > --- a/arch/arm/firmware/Kconfig
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -config ARCH_SUPPORTS_FIRMWARE
> > -	bool
> > -
> > -config ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
> > -	bool
> > -	select ARCH_SUPPORTS_FIRMWARE
> > -
> > -menu "Firmware options"
> > -	depends on ARCH_SUPPORTS_FIRMWARE
> > -
> > -config TRUSTED_FOUNDATIONS
> > -	bool "Trusted Foundations secure monitor support"
> > -	depends on ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
> > -	default y
> > -	help
> > -	  Some devices (including most Tegra-based consumer devices on the
> > -	  market) are booted with the Trusted Foundations secure monitor
> > -	  active, requiring some core operations to be performed by the secure
> > -	  monitor instead of the kernel.
> > -
> > -	  This option allows the kernel to invoke the secure monitor whenever
> > -	  required on devices using Trusted Foundations. See
> > -	  arch/arm/include/asm/trusted_foundations.h or the
> > -	  tlm,trusted-foundations device tree binding documentation for detai=
ls
> > -	  on how to use it.
> > -
> > -	  Say n if you don't know what this is about.
> > -
> > -endmenu
> > diff --git a/arch/arm/firmware/Makefile b/arch/arm/firmware/Makefile
> > deleted file mode 100644
> > index 6e41336b0bc4..000000000000
> > --- a/arch/arm/firmware/Makefile
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -obj-$(CONFIG_TRUSTED_FOUNDATIONS)	+=3D trusted_foundations.o
> > -
> > -# tf_generic_smc() fails to build with -fsanitize-coverage=3Dtrace-pc
> > -KCOV_INSTRUMENT                :=3D n
> > diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> > index 7b3fd0995a16..cbad7823f602 100644
> > --- a/arch/arm/mach-tegra/Kconfig
> > +++ b/arch/arm/mach-tegra/Kconfig
> > @@ -3,7 +3,6 @@ menuconfig ARCH_TEGRA
> >  	bool "NVIDIA Tegra"
> >  	depends on ARCH_MULTI_V7
> >  	select ARCH_HAS_RESET_CONTROLLER
> > -	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
> >  	select ARM_AMBA
> >  	select ARM_GIC
> >  	select CLKSRC_MMIO
> > @@ -14,6 +13,7 @@ menuconfig ARCH_TEGRA
> >  	select PM_OPP
> >  	select RESET_CONTROLLER
> >  	select SOC_BUS
> > +	select TRUSTED_FOUNDATIONS
>=20
> Do we really want to force-enable the driver? I think it's better to
> have a choice and then instead enable the driver in the
> tegra_defconfig.

The driver is getting enabled by default prior to this patch, and given
that it's fairly small, I thought it'd be okay to include it by default.
But I guess there's no harm in enabling it in tegra_defconfig and
multi_v7_defconfig, that way people do have the possibility to disable
it if they really don't want it.

> >  	select ZONE_DMA if ARM_LPAE
> >  	help
> >  	  This enables support for NVIDIA Tegra based systems.
>=20
>=20
> [snip]
>=20
> > --- a/drivers/firmware/Kconfig
> > +++ b/drivers/firmware/Kconfig
> > @@ -267,6 +267,21 @@ config TI_SCI_PROTOCOL
> >  	  This protocol library is used by client drivers to use the features
> >  	  provided by the system controller.
> > =20
> > +config TRUSTED_FOUNDATIONS
> > +	bool "Trusted Foundations secure monitor support"
>=20
> Th driver shall depend at least on ARM because of the assembly. And
> maybe even on ARCH_TEGRA.

Indeed, I've added a "depends on ARM" in v2.

> Do you know if there are any platforms other than Tegra that use that
> firmware? Won't it make sense to move the driver to tegra/ ?

I don't think there's any reason to make this Tegra specific, even if
this was only ever deployed on Tegra.

Thierry

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyuDGsACgkQ3SOs138+
s6HomhAAlIUtFHAokRU/WGn+FH70CVnn+zkSSUpO3NsdlXJB1zUSJGVq6u6xOqBW
dyeoYnhHNdmTTa8Kbh9PYAkkfk/YlQIwZmKTqsUq5AC1RHW/4E+L2cSb37fUiq//
7Z42swN/A6++1DybHHvtOsmzbV8G8ZxSheHLPG0GRzntUuR9N7yzpXXgN0DyZHwj
7kg9iI3hVO+qx8hXNLemqRCbVgbFQx5H/vNVGi+mb0PiM1VAm3Pbu06D9aiPhPL0
rVw2SZRXphHZDg/aZEAh099n1/P8fA3FDlKQADW+n6aGYHjxT2cDPB/4KDcWv12Q
LRMStmFyybFpvp1QVZKIeJuDmSzAVCPSwjQrtAKO97JPd+k4bv3TV5/fO7rlJKH8
YZmwwr8hdkNrAKtlunL/NLHYoFjYzp3eCmTWf+vBO6ljZe520dGbEaTSkaMC91N7
rG3MhxPTXRPdbT3ODwEe3Gb3tdFvIjaZwtkyl2OJw8XwmHI4w692jlrLHUNEcbwk
W9bST+58eYHX0uw/tOQKXZaG0WF3Q53lAfcjzcDCIwY8b60S/0xv0/R+gIMY24OR
Irny/wZFQH5QL3aspricSgYWHM6cmQ1MCoarpp9H52p8xZHMDVoTFzt0rL6Aj2T3
+7B13hES6qfMctFPqvIR6OzsIo8Yuy26AndLoWOSNuInp8/iCI4=
=XWf3
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--


--===============5664218325825580995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5664218325825580995==--

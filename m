From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: tegra: Disable cpuidle driver if PSCI is
 present
Date: Tue, 6 Oct 2015 10:21:08 +0200
Message-ID: <20151006082106.GB21527@ulmo.nvidia.com>
References: <cover.1442990383.git.jan.kiszka@siemens.com>
 <5151ffebe8611545c55f8cc499cf2368b1b789c4.1442990383.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5151ffebe8611545c55f8cc499cf2368b1b789c4.1442990383.git.jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 08:39:44AM +0200, Jan Kiszka wrote:
> The firmware takes over the ownership of the flow controller when it
> provides PSCI support. To avoid clashes, disable the Tegra cpuidle
> driver if PSCI was detected.
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/mach-tegra/Kconfig | 1 +
>  arch/arm/mach-tegra/tegra.c | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> index 0fa4c5f..373768c 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -4,6 +4,7 @@ menuconfig ARCH_TEGRA
>  	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
>  	select ARM_AMBA
>  	select ARM_GIC
> +	select ARM_PSCI
>  	select CLKSRC_MMIO
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_ARM_TWD if SMP
> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
> index 2378fa56..d97c961 100644
> --- a/arch/arm/mach-tegra/tegra.c
> +++ b/arch/arm/mach-tegra/tegra.c
> @@ -44,6 +44,7 @@
>  #include <asm/mach-types.h>
>  #include <asm/setup.h>
>  #include <asm/trusted_foundations.h>
> +#include <asm/psci.h>
> =20
>  #include "board.h"
>  #include "common.h"
> @@ -136,7 +137,8 @@ static void __init tegra_dt_init_late(void)
>  	int i;
> =20
>  	tegra_init_suspend();
> -	tegra_cpuidle_init();
> +	if (!psci_smp_available())
> +		tegra_cpuidle_init();
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(board_init_funcs); i++) {
>  		if (of_machine_is_compatible(board_init_funcs[i].machine)) {

The equivalent of this part is already in cpuidle-tegra114.c and I'm not
sure this adds anything. cpuidle-tegra114.c is the same code that is
used on Tegra124. Anything before Tegra114 is now unlikely to gain PSCI
support. Given that they're Cortex-A9 and lack virtualization extensions
I don't think it's even possible to support PSCI on them. Anything after
Tegra124 will very likely be 64-bit and hence require firmware support
(such as PSCI) for CPU idle anyway.

That still leaves the select ARM_PSCI which we don't have in mainline
yet. I'm also not sure if select ARM_PSCI is the right approach here. It
means that everyone will be forced to have PSCI support in the kernel.
But what if for some reason you want to disable PSCI (and instead use
the kernel's cpuidle support)? Maybe it'd be better to add this to the
tegra_defconfig instead.

Thierry

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWE4RyAAoJEN0jrNd/PrOhW7cQAMEqQQoHfHh/jbykrD/VTgW2
u+o1AjLhkm/LNlThaZp+cOVPE1IoTf/nM921e+fFOR4yZIHDXH+FHvu7R/PgqEw1
CF78LlOrXEx8LbDUgy2Qto0C5kzssv/QcUBKKfi5PGcrWecXv36Ars8sHiNOSgmw
KSCULFIJf+PAQdwIldSMhlDcKUTuDDW1CBWDvI8H5YJ4XKzyM2CFyhpUIoyjbuHw
tCbQqhBmD/xmy4AmhRYWSGECxwDkfZ1/jXjdikAdRdTJo4Hv9YlBlmjLtF5MCP/S
Wpdm7FiaBvr7ZP9UmyOKqq0LQ2kjpM+WPXEzX993HdEX4880y+Ge7a98go6dX5oc
nwdTk/rFbhNdBiW97V5JkVaH4eBR1Bks2pWETHYg72ysWU7Hy2/GQ3HXU+aovGPK
kMiy9mt8FJhg6h7Jry2i1gRZGWAcTu5/IWKsGb0qHp9s5pO7LxceP9LP/dKeCljh
rli2WTok29iaMl8cOtHYkfIm8m1HKqyivSKU0OuJdlQjqVHTp/0Bnw9hNVKUFPsW
OTMstdWAIeSM6nl8Y33g7y7VBN1HN7Yx6JYU3GNLdEQLGBTmxBz4T6xUuvqsnqW6
JS/7yjDM3AiRCSRA5PMZWYfenK/8TY15PVi6ZPaMRWRIzb+GK1uNahEtuCxWFzat
YCsZ5swqSiFPy7BJdYXQ
=3DeV
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--

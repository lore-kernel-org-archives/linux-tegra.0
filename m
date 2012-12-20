From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: tegra: # of CPU cores detection w/ & w/o
 HAVE_ARM_SCU
Date: Thu, 20 Dec 2012 12:06:25 +0200
Message-ID: <20121220100625.GB24693@arwen.pp.htv.fi>
References: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com>
 <1355996654-6579-4-git-send-email-hdoyu@nvidia.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1535155531249463354=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355996654-6579-4-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--===============1535155531249463354==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 20, 2012 at 11:44:01AM +0200, Hiroshi Doyu wrote:
> The method to detect the number of CPU cores on Cortex-A9 MPCore and
> Cortex-A15 MPCore is different. On Cortex-A9 MPCore we can get this
> information from the Snoop Control Unit(SCU). On Cortex-A15 MPCore we
> have to read it from the system coprocessor(CP15), because the SCU on
> Cortex-A15 MPCore does not have software readable registers. This
> patch selects the correct method at runtime based on the CPU ID.
>=20
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/platsmp.c |   31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
> index 1b926df..68e76ef 100644
> --- a/arch/arm/mach-tegra/platsmp.c
> +++ b/arch/arm/mach-tegra/platsmp.c
> @@ -23,6 +23,7 @@
>  #include <asm/hardware/gic.h>
>  #include <asm/mach-types.h>
>  #include <asm/smp_scu.h>
> +#include <asm/cputype.h>
> =20
>  #include <mach/powergate.h>
> =20
> @@ -34,9 +35,13 @@
>  #include "common.h"
>  #include "iomap.h"
> =20
> +#define CPU_MASK		0xff0ffff0
> +#define CPU_CORTEX_A9		0x410fc090
> +#define CPU_CORTEX_A15		0x410fc0f0
> +
>  extern void tegra_secondary_startup(void);
> =20
> -static void __iomem *scu_base =3D IO_ADDRESS(TEGRA_ARM_PERIF_BASE);
> +static void __iomem *scu_base;
> =20
>  #define EVP_CPU_RESET_VECTOR \
>  	(IO_ADDRESS(TEGRA_EXCEPTION_VECTORS_BASE) + 0x100)
> @@ -149,7 +154,26 @@ done:
>   */
>  static void __init tegra_smp_init_cpus(void)
>  {
> -	unsigned int i, ncores =3D scu_get_core_count(scu_base);
> +	unsigned int i, cpu_id, ncores;
> +	u32 l2ctlr;
> +	phys_addr_t pa;
> +
> +	cpu_id =3D read_cpuid(CPUID_ID) & CPU_MASK;
> +	switch (cpu_id) {
> +	case CPU_CORTEX_A15:
> +		asm("mrc p15, 1, %0, c9, c0, 2\n" : "=3Dr" (l2ctlr));
> +		ncores =3D ((l2ctlr >> 24) & 3) + 1;
> +		break;
> +	case CPU_CORTEX_A9:
> +		/* Get SCU physical base */
> +		asm("mrc p15, 4, %0, c15, c0, 0" : "=3Dr" (pa));
> +		scu_base =3D IO_ADDRESS(pa);
> +		ncores =3D scu_get_core_count(scu_base);
> +		break;
> +	default:
> +		BUG();

instead of bugging out, how about setting ncores to 1 instead ?

--=20
balbi

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ0uMhAAoJEIaOsuA1yqRE/G0P/j/wRzPw1pqokYea51C+P7Jb
Cp3qsO6Bp00pvVubctCbhYYwR+yh4SBn3UT6R247qOFJBRmdFtYukGQB1V23Q9BP
ZJeuKumgpJTIDge6MX+MPaE5SqaB7BBUyOWnQhRyH7KEIbxKBDoBHftoVT3SgnHk
YVx5qhieYtE3oou6WpMpu/+hdh/lE6YHhRCpw3ZnPP3x9u+hviFbjM5AvgHsHMIC
X+dmvxm8cMsWEqrLrwqT2kSfstR01cBSGnsdeST7GpNghtfcrtC7TpOm9Je1hRGR
2+TldBJNALQBbfb1kUW/7Q0GyAo5om1+XrEOLAb6mrTZeaGzm5JOHvnuPgNKEZo9
WtBEKaAh8Ogv1BdOIG8tIEDBgIH2rTchof+8CUZQrso94SU23JZVwYAQqe6tguV4
s8oxtSFFqlaY19sN2glYVrpBSNyY0jGrKShrskkWh8qCP2e9In6L7+64NcmLFJnb
TKLXD05Ynv9ssgRlvz7g+nRN+PoFX41j/c1Wiu6lKrR62oW26VOrAz0y+eBBPw+u
d7I7T/U5m5+fs88uNziXnMAtVbBQuEho3OO0Ba6VPvqkiG6TUSlg8WN72bvHN4us
uZXe1Vij0jrFSBGncz8kglkBdTnlkwx5Q7DzBOvrQDvxXYTj7waw2Gophld9NUUi
5YwNo2yMpqDEpi6syuCj
=yaO7
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--

--===============1535155531249463354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1535155531249463354==--

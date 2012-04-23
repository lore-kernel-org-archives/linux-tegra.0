From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: Add SMMU enabler in AHB
Date: Mon, 23 Apr 2012 15:09:35 +0300
Message-ID: <20120423120934.GZ26302@arwen.pp.htv.fi>
References: <1335181043-15348-1-git-send-email-hdoyu@nvidia.com>
 <1335181043-15348-2-git-send-email-hdoyu@nvidia.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/IQTGW+1SjCkQmn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335181043-15348-2-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--W/IQTGW+1SjCkQmn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 23, 2012 at 02:37:22PM +0300, Hiroshi DOYU wrote:
> diff --git a/arch/arm/mach-tegra/tegra-ahb.c b/arch/arm/mach-tegra/tegra-=
ahb.c
> index 411b51f..40877fa 100644
> --- a/arch/arm/mach-tegra/tegra-ahb.c
> +++ b/arch/arm/mach-tegra/tegra-ahb.c
> @@ -20,6 +20,7 @@
>   */
> =20
>  #include <linux/kernel.h>
> +#include <linux/module.h>

EXPORT_SYMBOL() is defined in <linux/export.h>

--=20
balbi

--W/IQTGW+1SjCkQmn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPlUZ+AAoJEIaOsuA1yqREkOMQALRrXLsnDqR32wYWocwo8LU4
4ahDTMw3SZt8NfLNDDhXZUQEhI7rJfq8ZFveLdnQ5k9T5Bq4dowUgaI9aMZWHOK1
s+uH2Ie5/TZLw6MC7++V9uIBn4T4XM9KLjiFNb/XUXdNOHJxWVlVXAe0udU9QaTF
14SGBNEZKaXI6gl0HfexrB9ehmHG9pEK5vVhHZupwKHeopYkTyAJb3TdNqmFXAji
/Hx1o4IReE/t1PJky5aodeLAMyXtz4bBgkLnXVMFPyKYQMxYp/AC1QbBuuon3Uj7
osEdtJC+aECG6UVIWe7OkQ0vegiCe5c3QjXBv7M7IBjSU2jAwVp32gUzbSaW9UX0
kVpL7B4oiSwKVLYPGwDAG8tit1GahNtrFUaFMfXp+H/Tdm/aznPtHwtMPpxGd1jn
5MWlJNS79QrQvFD0FcejN3IniYWZ7w0pgOl1I+lxpOiw94LudHGv036I5nz1b4b3
Cmgs9kqhcbl5Ord7Ym0twwdECCyMj9q5qzqGoXLRQqIf/KpRnbIjf+2GlEwlKUJr
tgbIL8A15yIm9tOJTMheO6Qn3Wg8VFUWFi+2VKprnLaI0KpoY8Fxe1SiyCTR2303
YnZ5xwW0pmvrniqCDZtyd4itExOScGwhEzy4FclTRJh0Dp/iCFsxtfeu6wEL498L
3I5CwVbiTv+aWDEjsX1U
=zB3M
-----END PGP SIGNATURE-----

--W/IQTGW+1SjCkQmn--

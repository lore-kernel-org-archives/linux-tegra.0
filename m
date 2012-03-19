From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Include assembler.h in sleep.S to fix build
 break
Date: Mon, 19 Mar 2012 17:59:40 +0100
Message-ID: <20120319165939.GB25144@avionic-0098.mockup.avionic-design.de>
References: <1332175831-5900-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332175831-5900-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Commit 6f6f6a7 "ARM: create a common IOMEM definition" moved macro
> IOMEM(), and requires users to include <asm/assembler.h>. Fix Tegra's
> sleep.S to do so.
>=20
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
>  arch/arm/mach-tegra/sleep.S |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
> index 8f9fde1..48cc7c6 100644
> --- a/arch/arm/mach-tegra/sleep.S
> +++ b/arch/arm/mach-tegra/sleep.S
> @@ -22,7 +22,10 @@
>   * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
>   */
> =20
> +#include <asm/assembler.h>
> +
>  #include <linux/linkage.h>
> +
>  #include <mach/io.h>
>  #include <mach/iomap.h>

I actually had a similar patch that looked pretty much like this:

	-#include <mach/io.h>
	+#include <asm/assembler.h>

The mach/io.h is no longer required AFAICT.

Thierry

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9nZfsACgkQZ+BJyKLjJp/i2ACeJCLFE7KEgze49GbY+p0uieRe
weUAn2J45QkxGoAkBcGBly9ZOC9FKKX6
=Vldv
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--

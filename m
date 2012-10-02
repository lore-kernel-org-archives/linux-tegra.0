From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: simplify DEBUG_LL UART selection options
Date: Tue, 2 Oct 2012 22:01:30 +0200
Message-ID: <20121002200130.GA31363@avionic-0098.mockup.avionic-design.de>
References: <1349204866-21810-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349204866-21810-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2012 at 01:07:44PM -0600, Stephen Warren wrote:
[...]
>  choice
> -        prompt "Default low-level debug console UART"
> -        default TEGRA_DEBUG_UART_NONE
> +        prompt "Low-level debug console UART"
> +        default TEGRA_DEBUG_UART_AUTO_ODMDATA
> =20
> -config TEGRA_DEBUG_UART_NONE
> -        bool "None"
> +config TEGRA_DEBUG_UART_AUTO_ODMDATA

The first item in a list of choices is automatically selected as the
default, so technically the default is redundant here. I suppose it
doesn't hurt to be explicit.

> diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
> index 0b0a5f5..0913d1f 100644
> --- a/arch/arm/mach-tegra/common.c
> +++ b/arch/arm/mach-tegra/common.c
> @@ -44,14 +44,13 @@
>   * kernel is loaded. The data is declared here rather than debug-macro.S=
 so
>   * that multiple inclusions of debug-macro.S point at the same data.
>   */
> -#define TEGRA_DEBUG_UART_OFFSET (TEGRA_DEBUG_UART_BASE & 0xFFFF)
>  u32 tegra_uart_config[3] =3D {
>  	/* Debug UART initialization required */
>  	1,
>  	/* Debug UART physical address */
> -	(u32)(IO_APB_PHYS + TEGRA_DEBUG_UART_OFFSET),
> +	0,
>  	/* Debug UART virtual address */
> -	(u32)(IO_APB_VIRT + TEGRA_DEBUG_UART_OFFSET),
> +	0,
>  };

I don't quite see how this is supposed to work now. Won't the debug.S
code fail if these fields are set to 0?

Thierry

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQa0gaAAoJEN0jrNd/PrOhWGcQAJmQdJN6N3dAVkv3LtRlhlax
IzyJ8636DALiiqdxwxRY1IpKFB2Pqfi/TgylqKO+28IK6s3Q/qs6wW3XBMcNV0YL
8DejtNdESGHvckDJFHJiWCH/RWOb34PKQD+HGhWGy+8jmvK6WBiOW/MROjKNXyH+
JE7q5VcExM7DActwX0BwCpJLjs4NxHxIQqkfnyywKuDkpd2yvUus0hhJa02sq/RA
i1jsLYRC9T2nTz2DVJjShrvUrm4CE9cOUmJw+7g4Obha2w6Sam3sk5DNuw9IOrLh
Y/8XiprDTobMQEzMa4M1MdlgDqxABzF/tfkCul7jBTV+/OuqIB+6jI75ioj0M7/W
/cwKMKP1uR+dZc0j5AUsxFvL3N2OuX/ZYd69u88qWMBI0DLVZZv7uAkduZ/4ahWL
yx2pZoVZUaRDcMmjSF5uKXW3nxlB4rc7PsNoUyq/UUzYqeXJt9zr4WE/aUhao3A7
8TN56Y89xD6Rn7yx6cYVFFxbZFwnzGjcwFjdw70XmlIn8tvR/2DJ5clx8WNSV4rR
imFC1YuvRzKiX4iSlHw7Q2C9VlOXDCodyN+WS3fXI/27v+youzxLrmtLNGdFyIu5
3xBOTSitJq8RRuN2SAgIwRiMq0pnuOVeL9Bp6cCySRlVo5ppQIYxOendugTimwNe
y7Nv9qPOq0dvZLpPgshF
=uJO9
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/31] ARM: tegra: select the reset framework
Date: Fri, 29 Nov 2013 14:10:41 +0100
Message-ID: <20131129131040.GS22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-7-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9pXJW6w71JX4l3T"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-7-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--s9pXJW6w71JX4l3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:01PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The Tegra clock driver is built unconditionally when Tegra support is
> enabled. In order to avoid having to ifdef the forthcoming reset driver
> implementation, have ARCH_TEGRA select RESET_CONTROLLER.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> index 09e740f58b27..15c09294effa 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -14,6 +14,8 @@ config ARCH_TEGRA
>  	select MIGHT_HAVE_CACHE_L2X0
>  	select MIGHT_HAVE_PCI
>  	select PINCTRL
> +	select ARCH_HAS_RESET_CONTROLLER
> +	select RESET_CONTROLLER

I don't think RESET_CONTROLLER is necessary given this:

	menuconfig RESET_CONTROLLER
		bool "Reset Controller Support"
		default y if ARCH_HAS_RESET_CONTROLLER

I suppose that would still make it possible to deselect RESET_CONTROLLER
and cause breakage. Explicitly selecting it avoids that, so:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--s9pXJW6w71JX4l3T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmJJQAAoJEN0jrNd/PrOhw0EP/inys9tjvsW4PXElVz3qun5R
w65oSJyPo51huVtueFep+2Kcjzz380qRaSM97lo8t5GD4luUcvR4KzQ9Zo/vfspc
WG9I5e3THKlbdqIEfkHmEusSOFJUV5maPpD9KAIty5tMUWRrArWkaLe2HADKeq7y
QgzfZ8rRN1bjJs2pEYdj85fmpEI0drQygX4mKyjqG9+dJt9oCd3jXHS2NvS1aKhV
6GzWRGwP4jPeehfRejFVno1BShoMo9SdPqz3bcKI63tlw69/qJ1YuCLRBdiS0ZZ6
IjVa+g6X1uPo3rJ3vLEOP4Rnb1QhMI86DCQCDaDfrPIWDSUEv20WZ6ekfG+IpNao
xVuqnrHC8yxTCl+udwURzZAY+ubkd5SZBptYrdAHjMwvQWx7oiexWt7lh6jOpNnn
u6Ufiw4g5IAXWrycTDVRSMnpVzi6ODCLvlZucqweMEs0UQ4eiqUasIOm1dhFoipJ
SyTLbn0VfMq2hYUNi8j8l1fOzVmIqLcNndzuTXTB4O8rpfkow/DpYG0rlAatdl+4
gcL/L8d/w/YnXDumlrp++6a54erETWFPl8jvNKOxfTEDhsh93JFUoN0EmHctEdxO
6ztufIG6YMzGSqMudpOPcY0+U6QmUeYS7hnnu0QHY7ZO+WG8PmqtkSOLEsvf8+JC
PEuBZCosVfSHBG83d/3L
=OX1m
-----END PGP SIGNATURE-----

--s9pXJW6w71JX4l3T--

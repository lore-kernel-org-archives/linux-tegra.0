From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: mutually exclude ZBOOT_ROM and AUTO_ZRELADDR
Date: Fri, 14 Oct 2011 18:29:48 +0200
Message-ID: <201110141829.48634.arnd@arndb.de>
References: <20111014071500.GP21648@n2100.arm.linux.org.uk> <1318607945-6807-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318607945-6807-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 14 October 2011, Olof Johansson wrote:
> This way platforms that want it can select AUTO_ZRELADDR without issues caused by
> someone manually also enabling ZBOOT_ROM.
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 82973b2..2ad58e8 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1814,6 +1814,7 @@ config ZBOOT_ROM_BSS
>  config ZBOOT_ROM
>  	bool "Compressed boot loader in ROM/flash"
>  	depends on ZBOOT_ROM_TEXT != ZBOOT_ROM_BSS
> +	depends on !AUTO_ZRELADDR
>  	help
>  	  Say Y here if you intend to execute your compressed kernel image
>  	  (zImage) directly from ROM or flash.  If unsure, say N.

Unfortunately, you cannot have it both ways:

arnd@ocdc-kvm:~/linux-arm$ make O=obj-tmp CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm  -sj20  menuconfig
arch/arm/Kconfig:1761:error: recursive dependency detected!
arch/arm/Kconfig:1761:  symbol ZBOOT_ROM depends on AUTO_ZRELADDR
arch/arm/Kconfig:1899:  symbol AUTO_ZRELADDR depends on ZBOOT_ROM

	Arnd

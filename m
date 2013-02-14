From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: dt: add header to define GPIO flags
Date: Thu, 14 Feb 2013 21:48:16 +0100
Message-ID: <20130214.224816.1898594449880044716.hdoyu@nvidia.com>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org><1360791198-29462-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360791198-29462-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Wed, 13 Feb 2013 22:33:10 +0100:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Many GPIO device tree bindings use the same flags. Create a header to
> define those.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/gpio.h |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 arch/arm/boot/dts/gpio.h
> 
> diff --git a/arch/arm/boot/dts/gpio.h b/arch/arm/boot/dts/gpio.h
> new file mode 100644
> index 0000000..4c9da69
> --- /dev/null
> +++ b/arch/arm/boot/dts/gpio.h
> @@ -0,0 +1,10 @@
> +/*
> + * This header provides constants for most GPIO bindings.
> + *
> + * Most GPIO bindings include a flags cell as part of the GPIO specifier.
> + * In most cases, the format of the flags cell uses the standard values
> + * defined in this header.
> + */

#ifdef _DTS_GPIO_H
#define _DTS_GPIO_H

> +
> +#define GPIO_ACTIVE_HIGH 0
> +#define GPIO_ACTIVE_LOW 1

#endif /* _DTS_GPIO_H */

To avoid multple inclusion problems, do we want the above
ifdef/define/endif for other DT header files as well?

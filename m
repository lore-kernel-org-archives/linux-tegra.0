From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] usb: host: tegra remove include of <mach/iomap.h>
Date: Wed, 3 Oct 2012 10:14:50 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6DDF8AED17@BGMAIL02.nvidia.com>
References: <1349218165-3494-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1349218165-3494-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, October 03, 2012 4:19 AM
> To: Greg Kroah-Hartman
> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Stephen
> Warren; Venu Byravarasu
> Subject: [PATCH] usb: host: tegra remove include of <mach/iomap.h>
> 
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Almost nothing from this file is used, and the file will hopefully be
> deleted soon. Copy the tiny portions that are used directly into
> ehci-tegra.c. I believe that Venu Byravarasu is working on cleaning up
> our USB driver, and those cleanups will remove the need for these
> constants.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Greg, if this patch can get into 3.7 (it's late, I know) at a point before
> wherever you branch off your USB tree for 3.8, then that would be great.
> If not, may I please request this patch be merged into a separate branch/tag
> that is merged into both the Tegra and USB trees for 3.8, since I will
> probably have cleanup patches in the Tegra tree that depend on this change,
> and Venu will likely be sending patches through the USB tree that will need
> to be merged with this too.
> ---
>  drivers/usb/host/ehci-tegra.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 6223d17..2de0890 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -28,7 +28,10 @@
>  #include <linux/pm_runtime.h>
> 
>  #include <linux/usb/tegra_usb_phy.h>
> -#include <mach/iomap.h>
> +
> +#define TEGRA_USB_BASE			0xC5000000
> +#define TEGRA_USB2_BASE			0xC5004000
> +#define TEGRA_USB3_BASE			0xC5008000
> 
>  #define TEGRA_USB_DMA_ALIGN 32
> 

This change looks fine to me. Plz consider my ACK.
Acked-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> 

> --
> 1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

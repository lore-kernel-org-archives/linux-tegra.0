From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: phy: tegra: Include proper GPIO consumer header to
 fix compile testing
Date: Tue, 3 Mar 2020 18:10:53 +0300
Message-ID: <9cce90a5-88b5-b875-9d20-34b5a9dd165e@gmail.com>
References: <1583234960-24909-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1583234960-24909-1-git-send-email-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

03.03.2020 14:29, Krzysztof Kozlowski пишет:
> The driver uses only GPIO Descriptor Consumer Interface so include
> proper header.  This fixes compile test failures (e.g. on i386):
> 
>     drivers/usb/phy/phy-tegra-usb.c: In function ‘ulpi_phy_power_on’:
>     drivers/usb/phy/phy-tegra-usb.c:695:2: error:
>         implicit declaration of function ‘gpiod_set_value_cansleep’ [-Werror=implicit-function-declaration]
>     drivers/usb/phy/phy-tegra-usb.c: In function ‘tegra_usb_phy_probe’:
>     drivers/usb/phy/phy-tegra-usb.c:1167:11: error:
>         implicit declaration of function ‘devm_gpiod_get_from_of_node’ [-Werror=implicit-function-declaration]
> 
> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index 6153cc35aba0..cffe2aced488 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -12,12 +12,11 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/resource.h>
>  #include <linux/slab.h>
> 

Thanks,

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

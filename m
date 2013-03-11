From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/5] rtc: tegra: use module_platform_driver_probe for
 module init/exit
Date: Mon, 11 Mar 2013 11:16:03 -0600
Message-ID: <513E1153.20207@wwwdotorg.org>
References: <1362852588-13362-1-git-send-email-ldewangan@nvidia.com> <1362852588-13362-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362852588-13362-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/09/2013 11:09 AM, Laxman Dewangan wrote:
> Use macro module_platform_driver_probe() to reduce some of the
> boilerplate code in the driver.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/rtc/rtc-tegra.c |   12 +-----------
>  1 files changed, 1 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> index f7718de..4cba10d 100644
> --- a/drivers/rtc/rtc-tegra.c
> +++ b/drivers/rtc/rtc-tegra.c
> @@ -451,17 +451,7 @@ static struct platform_driver tegra_rtc_driver = {
>  	},
>  };
>  
> -static int __init tegra_rtc_init(void)
> -{
> -	return platform_driver_probe(&tegra_rtc_driver, tegra_rtc_probe);
> -}
> -module_init(tegra_rtc_init);
> -
> -static void __exit tegra_rtc_exit(void)
> -{
> -	platform_driver_unregister(&tegra_rtc_driver);
> -}
> -module_exit(tegra_rtc_exit);
> +module_platform_driver_probe(tegra_rtc_driver, tegra_rtc_probe);

Out of curiosity here, why not just module_platform_driver(); can't the
instantiation of the RTC device be driven by the presence of the DT
node, and hence the creation of the platform device object, just like
any other driver/device?

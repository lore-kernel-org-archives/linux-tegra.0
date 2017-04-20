From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: select IOMMU_IOVA
Date: Thu, 20 Apr 2017 09:47:35 +0300
Message-ID: <a94db66f-4e81-396f-58f4-583dd64055ca@kapsi.fi>
References: <20170419182449.885312-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170419182449.885312-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Ah, had to forget something :)

Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 19.04.2017 21:24, Arnd Bergmann wrote:
> When IOMMU_IOVA is not built-in but host1x is, we get a link error:
>
> drivers/gpu/host1x/dev.o: In function `host1x_remove':
> dev.c:(.text.host1x_remove+0x50): undefined reference to `put_iova_domain'
> drivers/gpu/host1x/dev.o: In function `host1x_probe':
> dev.c:(.text.host1x_probe+0x31c): undefined reference to `init_iova_domain'
> dev.c:(.text.host1x_probe+0x38c): undefined reference to `put_iova_domain'
> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
> cdma.c:(.text.host1x_cdma_init+0x238): undefined reference to `alloc_iova'
> cdma.c:(.text.host1x_cdma_init+0x2c0): undefined reference to `__free_iova'
> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_deinit':
> cdma.c:(.text.host1x_cdma_deinit+0xb0): undefined reference to `free_iova'
>
> This adds the same select statement that we have for drm_tegra.
>
> Fixes: 404bfb78daf3 ("gpu: host1x: Add IOMMU support")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/gpu/host1x/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
> index b2fd029d67b3..91916326957f 100644
> --- a/drivers/gpu/host1x/Kconfig
> +++ b/drivers/gpu/host1x/Kconfig
> @@ -1,6 +1,7 @@
>  config TEGRA_HOST1X
>  	tristate "NVIDIA Tegra host1x driver"
>  	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
> +	select IOMMU_IOVA if IOMMU_SUPPORT
>  	help
>  	  Driver for the NVIDIA Tegra host1x hardware.
>
>

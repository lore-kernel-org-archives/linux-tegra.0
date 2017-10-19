From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: compile error in 4.14-rc5 with nvidia tegra enabled
Date: Thu, 19 Oct 2017 11:11:46 +0100
Message-ID: <d006a085-d81f-4632-35c9-4e9d607a6504@nvidia.com>
References: <20171019084210.lql5kffhluvxvquu@lemon.iwr.uni-heidelberg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171019084210.lql5kffhluvxvquu-/wZ4IcVS6hAdmw7VdWMmteH3J2bgQ+4lG9Ur7JDdleE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hermann Lauer <Hermann.Lauer-hEciA7+sKtudPOQpRHQ53DeJuz7u0hKX@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Adding linux-tegra and Mikko ...

On 19/10/17 09:42, Hermann Lauer wrote:
> Hello,
> compiling 4.14-rc{4,5} with a debian testing arm config yields the attached
> error. Disabling the Nvidia tegra architecture (unneeded on
> Banana{Pro,Pi,Ultra}) helps.
> 
> Thanks,
>  greetings
>    Hermann
> 
>   CC [M]  drivers/gpu/host1x/cdma.o                                                                             
> drivers/gpu/host1x/cdma.c: In function ‘host1x_pushbuffer_init’:                                                
> drivers/gpu/host1x/cdma.c:94:48: error: passing argument 3 of ‘dma_alloc_wc’ from incompatible pointer type [-We
> rror=incompatible-pointer-types]                                                                                
>    pb->mapped = dma_alloc_wc(host1x->dev, size, &pb->phys,                                                      
>                                                 ^                                                               
> In file included from drivers/gpu/host1x/cdma.c:22:0:                                                           
> ./include/linux/dma-mapping.h:780:21: note: expected ‘dma_addr_t * {aka long long unsigned int *}’ but argument 
> is of type ‘phys_addr_t * {aka unsigned int *}’                                                                 
>  static inline void *dma_alloc_wc(struct device *dev, size_t size,                                              
>                      ^~~~~~~~~~~~                                                                               
> drivers/gpu/host1x/cdma.c:113:48: error: passing argument 3 of ‘dma_alloc_wc’ from incompatible pointer type [-W
> error=incompatible-pointer-types]                                                                               
>    pb->mapped = dma_alloc_wc(host1x->dev, size, &pb->phys,                                                      
>                                                 ^                                                               
> In file included from drivers/gpu/host1x/cdma.c:22:0:                                                           
> ./include/linux/dma-mapping.h:780:21: note: expected ‘dma_addr_t * {aka long long unsigned int *}’ but argument 
> is of type ‘phys_addr_t * {aka unsigned int *}’                                                                 
>  static inline void *dma_alloc_wc(struct device *dev, size_t size,                                              
>                      ^~~~~~~~~~~~                                                                               
>   CC [M]  drivers/hid/hid-ntrig.o                                                                               
> cc1: some warnings being treated as errors                                                                      

Thanks for the report. I don't see this. What config and toolchain are
you using?

Mikko, have you seen this?

Cheers
Jon

-- 
nvpublic

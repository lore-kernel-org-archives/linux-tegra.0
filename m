From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [v2 1/1] ARM: dma-mapping: Call arm_dma_set_mask() if no
 ->set_dma_mask()
Date: Tue, 29 Jan 2013 13:47:26 +0100
Message-ID: <5107C4DE.7060607@samsung.com>
References: <5107B301.2060802@samsung.com>
 <1359462438-21006-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1359462438-21006-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

On 1/29/2013 1:27 PM, Hiroshi Doyu wrote:
> struct dma_map_ops iommu_ops doesn't have ->set_dma_mask, which causes
> crash when dma_set_mask() is called from some driver.
>
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm/include/asm/dma-mapping.h |   11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-mapping.h
> index 5b579b9..63cc49c 100644
> --- a/arch/arm/include/asm/dma-mapping.h
> +++ b/arch/arm/include/asm/dma-mapping.h
> @@ -14,6 +14,7 @@
>   #define DMA_ERROR_CODE	(~0)
>   extern struct dma_map_ops arm_dma_ops;
>   extern struct dma_map_ops arm_coherent_dma_ops;
> +extern int arm_dma_set_mask(struct device *dev, u64 dma_mask);
>   
>   static inline struct dma_map_ops *get_dma_ops(struct device *dev)
>   {
> @@ -32,7 +33,13 @@ static inline void set_dma_ops(struct device *dev, struct dma_map_ops *ops)
>   
>   static inline int dma_set_mask(struct device *dev, u64 mask)
>   {
> -	return get_dma_ops(dev)->set_dma_mask(dev, mask);
> +	struct dma_map_ops *ops = get_dma_ops(dev);
> +	BUG_ON(!ops);
> +
> +	if (ops->set_dma_mask)
> +		return ops->set_dma_mask(dev, mask);
> +
> +	return arm_dma_set_mask(dev, mask);
>   }
>   
>   #ifdef __arch_page_to_dma
> @@ -112,8 +119,6 @@ static inline void dma_free_noncoherent(struct device *dev, size_t size,
>   
>   extern int dma_supported(struct device *dev, u64 mask);
>   
> -extern int arm_dma_set_mask(struct device *dev, u64 dma_mask);
> -
>   /**
>    * arm_dma_alloc - allocate consistent memory for DMA
>    * @dev: valid struct device pointer, or NULL for ISA and EISA-like devices

It can be done much simpler, please just add '.set_dma_mask = 
arm_dma_set_mask,'
to iommu_ops declaration. There is no point complicating the header files.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center

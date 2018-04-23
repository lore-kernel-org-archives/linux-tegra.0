From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v1] gpu: host1x: Fix dma_free_wc() argument in the error
 path
Date: Mon, 23 Apr 2018 12:58:04 +0300
Message-ID: <9bfd3550-b712-f838-cb96-5ca1255825d4@kapsi.fi>
References: <20180423095456.16697-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180423095456.16697-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

On 23.04.2018 12:54, Dmitry Osipenko wrote:
> If IOVA allocation or IOMMU mapping fails, dma_free_wc() is invoked with
> size=0 because of a typo, that triggers "kernel BUG at mm/vmalloc.c:124!".
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/host1x/cdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> index 93df28228721..0724122afeac 100644
> --- a/drivers/gpu/host1x/cdma.c
> +++ b/drivers/gpu/host1x/cdma.c
> @@ -127,7 +127,7 @@ static int host1x_pushbuffer_init(struct push_buffer *pb)
>  iommu_free_iova:
>  	__free_iova(&host1x->iova, alloc);
>  iommu_free_mem:
> -	dma_free_wc(host1x->dev, pb->alloc_size, pb->mapped, pb->phys);
> +	dma_free_wc(host1x->dev, size, pb->mapped, pb->phys);
>
>  	return err;
>  }
>

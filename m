From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 1/1] ARM: dma-mapping: Drop GFP_COMP for DMA memory
 allocations
Date: Wed, 16 Oct 2013 11:40:21 +0100
Message-ID: <20131016104021.GC5403@mudshark.cambridge.arm.com>
References: <1381918756-10389-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1381918756-10389-1-git-send-email-hdoyu@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <linux@arm.linux.org.uk>, steve.capper@arm.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 16, 2013 at 11:19:13AM +0100, Hiroshi Doyu wrote:
> arm_iommu_alloc_attrs wants to split pages after allocation in order
> to reduce the memory footprint. This does not work well with GFP_COMP
> pages, so drop this flag before allocation.
> 
> ref: ea2e7057c0234cfb8b09467d8f137760d371fc72:
> 
>     ARM: 7172/1: dma: Drop GFP_COMP for DMA memory allocations
> 
>     dma_alloc_coherent wants to split pages after allocation in order to
>     reduce the memory footprint. This does not work well with GFP_COMP
>     pages, so drop this flag before allocation.
> 
> Signed-off-by: Hiroshi Doyu <hdoyu@nvidia.com>
> ---
>  arch/arm/mm/dma-mapping.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index f5e1a84..955dd3e 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -1321,6 +1321,13 @@ static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
>  	struct page **pages;
>  	void *addr = NULL;
>  
> +	/* Following is a work-around (a.k.a. hack) to prevent pages
> +	 * with __GFP_COMP being passed to split_page() which cannot
> +	 * handle them.  The real problem is that this flag probably
> +	 * should be 0 on ARM as it is not supported on this
> +	 * platform--see CONFIG_HUGETLB_PAGE. */
> +	gfp &= ~(__GFP_COMP);

Right, except that we *do* have hugepage support on ARM, so this probably
needs fixing properly.

Will

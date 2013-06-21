From: Richard Zhao <rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dma: Drop __GFP_COMP for iommu dma memory
 allocations
Date: Fri, 21 Jun 2013 12:52:40 +0800
Message-ID: <20130621045240.GH17331@rizhao-lap>
References: <1371731460-15316-1-git-send-email-rizhao@nvidia.com>
 <51C2FDE0.4060206@cogentembedded.com>
 <CANg6MZg3A7-oXfdUSarQ8n0PRsS0_BLjqfQ914KUoSzDDtShFg@mail.gmail.com>
 <20130620.173511.831032817734076793.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130620.173511.831032817734076793.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org" <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 20, 2013 at 10:35:11PM +0800, Hiroshi Doyu wrote:
> Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote @ Thu, 20 Jun 2013 15:40:50 +0200:
> 
> > >> +       /*
> > >> +        * Following is a work-around (a.k.a. hack) to prevent pages
> > >> +        * with __GFP_COMP being passed to split_page() which cannot
> > >> +        * handle them.  The real problem is that this flag probably
> > >> +        * should be 0 on ARM as it is not supported on this
> > >> +        * platform; see CONFIG_HUGETLBFS.
> > >> +        */
> > >> +       gfp &= ~(__GFP_COMP);
> > >
> > >
> > >    Hm, what exactly is the sense you meant in using ()?
> > 
> > It's copy/paste from elsewhere in this file. At least it's consistent? :)
> 
> I almost sent the exact same one, actually it was under internal reivew;)
Ah, sorry I didn't search internal mails but only arm mail list for related
fix, since I thought it's not specific to tegra. Why not give it a
Reviewed-by or Tested-by?
> 
> This patch is similar but is the iommu version of:
Exactly.

Thanks
Richard
> 
> 
> commit ea2e7057c0234cfb8b09467d8f137760d371fc72
> Author: Sumit Bhattacharya <sumitb-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Thu Nov 24 00:47:12 2011 +0100
> 
>     ARM: 7172/1: dma: Drop GFP_COMP for DMA memory allocations
>     
>     dma_alloc_coherent wants to split pages after allocation in order to
>     reduce the memory footprint. This does not work well with GFP_COMP
>     pages, so drop this flag before allocation.
>     
>     This patch is ported from arch/avr32
>     (commit 3611553ef985ef7c5863c8a94641738addd04cff).
>     
>     [swarren: s/HUGETLB_PAGE/HUGETLBFS/ in comment, minor comment cleanup]
>     
>     Signed-off-by: Sumit Bhattacharya <sumitb-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>     Tested-by: Varun Colbert <vcolbert-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>     Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>     Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index ab58456..1aa664a 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -332,6 +332,15 @@ __dma_alloc(struct device *dev, size_t size, dma_addr_t *handle, gfp_t gfp,
>         struct page *page;
>         void *addr;
>  
> +       /*
> +        * Following is a work-around (a.k.a. hack) to prevent pages
> +        * with __GFP_COMP being passed to split_page() which cannot
> +        * handle them.  The real problem is that this flag probably
> +        * should be 0 on ARM as it is not supported on this
> +        * platform; see CONFIG_HUGETLBFS.
> +        */
> +       gfp &= ~(__GFP_COMP);
> +
>         *handle = ~0;
>         size = PAGE_ALIGN(size);

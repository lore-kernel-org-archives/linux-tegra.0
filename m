From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [RFC 04/42] drivers/dma: don't check resource with
 devm_ioremap_resource
Date: Fri, 10 May 2013 19:57:47 +0200
Message-ID: <20130510175739.GA2912@katana>
References: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
 <1368173847-5661-5-git-send-email-wsa@the-dreams.de>
 <518D21D4.6000609@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <518D21D4.6000609-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 10, 2013 at 10:35:32AM -0600, Stephen Warren wrote:
> On 05/10/2013 02:16 AM, Wolfram Sang wrote:
> > devm_ioremap_resource does sanity checks on the given resource. No need to
> > duplicate this in the driver.
> 
> > diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> 
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res) {
> > -		dev_err(&pdev->dev, "No mem resource for DMA\n");
> > -		return -EINVAL;
> > -	}
> > -
> >  	tdma->base_addr = devm_ioremap_resource(&pdev->dev, res);
> 
> One issue here is that it's not obvious just from reading the code
> that's left behind that the "missing" error-checking of the
> platform_get_resource() return value is OK because
> devm_ioremap_resource() will check it "for us". Everyone now has to
> mentally maintain a list of exceptions where it's OK not to error-check.

My goal is to make not-checking the standard case with devm.

> A similar situation exists for e.g. kzalloc already spewing an error
> when allocations fail, and so drivers don't need to print a diagnostic
> in that case, but it's helpful if they do in most other cases, but
> that's another issue.

My goal is to make drivers-not-printing-errors the standard case with devm :)

> Would it be better to introduce a new devm_ioremap_pdev_resource(pdev,
> index) that replaced both those two API calls with a single one. That
> way, only the author/reader of the new devm_ioremap_pdev_resource()
> would have to remember that caveat, and a single comment could be added
> so people unfamiliar with the code remember, without duplicating the
> comment in every driver.

I see two steps here:

1) make devm interface consistent
2) ease the devm interface with platform drivers

I am currently working on the first step.

Thanks,

   Wolfram

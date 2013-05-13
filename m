From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [RFC 04/42] drivers/dma: don't check resource with
 devm_ioremap_resource
Date: Mon, 13 May 2013 08:08:46 +0200
Message-ID: <20130513060842.GA2947@katana>
References: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
 <1368173847-5661-5-git-send-email-wsa@the-dreams.de>
 <518D21D4.6000609@wwwdotorg.org>
 <20130510175739.GA2912@katana>
 <518D49B0.4050901@wwwdotorg.org>
 <20130512160440.GA27639@intel.com>
 <20130512182802.GA2922@katana>
 <20130513021000.GB27639@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130513021000.GB27639-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


> > > > >>> devm_ioremap_resource does sanity checks on the given resource. No need to
> > > > >>> duplicate this in the driver.
> > > > >>
> > > > >>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> > > > >>
> > > > >>>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > >>> -	if (!res) {
> > > > >>> -		dev_err(&pdev->dev, "No mem resource for DMA\n");
> > > > >>> -		return -EINVAL;
> > > > >>> -	}
> > > > >>> -
> > > > >>>  	tdma->base_addr = devm_ioremap_resource(&pdev->dev, res);
> > > > >>
> > > > >> One issue here is that it's not obvious just from reading the code
> > > > >> that's left behind that the "missing" error-checking of the
> > > > >> platform_get_resource() return value is OK because
> > > > >> devm_ioremap_resource() will check it "for us". Everyone now has to
> > > > >> mentally maintain a list of exceptions where it's OK not to error-check.
> > > > > 
> > > > > My goal is to make not-checking the standard case with devm.
> > > > 
> > > > OK, if no parameters passed to any devm function every need to be
> > > > error-checked, that'll certainly be a bit easier to remember.
> > > Okay to remove the log message and move to devm_ but I dont agree with this
> > > patch not returning error above. We shouldnt supress the error..
> > 
> > The error will be reported because devm_ioremap_resource will return an
> > ERR_PTR.
> And this patch removed the check on 'res' pointer, so on failure we continue...

I don't get it. What is the difference between a manual check of res and
the directly following devm_ioremap_resource returning ERR_PTR(-EINVAL)
if res is NULL?

From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] drivers/dma: drop modular code from non modular
 drivers
Date: Thu, 10 Dec 2015 08:42:02 +0530
Message-ID: <20151210031202.GH1854@localhost>
References: <1449703322-17762-1-git-send-email-paul.gortmaker@windriver.com>
 <7162994.ydt4N8UgZZ@wuerfel>
 <20151210001741.GT22885@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151210001741.GT22885-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 09, 2015 at 07:17:42PM -0500, Paul Gortmaker wrote:
> [Re: [PATCH 0/6] drivers/dma: drop modular code from non modular drivers] On 10/12/2015 (Thu 00:29) Arnd Bergmann wrote:
> 
> > On Wednesday 09 December 2015 18:21:56 Paul Gortmaker wrote:
> > > This series of commits is a slice of a larger project to ensure
> > > people don't have dead code for module removal in non-modular
> > > drivers.  Overall there is roughly 5k lines of dead code in the
> > > kernel due to this.
> > > 
> > > There is a quasi-separate theme, in that some of the drivers were
> > > allowing an unbind implicitly since it is enabled by default.  But
> > > for core DMA infrastructure drivers, this doesn't seem useful -- so
> > > we also disable that here which allows us to delete any ".remove"
> > > functions from the drivers that would otherwise be called during the
> > > (impossible to trigger) module removal.
> > > 
> > > Since ARM covers these files the best of all architectures, each
> > > file was build tested for allmodconfig on ARM, which at the same
> > > time confirms that the files are not built with "CC [M]" -- hence
> > > genuinely non-modular.
> > > 
> > > My testing and the larger patch series in general has been done
> > > against the latest linux-next tree.
> > > 
> > > 
> > 
> > We are in the process of changing the DMA drivers to a new way of
> > passing the "filter" function around. We can soon build them
> > all as loadable modules again.
> 
> Hi Arnd,
> 
> Thanks for the feedback -- just to clarify, you are suggesting I hold
> on the series until I see what emerges in the next merge window?

Yes, with this we should be able to have loadable modules for *most* so we
may not require this

Thanks
-- 
~Vinod

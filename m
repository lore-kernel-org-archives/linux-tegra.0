From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: fix of_irq_get() error check
Date: Wed, 9 Aug 2017 11:40:20 +0530
Message-ID: <20170809061020.GT3053@localhost>
References: <20170730181051.733168837@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170730181051.733168837-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jul 30, 2017 at 09:10:44PM +0300, Sergei Shtylyov wrote:
> of_irq_get() may return 0 as well as negative error number on failure,
> while the driver only checks for the negative values. The driver would then
> call request_irq(0, ...) in tegra_adma_alloc_chan_resources() and never get
> valid channel interrupt.
> 
> Check for 'tdc->irq <= 0' instead and return -ENXIO from the driver's probe
> iff of_irq_get() returned 0.

Applied, thanks

-- 
~Vinod

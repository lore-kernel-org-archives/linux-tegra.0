From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 6/6] dmaengine: tegra-apb: Disable interrupts on removal
Date: Wed, 28 Oct 2015 15:53:41 +0900
Message-ID: <20151028065339.GE3041@vkoul-mobl.iind.intel.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
 <1444983957-18691-7-git-send-email-jonathanh@nvidia.com>
 <5620BB0E.9040400@metafoo.de>
 <5620C383.3060104@nvidia.com>
 <5620D42A.8060007@metafoo.de>
 <5620D7FE.2010205@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5620D7FE.2010205@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 16, 2015 at 11:57:02AM +0100, Jon Hunter wrote:
> >>> How about just calling free_irq()? That's how you'd typically handle this.
> >>
> >> Yes, however, the interrupt is requested by devm_request_irq(). I guess
> >> I could call devm_free_irq() here?
> > 
> > Just use request_irq() instead of devm_request_irq(). You have the same
> > issue on the error path in the probe function anyway and also need to add
> > the free_irq() before the tasklet_kill() there as well.
> 
> I was wondering about that but the tasklets should never be scheduled if
> the probe does not succeed, so I think it is ok.

This is actually very racy, if probe fails but due to devm_ calls your irq
is alive till it freed by core

And a faulty device triggering irq can complicate matters, so for irq IMHO
we don't get much benefit with devm_ variant

-- 
~Vinod

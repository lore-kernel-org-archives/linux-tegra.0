From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V2 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Wed, 7 Oct 2015 17:33:50 +0100
Message-ID: <20151007163349.GB31982@leverpostej>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-2-git-send-email-jonathanh@nvidia.com>
 <20151005131215.GN19064@leverpostej>
 <56139181.4090706@nvidia.com>
 <561451D3.2070605@wwwdotorg.org>
 <56153991.3040409@nvidia.com>
 <561542D3.8030607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <561542D3.8030607@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

[...]

> >>>>>+- dma-channels: Must be 22. Defines the number of DMA channels
> >>>>>supported
> >>>>>+  by the DMA controller.
> >>>>
> >>>>If this has to be a fixed value, why is it necessary? Why does the
> >>>>driver not just know this?
> >>>>
> >>>>Are there other instances of this IP block where this differs?
> >>>
> >>>So this will change for future devices and yes it may seem silly now to
> >>>have something that fixed and appears to be constant but I was trying to
> >>>future proof the binding. May be the comment should read "For tegra210
> >>>must be 22", however, I thought the compatible string would imply this.
> >>
> >>Typically you'd want a table in the driver that maps from compatible
> >>value to the set of per-SoC data that's associated with the compatible
> >>value. Then, you don't need to put this data into the DT.
> >
> >Yes I have seen that which I was not sure that I was a fan of, given
> >that we have DT and its purpose is to describe the hardware. So may be
> >the problem I have is deciding on which hardware parameters should be
> >described in DT versus those that should be place in the driver itself.
> >I am not sure if there is a rule of thumb for this type of thing?
> 
> It seems to be a matter of preference.
> 
> I think DT is mainly about identifying which HW is present. Facets
> of the HW that are fixed (100% derivable from the compatible value)
> belong in the driver. If we took the opposite view, we should put a
> description of every register/field layout in the DT in case they
> change on new HW and we don't want to edit the driver code to take
> account of that, and in fact should put byte code into the DT since
> simple data might not be enough to allow us not to edit the driver.
> Facets that vary between boards, use-cases, etc. are the main
> benefit of DT in my opinion, not slow-moving data specific to SoCs.

I think it depends on what the difference is as opposed to how quickly
it changes.

If there's some known-configurable but non-probeable property of an IP
block, then describing that explicitly makes sense if you can predict
what the other configurations will look like in terms of the programming
interface (e.g. the register layout). That gives you a degree of forward
compatibility, with less churn and a smaller driver.

If the register layout changes in a non-predictable fashion, you cannot
capture that in a binding a need more code. There will always be
elements which are non-predictable and need changes, but that need not
be the default case.

Mark.

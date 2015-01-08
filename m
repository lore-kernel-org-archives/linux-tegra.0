From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 1/11] ARM: tegra: add function to control the GPU rail
 clamp
Date: Thu, 8 Jan 2015 11:32:06 +0200
Message-ID: <20150108093205.GV10073@tbergstrom-lnx.Nvidia.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
 <1419331204-26679-2-git-send-email-vinceh@nvidia.com>
 <1419426990.2179.7.camel@lynxeye.de>
 <549B7638.2010405@nvidia.com>
 <20150105150932.GG12010@ulmo.nvidia.com>
 <20150107101900.GP10073@tbergstrom-lnx.Nvidia.com>
 <54AD0F37.5080609@nvidia.com>
 <20150107141254.GS10073@tbergstrom-lnx.Nvidia.com>
 <20150107141938.GA7392@nvidia.com>
 <20150107151206.GG1621@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150107151206.GG1621@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Vince Hsu <vinceh@nvidia.com>, Lucas Stach <dev@lynxeye.de>, swarren@wwwdotorg.org, gnurou@gmail.com, bskeggs@redhat.com, martin.peres@free.fr, seven@nimrod-online.com, samuel.pitoiset@gmail.com, nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

> > And specify the dependencies between domains in DT?
> 
> I think the dependencies could be in the driver. Of course the power
> domains are per-SoC data, so really shouldn't be in the DTS either (the
> data is all implied by the compatible value) but there's no good way to
> get at the clocks and resets without DT, so I think that's a reasonable
> trade-off.
> 
> It seems to me like there are only two dependencies:
> 
> 	DIS and DISB depend on SOR
> 	VE depends on DIS
> 
> That's according to 5.6.6 "Programming Guide for Power Gating and
> Ungating" of the Tegra K1 TRM. It also seems like a bunch of modules are
> part of seemingly unrelated domains. Especially SOR seems to cover a
> large range of modules (MIPI-CAL, DPAUX, SOR, HDMI, DSI, DSIB and
> HDA2HDMI).
> 
> Given that we may want to more fine-grainedly control clocks to save
> power, don't we need to control clocks and resets within the drivers? I
> think the runtime PM framework makes sure to call this in the right
> order, so for suspend, the sequence would be:
> 
> 	1) device->suspend
> 	2) domain->suspend
> 
> and for resume:
> 
> 	1) domain->resume
> 	2) device->resume
> 
> But then we're back to square one, namely that the MC flush doesn't work
> properly, since it needs to be implemented in domain->suspend. Does that
> mean we can't clock-gate modules? In order to ensure a proper powergate
> sequence, the domain code would need to clk_enable() the module clock to
> make sure it stays on during the reset sequence. But if the domain code
> has a reference to the clock, then the driver can't clock-gate the
> module anymore by calling clk_disable().
> 
> Am I missing something?
> 

There's a difference between having a reference and actually enabling the
clock. the domain powergate method will only be called when the clocks of
all modules in the domain are off. So the powergate method can then turn them
on again, do the module resets and client flushes and then disable them
again. Same for ungate. So I don't see a problem here?

Cheers,

Peter.

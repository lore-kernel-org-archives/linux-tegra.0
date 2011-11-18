From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH 03/10] arm/tegra: prepare clock code for multiple tegra
 variants
Date: Fri, 18 Nov 2011 12:18:40 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1740D74F48@HQMAIL01.nvidia.com>
References: <1321546766-26770-1-git-send-email-pdeschrijver@nvidia.com>
 <1321546766-26770-4-git-send-email-pdeschrijver@nvidia.com>
 <20111118190649.GB31678@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20111118190649.GB31678@quad.lixom.net>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Friday, November 18, 2011 12:07 PM:
> On Thu, Nov 17, 2011 at 06:19:17PM +0200, Peter De Schrijver wrote:
> > Rework the tegra20 clock code to support multiple tegra variants :
> >
> >  * remove tegra2_periph_reset_assert/tegra2_periph_reset_deassert. This
> >    functionality should be in clock.c.
> >  * compile tegra_sdmmc_tap_delay only on tegra20 as this feature will not
> >    be available in future variants.
> >  * don't export clk_measure_input_freq as its functionality is also available
> >    using clk_get_rate().
...
> > @@ -403,10 +405,11 @@ void __init tegra_init_clock(void)
> >  }
> >
> >  /*
> > - * The SDMMC controllers have extra bits in the clock source register that
> > - * adjust the delay between the clock and data to compenstate for delays
> > - * on the PCB.
> > + * The SDMMC controllers on tegra20 have extra bits in the clock source
> > + * register that adjust the delay between the clock and data to compenstate
> > + * for delays on the PCB.
> >   */
> > +#ifdef CONFIG_ARCH_TEGRA_2x_SOC
> >  void tegra_sdmmc_tap_delay(struct clk *c, int delay)
> >  {
> >  	unsigned long flags;
> > @@ -415,6 +418,7 @@ void tegra_sdmmc_tap_delay(struct clk *c, int delay)
> >  	tegra2_sdmmc_tap_delay(c, delay);
> >  	spin_unlock_irqrestore(&c->spinlock, flags);
> >  }
> > +#endif
> 
> Ifdeffing this out doesn't quite make sense. Better to do a #ifdef in the
> include file with an #else case that fills in an empty function. This
> needs to be abstracted differently for the two platforms anyway but
> that can be done separately from this. Does tegra3 have tap delay setup
> as well? (I don't have the TRM handy right now).

I vote just rip this function out altogether.

It isn't used in mainline, chromeos-2.6.38, chromeos-3.0, nor our internal
2.6.36 or 2.6.39 kernels.

Equally, I can't find any documentation of the register bits this code
touches in either Tegra20 or Tegra30 TRMs.

-- 
nvpublic


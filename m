From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v6 03/10] arm/tegra: prepare clock code for multiple
 tegra variants
Date: Tue, 13 Dec 2011 13:21:26 +0200
Message-ID: <20111213112126.GW27578@tbergstrom-lnx.Nvidia.com>
References: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
 <1323348254-29072-4-git-send-email-pdeschrijver@nvidia.com>
 <CAMbhsRT97Oq-=8f9++f6Jgg=YVaimKSz68xcDDNbDbvL+V5fJg@mail.gmail.com>
 <20111209091319.GI27578@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111209091319.GI27578@tbergstrom-lnx.Nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Gary King <gking@nvidia.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 09, 2011 at 10:13:20AM +0100, Peter De Schrijver wrote:
> On Thu, Dec 08, 2011 at 07:25:53PM +0100, Colin Cross wrote:
> > On Thu, Dec 8, 2011 at 4:43 AM, Peter De Schrijver <pdeschrijver@nvidia.com<mailto:pdeschrijver@nvidia.com>> wrote:
> > Rework the tegra20 clock code to support multiple tegra variants :
> > 
> >  * remove tegra2_periph_reset_assert/tegra2_periph_reset_deassert. This
> >   functionality should be in clock.c.
> >  * compile tegra_sdmmc_tap_delay only on tegra20 as this feature will not
> >   be available in future variants.
> >  * don't export clk_measure_input_freq as its functionality is also available
> >   using clk_get_rate().
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com<mailto:pdeschrijver@nvidia.com>>
> > ---
> >  arch/arm/mach-tegra/clock.c         |   12 +++++++-----
> >  arch/arm/mach-tegra/clock.h         |    8 ++++----
> >  arch/arm/mach-tegra/tegra2_clocks.c |   14 +-------------
> >  arch/arm/mach-tegra/timer.c         |   12 ++++++++----
> >  4 files changed, 20 insertions(+), 26 deletions(-)
> > 
> > diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
> > index f8d41ff..f27bdcc 100644
> > --- a/arch/arm/mach-tegra/clock.c
> > +++ b/arch/arm/mach-tegra/clock.c
> > @@ -387,13 +387,15 @@ EXPORT_SYMBOL(tegra_clk_init_from_table);
> > 
> >  void tegra_periph_reset_deassert(struct clk *c)
> >  {
> > -       tegra2_periph_reset_deassert(c);
> > +       BUG_ON(!c->ops->reset);
> > +       c->ops->reset(c, false);
> >  }
> >  EXPORT_SYMBOL(tegra_periph_reset_deassert);
> > 
> >  void tegra_periph_reset_assert(struct clk *c)
> >  {
> > -       tegra2_periph_reset_assert(c);
> > +       BUG_ON(!c->ops->reset);
> > +       c->ops->reset(c, true);
> >  }
> >  EXPORT_SYMBOL(tegra_periph_reset_assert);
> > 
> > @@ -403,9 +405,9 @@ void __init tegra_init_clock(void)
> >  }
> > 
> >  /*
> > - * The SDMMC controllers have extra bits in the clock source register that
> > - * adjust the delay between the clock and data to compenstate for delays
> > - * on the PCB.
> > + * The SDMMC controllers on tegra20 have extra bits in the clock source
> > + * register that adjust the delay between the clock and data to compenstate
> > + * for delays on the PCB.
> >  */
> >  void tegra_sdmmc_tap_delay(struct clk *c, int delay)
> >  {
> > 
> > I created this wrapper around tegra2_sdmmc_tap_delay because I guessed the same requirement would be present in tegra3.  If you don't expect this to be required on anything but tegra2, you could drop the wrapper and just have callers use tegra2_sdmmc_tap_delay.
> > 
> 
> I will ask around if this is needed for tegra30.
> 

This feature moved to the SDMMC block in tegra30, so we don't need any code
in the clock framework anymore. So I think we should just use
tegra2_sdmmc_tap_delay directly.

Cheers,

Peter.

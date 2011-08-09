From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 4/5 V2] ARM: tegra: paz00: add clocks required for usb operation
Date: Tue, 9 Aug 2011 21:18:43 +0200
Message-ID: <201108092118.43724.marvin24@gmx.de>
References: <cover.1312735430.git.marvin24@gmx.de> <201108092029.17546.marvin24@gmx.de> <CAOesGMiV-jrcGFUXBf=5H__-gXvwgxUias7WGouYTvAy+k=oMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMiV-jrcGFUXBf=5H__-gXvwgxUias7WGouYTvAy+k=oMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Olof,

On Tuesday 09 August 2011 20:30:47 Olof Johansson wrote:
> On Tue, Aug 9, 2011 at 11:29 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> >
> > These clocks are required for usb operation.
> > ---
> >  arch/arm/mach-tegra/board-paz00.c |    6 ++++++
> >  1 files changed, 6 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-
paz00.c
> > index 45111f6..89a3dda 100644
> > --- a/arch/arm/mach-tegra/board-paz00.c
> > +++ b/arch/arm/mach-tegra/board-paz00.c
> > @@ -145,6 +145,12 @@ static __initdata struct tegra_clk_init_table 
paz00_clk_init_table[] = {
> >        /* name         parent          rate            enabled */
> >        { "uarta",      "pll_p",        216000000,      true },
> >        { "uartd",      "pll_p",        216000000,      true },
> > +
> > +       { "pll_p_out4", "pll_p",        24000000,       true },
> > +       { "usbd",       "clk_m",        12000000,       true },
> > +       { "usb2",       "clk_m",        12000000,       true },
> > +       { "usb3",       "clk_m",        12000000,       true },
> 
> Do they all have to be enabled here? Setting the parent and rate makes
> sense, but you shouldn't have to enable them.

usb also works with all three usb* clocks set to disabled (they are even not 
required to be listed there at all). Honestly, the whole clock setup is a little 
obscure to me. 

Can these clocks be safly disabled in the clock table and hope that the ehci 
host driver will enable them if required? Also independent to what the 
bootloader does, which I don't know? I'm asking because we may switch from the 
proprietary bootloader (fastboot?) to u-boot in the near future.

Marc

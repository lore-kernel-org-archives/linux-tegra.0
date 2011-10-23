From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: paz00: add support for the embedded
 controller
Date: Sun, 23 Oct 2011 08:54:58 +0200
Message-ID: <20111023065222.GA8537@dhcp-172-17-9-83.mtv.corp.google.com>
References: <cover.1319313019.git.marvin24@gmx.de>
 <b5f0dc6e7996a21d4493f8e7765e322fe6d8b7ef.1319313020.git.marvin24@gmx.de>
 <CAOesGMhVFk6n0n98akeVdM-cLtK9ip0-M01u9jy8WEdJNU+xsg@mail.gmail.com>
 <1625092.81oZlljjhQ@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1625092.81oZlljjhQ@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

[+gregkh]

On Sat, Oct 22, 2011 at 10:49:42PM +0200, Marc Dietrich wrote:
> On Saturday 22 October 2011 13:27:12 Olof Johansson wrote:
> > On Sat, Oct 22, 2011 at 1:16 PM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> > > This adds support for the embedded controller known as NVEC. The driver
> > > lives currently in the staging tree and we aim to promote it one level
> > > higher in the near future.
> > > 
> > > The NVEC driver uses the I2C resources of the master controller for now
> > > until slave support is added to the i2c-tegra driver.
> > > 
> > > diff --git a/arch/arm/mach-tegra/board-paz00.c
> > > b/arch/arm/mach-tegra/board-paz00.c index 602f8dd..3f46b37 100644
> > > --- a/arch/arm/mach-tegra/board-paz00.c
> > > +++ b/arch/arm/mach-tegra/board-paz00.c
> > > @@ -44,6 +44,8 @@
> > >  #include "devices.h"
> > >  #include "gpio-names.h"
> > > 
> > > +#include "../../../drivers/staging/nvec/nvec.h"
> > 
> > Ick, no! Move the header file containing platform data to
> > include/linux/platform_data instead (or break it off in a separate
> > header file).
> 
> I know this looks ugly, but it is AFAIK the only (and the common) way for a 
> staging driver to be used. Of course the header will be moved to e.g. to 
> include/linux/mfd once the driver is ready for mainline, but till that we just
> cannot write somewhere outside of the staging dir.

Actually, you should be OK with adding it to include/linux/platform_data.

But if you're just about to add device tree, it might make sense to do
a device tree binding instead and only do device-tree configuration of the
device instead. Care to cook up a patch for that?

> > > +       tegra_i2c_device3.name = "nvec";
> > > +       tegra_i2c_device3.dev.platform_data = &nvec_pdata;
> > > +       platform_device_register(&tegra_i2c_device3);
> > 
> > Please define a separate platform_device instead of hijacking the
> > current one, please.
> 
> ok, I just wanted to keep the patch small ;-)

Keeping the code clean is more important than keeping the change small.


-Olof

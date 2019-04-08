From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 3/8] memory: tegra: Add Tegra210 EMC clock driver
Date: Mon, 8 Apr 2019 12:25:30 +0300
Message-ID: <20190408092530.GD12975@pdeschrijver-desktop.Nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-4-josephl@nvidia.com>
 <20190403113426.GH5238@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190403113426.GH5238@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 03, 2019 at 01:34:26PM +0200, Thierry Reding wrote:
> On Mon, Mar 25, 2019 at 03:45:18PM +0800, Joseph Lo wrote:
> > This is the initial patch for Tegra210 EMC clock driver, which doesn't
> > include the support code and detail sequence for clock scaling yet.
> > 
> > The driver is designed to support LPDDR4 SDRAMs. Because of the LPDDR4
> > devices need to do initial time training before it can be used, the
> > firmware will help to do that at early boot stage. The trained table for
> > the rates that we will support in the kernel will be merged to the
> > kernel DTB. So the driver can get the trained table for clock scaling
> > support.
> > 
> > For the higher rate support (above 800MHz), the periodic training is
> > needed for the timing compensation. So basically, two methodologies for
> > clock scaling support, one is following the clock changing sequence to
> > update the EMC table to EMC registers and another is if the rate needs
> > periodic training, then we will start a timer to do that periodically
> > until it leaves the rate that doesn't need that.
> > 
> > Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> > 
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > ---
> >  drivers/memory/tegra/Kconfig             |   10 +
> >  drivers/memory/tegra/Makefile            |    1 +
> >  drivers/memory/tegra/tegra210-dt-parse.c |  340 +++++++
> >  drivers/memory/tegra/tegra210-emc-reg.h  | 1083 ++++++++++++++++++++++
> >  drivers/memory/tegra/tegra210-emc.c      |  886 ++++++++++++++++++
> >  5 files changed, 2320 insertions(+)
> >  create mode 100644 drivers/memory/tegra/tegra210-dt-parse.c
> >  create mode 100644 drivers/memory/tegra/tegra210-emc-reg.h
> >  create mode 100644 drivers/memory/tegra/tegra210-emc.c
> > 
> > diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> > index 34e0b70f5c5f..614e9b370183 100644
> > --- a/drivers/memory/tegra/Kconfig
> > +++ b/drivers/memory/tegra/Kconfig
> > @@ -25,3 +25,13 @@ config TEGRA124_EMC
> >  	  Tegra124 chips. The EMC controls the external DRAM on the board.
> >  	  This driver is required to change memory timings / clock rate for
> >  	  external memory.
> > +
> > +config TEGRA210_EMC
> > +	bool "NVIDIA Tegra210 External Memory Controller driver"
> > +	default y
> > +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
> > +	help
> > +	  This driver is for the External Memory Controller (EMC) found on
> > +	  Tegra210 chips. The EMC controls the external DRAM on the board.
> > +	  This driver is required to change memory timings / clock rate for
> > +	  external memory.
> > diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> > index 3971a6b7c487..36a835620bbd 100644
> > --- a/drivers/memory/tegra/Makefile
> > +++ b/drivers/memory/tegra/Makefile
> > @@ -12,4 +12,5 @@ obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
> >  
> >  obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
> >  obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
> > +obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o tegra210-dt-parse.o
> >  obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
> > diff --git a/drivers/memory/tegra/tegra210-dt-parse.c b/drivers/memory/tegra/tegra210-dt-parse.c
> > new file mode 100644
> > index 000000000000..6a3a3a28ac64
> > --- /dev/null
> > +++ b/drivers/memory/tegra/tegra210-dt-parse.c
> > @@ -0,0 +1,340 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2013-2019, NVIDIA CORPORATION.  All rights reserved.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/err.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <soc/tegra/fuse.h>
> > +
> > +#include "tegra210-emc-reg.h"
> > +
> > +static struct device_node *tegra_emc_ramcode_devnode(
> > +	struct device_node *np)
> 
> This is weirdly wrapped. Typically if it doesn't all fit on one line
> you'd break after the return type, like so:
> 
>     static struct device_node *tegra_emc_ramcode_devnode(struct device_node *np)
> 
> That said, the above does seem to fit on a single line, so there'n no
> reason to wrap at all. You could still try to make it a little shorter
> by using the _node suffix instead of _devnode.
> 

..

> 
> Should this be an array? Seems like that could make it easier to write
> the tables to these registers later on.
> 
> > +
> > +	struct emc_table *current_timing;
> > +	struct emc_table *next_timing;
> > +	struct emc_table start_timing;
> 
> Why is start_timing not a pointer? It looks to me like that's basically
> a copy of emc_table[0], so why not just point it at that?
> 

No. Apparently it is possible the EMC registers are configured by the
bootloader differently than anything mentioned in the table. Given that
the switching sequence need some of the current register values, we need
to read those from the hardware and we cannot just point to an existing
table entry.

Peter.

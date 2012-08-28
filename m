From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] usb: tegra: moving phy driver into drivers directory
Date: Tue, 28 Aug 2012 18:06:14 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6DDE14DCF5@BGMAIL02.nvidia.com>
References: <1346146338-4996-1-git-send-email-vbyravarasu@nvidia.com>
 <20120828094924.GT27166@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120828094924.GT27166-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


> -----Original Message-----
> From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> Sent: Tuesday, August 28, 2012 3:19 PM
> To: Venu Byravarasu
> Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org; olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org; swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org;
> linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
> gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; balbi-l0cyMroinI0@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH] usb: tegra: moving phy driver into drivers directory
> 
> * PGP Signed by an unknown key
> 
> Hi,
> 
> On Tue, Aug 28, 2012 at 03:02:18PM +0530, Venu Byravarasu wrote:
> > In order to keep up with the USB driver files organization,
> > moving USB phy driver from mach-tegra to drivers/USB directory.
> >
> > Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/mach-tegra/Makefile                       |    1 -
> >  arch/arm/mach-tegra/devices.c                      |    8 +-------
> >  arch/arm/mach-tegra/devices.h                      |    2 --
> >  drivers/usb/host/ehci-tegra.c                      |    2 +-
> >  drivers/usb/phy/Makefile                           |    1 +
> >  .../usb_phy.c => drivers/usb/phy/tegra_usb_phy.c   |    4 +---
> >  .../usb_phy.h => drivers/usb/phy/tegra_usb_phy.h   |    2 --
> >  7 files changed, 4 insertions(+), 16 deletions(-)
> >  rename arch/arm/mach-tegra/usb_phy.c =>
> drivers/usb/phy/tegra_usb_phy.c (99%)
> >  rename arch/arm/mach-tegra/include/mach/usb_phy.h =>
> drivers/usb/phy/tegra_usb_phy.h (97%)
> >
> > diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-
> tegra/Makefile
> > index b94858f..b542dac 100644
> > --- a/arch/arm/mach-tegra/Makefile
> > +++ b/arch/arm/mach-tegra/Makefile
> > @@ -25,7 +25,6 @@ obj-$(CONFIG_HOTPLUG_CPU)               += hotplug.o
> >  obj-$(CONFIG_TEGRA_SYSTEM_DMA)		+= dma.o
> >  obj-$(CONFIG_CPU_FREQ)                  += cpu-tegra.o
> >  obj-$(CONFIG_TEGRA_PCI)			+= pcie.o
> > -obj-$(CONFIG_USB_SUPPORT)		+= usb_phy.o
> >
> >  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= board-dt-
> tegra20.o
> >  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= board-dt-
> tegra30.o
> > diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-
> tegra/devices.c
> > index 61e9603..232d7e1 100644
> > --- a/arch/arm/mach-tegra/devices.c
> > +++ b/arch/arm/mach-tegra/devices.c
> > @@ -26,7 +26,6 @@
> >  #include <mach/irqs.h>
> >  #include <mach/iomap.h>
> >  #include <mach/dma.h>
> > -#include <mach/usb_phy.h>
> >
> >  #include "gpio-names.h"
> >  #include "devices.h"
> > @@ -438,11 +437,6 @@ static struct resource tegra_usb3_resources[] = {
> >  	},
> >  };
> >
> > -struct tegra_ulpi_config tegra_ehci2_ulpi_phy_config = {
> > -	.reset_gpio = -1,
> > -	.clk = "cdev2",
> > -};
> > -
> >  struct tegra_ehci_platform_data tegra_ehci1_pdata = {
> >  	.operating_mode = TEGRA_USB_OTG,
> >  	.power_down_on_bus_suspend = 1,
> > @@ -450,7 +444,7 @@ struct tegra_ehci_platform_data tegra_ehci1_pdata
> = {
> >  };
> >
> >  struct tegra_ehci_platform_data tegra_ehci2_pdata = {
> > -	.phy_config = &tegra_ehci2_ulpi_phy_config,
> > +	.phy_config = NULL,
> >  	.operating_mode = TEGRA_USB_HOST,
> >  	.power_down_on_bus_suspend = 1,
> >  	.vbus_gpio = -1,
> > diff --git a/arch/arm/mach-tegra/devices.h b/arch/arm/mach-
> tegra/devices.h
> > index 4f50527..6bac5e6 100644
> > --- a/arch/arm/mach-tegra/devices.h
> > +++ b/arch/arm/mach-tegra/devices.h
> > @@ -22,8 +22,6 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/platform_data/tegra_usb.h>
> >
> > -#include <mach/usb_phy.h>
> > -
> >  extern struct tegra_ulpi_config tegra_ehci2_ulpi_phy_config;
> >
> >  extern struct tegra_ehci_platform_data tegra_ehci1_pdata;
> > diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> > index 75eca42..a03e279 100644
> > --- a/drivers/usb/host/ehci-tegra.c
> > +++ b/drivers/usb/host/ehci-tegra.c
> > @@ -27,7 +27,7 @@
> >  #include <linux/of_gpio.h>
> >  #include <linux/pm_runtime.h>
> >
> > -#include <mach/usb_phy.h>
> > +#include "../phy/tegra_usb_phy.h"
> >  #include <mach/iomap.h>
> >
> >  #define TEGRA_USB_DMA_ALIGN 32
> > diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
> > index eca095b..663164f 100644
> > --- a/drivers/usb/phy/Makefile
> > +++ b/drivers/usb/phy/Makefile
> > @@ -5,3 +5,4 @@
> >  ccflags-$(CONFIG_USB_DEBUG) := -DDEBUG
> >
> >  obj-$(CONFIG_USB_ISP1301)		+= isp1301.o
> > +obj-$(CONFIG_USB_EHCI_TEGRA)		+= tegra_usb_phy.o
> > diff --git a/arch/arm/mach-tegra/usb_phy.c
> b/drivers/usb/phy/tegra_usb_phy.c
> > similarity index 99%
> > rename from arch/arm/mach-tegra/usb_phy.c
> > rename to drivers/usb/phy/tegra_usb_phy.c
> > index 022b33a..c856716 100644
> > --- a/arch/arm/mach-tegra/usb_phy.c
> > +++ b/drivers/usb/phy/tegra_usb_phy.c
> > @@ -1,6 +1,4 @@
> >  /*
> > - * arch/arm/mach-tegra/usb_phy.c
> > - *
> >   * Copyright (C) 2010 Google, Inc.
> >   *
> >   * Author:
> > @@ -31,7 +29,7 @@
> >  #include <linux/usb/ulpi.h>
> >  #include <asm/mach-types.h>
> >  #include <mach/gpio-tegra.h>
> > -#include <mach/usb_phy.h>
> > +#include "tegra_usb_phy.h"
> >  #include <mach/iomap.h>
> >
> >  #define ULPI_VIEWPORT		0x170
> 
> NAK, needs to be converted to proper PHY driver (misnamed as
> include/linux/usb/otg.h). You will need proper phy->init, phy->suspend,
> phy->resume, etc callbacks.
> 

Thanks Felipe for your comments.
Created a patch to separate out phy related stuff to phy.h with you as a reviewer.
Plz let me know your comments. 

Thanks,
Venu

> --
> balbi
> 
> * Unknown Key
> * 0x35CAA444
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

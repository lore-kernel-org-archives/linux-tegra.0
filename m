From: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] [ARM] tegra: Add support for Tegra USB PHYs
Date: Wed, 9 Feb 2011 09:44:51 +0100
Message-ID: <4D525403.4010602@parrot.com>
References: <1297228927-23497-1-git-send-email-benoit@android.com> <1297228927-23497-2-git-send-email-benoit@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297228927-23497-2-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello,

Benoit Goby a =E9crit :
> Interface used by Tegra's gadget driver and ehci driver
> to power on and configure the USB PHYs.
>=20
> + */
> +
> +#include <linux/resource.h>
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/gpio.h>
> +#include <asm/mach-types.h>
> +#include <mach/usb_phy.h>
> +#include <mach/iomap.h>
> +
> +#define USB_USBSTS             0x144
> +#define   USB_USBSTS_PCI       (1 << 2)
> +
> +#define ULPI_VIEWPORT          0x170
It look like your core is a arc/chipidea/mips one that is already used=20
on other product (msm) for example.

Can't you merge with them ?

for example
 > +static int utmi_wait_register(void __iomem *reg, u32 mask, u32 resu=
lt)
 > +{
 > +       unsigned long timeout =3D 2000;
 > +       do {
 > +               if ((readl(reg) & mask) =3D=3D result)
 > +                       return 0;
 > +               udelay(1);
 > +               timeout--;
 > +       } while (timeout);
 > +       return -1;
 > +}
 > +static void ulpi_viewport_write(struct tegra_usb_phy *phy, u8 addr,=
=20
u8 data)
 > +{
 > +       unsigned long val;
 > +       void __iomem *base =3D phy->regs;
 > +
 > +       val =3D ULPI_RUN | ULPI_RD_RW_WRITE | ULPI_PORT(0);
 > +       val |=3D ULPI_ADDR(addr) | ULPI_DATA_WR(data);
 > +       writel(val, base + ULPI_VIEWPORT);
 > +
 > +       if (utmi_wait_register(base + ULPI_VIEWPORT, ULPI_RUN, 0))
 > +               pr_err("%s: timeout accessing ulpi phy\n", __func__)=
;
 > +}

look very similar to what is in drivers/usb/otg/msm72k_otg.c


+static int ulpi_write(struct otg_transceiver *otg, u32 val, u32 reg)
+{
+       struct msm_otg *motg =3D container_of(otg, struct msm_otg, otg)=
;
+       int cnt =3D 0;
+
+       /* initiate write operation */
+       writel(ULPI_RUN | ULPI_WRITE |
+              ULPI_ADDR(reg) | ULPI_DATA(val),
+              USB_ULPI_VIEWPORT);
+
+       /* wait for completion */
+       while (cnt < ULPI_IO_TIMEOUT_USEC) {
+               if (!(readl(USB_ULPI_VIEWPORT) & ULPI_RUN))
+                       break;
+               udelay(1);
+               cnt++;
+       }
+
+       if (cnt >=3D ULPI_IO_TIMEOUT_USEC) {
+               dev_err(otg->dev, "ulpi_write: timeout\n");
+               return -ETIMEDOUT;
+       }
+       return 0;
+}


Matthieu
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

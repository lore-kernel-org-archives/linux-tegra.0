From: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/4] usb: host: Add EHCI driver for NVIDIA Tegra SoCs
Date: Wed, 9 Feb 2011 10:01:46 +0100
Message-ID: <4D5257FA.1030605@parrot.com>
References: <1297228927-23497-1-git-send-email-benoit@android.com> <1297228927-23497-4-git-send-email-benoit@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297228927-23497-4-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

Benoit Goby a =E9crit :
> Signed-off-by: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
_clk);
> +}
> +
> +static int tegra_ehci_hub_control(
> +       struct usb_hcd  *hcd,
> +       u16             typeReq,
> +       u16             wValue,
> +       u16             wIndex,
> +       char            *buf,
> +       u16             wLength
> +)
> +{
> +       struct ehci_hcd *ehci =3D hcd_to_ehci(hcd);
> +       struct tegra_ehci_hcd *tegra =3D dev_get_drvdata(hcd->self.co=
ntroller);
> +       u32 __iomem     *status_reg;
> +       u32             temp;
> +       unsigned long   flags;
> +       int             retval =3D 0;
> +
> +       status_reg =3D &ehci->regs->port_status[(wIndex & 0xff) - 1];
> +
> +       spin_lock_irqsave(&ehci->lock, flags);
> +
> +       /*
> +        * In ehci_hub_control() for USB_PORT_FEAT_ENABLE clears the =
other bits
> +        * that are write on clear, by writing back the register read=
 value, so
> +        * USB_PORT_FEAT_ENABLE is handled by masking the set on clea=
r bits
> +        */
> +       if (typeReq =3D=3D ClearPortFeature && wValue =3D=3D USB_PORT=
_FEAT_ENABLE) {
> +               temp =3D ehci_readl(ehci, status_reg) & ~PORT_RWC_BIT=
S;
> +               ehci_writel(ehci, temp & ~PORT_PE, status_reg);
> +               goto done;
> +       }
> +
> +       else if (typeReq =3D=3D GetPortStatus) {
> +               temp =3D ehci_readl(ehci, status_reg);
> +               if (tegra->port_resuming && !(temp & PORT_SUSPEND)) {
> +                       /* resume completed */
> +                       tegra->port_resuming =3D 0;
> +                       tegra_usb_phy_postresume(tegra->phy);
> +               }
> +       }
> +
> +       else if (typeReq =3D=3D SetPortFeature && wValue =3D=3D USB_P=
ORT_FEAT_SUSPEND) {
> +               temp =3D ehci_readl(ehci, status_reg);
> +               if ((temp & PORT_PE) =3D=3D 0 || (temp & PORT_RESET) =
!=3D 0) {
> +                       retval =3D -EPIPE;
> +                       goto done;
> +               }
> +
> +               /* After above check the port must be connected.
> +                * Set appropriate bit thus could put phy into low po=
wer
> +                * mode if we have hostpc feature
> +                */
> +               temp &=3D ~PORT_WKCONN_E;
> +               temp |=3D PORT_WKDISC_E | PORT_WKOC_E;
> +               ehci_writel(ehci, temp | PORT_SUSPEND, status_reg);
> +               if (handshake(ehci, status_reg, PORT_SUSPEND,
> +                                               PORT_SUSPEND, 5000))
> +                       pr_err("%s: timeout waiting for SUSPEND\n", _=
_func__);
> +               set_bit((wIndex & 0xff) - 1, &ehci->suspended_ports);
> +               goto done;
> +       }
> +
> +       /*
> +        * Tegra host controller will time the resume operation to cl=
ear the bit
> +        * when the port control state switches to HS or FS Idle. Thi=
s behavior
> +        * is different from EHCI where the host controller driver is=
 required
> +        * to set this bit to a zero after the resume duration is tim=
ed in the
> +        * driver.
> +        */
> +       else if (typeReq =3D=3D ClearPortFeature &&
> +                                       wValue =3D=3D USB_PORT_FEAT_S=
USPEND) {
> +               temp =3D ehci_readl(ehci, status_reg);
> +               if ((temp & PORT_RESET) || !(temp & PORT_PE)) {
> +                       retval =3D -EPIPE;
> +                       goto done;
> +               }
> +
> +               if (!(temp & PORT_SUSPEND))
> +                       goto done;
> +
> +               tegra_usb_phy_preresume(tegra->phy);
> +
> +               ehci->reset_done[wIndex-1] =3D jiffies + msecs_to_jif=
fies(25);
> +
> +               temp &=3D ~(PORT_RWC_BITS | PORT_WAKE_BITS);
> +               /* start resume signalling */
> +               ehci_writel(ehci, temp | PORT_RESUME, status_reg);
> +
> +               spin_unlock_irqrestore(&ehci->lock, flags);
> +               msleep(20);
> +               spin_lock_irqsave(&ehci->lock, flags);
> +
> +               /* polling PORT_RESUME until the controller clear thi=
s bit */
> +               if (handshake(ehci, status_reg, PORT_RESUME, 0, 2000)=
)
> +                       pr_err("%s: timeout waiting for RESUME\n", __=
func__);
> +
> +               /* polling PORT_SUSPEND until the controller clear th=
is bit */
> +               if (handshake(ehci, status_reg, PORT_SUSPEND, 0, 2000=
))
> +                       pr_err("%s: timeout waiting for SUSPEND\n", _=
_func__);
> +
> +               ehci->reset_done[wIndex-1] =3D 0;
> +
> +               tegra->port_resuming =3D 1;
> +               goto done;
> +       }
> +
> +       spin_unlock_irqrestore(&ehci->lock, flags);
> +
> +       /* Handle the hub control events here */
> +       return ehci_hub_control(hcd, typeReq, wValue, wIndex, buf, wL=
ength);
> +done:
> +       spin_unlock_irqrestore(&ehci->lock, flags);
> +       return retval;
> +}
> +
I don't know enough usb layer, but can't you done something similar tha=
n=20
in msm otg : let's the otg layer handle the power management ?

http://www.spinics.net/lists/linux-usb/msg41247.html


> +static int tegra_ehci_reset(struct usb_hcd *hcd)
> +{
> +       unsigned long temp;
> +       int usec =3D 250*1000; /* see ehci_reset */
> +
> +       temp =3D readl(hcd->regs + TEGRA_USB_USBCMD_REG_OFFSET);
> +       temp |=3D TEGRA_USB_USBCMD_RESET;
> +       writel(temp, hcd->regs + TEGRA_USB_USBCMD_REG_OFFSET);
> +
> +       do {
> +               temp =3D readl(hcd->regs + TEGRA_USB_USBCMD_REG_OFFSE=
T);
> +               if (!(temp & TEGRA_USB_USBCMD_RESET))
> +                       break;
> +               udelay(1);
> +               usec--;
> +       } while (usec);
> +
> +       if (!usec)
> +               return -ETIMEDOUT;
> +
> +       /* Set to Host mode by setting bit 0-1 of USB device mode reg=
ister */
> +       temp =3D readl(hcd->regs + TEGRA_USB_USBMODE_REG_OFFSET);
> +       writel((temp | TEGRA_USB_USBMODE_HOST),
> +                       (hcd->regs + TEGRA_USB_USBMODE_REG_OFFSET));
> +
> +       return 0;
> +}
Why can't you use tdi_reset that already this for you ?



Matthieu
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

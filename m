From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 4/9] mfd: Add binding document for NVIDIA Tegra XUSB
Date: Wed, 20 May 2015 07:35:51 +0100
Message-ID: <20150520063551.GD3627@x1>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
 <1430761002-9327-5-git-send-email-abrestic@chromium.org>
 <20150513143954.GA3394@x1>
 <55544CC5.9050001@nvidia.com>
 <20150514074058.GA22418@x1>
 <CAL1qeaEqNejuGkN-ke11mtWnaaRo+XieCBkQ6+NQ-Afym6uxVA@mail.gmail.com>
 <CAL1qeaHy0h7bXhuLHh4AG2Zfu48JYeawgVo4dp_k4oX8YFw6tA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaHy0h7bXhuLHh4AG2Zfu48JYeawgVo4dp_k4oX8YFw6tA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 19 May 2015, Andrew Bresticker wrote:

> Lee,
>=20
> On Thu, May 14, 2015 at 10:38 AM, Andrew Bresticker
> <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > On Thu, May 14, 2015 at 12:40 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
> >> On Thu, 14 May 2015, Jon Hunter wrote:
> >>
> >>> Hi Lee,
> >>>
> >>> On 13/05/15 15:39, Lee Jones wrote:
> >>> > On Mon, 04 May 2015, Andrew Bresticker wrote:
> >>> >
> >>> >> Add a binding document for the XUSB host complex on NVIDIA Teg=
ra124
> >>> >> and later SoCs.  The XUSB host complex includes a mailbox for
> >>> >> communication with the XUSB micro-controller and an xHCI host-=
controller.
> >>> >>
> >>> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> >>> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >>> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> >>> >> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >>> >> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> >>> >> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>> >> ---
> >>> >> Changes from v7:
> >>> >>  - Move non-shared resources into child nodes.
> >>> >> New for v7.
> >>> >> ---
> >>> >>  .../bindings/mfd/nvidia,tegra124-xusb.txt          | 37 +++++=
+++++++++++++++++
> >>> >>  1 file changed, 37 insertions(+)
> >>> >>  create mode 100644 Documentation/devicetree/bindings/mfd/nvid=
ia,tegra124-xusb.txt
> >>> >>
> >>> >> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,tegr=
a124-xusb.txt b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-x=
usb.txt
> >>> >> new file mode 100644
> >>> >> index 0000000..bc50110
> >>> >> --- /dev/null
> >>> >> +++ b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xu=
sb.txt
> >>> >> @@ -0,0 +1,37 @@
> >>> >> +NVIDIA Tegra XUSB host copmlex
> >>> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> >> +
> >>> >> +The XUSB host complex on Tegra124 and later SoCs contains an =
xHCI host
> >>> >> +controller and a mailbox for communication with the XUSB micr=
o-controller.
> >>> >> +
> >>> >> +Required properties:
> >>> >> +--------------------
> >>> >> + - compatible: For Tegra124, must contain "nvidia,tegra124-xu=
sb".
> >>> >> +   Otherwise, must contain '"nvidia,<chip>-xusb", "nvidia,teg=
ra124-xusb"'
> >>> >> +   where <chip> is tegra132.
> >>> >> + - reg: Must contain the base and length of the XUSB FPCI reg=
isters.
> >>> >> + - ranges: Bus address mapping for the XUSB block.  Can be em=
pty since the
> >>> >> +   mapping is 1:1.
> >>> >> + - #address-cells: Must be 2.
> >>> >> + - #size-cells: Must be 2.
> >>> >> +
> >>> >> +Example:
> >>> >> +--------
> >>> >> +  usb@0,70098000 {
> >>> >> +          compatible =3D "nvidia,tegra124-xusb";
> >>> >> +          reg =3D <0x0 0x70098000 0x0 0x1000>;
> >>> >> +          ranges;
> >>> >> +
> >>> >> +          #address-cells =3D <2>;
> >>> >> +          #size-cells =3D <2>;
> >>> >> +
> >>> >> +          usb-host@0,70090000 {
> >>> >> +                  compatible =3D "nvidia,tegra124-xhci";
> >>> >> +                  ...
> >>> >> +          };
> >>> >> +
> >>> >> +          mailbox {
> >>> >> +                  compatible =3D "nvidia,tegra124-xusb-mbox";
> >>> >> +                  ...
> >>> >> +          };
> >>> >
> >>> > This doesn't appear to be a proper MFD.  I would have the USB a=
nd
> >>> > Mailbox devices probe seperately and use a phandle to point the=
 USB
> >>> > device to its Mailbox.
> >>> >
> >>> > usb@xyz {
> >>> >     mboxes =3D <&xusb-mailbox, [chan]>;
> >>> > };
> >>> >
> >>>
> >>> I am assuming that Andrew had laid it out like this to reflect th=
e hw
> >>> structure. The mailbox and xhci controller are part of the xusb
> >>> sub-system and hence appear as child nodes. My understanding is t=
hat for
> >>> device-tree we want the device-tree structure to reflect the actu=
al hw.
> >>> Is this not the case?
> >>
> >> Yes, the DT files should reflect h/w.  I have requested to see wha=
t
> >> the memory map looks like, so I might provide a more appropriate
> >> solution to accepting a pretty pointless MFD.
> >
> > FWIW, the address map for XUSB looks like this:
> >
> > XUSB_HOST: 0x70090000 - 0x7009a000
> >     xHCI registers: 0x70090000 - 0x70098000
> >     FPCI configuration registers: 0x70098000 - 0x70099000
> >     IPFS configuration registers: 0x70099000 - 0x7009a000
> >
> >> Two solutions spring to mind.  You can either call
> >> of_platform_populate() from the USB driver, as some already do:
> >>
> >>   drivers/usb/dwc3/dwc3-exynos.c:
> >>     ret =3D of_platform_populate(node, NULL, NULL, dev);
> >>   drivers/usb/dwc3/dwc3-keystone.c:
> >>     error =3D of_platform_populate(node, NULL, NULL, dev);
> >>   drivers/usb/dwc3/dwc3-omap.c:
> >>     ret =3D of_platform_populate(node, NULL, NULL, dev);
> >>   drivers/usb/dwc3/dwc3-qcom.c:
> >>     ret =3D of_platform_populate(node, NULL, NULL, qdwc->dev);
> >>   drivers/usb/dwc3/dwc3-st.c:
> >>     ret =3D of_platform_populate(node, NULL, NULL, dev);
> >>   drivers/usb/musb/musb_am335x.c:
> >>     ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &p=
dev->dev);
> >
> > This still requires a small, separate driver to setup the regmap an=
d
> > do of_platform_populate().  The only difference is it lives in
> > drivers/usb/ instead of drivers/mfd/.
> >
> >> Or use the "simple-mfd", which is currently in -next:
> >>
> >>   git show next/master:Documentation/devicetree/bindings/mfd/mfd.t=
xt
> >
> > I'm not too opposed to this, but Thierry was when I brought this up
> > before.  The issue here is that if we ever have to do something
> > besides setting up a regmap in the MFD, we'd have to change the
> > binding and break DT backwards-compatibility.
>=20
> Any thoughts on this?  A minimal MFD seems to be the best way to
> future-proof this binding/driver should it need to be extended in the
> future.  If this is a firm NAK from you however, I'll need to let
> Jassi now so that he can un-queue the mailbox patches for 4.2....

I was waiting to hear Thierry's thoughts.  However, I am unconvinced
that you need an MFD driver for this and refuse to take a shell (read
"pointless") one on an "if we ever ..." clause.

Will you break backwards capability though?  I'm not sure you will.
Old DTBs will still use 'simple-mfd' and probe the devices in the
normal way.  *If* you introduce an MFD driver at a later date then the
old DTB will miss out the *new* functionality, which is expected and
accepted.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

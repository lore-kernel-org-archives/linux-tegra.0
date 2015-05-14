From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 4/9] mfd: Add binding document for NVIDIA Tegra XUSB
Date: Thu, 14 May 2015 08:40:58 +0100
Message-ID: <20150514074058.GA22418@x1>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
 <1430761002-9327-5-git-send-email-abrestic@chromium.org>
 <20150513143954.GA3394@x1>
 <55544CC5.9050001@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55544CC5.9050001-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 14 May 2015, Jon Hunter wrote:

> Hi Lee,
>=20
> On 13/05/15 15:39, Lee Jones wrote:
> > On Mon, 04 May 2015, Andrew Bresticker wrote:
> >=20
> >> Add a binding document for the XUSB host complex on NVIDIA Tegra12=
4
> >> and later SoCs.  The XUSB host complex includes a mailbox for
> >> communication with the XUSB micro-controller and an xHCI host-cont=
roller.
> >>
> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> >> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> >> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >> Changes from v7:
> >>  - Move non-shared resources into child nodes.
> >> New for v7.
> >> ---
> >>  .../bindings/mfd/nvidia,tegra124-xusb.txt          | 37 +++++++++=
+++++++++++++
> >>  1 file changed, 37 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,t=
egra124-xusb.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,tegra124=
-xusb.txt b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.=
txt
> >> new file mode 100644
> >> index 0000000..bc50110
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.t=
xt
> >> @@ -0,0 +1,37 @@
> >> +NVIDIA Tegra XUSB host copmlex
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +The XUSB host complex on Tegra124 and later SoCs contains an xHCI=
 host
> >> +controller and a mailbox for communication with the XUSB micro-co=
ntroller.
> >> +
> >> +Required properties:
> >> +--------------------
> >> + - compatible: For Tegra124, must contain "nvidia,tegra124-xusb".
> >> +   Otherwise, must contain '"nvidia,<chip>-xusb", "nvidia,tegra12=
4-xusb"'
> >> +   where <chip> is tegra132.
> >> + - reg: Must contain the base and length of the XUSB FPCI registe=
rs.
> >> + - ranges: Bus address mapping for the XUSB block.  Can be empty =
since the
> >> +   mapping is 1:1.
> >> + - #address-cells: Must be 2.
> >> + - #size-cells: Must be 2.
> >> +
> >> +Example:
> >> +--------
> >> +	usb@0,70098000 {
> >> +		compatible =3D "nvidia,tegra124-xusb";
> >> +		reg =3D <0x0 0x70098000 0x0 0x1000>;
> >> +		ranges;
> >> +
> >> +		#address-cells =3D <2>;
> >> +		#size-cells =3D <2>;
> >> +
> >> +		usb-host@0,70090000 {
> >> +			compatible =3D "nvidia,tegra124-xhci";
> >> +			...
> >> +		};
> >> +
> >> +		mailbox {
> >> +			compatible =3D "nvidia,tegra124-xusb-mbox";
> >> +			...
> >> +		};
> >=20
> > This doesn't appear to be a proper MFD.  I would have the USB and
> > Mailbox devices probe seperately and use a phandle to point the USB
> > device to its Mailbox.
> >=20
> > usb@xyz {
> > 	mboxes =3D <&xusb-mailbox, [chan]>;
> > };
> >=20
>=20
> I am assuming that Andrew had laid it out like this to reflect the hw
> structure. The mailbox and xhci controller are part of the xusb
> sub-system and hence appear as child nodes. My understanding is that =
for
> device-tree we want the device-tree structure to reflect the actual h=
w.
> Is this not the case?

Yes, the DT files should reflect h/w.  I have requested to see what
the memory map looks like, so I might provide a more appropriate
solution to accepting a pretty pointless MFD.

Two solutions spring to mind.  You can either call
of_platform_populate() from the USB driver, as some already do:

  drivers/usb/dwc3/dwc3-exynos.c:
    ret =3D of_platform_populate(node, NULL, NULL, dev);
  drivers/usb/dwc3/dwc3-keystone.c:
    error =3D of_platform_populate(node, NULL, NULL, dev);
  drivers/usb/dwc3/dwc3-omap.c:
    ret =3D of_platform_populate(node, NULL, NULL, dev);
  drivers/usb/dwc3/dwc3-qcom.c:
    ret =3D of_platform_populate(node, NULL, NULL, qdwc->dev);
  drivers/usb/dwc3/dwc3-st.c:
    ret =3D of_platform_populate(node, NULL, NULL, dev);
  drivers/usb/musb/musb_am335x.c:
    ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->=
dev);

Or use the "simple-mfd", which is currently in -next:

  git show next/master:Documentation/devicetree/bindings/mfd/mfd.txt

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

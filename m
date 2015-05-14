From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 4/9] mfd: Add binding document for NVIDIA Tegra XUSB
Date: Thu, 14 May 2015 10:30:42 +0100
Message-ID: <20150514093042.GG22418@x1>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
 <1430761002-9327-5-git-send-email-abrestic@chromium.org>
 <20150513143954.GA3394@x1>
 <55544CC5.9050001@nvidia.com>
 <20150514074058.GA22418@x1>
 <55546767.90501@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55546767.90501@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Andrew Bresticker <abrestic@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, 14 May 2015, Jon Hunter wrote:
> On 14/05/15 08:40, Lee Jones wrote:
> > On Thu, 14 May 2015, Jon Hunter wrote:
> >> On 13/05/15 15:39, Lee Jones wrote:
> >>> On Mon, 04 May 2015, Andrew Bresticker wrote:
> >>>
> >>>> Add a binding document for the XUSB host complex on NVIDIA Tegra=
124
> >>>> and later SoCs.  The XUSB host complex includes a mailbox for
> >>>> communication with the XUSB micro-controller and an xHCI host-co=
ntroller.
> >>>>
> >>>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> >>>> Cc: Rob Herring <robh+dt@kernel.org>
> >>>> Cc: Pawel Moll <pawel.moll@arm.com>
> >>>> Cc: Mark Rutland <mark.rutland@arm.com>
> >>>> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> >>>> Cc: Kumar Gala <galak@codeaurora.org>
> >>>> Cc: Samuel Ortiz <sameo@linux.intel.com>
> >>>> Cc: Lee Jones <lee.jones@linaro.org>
> >>>> ---
> >>>> Changes from v7:
> >>>>  - Move non-shared resources into child nodes.
> >>>> New for v7.
> >>>> ---
> >>>>  .../bindings/mfd/nvidia,tegra124-xusb.txt          | 37 +++++++=
+++++++++++++++
> >>>>  1 file changed, 37 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia=
,tegra124-xusb.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,tegra1=
24-xusb.txt b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xus=
b.txt
> >>>> new file mode 100644
> >>>> index 0000000..bc50110
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb=
=2Etxt
> >>>> @@ -0,0 +1,37 @@
> >>>> +NVIDIA Tegra XUSB host copmlex
> >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> +
> >>>> +The XUSB host complex on Tegra124 and later SoCs contains an xH=
CI host
> >>>> +controller and a mailbox for communication with the XUSB micro-=
controller.
> >>>> +
> >>>> +Required properties:
> >>>> +--------------------
> >>>> + - compatible: For Tegra124, must contain "nvidia,tegra124-xusb=
".
> >>>> +   Otherwise, must contain '"nvidia,<chip>-xusb", "nvidia,tegra=
124-xusb"'
> >>>> +   where <chip> is tegra132.
> >>>> + - reg: Must contain the base and length of the XUSB FPCI regis=
ters.
> >>>> + - ranges: Bus address mapping for the XUSB block.  Can be empt=
y since the
> >>>> +   mapping is 1:1.
> >>>> + - #address-cells: Must be 2.
> >>>> + - #size-cells: Must be 2.
> >>>> +
> >>>> +Example:
> >>>> +--------
> >>>> +	usb@0,70098000 {
> >>>> +		compatible =3D "nvidia,tegra124-xusb";
> >>>> +		reg =3D <0x0 0x70098000 0x0 0x1000>;
> >>>> +		ranges;
> >>>> +
> >>>> +		#address-cells =3D <2>;
> >>>> +		#size-cells =3D <2>;
> >>>> +
> >>>> +		usb-host@0,70090000 {
> >>>> +			compatible =3D "nvidia,tegra124-xhci";
> >>>> +			...
> >>>> +		};
> >>>> +
> >>>> +		mailbox {
> >>>> +			compatible =3D "nvidia,tegra124-xusb-mbox";
> >>>> +			...
> >>>> +		};
> >>>
> >>> This doesn't appear to be a proper MFD.  I would have the USB and
> >>> Mailbox devices probe seperately and use a phandle to point the U=
SB
> >>> device to its Mailbox.
> >>>
> >>> usb@xyz {
> >>> 	mboxes =3D <&xusb-mailbox, [chan]>;
> >>> };
> >>>
> >>
> >> I am assuming that Andrew had laid it out like this to reflect the=
 hw
> >> structure. The mailbox and xhci controller are part of the xusb
> >> sub-system and hence appear as child nodes. My understanding is th=
at for
> >> device-tree we want the device-tree structure to reflect the actua=
l hw.
> >> Is this not the case?
> >=20
> > Yes, the DT files should reflect h/w.  I have requested to see what
> > the memory map looks like, so I might provide a more appropriate
> > solution to accepting a pretty pointless MFD.
>=20
> For the xusb-host has memory from 0x7009000 - 0x7009ffff.
>=20
> Within this range, we have this fpci range which is defined as 0x7009=
800
> - 0x70098fff. This range is being shared between the mailbox and xhci
> drivers. Looking at the drivers, we have ...
>=20
> mailbox uses: 0x700980e0 - 0x700980f3 and 0x70098428 - 0x7009842b.
> xhci uses:    0x70098000 - 0x700980cf and 0x70098800 - 0x70098803.
>=20
> So it is a bit messy as they overlap. However, we could have ...
>=20
> 	xusb_mbox: mailbox {
> 		compatible =3D "nvidia,tegra124-xusb-mbox";
> 		reg =3D <0x0 0x700980e0 0x0 0x14>,
> 		      <0x0 0x70098428 0x0 0x4>;
> 		...
> 	};
> 	usb-host@0,70090000 {
> 		compatible =3D "nvidia,tegra124-xhci";
> 		reg =3D <0x0 0x70090000 0x0 0x8000>,		      =09
> 		      <0x0 0x70098000 0x0 0x00d0>;
> 		      <0x0 0x70098800 0x0 0x0004>;
> 		      <0x0 0x70099000 0x0 0x1000>;
> 		...
> 	};
>=20
> I believe that Thierry and Stephen said that they wished to avoid
> multiple devices sharing the same memory ranges, and so we would need=
 to
> divvy up the memory map as above. However, I am not sure if this is a=
n
> ok thing to do.
> =09
> > Two solutions spring to mind.  You can either call
> > of_platform_populate() from the USB driver, as some already do:
> >=20
> >   drivers/usb/dwc3/dwc3-exynos.c:
> >     ret =3D of_platform_populate(node, NULL, NULL, dev);
> >   drivers/usb/dwc3/dwc3-keystone.c:
> >     error =3D of_platform_populate(node, NULL, NULL, dev);
> >   drivers/usb/dwc3/dwc3-omap.c:
> >     ret =3D of_platform_populate(node, NULL, NULL, dev);
> >   drivers/usb/dwc3/dwc3-qcom.c:
> >     ret =3D of_platform_populate(node, NULL, NULL, qdwc->dev);
> >   drivers/usb/dwc3/dwc3-st.c:
> >     ret =3D of_platform_populate(node, NULL, NULL, dev);
> >   drivers/usb/musb/musb_am335x.c:
> >     ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pd=
ev->dev);
> >=20
> > Or use the "simple-mfd", which is currently in -next:
> >=20
> >   git show next/master:Documentation/devicetree/bindings/mfd/mfd.tx=
t
>=20
> That is nice. Sounds like the "simple-bus" style of device but for an

That's precisely what it does.  FYI: You 'can' use "simple-bus" and it
will do the right thing, but as an MFD isn't really a bus, it was
decided to create something a little more fitting.

> mfd. Based upon the above, let me know if you think we could use the
> "simple-mfd"?

I do. :)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

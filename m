From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v8 4/9] mfd: Add binding document for NVIDIA Tegra XUSB
Date: Thu, 14 May 2015 10:38:26 -0700
Message-ID: <CAL1qeaEqNejuGkN-ke11mtWnaaRo+XieCBkQ6+NQ-Afym6uxVA@mail.gmail.com>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
	<1430761002-9327-5-git-send-email-abrestic@chromium.org>
	<20150513143954.GA3394@x1>
	<55544CC5.9050001@nvidia.com>
	<20150514074058.GA22418@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150514074058.GA22418@x1>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 14, 2015 at 12:40 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, 14 May 2015, Jon Hunter wrote:
>
>> Hi Lee,
>>
>> On 13/05/15 15:39, Lee Jones wrote:
>> > On Mon, 04 May 2015, Andrew Bresticker wrote:
>> >
>> >> Add a binding document for the XUSB host complex on NVIDIA Tegra124
>> >> and later SoCs.  The XUSB host complex includes a mailbox for
>> >> communication with the XUSB micro-controller and an xHCI host-controller.
>> >>
>> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> >> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> >> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> >> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> >> ---
>> >> Changes from v7:
>> >>  - Move non-shared resources into child nodes.
>> >> New for v7.
>> >> ---
>> >>  .../bindings/mfd/nvidia,tegra124-xusb.txt          | 37 ++++++++++++++++++++++
>> >>  1 file changed, 37 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt
>> >> new file mode 100644
>> >> index 0000000..bc50110
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt
>> >> @@ -0,0 +1,37 @@
>> >> +NVIDIA Tegra XUSB host copmlex
>> >> +==============================
>> >> +
>> >> +The XUSB host complex on Tegra124 and later SoCs contains an xHCI host
>> >> +controller and a mailbox for communication with the XUSB micro-controller.
>> >> +
>> >> +Required properties:
>> >> +--------------------
>> >> + - compatible: For Tegra124, must contain "nvidia,tegra124-xusb".
>> >> +   Otherwise, must contain '"nvidia,<chip>-xusb", "nvidia,tegra124-xusb"'
>> >> +   where <chip> is tegra132.
>> >> + - reg: Must contain the base and length of the XUSB FPCI registers.
>> >> + - ranges: Bus address mapping for the XUSB block.  Can be empty since the
>> >> +   mapping is 1:1.
>> >> + - #address-cells: Must be 2.
>> >> + - #size-cells: Must be 2.
>> >> +
>> >> +Example:
>> >> +--------
>> >> +  usb@0,70098000 {
>> >> +          compatible = "nvidia,tegra124-xusb";
>> >> +          reg = <0x0 0x70098000 0x0 0x1000>;
>> >> +          ranges;
>> >> +
>> >> +          #address-cells = <2>;
>> >> +          #size-cells = <2>;
>> >> +
>> >> +          usb-host@0,70090000 {
>> >> +                  compatible = "nvidia,tegra124-xhci";
>> >> +                  ...
>> >> +          };
>> >> +
>> >> +          mailbox {
>> >> +                  compatible = "nvidia,tegra124-xusb-mbox";
>> >> +                  ...
>> >> +          };
>> >
>> > This doesn't appear to be a proper MFD.  I would have the USB and
>> > Mailbox devices probe seperately and use a phandle to point the USB
>> > device to its Mailbox.
>> >
>> > usb@xyz {
>> >     mboxes = <&xusb-mailbox, [chan]>;
>> > };
>> >
>>
>> I am assuming that Andrew had laid it out like this to reflect the hw
>> structure. The mailbox and xhci controller are part of the xusb
>> sub-system and hence appear as child nodes. My understanding is that for
>> device-tree we want the device-tree structure to reflect the actual hw.
>> Is this not the case?
>
> Yes, the DT files should reflect h/w.  I have requested to see what
> the memory map looks like, so I might provide a more appropriate
> solution to accepting a pretty pointless MFD.

FWIW, the address map for XUSB looks like this:

XUSB_HOST: 0x70090000 - 0x7009a000
    xHCI registers: 0x70090000 - 0x70098000
    FPCI configuration registers: 0x70098000 - 0x70099000
    IPFS configuration registers: 0x70099000 - 0x7009a000

> Two solutions spring to mind.  You can either call
> of_platform_populate() from the USB driver, as some already do:
>
>   drivers/usb/dwc3/dwc3-exynos.c:
>     ret = of_platform_populate(node, NULL, NULL, dev);
>   drivers/usb/dwc3/dwc3-keystone.c:
>     error = of_platform_populate(node, NULL, NULL, dev);
>   drivers/usb/dwc3/dwc3-omap.c:
>     ret = of_platform_populate(node, NULL, NULL, dev);
>   drivers/usb/dwc3/dwc3-qcom.c:
>     ret = of_platform_populate(node, NULL, NULL, qdwc->dev);
>   drivers/usb/dwc3/dwc3-st.c:
>     ret = of_platform_populate(node, NULL, NULL, dev);
>   drivers/usb/musb/musb_am335x.c:
>     ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);

This still requires a small, separate driver to setup the regmap and
do of_platform_populate().  The only difference is it lives in
drivers/usb/ instead of drivers/mfd/.

> Or use the "simple-mfd", which is currently in -next:
>
>   git show next/master:Documentation/devicetree/bindings/mfd/mfd.txt

I'm not too opposed to this, but Thierry was when I brought this up
before.  The issue here is that if we ever have to do something
besides setting up a regmap in the MFD, we'd have to change the
binding and break DT backwards-compatibility.

Thanks,
Andrew

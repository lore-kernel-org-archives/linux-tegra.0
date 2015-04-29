From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V7 4/9] mfd: Add binding document for NVIDIA Tegra XUSB
Date: Wed, 29 Apr 2015 12:46:49 -0700
Message-ID: <CAL1qeaEt9kGbcCfwqhVzwJxx9DvgOnjfU6C8MCH6t0vqwJK0WA@mail.gmail.com>
References: <1430174242-29465-1-git-send-email-abrestic@chromium.org>
	<1430174242-29465-5-git-send-email-abrestic@chromium.org>
	<20150429092545.GR9169@x1>
	<CAL1qeaFh5go_K0GnGXxU7KqjcgCm2kpUL5mVgGSYosPoXAXgpw@mail.gmail.com>
	<20150429183429.GB9169@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150429183429.GB9169@x1>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 29, 2015 at 11:34 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, 29 Apr 2015, Andrew Bresticker wrote:
>
>> Lee,
>>
>> On Wed, Apr 29, 2015 at 2:25 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > On Mon, 27 Apr 2015, Andrew Bresticker wrote:
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
>> >> New for v7.
>> >> ---
>> >>  .../bindings/mfd/nvidia,tegra124-xusb.txt          | 46 ++++++++++++++++++++++
>> >>  1 file changed, 46 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt
>> >> new file mode 100644
>> >> index 0000000..6a46680
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt
>> >> @@ -0,0 +1,46 @@
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
>> >
>> > Okay.  Why?
>>
>> Why what?  This is the convention used for Tegra bindings and is also
>> documented in Documentation/devicetree/bindings/submitting-patches.txt.
>> See nvidia,tegra114-spi.txt and nvidia,tegra20-i2c.txt for other
>> examples of this.
>
> It seems strange to me that you'd mention two specific chips in one
> compatible string.  What's the purpose of that?

The Tegra maintainers can correct me if I'm wrong here, but the point
is, I think, to future-proof the binding.  There are currently no
differences between Tegra124 and Tegra132 that need to be accounted
for in the driver, so the driver need only match against
"nvidia,tegra124-xusb".  If a Tegra132-specific quirk comes about
later all Tegra132 device-trees will also include the
"nvidia,tegra132-*" compatible string, so we can simply update the
driver without breaking DT backwards-compatibility.

>> >> + - reg: Must contain register base and length for each register set listed
>> >> +   in reg-names.
>> >
>> > You've mentioned 2 of the cells, what about the remaining 2?
>>
>> The example given was for Tegra124, where there are two address cells
>> and two size cells.
>
> I don't get that.  How does that work?

Tegra124 has a physical address space of > 4GB because of LPAE, thus a
single cell each for address and size is not sufficient.  The arm64
Tegra SoCs will obviously also use two address and size cells.  Take a
look at arch/arm/boot/dts/tegra124.dtsi.

-Andrew

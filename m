From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy: tegra-xusb-padctl: Add Tegra210 support
Date: Fri, 13 Nov 2015 09:58:35 -0800
Message-ID: <CAL1qeaEj=sihAxxw26aDkrzOO6F0GzmVfBs2dv2ch+4p0=AuXA@mail.gmail.com>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
	<1446657109-15568-3-git-send-email-thierry.reding@gmail.com>
	<563A71C7.9030002@wwwdotorg.org>
	<20151113163239.GB7219@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151113163239.GB7219@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 13, 2015 at 8:32 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Nov 04, 2015 at 01:59:51PM -0700, Stephen Warren wrote:
>> On 11/04/2015 10:11 AM, Thierry Reding wrote:
>> >From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >
>> >Extend the binding to cover the set of feature found in Tegra210.
>>
>> >diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
>>
>> >+For Tegra210, the list of valid PHY nodes is given below:
>> >+- utmi: utmi-0, utmi-1, utmi-2, utmi-3
>> >+  - functions: "snps", "xusb", "uart"
>> >+- hsic: hsic-0, hsic-1
>> >+  - functions: "snps", "xusb"
>> >+- pcie: pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, pcie-5, pcie-6
>> >+  - functions: "pcie-x1", "usb3-ss", "pcie-x4"
>> >+- sata: sata-0
>> >+  - functions: "usb3-ss", "sata"
>>
>> usb2-bias also needs to be present.
>
> I'm not sure about this. All of the driver code that I've looked deals
> with the usb2-bias pad internally. As far as I can tell, this pad needs
> to be configured to whatever any of the other pads is configured for. I
> think that means if any of the UTMI pads is configured for XUSB then the
> usb2-bias pad must also be configured for XUSB. Which would also imply
> that if one of the UTMI pads is configured for XUSB, all of them must be
> configured for XUSB.

I was told by hardware engineers at NVIDIA that (at least on
Tegra124/Tegra132) the usb2-bias pad must be configured in the
XUSB_PADCTL register space if UTMI pad 0 is muxed to XUSB.  If UTMI
pad 0 is muxed to SNPS, then the usb2-bias pad is configured in the
USB register space (base 0x7d000000).  You may want to follow up
internally to confirm this.  If it's true, that could make things here
a bit nastier, especially if we want to support configurations where
some pads are muxed to XUSB while others are muxed to SNPS.

-Andrew

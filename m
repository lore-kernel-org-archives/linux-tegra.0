From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy: tegra-xusb-padctl: Add Tegra210
 support
Date: Mon, 16 Nov 2015 13:26:43 -0700
Message-ID: <564A3C03.1040608@wwwdotorg.org>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
 <1446657109-15568-3-git-send-email-thierry.reding@gmail.com>
 <563A71C7.9030002@wwwdotorg.org> <20151113163239.GB7219@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151113163239.GB7219@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/13/2015 09:32 AM, Thierry Reding wrote:
> On Wed, Nov 04, 2015 at 01:59:51PM -0700, Stephen Warren wrote:
>> On 11/04/2015 10:11 AM, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Extend the binding to cover the set of feature found in Tegra210.
>>
>>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
>>
>>> +PCIe pad:
>>> +---------
>>> +
>>> +Required properties:
>>> +- clocks: Must contain an entry for each entry in clock-names.
>>> +- clock-names: Must contain the following entries:
>>> +  - "pll": phandle and specifier referring to the PLLE
>>> +- resets: Must contain an entry for each entry in reset-names.
>>> +- reset-names: Must contain the following entries:
>>> +  - "phy": reset for the PCIe UPHY block
>>
>> I don't recall any clocks or resets properties in the pads for Tegra124. Do
>> we really not need any?
>
> Tegra124 had two instances of what used to be called IOPHY, one for PCIe
> and one for SATA. On Tegra210 these have been replaced by two instances
> of what's called UPHY. The resets listed in the PCIe and SATA pad nodes
> are wired to those UPHY instances, hence why they are new on Tegra210.
>
> For Tegra124 no resets exist for the IOPHY instances.

OK.

I wonder if renaming the section title from "PCIe pad" to "Tegra210 PCIe 
pad" would be helpful; it'd certainly allow the reader to more quickly 
work out what part of the document they were looking at if jumping 
around in it.

>>> +SATA pad:
>>> +---------
>>> +
>>> +Required properties:
>>> +- resets: Must contain an entry for each entry in reset-names.
>>> +- reset-names: Must contain the following entries:
>>> +  - "phy": reset for the SATA UPHY block
>>> +
>>>
>>>   PHY nodes:
>>
>> Nit: 2 blank lines there.
>
> Those were intentional for additional spacing between sections.

That seems inconsistent, and not something I recall seeing before, so 
I'm not sure anyone would realize that. Better to do it with more 
explicit section names I think.

>>> +For Tegra210, the list of valid PHY nodes is given below:
>>> +- utmi: utmi-0, utmi-1, utmi-2, utmi-3
>>> +  - functions: "snps", "xusb", "uart"
>>> +- hsic: hsic-0, hsic-1
>>> +  - functions: "snps", "xusb"
>>> +- pcie: pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, pcie-5, pcie-6
>>> +  - functions: "pcie-x1", "usb3-ss", "pcie-x4"
>>> +- sata: sata-0
>>> +  - functions: "usb3-ss", "sata"
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

I don't believe that's true; on Tegra210 I have successfully configured 
the (legacy) "USB2 controller" to drive the recovery/micro-USB 
board-level port, and the "XUSB controller" (USB2 and USB3 ports 
thereof) to drive a couple of other board-level ports.

> It's also not a pad in the sense that the others are pads. It doesn't
> directly connect anywhere. It's also shared by all the UTMI pads. That
> said, there are two registers that allow some of the parameters of the
> pad to be set, so perhaps adding the node exclusively for
> configurability might make sense.
>
> It wouldn't really be a PHY node, though, so wouldn't fit into the above
> group. Perhaps something like the following could be added:
>
>    There is an additional pad that is used to support the bias voltages
>    to the USB2/UTMI pads. This is not a PHY that can be consumed by any
>    I/O controller, but the device tree node can be used to specify
>    parameters needed for the programming of the pad.
>
> I think the function shouldn't necessarily be exposed as a parameter,
> because all that would do is add the possibility for a conflicting set
> of mux options with the USB2/UTMI pads.

OK, if we can come up with a well-described algorithm re: how/when to 
program/enable this pad, then we can probably represent this differently 
than the other pads. I might expect DT to contain values for 
HS_DISCON_LEVEL HS_SQUELCH_LEVEL, although I can't recall if those 
values are SoC- or board-specific off the top of my head.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

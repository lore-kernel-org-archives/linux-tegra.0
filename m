From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Mon, 9 Nov 2015 16:48:28 +0000
Message-ID: <5640CE5C.9070103@nvidia.com>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
 <1446657109-15568-2-git-send-email-thierry.reding@gmail.com>
 <563B27AC.2000702@nvidia.com>
 <CAL1qeaHHS5PAUzcPAKevfUzcp+AiNUeYX0AowM4HJX5-x2x+nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaHHS5PAUzcPAKevfUzcp+AiNUeYX0AowM4HJX5-x2x+nQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 05/11/15 18:13, Andrew Bresticker wrote:
> On Thu, Nov 5, 2015 at 1:55 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> +UTMI ports:
>>> +-----------
>>> +
>>> +Required properties:
>>> +- status: Defines the operation status of the port. Valid values are:
>>> +  - "disabled": the port is disabled
>>> +  - "okay": the port is enabled
>>> +- mode: A string that determines the mode in which to run the port. Valid
>>> +  values are:
>>> +  - "host": for USB host mode
>>> +  - "device": for USB device mode
>>> +  - "otg": for USB OTG mode
>>> +
>>> +Optional properties:
>>> +- nvidia,internal: A boolean property whose presence determines that a port
>>> +  is internal. In the absence of this property the port is considered to be
>>> +  external.
>>> +- vbus-supply: phandle to a regulator supplying the VBUS voltage.
>>> +
>>> +ULPI ports:
>>> +-----------
>>> +
>>> +Optional properties:
>>> +- status: Defines the operation status of the port. Valid values are:
>>> +  - "disabled": the port is disabled
>>> +  - "okay": the port is enabled
>>> +- nvidia,internal: A boolean property whose presence determines that a port
>>> +  is internal. In the absence of this property the port is considered to be
>>> +  external.
>>> +
>>> +HSIC ports:
>>> +-----------
>>> +
>>> +Required properties:
>>> +- status: Defines the operation status of the port. Valid values are:
>>> +  - "disabled": the port is disabled
>>> +  - "okay": the port is enabled
>>> +
>>> +Super-speed USB ports:
>>> +----------------------
>>> +
>>> +Required properties:
>>> +- status: Defines the operation status of the port. Valid values are:
>>> +  - "disabled": the port is disabled
>>> +  - "okay": the port is enabled
>>> +- nvidia,port: A single cell that specifies the physical port number to map
>>> +  this super-speed USB port to. The range of valid port numbers varies with
>>> +  the SoC generation:
>>> +  - 0-2: for Tegra124 and Tegra132
>>
>> I am a bit confused by what nvidia,port property is used for. Is this to
>> program XUSB_PADCTL_SS_PORT_MAP_0? If so then I think that this should
>> be an optional property because if you want to use the usb3 ports for
>> usb3, then we should not need to specify this here.
> 
> "nvidia,port" is used to program XUSB_PADCTL_SS_PORT_MAP and is
> definitely required.  It specifies the UTMI port to which the SS port
> is mapped to.  For example, Nyan-Big has 3 UTMI ports (0, 1
> (internal), and 2) and 2 SS ports (0 and 1).  SS port 0 is mapped to
> the same physical port as UTMI port 0 and SS port 1 is mapped to the
> same physical port as UTMI port 2.

By port, you mean usb3 connector/receptacle right?

I had also been thinking about the use-case where you have an embedded
usb3 device (on the same pcb) directly connected to the tegra and so I
was wondering if setting this register would be still necessary.
However, I have checked with the designers and they told me that we do
still need to set this even if this case. So it does appear to be
required after all. Sorry for the noise.

Jon

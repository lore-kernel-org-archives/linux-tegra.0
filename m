From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Thu, 5 Nov 2015 10:13:36 -0800
Message-ID: <CAL1qeaHHS5PAUzcPAKevfUzcp+AiNUeYX0AowM4HJX5-x2x+nQ@mail.gmail.com>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
	<1446657109-15568-2-git-send-email-thierry.reding@gmail.com>
	<563B27AC.2000702@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <563B27AC.2000702-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 5, 2015 at 1:55 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> +UTMI ports:
>> +-----------
>> +
>> +Required properties:
>> +- status: Defines the operation status of the port. Valid values are:
>> +  - "disabled": the port is disabled
>> +  - "okay": the port is enabled
>> +- mode: A string that determines the mode in which to run the port. Valid
>> +  values are:
>> +  - "host": for USB host mode
>> +  - "device": for USB device mode
>> +  - "otg": for USB OTG mode
>> +
>> +Optional properties:
>> +- nvidia,internal: A boolean property whose presence determines that a port
>> +  is internal. In the absence of this property the port is considered to be
>> +  external.
>> +- vbus-supply: phandle to a regulator supplying the VBUS voltage.
>> +
>> +ULPI ports:
>> +-----------
>> +
>> +Optional properties:
>> +- status: Defines the operation status of the port. Valid values are:
>> +  - "disabled": the port is disabled
>> +  - "okay": the port is enabled
>> +- nvidia,internal: A boolean property whose presence determines that a port
>> +  is internal. In the absence of this property the port is considered to be
>> +  external.
>> +
>> +HSIC ports:
>> +-----------
>> +
>> +Required properties:
>> +- status: Defines the operation status of the port. Valid values are:
>> +  - "disabled": the port is disabled
>> +  - "okay": the port is enabled
>> +
>> +Super-speed USB ports:
>> +----------------------
>> +
>> +Required properties:
>> +- status: Defines the operation status of the port. Valid values are:
>> +  - "disabled": the port is disabled
>> +  - "okay": the port is enabled
>> +- nvidia,port: A single cell that specifies the physical port number to map
>> +  this super-speed USB port to. The range of valid port numbers varies with
>> +  the SoC generation:
>> +  - 0-2: for Tegra124 and Tegra132
>
> I am a bit confused by what nvidia,port property is used for. Is this to
> program XUSB_PADCTL_SS_PORT_MAP_0? If so then I think that this should
> be an optional property because if you want to use the usb3 ports for
> usb3, then we should not need to specify this here.

"nvidia,port" is used to program XUSB_PADCTL_SS_PORT_MAP and is
definitely required.  It specifies the UTMI port to which the SS port
is mapped to.  For example, Nyan-Big has 3 UTMI ports (0, 1
(internal), and 2) and 2 SS ports (0 and 1).  SS port 0 is mapped to
the same physical port as UTMI port 0 and SS port 1 is mapped to the
same physical port as UTMI port 2.

> Also the XHCI has 3 usb2 ports and 2 usb3 ports and so when you have
> port numbers 0-2 I am not sure what you are referring too.

The port numbers correspond tot he UTMI ports, so 3 UTMI ports =
possible port values of 0 - 2.

Maybe "port" isn't the best name here?

-Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

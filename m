From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Patch V2 01/18] dt-bindings: phy: tegra-xusb: Add
 usb-role-switch
Date: Mon, 13 Jan 2020 10:07:08 +0530
Message-ID: <6eb31a50-472f-439c-3bc7-bcad1c0c9ff4@nvidia.com>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-2-git-send-email-nkristam@nvidia.com>
 <20191219130503.GG1440537@ulmo>
 <fe47fd52-efd0-4f84-d1e4-4bce5571e425@nvidia.com>
 <20200110111633.GA2233456@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200110111633.GA2233456@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 10-01-2020 16:46, Thierry Reding wrote:
> On Fri, Dec 20, 2019 at 04:08:30PM +0800, JC Kuo wrote:
>> On 12/19/19 9:05 PM, Thierry Reding wrote:
>>> On Wed, Dec 18, 2019 at 02:46:14PM +0530, Nagarjuna Kristam wrote:
>>>> Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
>>>> entry is used by XUSB pad controller driver to register for role changes
>>>> for OTG/Peripheral capable USB 2 ports.
>>>>
>>>> Signed-off-by: Nagarjuna Kristam<nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>> V2:
>>>>   - Moved usb-role-switch to seperate Required section as suggested by Thierry.
>>>>   - Added reference to usb/usb-conn-gpio.txt for connector subnode.
>>>> ---
>>>>   .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt         | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>>> index 9fb682e..23bf354 100644
>>>> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>>> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>>> @@ -174,6 +174,12 @@ Required properties:
>>>>     - "device": for USB device mode
>>>>     - "otg": for USB OTG mode
>>>>   
>>>> +Required properties for OTG/Peripheral capable USB2 ports:
>>>> +- usb-role-switch: Boolean property to indicate that the port support OTG or
>>> "supports", and also, why if it supports OTG*or*  peripheral? Doesn't
>>> OTG imply peripheral? OTG means it can be either peripheral or host,
>>> right? So I think the end of that sentence can be just:
>>>
>>> 	"... the port supports OTG."
>> An USB OTG port is capable of both USB host and peripheral operations. An USB
>> peripheral port can only act as an USB peripheral.
>>
>> The micro USB ports found on Jetson TX1/TX2 platforms are micro-AB ports which
>> should implement both host and peripheral capabilities. We say such ports
>> support OTG. The micro USB port found on Jetson Nano is a micro-B port which
>> should implement peripheral capability only. We say such ports support
>> peripheral, rather than OTG.
> I the port supports only peripheral mode, why do we need to have a
> usb-role-switch property? Shouldn't we in that case have a mode property
> with value "device"?
> 
> usb-mode-switch is only needed if mode = "otg", isn't it? In all other
> cases the functionality is fixed (either host or peripheral) and the
> mode cannot be switched.
> 
> Thierry

usb-role-switch is needed when mode == "otg" or "peripheral".

Device mode is detected via vbus GPIO irrespective of mode being 
peripheral only or OTG.
Host mode is detected via id-gpio, in OTG case.

When mode is peripheral, role changes happens between USB_ROLE_DEVICE 
and USB_ROLE_NONE, which are generally based on Vbus GPIO(hot plug) 
detection.

When mode is otg, role changes happens between USB_ROLE_HOST, 
USB_ROLE_DEVICE and USB_ROLE_NONE, which are detected via id-gpio, 
vbus-gpio and no detection respectively.

-Nagarjuna

From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/7] ARM: tegra: update device trees for USB binding
 rework
Date: Thu, 04 Apr 2013 12:01:19 -0600
Message-ID: <515DBFEF.8060607@wwwdotorg.org>
References: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com> <1364978502-22887-3-git-send-email-vbyravarasu@nvidia.com> <515C8024.30204@wwwdotorg.org> <D958900912E20642BCBC71664EFECE3E6E50BE48AE@BGMAIL02.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6E50BE48AE-QZ+emBqkIFBDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/04/2013 07:01 AM, Venu Byravarasu wrote:
>> -----Original Message-----
>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> Sent: Thursday, April 04, 2013 12:47 AM
>> To: Venu Byravarasu
>> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; balbi-l0cyMroinI0@public.gmane.org;
>> stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
>> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH v2 2/7] ARM: tegra: update device trees for USB binding
>> rework
>>
>> On 04/03/2013 02:41 AM, Venu Byravarasu wrote:
>>> This patch updates all Tegra board files so that they contain all the
>>
>> The binding documentation says that the vbus-supply property is required
>> in all cases. However, many of the DT files still don't have that
>> property even after this patch. That's inconsistent.
> 
> Will edit the binding to have the vbus-supply only for otg cases. 

>>> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
>>
>>> +	usb-phy@c5000000 {
>>> +		vbus-supply = <&vbus_reg>;
>>> +		dr_mode = "otg";
>>> +	};
>>
>> Where is the nvidia,vbus-gpio property? Since your code changes don't
>> actually implement use of the vbus-supply property yet, they will expect
>> the vbus-gpio property to exist in the PHY node.
> 
> As of now Vbus-gpio is being used by EHCI driver only.
> As anyways we wanted to use vbus-supply, will implement its
> support in PHY driver and remove vbus-gpio from EHCI node. 
> Hence did not add vbus-gpio to PHY DT nodes.

Ah right. I thought that this patch series moved the use of vbus-gpio
from the EHCI to the PHY driver, just like it moved the handling of
other properties such as dr_mode. I guess that's not actually true.

Just so we're clear, I'd expect the following then:

* Update binding to remove references to vbus-gpio from EHCI binding,
add references to vbus-supply to PHY binding.

* Update DT to add vbus-supply to PHY nodes, but don't remove vbus-gpio
from EHCI nodes.

* The code in this series doesn't actually change the vbus-* usage yet.

...

* Once this series is finalized, create another follow-on patch that
adds vbus-supply handling in to the PHY driver, and removes vbus-gpio
handling from the EHCI driver.

* Finally, remove vbus-gpio from the DT files.

I think we're in agreement on this now, and this series mostly already
does exactly that. I just wanted to spell it out explicitly to make sure.

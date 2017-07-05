From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 0/9] Support UDC on Tegra 20/30/114/124
Date: Thu, 6 Jul 2017 02:20:04 +0300
Message-ID: <94e2532d-d342-3062-ec7a-6dfd865c1b62@gmail.com>
References: <cover.1499273075.git.digetx@gmail.com>
 <b5c54655-ccf4-2d4e-59fe-4a9e4609605a@wwwdotorg.org>
 <c8d9740a-7792-87d9-9466-8d3a45280403@gmail.com>
 <63e87e5c-5331-2680-7686-5ed22718a2bd@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63e87e5c-5331-2680-7686-5ed22718a2bd-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06.07.2017 01:54, Stephen Warren wrote:
> On 07/05/2017 04:13 PM, Dmitry Osipenko wrote:
>> On 05.07.2017 23:31, Stephen Warren wrote:
>>> On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
>>>> Some time ago Thierry Reding sent out patches that enabled UDC on NVIDIA
>>>> Tegra, unfortunately they haven't got enough traction to get into the
>>>> kernel. I've rebased those patches and added a fix for the Ethernet USB
>>>> Gadget on Tegra20, Marc Dietrich tested UDC driver on AC100 and Nicolas
>>>> Chauvet on TK1. Like an original patchset, this series adds support for
>>>> the peripheral mode only.
>>>
>>> Does this mean that the relevant ports no longer support host mode? That's going
>>> to be a user-visible regression, which doesn't sound like a good idea. Isn't OTG
>>> possible instead?
>>
>> We are going to switch only AC100 and TrimSlice to use the UDC driver.
> 
> Really? I saw patches in the series for Beaver, Dalmore, and Jetson TK1 too.
> 

Yes, the "PHY" and "EHCI" nodes are disabled on those boards in DT.

>> Do you
>> know whether that port is working in a host mode with the tegra-ehci driver on
>> these devices?
> 
> If any USB port is enabled in the DT, it was certainly validated at some point.
> IIRC, we only have host mode enabled at present. So, yes, I'd expect this port
> to work in host mode currently without any issue.
> 

Okay, so we have to decide whether it's reasonable to switch AC100 and TrimSlice
to the peripheral mode. I think realistically chances that someone uses that
port in a host mode are quite low, while it works fine and probably more useful
in a device mode.

>> That should be a micro USB port. Since that port is working in a
>> device mode by default, I presume that switching it into a host mode would
>> require some extra 'dance', otherwise I may drop the AC100 / TrimSlice patches.
>>
>> The full-featured OTG should be possible, it could be done later if desired. I'm
>> leaving it to somebody else to implement.


-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 8/9] ARM: tegra: Enable UDC on AC100
Date: Fri, 7 Jul 2017 11:27:09 +0300
Message-ID: <93faba14-0558-584f-279c-6e9a9305e520@gmail.com>
References: <cover.1499273075.git.digetx@gmail.com>
 <32f880f8-a49c-8f29-fe26-f50cae31e215@gmail.com>
 <33990cfa-f2f8-48ba-240b-ad088ba50bb5@wwwdotorg.org>
 <1803887.4ILkMQVocE@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1803887.4ILkMQVocE@fb07-iapwap2>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07.07.2017 00:23, Marc Dietrich wrote:
> Am Donnerstag, 6. Juli 2017, 20:00:02 CEST schrieb Stephen Warren:
>> On 07/06/2017 10:57 AM, Dmitry Osipenko wrote:
>>> On 06.07.2017 19:38, Stephen Warren wrote:
>>>> On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
>>>>> Override the compatible string of the first USB controller to enable
>>>>> device mode.
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
>>>>> b/arch/arm/boot/dts/tegra20-paz00.dts
>>>>>
>>>>>        usb@c5000000 {
>>>>>
>>>>> +        compatible = "nvidia,tegra20-udc";
>>>>>
>>>>>            status = "okay";
>>>>>
>>>>> +        dr_mode = "otg";
>>>>>
>>>>>        };
>>>>
>>>> This port is the only external USB port on the AC100.
>>>
>>> Seems that's not true. http://elinux.org/Tegra/Boards/Toshiba_AC100 claims
>>> that there are host and micro USB ports.
>>
>> You're right; I was getting this board confused with the Springbank
>> variety of Seaboard, and when I looked at the mini USB port on the AC100
>> I thought it was something else.
> 
> Sorry, for the late reply, I'm on vacation.
>  

No worries, have a good time!;)

>> Given the physical connector on this USB port on the AC100, it's
>> probably fine to convert it to device-mode only since I don't expect
>> anyone has a USB OTG cable that has a mini size connector on the host end.
>>
>> It looks like this port is only enabled because the very first version
>> of tegra-paz00.dts didn't explicitly disable the port, and when
>> tegra20.dtsi was updated to disable all USB ports by default,
>> tegra-paz00.dtsi was updated to enable the port so that the DT change
>> didn't affect behaviour, which then left the port enabled explicitly
>> albeit without much reason.
> 
> I think someone used it in the past in host mode and it was working, but I 
> think everyone will be happy to have it operating as client only (as original 
> intended), especially because we already have an external (and also an 
> internal) usb port.
> 
>> So, once the dr_mode is fixed in this change, it's:
>> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tested-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> 


-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

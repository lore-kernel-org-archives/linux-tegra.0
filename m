From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 4/9] ARM: tegra: Enable UDC on TrimSlice
Date: Thu, 6 Jul 2017 12:03:19 -0600
Message-ID: <52a9941a-59a5-5b49-be67-3b4991497395@wwwdotorg.org>
References: <cover.1499273075.git.digetx@gmail.com>
 <82321d32d968c6b9481a77fbecae8c0756d37f0f.1499273075.git.digetx@gmail.com>
 <20170706012409.GD24420@b29397-desktop>
 <7717016d-6da4-6933-a36e-4a6bf45646ab@wwwdotorg.org>
 <8c56c8e4-0c61-9400-5f52-0e6c00b51310@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8c56c8e4-0c61-9400-5f52-0e6c00b51310-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/06/2017 11:16 AM, Dmitry Osipenko wrote:
> On 06.07.2017 19:46, Stephen Warren wrote:
>> On 07/05/2017 07:24 PM, Peter Chen wrote:
>>> On Wed, Jul 05, 2017 at 08:19:53PM +0300, Dmitry Osipenko wrote:
>>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> Override the compatible string of the first USB controller to enable
>>>> device mode.
>>>>
>>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>    arch/arm/boot/dts/tegra20-trimslice.dts | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts
>>>> b/arch/arm/boot/dts/tegra20-trimslice.dts
>>>> index b902ab594afa..96b4f3f9827b 100644
>>>> --- a/arch/arm/boot/dts/tegra20-trimslice.dts
>>>> +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
>>>> @@ -336,7 +336,9 @@
>>>>        };
>>>>          usb@c5000000 {
>>>> +        compatible = "nvidia,tegra20-udc";
>>>>            status = "okay";
>>>> +        dr_mode = "otg";
>>>
>>> If this board supports peripheral-only, you need to
>>> set dr_mode as "peripheral".
>>
>> I agree here. Even if the ports can theoretically do otg, and DT is supposed to
>> represent HW not SW, given we have no SW support for actual OTG, it'd be best
>> not to change the DT to OTG until it's actually useful to do so. This comment
>> applies to the patches I ack'd already too.
> 
> In case of absence of the "dr_mode" option or without a support of host mode
> switching, UDC driver fallbacks to the peripheral mode. Given that DT is
> supposed to be stable, I'm not sure what to do... should I specify the
> peripheral mode for now (which doesn't represent the HW) or completely remove
> the "dr_mode"?

I think specifying dr_mode="peripheral" now is fine; we can change it later.

DT ABI compatibility isn't about never changing the DT content, it's 
about making sure that any schema changes occur in a 
backwards-compatible fashion.

Also in the case of a USB port that does support OTG, the dr_mode 
property represents both (a) the HW's capabilities, and (b) the user's 
desired (initial, if e.g. sysfs modification is possible) mode of 
operation if the HW has multiple capabilities. Given (b), I think it's 
fine to specify peripheral mode for now, and allow the user to change it 
back to host or OTG mode if they want (although OTG mode isn't 
useful/valid until SW support exists).

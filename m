From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable TPM on tegra124 nyan boards
Date: Thu, 14 May 2015 08:21:57 -0600
Message-ID: <5554AF85.4050307@wwwdotorg.org>
References: <1431526427-13340-1-git-send-email-sjg@chromium.org>	<5553637C.5010506@wwwdotorg.org> <CAPnjgZ0ga6==w7YWQoeUtXRxUhCjQ+BHMJuCL7vbqN9WTLM2kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ0ga6==w7YWQoeUtXRxUhCjQ+BHMJuCL7vbqN9WTLM2kQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lak <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/13/2015 09:22 AM, Simon Glass wrote:
> Hi Stephen,
>
> On 13 May 2015 at 08:45, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 05/13/2015 08:13 AM, Simon Glass wrote:
>>>
>>> Regenerate the pinmux from the latest tegra-pinmux-scripts.
>>
>>
>> (Dropping most CCs; DT maintainers and lists generally don't get CC'd on
>> simple DT content changes but rather on schema adds/changes and perhaps
>> major DT content changes depending on context)
>
> OK, I'll try to remember to use patman -m.
>
>>
>>> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> b/arch/arm/boot/dts/tegra124-nyan-big.dts
>>
>>
>>>                  pinctrl-names = "default";
>>>                  pinctrl-0 = <&pinmux_default>;
>>>
>>> -               pinmux_default: common {
>>> +               state_default: pinmux {
>>
>>
>> This change will break compilation, since it changes the label name, yet the
>> old name is still referenced in pinctrl-0 above. Same applies in the other
>> file too.
>
> Yes I saw that, but assumed that the tool was doing the right thing.
> Is the tool wrong?

Well, it includes the outer node to make it obvious where to put the 
generated data, but since this one line doesn't exactly match what's in 
some of the kernel DTs, it's probably just confusing. I've sent a patch 
to remove that one line from the generated output of the tool; find it 
on the linux-tegra mailing list.

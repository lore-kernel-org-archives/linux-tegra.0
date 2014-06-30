From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: tegra: roth: pinmux fixes
Date: Mon, 30 Jun 2014 09:46:57 -0600
Message-ID: <53B18671.2080005@wwwdotorg.org>
References: <1403508779-25896-1-git-send-email-acourbot@nvidia.com> <53ADEB5F.5030502@wwwdotorg.org> <CAAVeFuKjfmuo0JjRnhhfbuo-Ed-QqVciAQ3g6ESCmzxhOvv0JA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuKjfmuo0JjRnhhfbuo-Ed-QqVciAQ3g6ESCmzxhOvv0JA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/28/2014 10:27 PM, Alexandre Courbot wrote:
> On Sat, Jun 28, 2014 at 7:08 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 06/23/2014 01:32 AM, Alexandre Courbot wrote:
>>> Two small but important fixes to SHIELD's pinmux configuration.
>>> The use of invalid properties caused the pinmux to not be applied
>>> at all. Also the setting for sdmmc clock lines resulted in random
>>> errors or even the impossibility to probe attached devices.
>>>
>>> Alexandre Courbot (2):
>>>   ARM: tegra: roth: fix unsupported pinmux properties
>>>   ARM: tegra: roth: enable input on mmc clock pins
>>
>> The series, applied to Tegra's for-3.17/dt branch.
>>
>> Sorry for the delay; I'd forgotten that our internal discussion resolved
>> my questions about patch 2.
> 
> Thanks! And sorry for not mirroring the discussion on the public list.
> 
>> Still looking forward to internal bugs files against the Jetson TK1 and
>> Venice2 board pinmux spreadsheets for the same issue:-)
> 
> Are the spreadsheets you are talking about the following documents?
> 
> https://github.com/NVIDIA/tegra-pinmux-scripts/blob/master/configs/jetson-tk1.board
> 
> Or do we have internal structures we need to update as well?

That's data that is extracted from the internal spreadsheets. I'll try
and remember to send you the links internally (since they wouldn't be
useful to anyone on-list).

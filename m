From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Fix "scheduling while atomic"
Date: Thu, 26 May 2016 09:42:31 +0100
Message-ID: <5746B6F7.9040101@nvidia.com>
References: <1460900051-3065-1-git-send-email-digetx@gmail.com>
 <572B47DE.1090804@nvidia.com>
 <c4a3fb3f-adb8-c167-d660-55d3f803c9c3@gmail.com> <5745C02A.20308@nvidia.com>
 <d3552444-75b6-a624-589d-5391d7c09526@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d3552444-75b6-a624-589d-5391d7c09526-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/05/16 19:51, Dmitry Osipenko wrote:
> On 25.05.2016 18:09, Jon Hunter wrote:

...

>> If you are able to reproduce this on v3.18, then it would be good if you
>> could trace the CCF calls around this WARNING to see what is causing the
>> contention.
> 
> I managed to reproduce it with some CCF "tracing".
> Full kmsg log is here: https://bpaste.net/show/d8ab7b7534b7
> 
> Looks like CPU freq governor thread yields during clk_set_rate() and
> then CPU idle kicks in, taking the same mutex.

On the surface that sounds odd to me, but without understanding the
details, I guess I don't know if this is a valid thing to be doing or
even how that actually works!

> However, cpufreq_interactive governor is android specific governor and
> isn't in upstream kernel yet. Quick googling shows that recent
> "upstreaming" patch uses same cpufreq_interactive_speedchange_task:
> https://lkml.org/lkml/2016/5/20/41

Do you know if this version they are upstreaming could also yield during
the clk_set_rate()?

> I'm not aware of other possibility to reproduce this issue, it needs
> some CCF interaction from a separate task. So the current upstream
> kernel shouldn't be affected, I guess.

What still does not make sense to me is why any frequency changes have
not completed before we attempt to enter the LP2 state?

OK, well may be we will hold off on this change for the moment.

Cheers
Jon

-- 
nvpublic

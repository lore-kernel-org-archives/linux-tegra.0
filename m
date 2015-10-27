From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clocksource/drivers/tegra: allow timer irq affinity
 change
Date: Tue, 27 Oct 2015 21:54:04 +0100
Message-ID: <562FE46C.8080904@linaro.org>
References: <1445787630-13251-1-git-send-email-dev@lynxeye.de>
 <562F4EA3.7000202@linaro.org> <1445977362.2535.1.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445977362.2535.1.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/27/2015 09:22 PM, Lucas Stach wrote:
> Am Dienstag, den 27.10.2015, 11:14 +0100 schrieb Daniel Lezcano:
>> On 10/25/2015 04:40 PM, Lucas Stach wrote:
>>> Allow the timer core to change the smp affinity of the broadcast
>>> timer
>>> irq by setting CLOCK_EVT_FEAT_DYNIRQ flag.
>>>
>>> This reduces interrupt pressure and wakeups on CPU0 as well as
>>> vastly
>>> reducing the number of timer broadcast IPIs.
>>
>> Did you test this patch on a tegra2 ?
>>
> Yes, I haven't spotted anything bad, but don't know if I should look
> out for specific oddities?

I was wondering if you tested it because the changelog was the same tha=
n=20
the similar change you did previously so I wanted to know if you assume=
d=20
the behavior or if you tested it.

So, no problem.

Thanks !

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

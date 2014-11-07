From: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clocksource: tegra: Port tegra20 clocksource to arm64
Date: Thu, 6 Nov 2014 20:26:18 -0800
Message-ID: <CAOMFOmVdpbP1v5xFF80mxq4z2Yjs+aZuW=89ArtwvgAX8MVQtQ@mail.gmail.com>
References: <1415319715-21757-1-git-send-email-anatol.pomozov@gmail.com>
	<545C47BC.4050207@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545C47BC.4050207-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi

On Thu, Nov 6, 2014 at 8:17 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 11/06/2014 05:21 PM, Anatol Pomozov wrote:
>> register_persistent_clock() are in different headers in arm/arm64
>>
>> Tested: Compiled the driver on 64bit platform and make sure that
>> it works
>
> I assume "it works" refers to "it compiles" not "it executes successfully"?

It execute successfully, at least on 3.14 + bunch of backported
changes. I tested it on chromiumos 3.14 kernel and 64bit tegra board.

> I think it'd be better to make the same APIs available on arm and arm64,
> or even across all architectures.
>
>> Signed-off-by: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/clocksource/tegra20_timer.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
>> index d2616ef..e0123c7 100644
>> --- a/drivers/clocksource/tegra20_timer.c
>> +++ b/drivers/clocksource/tegra20_timer.c
>> @@ -29,8 +29,12 @@
>>  #include <linux/sched_clock.h>
>>  #include <linux/delay.h>
>>
>> +#ifdef CONFIG_ARM64
>> +#include <asm/time.h>
>> +#else
>>  #include <asm/mach/time.h>
>>  #include <asm/smp_twd.h>
>> +#endif
>>
>>  #define RTC_SECONDS            0x08
>>  #define RTC_SHADOW_SECONDS     0x0c
>>
>

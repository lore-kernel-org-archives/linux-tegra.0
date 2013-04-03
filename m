From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clocksource: tegra: enable arch_timer
Date: Wed, 03 Apr 2013 12:22:27 -0600
Message-ID: <515C7363.4040404@wwwdotorg.org>
References: <1364988750-25058-1-git-send-email-josephl@nvidia.com> <515C2E8F.1030802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515C2E8F.1030802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 07:28 AM, Rob Herring wrote:
> On 04/03/2013 06:32 AM, Joseph Lo wrote:
>> Architected timer is the local timer for Cortex-A15. Adding the support
>> for Tegra.
>>
>> Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> My patch series to add CLOCKSOURCE_OF_DECLARE support to arch timer and
> sched_clock enhancements will make this unnecessary:
> 
> http://www.spinics.net/lists/arm-kernel/msg234597.html
> 
> Testing would be appreciated.

Joseph (or Rob), what's the benefit of this change; what works with it
and/or what breaks without it?

Rob, if I did apply this change, and you also apply that series of
yours, what is the result: compile-time breakage, run-time breakage,
just some redundant code that needs to be removed again?

Thanks.

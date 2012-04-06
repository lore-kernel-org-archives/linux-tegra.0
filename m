From: "Shilimkar, Santosh" <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC PATCH] cpuidle: allow per cpu latencies
Date: Fri, 6 Apr 2012 16:02:37 +0530
Message-ID: <CAMQu2gzwe0F3qcaTqASEPUASdG1SjpUxrBrSp-RrYLgy3W24OQ@mail.gmail.com>
References: <1333619620-21201-1-git-send-email-pdeschrijver@nvidia.com> <4F7DA009.4010802@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F7DA009.4010802-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Trinabh Gupta <g.trinabh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Deepthi Dharwar <deepthi-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter,

On Thu, Apr 5, 2012 at 7:07 PM, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> On 4/5/2012 2:53 AM, Peter De Schrijver wrote:
>> This patch doesn't update all cpuidle device registrations. I will do that
>
> question is if you want to do per cpu latencies, or if you want to have
> both types of C state in one big table, and have each of the tegra cpyu
> types pick half of them...
>
>
Indeed !! That should work.
I thought the C-states are always per CPU based and during the
cpuidle registration you can register C-state accordingly based on the
specific CPU types with different latencies if needed.

Am I missing something ?

Regards
Santosh

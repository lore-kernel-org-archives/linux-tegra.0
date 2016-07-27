From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] timers/core: Correct callback order during CPU hot plug.
Date: Wed, 27 Jul 2016 10:50:42 +0100
Message-ID: <25aca1c4-5bc0-838c-ac69-45ec97031da2@nvidia.com>
References: <20160713153337.566790058@linutronix.de>
 <1469610498-25914-1-git-send-email-rcochran@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469610498-25914-1-git-send-email-rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rt-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Richard,

On 27/07/16 10:08, Richard Cochran wrote:
> On the tear-down path, the dead CPU callback for the timers was
> misplaced within the 'cpuhp_state' enumeration.  There is a hidden
> dependency between the timers and block multiqueue.  The timers
> callback must happen before the block multiqueue callback otherwise a
> RCU stall occurs.
> 
> This patch fixes the order within the hot plug state machine.
> 
> Signed-off-by: Richard Cochran <rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Fixes: 24f73b99716a ("timers/core: Convert to hotplug state machine")
> 
> Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Cc: Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: rt-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
> ---
>  include/linux/cpuhotplug.h |  2 +-
>  kernel/cpu.c               | 15 ++++++++++-----
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 6d405db..242bf53 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -20,9 +20,9 @@ enum cpuhp_state {
>  	CPUHP_PROFILE_PREPARE,
>  	CPUHP_X2APIC_PREPARE,
>  	CPUHP_SMPCFD_PREPARE,
> -	CPUHP_TIMERS_DEAD,
>  	CPUHP_RCUTREE_PREP,
>  	CPUHP_NOTIFY_PREPARE,
> +	CPUHP_TIMERS_DEAD,
>  	CPUHP_BRINGUP_CPU,
>  	CPUHP_AP_IDLE_DEAD,
>  	CPUHP_AP_OFFLINE,
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 67f4943..ec12b72 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1208,11 +1208,6 @@ static struct cpuhp_step cpuhp_bp_states[] = {
>  		.startup = smpcfd_prepare_cpu,
>  		.teardown = smpcfd_dead_cpu,
>  	},
> -	[CPUHP_TIMERS_DEAD] = {
> -		.name = "timers dead",
> -		.startup = NULL,
> -		.teardown = timers_dead_cpu,
> -	},
>  	[CPUHP_RCUTREE_PREP] = {
>  		.name = "RCU-tree prepare",
>  		.startup = rcutree_prepare_cpu,
> @@ -1229,6 +1224,16 @@ static struct cpuhp_step cpuhp_bp_states[] = {
>  		.skip_onerr		= true,
>  		.cant_stop		= true,
>  	},
> +	/*
> +	 * On the tear-down path, timers_dead_cpu() must be invoked
> +	 * before blk_mq_queue_reinit_notify() from notify_dead(),
> +	 * otherwise a RCU stall occurs.
> +	 */
> +	[CPUHP_TIMERS_DEAD] = {
> +		.name = "timers dead",
> +		.startup = NULL,
> +		.teardown = timers_dead_cpu,
> +	},
>  	/* Kicks the plugged cpu into life */
>  	[CPUHP_BRINGUP_CPU] = {
>  		.name			= "cpu:bringup",
> 

This fixes the RCU stalls I was seeing during suspend on Tegra and so ...

Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers!
Jon

-- 
nvpublic

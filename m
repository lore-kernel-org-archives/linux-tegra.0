From: rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Tue, 26 Jul 2016 17:42:27 +0200
Message-ID: <20160726154227.GC23707@linutronix.de>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
 <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7d37714e-b072-ee90-f14f-364f4fd01f0d-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Anna-Maria Gleixner <anna-maria-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jon,

On Mon, Jul 25, 2016 at 03:56:48PM +0100, Jon Hunter wrote:
> > When tearing down, call timers_dead_cpu before notify_dead.
> > There is a hidden dependency between:
> >
> > - timers
> > - Block multiqueue
> > - rcutree
> >
> > If timers_dead_cpu() comes later than blk_mq_queue_reinit_notify()
> > that latter function causes a RCU stall.
> 
> After this change is applied I am seeing RCU stalls during suspend
> on Tegra. I guess I am hitting the case mentioned above? How should
> this be avoided?

Contrary to the commit message, this callback ended up in the wrong
place within the sequence.  (It was correct in an earlier version, but
the series has been through many changes.)

Can you try this patch to see if it avoids the stall, please?

Thanks,
Richard
---

diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 6d405db..242bf53 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -20,9 +20,9 @@ enum cpuhp_state {
 	CPUHP_PROFILE_PREPARE,
 	CPUHP_X2APIC_PREPARE,
 	CPUHP_SMPCFD_PREPARE,
-	CPUHP_TIMERS_DEAD,
 	CPUHP_RCUTREE_PREP,
 	CPUHP_NOTIFY_PREPARE,
+	CPUHP_TIMERS_DEAD,
 	CPUHP_BRINGUP_CPU,
 	CPUHP_AP_IDLE_DEAD,
 	CPUHP_AP_OFFLINE,
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 67f4943..8d65510 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1208,11 +1208,6 @@ static struct cpuhp_step cpuhp_bp_states[] = {
 		.startup = smpcfd_prepare_cpu,
 		.teardown = smpcfd_dead_cpu,
 	},
-	[CPUHP_TIMERS_DEAD] = {
-		.name = "timers dead",
-		.startup = NULL,
-		.teardown = timers_dead_cpu,
-	},
 	[CPUHP_RCUTREE_PREP] = {
 		.name = "RCU-tree prepare",
 		.startup = rcutree_prepare_cpu,
@@ -1229,6 +1224,11 @@ static struct cpuhp_step cpuhp_bp_states[] = {
 		.skip_onerr		= true,
 		.cant_stop		= true,
 	},
+	[CPUHP_TIMERS_DEAD] = {
+		.name = "timers dead",
+		.startup = NULL,
+		.teardown = timers_dead_cpu,
+	},
 	/* Kicks the plugged cpu into life */
 	[CPUHP_BRINGUP_CPU] = {
 		.name			= "cpu:bringup",

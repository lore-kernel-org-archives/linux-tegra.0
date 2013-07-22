From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
Date: Mon, 22 Jul 2013 06:32:01 +0200
Message-ID: <51ECB5C1.600@linaro.org>
References: <1372152228-16199-1-git-send-email-josephl@nvidia.com>  <51E439BC.9030608@wwwdotorg.org>  <1373973447.8538.80.camel@jlo-ubuntu-64.nvidia.com>  <51E5A438.10004@wwwdotorg.org>  <1374056130.10997.16.camel@jlo-ubuntu-64.nvidia.com>  <51E6FF0B.5000708@wwwdotorg.org>  <1374145726.5610.73.camel@jlo-ubuntu-64.nvidia.com>  <51E7E27B.9090605@linaro.org>  <1374218064.24607.1.camel@jlo-ubuntu-64.nvidia.com>  <51E91A72.6070708@linaro.org>  <1374462916.15946.14.camel@jlo-ubuntu-64.nvidia.com>  <51ECB223.5000002@linaro.org> <1374467085.15946.16.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000608050001010605070500"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374467085.15946.16.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is a multi-part message in MIME format.
--------------000608050001010605070500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/22/2013 06:24 AM, Joseph Lo wrote:
> On Mon, 2013-07-22 at 12:16 +0800, Daniel Lezcano wrote:
>> On 07/22/2013 05:15 AM, Joseph Lo wrote:
>>> On Fri, 2013-07-19 at 18:52 +0800, Daniel Lezcano wrote:
>>>> On 07/19/2013 09:14 AM, Joseph Lo wrote:
>>>>> On Thu, 2013-07-18 at 20:41 +0800, Daniel Lezcano wrote:
>>>>>> On 07/18/2013 01:08 PM, Joseph Lo wrote:
>>>>>>> On Thu, 2013-07-18 at 04:31 +0800, Stephen Warren wrote:
>>>>>>>> On 07/17/2013 04:15 AM, Joseph Lo wrote:
>>>>>>>>> On Wed, 2013-07-17 at 03:51 +0800, Stephen Warren wrote:
>>>>>>>>>> On 07/16/2013 05:17 AM, Joseph Lo wrote:
>>>>>>>>>>> On Tue, 2013-07-16 at 02:04 +0800, Stephen Warren wrote:
>>>>>>>>>>>> On 06/25/2013 03:23 AM, Joseph Lo wrote:
>>>>>>>>>>>>> Use the CPUIDLE_FLAG_TIMER_STOP and let the cpuidle framework
>>>>>>>>>>>>> to handle the CLOCK_EVT_NOTIFY_BROADCAST_ENTER/EXIT when entering
>>>>>>>>>>>>> this state.
>>>>>>>> ... [ discussion of issues with Joesph's patches applied]
>>>>>>>>>
> [...]
>>>>
>>>> Ok, so the problem occurs with the CPUIDLE_FLAG_TIMER_STOP flag only on
>>>> tegra114, right ?
>>>>
>>>> Sorry, I am a bit lost :)
>>>>
>>> Here are the issues that happen after apply CPUIDLE_FLAG_TIMER_STOP.
>>> 1) Tegra114/30
>>> The warning message at kernel/time/tick-broadcast.c:667
>>> tick_broadcast_oneshot_control could be triggered when doing CPU hot
>>> plug stress test.
>>
>> With the fix for tick-broadcast.c [1] ?
> Yes.
> 
>>
>>> 2) Tegra20
>>> The system is easy to stick or become lag.
>>> The CPU hot plug is easy to cause system stick too.
>>>
>>> The fix I suggested in another mail looks can fix all the issues above.
>>> I verified it again today on 3 different Tegra SoC platforms.
>>
>> Not sure your patch fixes the problem.
>>
>> I am wondering if there isn't a underlaying problem which surface with
>> the flag.

Does the attached patch changes something ?


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


--------------000608050001010605070500
Content-Type: text/x-diff;
 name="0011-cpuidle-add-hotplug-support-to-initialize-the-timer-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0011-cpuidle-add-hotplug-support-to-initialize-the-timer-.pa";
 filename*1="tch"

From 5d4f611244834662d3ac077af4e8e6ef4bb1ed8a Mon Sep 17 00:00:00 2001
From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Tue, 9 Apr 2013 12:03:28 +0200
Subject: [PATCH 11/36] cpuidle: add hotplug support to initialize the timer
 broadcast

Commit 89878baa73f0f1c679355006bd8632e5d78f96c2 introduced the flag
CPUIDLE_FLAG_TIMER_STOP where we specify a specific idle state stops the local
timer.

Commit a06df062a189a8d5588babb8bf0bb78672497798 introduced the initialization
of the timer broadcast framework depending of the flag presence.

If a system is booted with some cpus offline, by setting for example, maxcpus=1
in the kernel command line, and then they are set online, the timer broadcast
won't be setup automatically.

Fix this by adding the cpu hotplug notifier and enable/disable the timer
broadcast automatically. So no need to handle that at the arch specific driver
level like eg. intel_idle does.

Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/cpuidle/driver.c |   48 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

Index: cpuidle-next/drivers/cpuidle/driver.c
===================================================================
--- cpuidle-next.orig/drivers/cpuidle/driver.c
+++ cpuidle-next/drivers/cpuidle/driver.c
@@ -10,6 +10,7 @@
 
 #include <linux/mutex.h>
 #include <linux/module.h>
+#include <linux/cpu.h>
 #include <linux/cpuidle.h>
 #include <linux/cpumask.h>
 #include <linux/clockchips.h>
@@ -147,6 +148,48 @@ static void cpuidle_setup_broadcast_time
 }
 
 /**
+ * cpuidle_hotplug_notify: notifier callback when a cpu is onlined/offlined
+ * @n: the notifier block
+ * @action: an unsigned long giving the event related to the notification
+ * @hcpu: a void pointer but used as the cpu number which the event is related
+ *
+ * The kernel can boot with some cpus offline, we have to init the timer
+ * broadcast for these cpus when they are onlined. Also we have to disable
+ * the timer broadcast when the cpu is down.
+ *
+ * Returns NOTIFY_OK
+ */
+static int cpuidle_hotplug_notify(struct notifier_block *n,
+				  unsigned long action, void *hcpu)
+{
+	int cpu = (unsigned long)hcpu;
+	struct cpuidle_driver *drv;
+
+	drv = __cpuidle_get_cpu_driver(cpu);
+	if (!drv || !drv->bctimer)
+		goto out;
+
+	switch (action & 0xf) {
+	case CPU_ONLINE:
+		smp_call_function_single(cpu, cpuidle_setup_broadcast_timer,
+					 (void *)CLOCK_EVT_NOTIFY_BROADCAST_ON,
+					 1);
+		break;
+	case CPU_DEAD:
+		smp_call_function_single(cpu, cpuidle_setup_broadcast_timer,
+					 (void *)CLOCK_EVT_NOTIFY_BROADCAST_OFF,
+					 1);
+		break;
+	}
+out:
+	return NOTIFY_OK;
+}
+
+static struct notifier_block cpuidle_hotplug_notifier = {
+	.notifier_call = cpuidle_hotplug_notify,
+};
+
+/**
  * __cpuidle_driver_init - initialize the driver's internal data
  * @drv: a valid pointer to a struct cpuidle_driver
  *
@@ -262,6 +305,9 @@ int cpuidle_register_driver(struct cpuid
 	ret = __cpuidle_register_driver(drv);
 	spin_unlock(&cpuidle_driver_lock);
 
+	if (!ret)
+		ret = register_cpu_notifier(&cpuidle_hotplug_notifier);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(cpuidle_register_driver);
@@ -276,6 +322,8 @@ EXPORT_SYMBOL_GPL(cpuidle_register_drive
  */
 void cpuidle_unregister_driver(struct cpuidle_driver *drv)
 {
+	unregister_cpu_notifier(&cpuidle_hotplug_notifier);
+
 	spin_lock(&cpuidle_driver_lock);
 	__cpuidle_unregister_driver(drv);
 	spin_unlock(&cpuidle_driver_lock);

--------------000608050001010605070500--

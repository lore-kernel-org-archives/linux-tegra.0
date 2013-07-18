From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
Date: Thu, 18 Jul 2013 14:41:31 +0200
Message-ID: <51E7E27B.9090605@linaro.org>
References: <1372152228-16199-1-git-send-email-josephl@nvidia.com>  <51E439BC.9030608@wwwdotorg.org>  <1373973447.8538.80.camel@jlo-ubuntu-64.nvidia.com>  <51E5A438.10004@wwwdotorg.org>  <1374056130.10997.16.camel@jlo-ubuntu-64.nvidia.com>  <51E6FF0B.5000708@wwwdotorg.org> <1374145726.5610.73.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374145726.5610.73.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/18/2013 01:08 PM, Joseph Lo wrote:
> On Thu, 2013-07-18 at 04:31 +0800, Stephen Warren wrote:
>> On 07/17/2013 04:15 AM, Joseph Lo wrote:
>>> On Wed, 2013-07-17 at 03:51 +0800, Stephen Warren wrote:
>>>> On 07/16/2013 05:17 AM, Joseph Lo wrote:
>>>>> On Tue, 2013-07-16 at 02:04 +0800, Stephen Warren wrote:
>>>>>> On 06/25/2013 03:23 AM, Joseph Lo wrote:
>>>>>>> Use the CPUIDLE_FLAG_TIMER_STOP and let the cpuidle framework
>>>>>>> to handle the CLOCK_EVT_NOTIFY_BROADCAST_ENTER/EXIT when enteri=
ng
>>>>>>> this state.
>> ... [ discussion of issues with Joesph's patches applied]
>>>
>>> OK. I did more stress tests last night and today. I found it cause =
by
>>> the patch "ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag" a=
nd
>>> only impact the Tegra20 platform. The hot plug regression seems due=
 to
>>> this patch. After dropping this patch on top of v3.11-rc1, the Tegr=
a20
>>> can back to normal.
>>>
>>> And the hop plug and suspend stress test can pass on Tegra30/114 to=
o.
>>>
>>> Can the other two patch series for Tegra114 to support CPU idle pow=
er
>>> down mode and system suspend still moving forward, not be blocked b=
y
>>> this patch?
>>>
>>> Looks the CPUIDLE_FLAG_TIMER_STOP flag still cause some other issue=
 for
>>> hot plug on Tegra20, I will continue to check this. You can just dr=
op
>>> this patch.
>>
>> OK, if I drop that patch, then everything on Tegra20 and Tegra30 see=
ms
>> fine again.
>>
>> However, I've found some new and exciting issue on Tegra114!
>>
>> With unmodified v3.11-rc1, I can do the following without issue:
>>
>> * Unplug/replug CPUs, so that I had all combinations of CPU 1, 2, 3
>> plugged/unpplugged (with CPU 0 always plugged).
>>
>> * Unplug/replug CPUs, so that I had all combinations of CPU 0, 1, 2,=
 3
>> plugged/unpplugged (with the obvious exception of never having all C=
PUs
>> unplugged).
>>
>> However, if I try this with your Tegra114 cpuidle and suspend patche=
s
>> applied, I see the following issues:
>>
>> 1) If I boot, unplug CPU 0, then replug CPU 0, the system immediatel=
y
>> hard-hangs.
>>
> Sorry, I didn't apply the hotplug stress test on CPU0 too much. Becau=
se
> all of our use cases and stress tests are focused on secondary CPUs
> only.
>=20
> After doing some tests, here is my summary. This issue happens after =
we
> support CPU idle power-down mode and relates to PMC or flow controlle=
r I
> believe.
>=20
> i) on top of v3.11-rc1 (only support WFI in CPU idle)
> When hot unplug CPU0, the PMC can power gate and put it into reset
> state. This is what I expect and also true on all the other secondary
> CPUs. The flow controller can maintain the CPU power state machine as
> what we want.
>=20
> ii) on top of v3.11-rc1 + CPU idle power down mode support
> a) I saw most of the time the CPU0,1,2,3 were in power down and reset
> status. That means the idle power down mode works fine.
>=20
> b) Testing with the CPU hotplug stress test with the secondary CPUs (=
not
> include CPU0), the result is good too.
>=20
> c) Testing hot plug on CPU0 with CPUIDLE_FLAG_TIMER_STOP apply or not
> apply (Note 1), the result shows not good to me. The CPU0 have alread=
y
> gone into WFI and the flow controller is set as WAITFOREVENT mode. Bu=
t
> the PMC always can't power gate CPU0 and sometimes can put it into
> reset, but sometimes can't. That's why you can see it hanging after
> unplug CPU0 sometimes.

Are sure coupled idle state support hotplug and especially the cpu0
hotplug ?

> When hop plug-in CPU0, because the CPU0 not be power gated by PMC or =
the
> flow controller event that we trigger PMC to do. I think it may need
> more time to process it. It can be solved by just add a udelay(10) af=
ter
> we set up flow controller event to wake up CPU0. Then it can put CPU0
> back to normal state.
>=20
> So the result shows to me the flow controller (or the state machine)
> looks not support to power gate CPU0 when we support idle power down
> mode. The power of CPU0 also can bind to the power of the CPU cluster=
=2E
> That cause the state machine can't work correctly in this case, I gue=
ss.
> I need to check with some people. BTW, I just saw we drop the hotplug
> support for CPU0 in downstream rel-18 (although it's not related to t=
his
> issue).
>=20
> Note 1.
> diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c
> b/arch/arm/mach-tegra/cpuidle-tegra114.c
> index 658b205..5248a69 100644
> --- a/arch/arm/mach-tegra/cpuidle-tegra114.c
> +++ b/arch/arm/mach-tegra/cpuidle-tegra114.c
> @@ -43,8 +43,12 @@ static int tegra114_idle_power_down(struct
> cpuidle_device *dev,
>         tegra_set_cpu_in_lp2();
>         cpu_pm_enter();
> =20
> +       clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cp=
u);
> +
>         cpu_suspend(0, tegra30_sleep_cpu_secondary_finish);
> =20
> +       clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu=
);
> +
>         cpu_pm_exit();
>         tegra_clear_cpu_in_lp2();
> =20
> @@ -66,8 +70,8 @@ static struct cpuidle_driver tegra_idle_driver =3D =
{
>                         .exit_latency           =3D 500,
>                         .target_residency       =3D 1000,
>                         .power_usage            =3D 0,
> -                       .flags                  =3D
> CPUIDLE_FLAG_TIME_VALID |
> -
> CPUIDLE_FLAG_TIMER_STOP,
> +                       .flags                  =3D
> CPUIDLE_FLAG_TIME_VALID,
> +//
> CPUIDLE_FLAG_TIMER_STOP,
>                         .name                   =3D "powered-down",
>                         .desc                   =3D "CPU power gated"=
,
>                 },
>=20
>> 2) If I run the hotplug test script, leaving CPU 0 always present, I
>> sometimes see:
>>
>>> root@localhost:~# for i in `seq 1 50`; do echo ITERATION $i; ./cpuo=
nline.py; done
>>> ITERATION 1
>>> echo 0 > /sys/devices/system/cpu/cpu2/online
>>> [  458.910054] CPU2: shutdown
>>> echo 0 > /sys/devices/system/cpu/cpu1/online
>>> [  461.004371] CPU1: shutdown
>>> echo 0 > /sys/devices/system/cpu/cpu3/online
>>> [  463.027341] CPU3: shutdown
>>> echo 1 > /sys/devices/system/cpu/cpu1/online
>>> [  465.061412] CPU1: Booted secondary processor
>>> echo 1 > /sys/devices/system/cpu/cpu2/online
>>> [  467.095313] CPU2: Booted secondary processor
>>> [  467.113243] ------------[ cut here ]------------
>>> [  467.117948] WARNING: CPU: 2 PID: 0 at kernel/time/tick-broadcast=
=2Ec:667 tick_broadcast_oneshot_control+0x19c/0x1c4()
>>> [  467.128352] Modules linked in:
>>> [  467.131455] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 3.11.0-rc1=
-00022-g7487363-dirty #49
>>> [  467.139678] [<c0015620>] (unwind_backtrace+0x0/0xf8) from [<c001=
154c>] (show_stack+0x10/0x14)
>>> [  467.148228] [<c001154c>] (show_stack+0x10/0x14) from [<c05135a8>=
] (dump_stack+0x80/0xc4)
>>> [  467.156336] [<c05135a8>] (dump_stack+0x80/0xc4) from [<c0024590>=
] (warn_slowpath_common+0x64/0x88)
>>> [  467.165300] [<c0024590>] (warn_slowpath_common+0x64/0x88) from [=
<c00245d0>] (warn_slowpath_null+0x1c/0x24)
>>> [  467.174959] [<c00245d0>] (warn_slowpath_null+0x1c/0x24) from [<c=
00695e4>] (tick_broadcast_oneshot_control+0x19c/0x1c4)
>>> [  467.185659] [<c00695e4>] (tick_broadcast_oneshot_control+0x19c/0=
x1c4) from [<c0067cdc>] (clockevents_notify+0x1b0/0x1dc)
>>> [  467.196538] [<c0067cdc>] (clockevents_notify+0x1b0/0x1dc) from [=
<c034f348>] (cpuidle_idle_call+0x11c/0x168)
>>> [  467.206292] [<c034f348>] (cpuidle_idle_call+0x11c/0x168) from [<=
c000f134>] (arch_cpu_idle+0x8/0x38)
>>> [  467.215359] [<c000f134>] (arch_cpu_idle+0x8/0x38) from [<c006103=
8>] (cpu_startup_entry+0x60/0x134)
>>> [  467.224325] [<c0061038>] (cpu_startup_entry+0x60/0x134) from [<8=
00083d8>] (0x800083d8)
>>> [  467.232227] ---[ end trace ea579be22a00e7fb ]---
>>> echo 0 > /sys/devices/system/cpu/cpu1/online
>>> [  469.126682] CPU1: shutdown
>=20
> Hmm. It's hard to reproduce. But finally, I also can repro with CPU
> hotplug stress test. And some strange issues after apply
> CPUIDLE_FLAG_TIMER_STOP on Tegra20, can we postpone to apply this?
> I need more time to investigate how does this flag impact system.
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

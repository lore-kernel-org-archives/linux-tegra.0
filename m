From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
Date: Wed, 17 Jul 2013 23:45:47 +0200
Message-ID: <51E7108B.5030504@linaro.org>
References: <1372152228-16199-1-git-send-email-josephl@nvidia.com>  <51E439BC.9030608@wwwdotorg.org>  <1373973447.8538.80.camel@jlo-ubuntu-64.nvidia.com>  <51E5A438.10004@wwwdotorg.org> <1374056130.10997.16.camel@jlo-ubuntu-64.nvidia.com> <51E6FF0B.5000708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51E6FF0B.5000708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/17/2013 10:31 PM, Stephen Warren wrote:
> On 07/17/2013 04:15 AM, Joseph Lo wrote:
>> On Wed, 2013-07-17 at 03:51 +0800, Stephen Warren wrote:
>>> On 07/16/2013 05:17 AM, Joseph Lo wrote:
>>>> On Tue, 2013-07-16 at 02:04 +0800, Stephen Warren wrote:
>>>>> On 06/25/2013 03:23 AM, Joseph Lo wrote:
>>>>>> Use the CPUIDLE_FLAG_TIMER_STOP and let the cpuidle framework
>>>>>> to handle the CLOCK_EVT_NOTIFY_BROADCAST_ENTER/EXIT when enterin=
g
>>>>>> this state.
> ... [ discussion of issues with Joesph's patches applied]
>>
>> OK. I did more stress tests last night and today. I found it cause b=
y
>> the patch "ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag" an=
d
>> only impact the Tegra20 platform. The hot plug regression seems due =
to
>> this patch. After dropping this patch on top of v3.11-rc1, the Tegra=
20
>> can back to normal.
>>
>> And the hop plug and suspend stress test can pass on Tegra30/114 too=
=2E
>>
>> Can the other two patch series for Tegra114 to support CPU idle powe=
r
>> down mode and system suspend still moving forward, not be blocked by
>> this patch?
>>
>> Looks the CPUIDLE_FLAG_TIMER_STOP flag still cause some other issue =
for
>> hot plug on Tegra20, I will continue to check this. You can just dro=
p
>> this patch.
>=20
> OK, if I drop that patch, then everything on Tegra20 and Tegra30 seem=
s
> fine again.
>=20
> However, I've found some new and exciting issue on Tegra114!
>=20
> With unmodified v3.11-rc1, I can do the following without issue:
>=20
> * Unplug/replug CPUs, so that I had all combinations of CPU 1, 2, 3
> plugged/unpplugged (with CPU 0 always plugged).
>=20
> * Unplug/replug CPUs, so that I had all combinations of CPU 0, 1, 2, =
3
> plugged/unpplugged (with the obvious exception of never having all CP=
Us
> unplugged).
>=20
> However, if I try this with your Tegra114 cpuidle and suspend patches
> applied, I see the following issues:
>=20
> 1) If I boot, unplug CPU 0, then replug CPU 0, the system immediately
> hard-hangs.
>=20
> 2) If I run the hotplug test script, leaving CPU 0 always present, I
> sometimes see:
>=20
>> root@localhost:~# for i in `seq 1 50`; do echo ITERATION $i; ./cpuon=
line.py; done
>> ITERATION 1
>> echo 0 > /sys/devices/system/cpu/cpu2/online
>> [  458.910054] CPU2: shutdown
>> echo 0 > /sys/devices/system/cpu/cpu1/online
>> [  461.004371] CPU1: shutdown
>> echo 0 > /sys/devices/system/cpu/cpu3/online
>> [  463.027341] CPU3: shutdown
>> echo 1 > /sys/devices/system/cpu/cpu1/online
>> [  465.061412] CPU1: Booted secondary processor
>> echo 1 > /sys/devices/system/cpu/cpu2/online
>> [  467.095313] CPU2: Booted secondary processor
>> [  467.113243] ------------[ cut here ]------------
>> [  467.117948] WARNING: CPU: 2 PID: 0 at kernel/time/tick-broadcast.=
c:667 tick_broadcast_oneshot_control+0x19c/0x1c4()
>> [  467.128352] Modules linked in:
>> [  467.131455] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 3.11.0-rc1-=
00022-g7487363-dirty #49
>> [  467.139678] [<c0015620>] (unwind_backtrace+0x0/0xf8) from [<c0011=
54c>] (show_stack+0x10/0x14)
>> [  467.148228] [<c001154c>] (show_stack+0x10/0x14) from [<c05135a8>]=
 (dump_stack+0x80/0xc4)
>> [  467.156336] [<c05135a8>] (dump_stack+0x80/0xc4) from [<c0024590>]=
 (warn_slowpath_common+0x64/0x88)
>> [  467.165300] [<c0024590>] (warn_slowpath_common+0x64/0x88) from [<=
c00245d0>] (warn_slowpath_null+0x1c/0x24)
>> [  467.174959] [<c00245d0>] (warn_slowpath_null+0x1c/0x24) from [<c0=
0695e4>] (tick_broadcast_oneshot_control+0x19c/0x1c4)
>> [  467.185659] [<c00695e4>] (tick_broadcast_oneshot_control+0x19c/0x=
1c4) from [<c0067cdc>] (clockevents_notify+0x1b0/0x1dc)
>> [  467.196538] [<c0067cdc>] (clockevents_notify+0x1b0/0x1dc) from [<=
c034f348>] (cpuidle_idle_call+0x11c/0x168)
>> [  467.206292] [<c034f348>] (cpuidle_idle_call+0x11c/0x168) from [<c=
000f134>] (arch_cpu_idle+0x8/0x38)
>> [  467.215359] [<c000f134>] (arch_cpu_idle+0x8/0x38) from [<c0061038=
>] (cpu_startup_entry+0x60/0x134)
>> [  467.224325] [<c0061038>] (cpu_startup_entry+0x60/0x134) from [<80=
0083d8>] (0x800083d8)
>> [  467.232227] ---[ end trace ea579be22a00e7fb ]---
>> echo 0 > /sys/devices/system/cpu/cpu1/online
>> [  469.126682] CPU1: shutdown
>=20
> I have found no solution for (1) (although I didn't look hard!).
>=20
> (2) can be solved with the following (at least 50 iterations of my te=
st
> script worked with this patch applied):

Actually this warning is resulting from a bug in the tick broadcast cod=
e
and has been solved with commit:

https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?h=3Dti=
mers/urgent&id=3Dea8deb8dfa6b0e8d1b3d1051585706739b46656c

This patch has been merged in timers/urgent branch but still need to
merged with timers/core.

The patch below does not fix the warning but prevents the tick warning
to occur. Applying the patch above will fix your problem.


>> diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-=
tegra/cpuidle-tegra114.c
>> index 658b205..896408d 100644
>> --- a/arch/arm/mach-tegra/cpuidle-tegra114.c
>> +++ b/arch/arm/mach-tegra/cpuidle-tegra114.c
>> @@ -66,8 +66,7 @@ static struct cpuidle_driver tegra_idle_driver =3D=
 {
>>                         .exit_latency           =3D 500,
>>                         .target_residency       =3D 1000,
>>                         .power_usage            =3D 0,
>> -                       .flags                  =3D CPUIDLE_FLAG_TIM=
E_VALID |
>> -                                                 CPUIDLE_FLAG_TIMER=
_STOP,
>> +                       .flags                  =3D CPUIDLE_FLAG_TIM=
E_VALID,
>>                         .name                   =3D "powered-down",
>>                         .desc                   =3D "CPU power gated=
",
>>                 },
>=20
> Here's my test script for reference:
>=20
> #!/usr/bin/env python
>=20
> import multiprocessing
> import os
> import sys
> import time
>=20
> cpus =3D multiprocessing.cpu_count()
> if cpus =3D=3D 4:
>   socf =3D file('/sys/devices/soc0/soc_id')
>   soc =3D socf.readline().strip()
>   socf.close()
>   if True: #soc =3D=3D '48':
>     gc =3D (11, 9, 1, 3, 7, 5, 13, 15)
>   else:
>     gc =3D (14, 10, 11, 9, 8, 1, 3, 2, 6, 7, 5, 4, 12, 13, 15)
> elif cpus =3D=3D 2:
>   gc =3D (1, 3)
> else:
>   raise Exception("Invalid CPU count %d" % cpus)
>=20
> oldidx =3D len(gc) - 1
> oldmask =3D gc[oldidx]
>=20
> for newidx in range(len(gc)):
>   newmask =3D gc[newidx]
>   for cpu in range(cpus):
>     oldon =3D oldmask & (1 << cpu)
>     newon =3D newmask & (1 << cpu)
>     if oldon !=3D newon:
>       if newon:
>         newonval =3D 1
>       else:
>         newonval =3D 0
>       cmd =3D "echo %d > /sys/devices/system/cpu/cpu%d/online" \
> % (newonval, cpu)
>       print cmd
>       os.system(cmd)
>   time.sleep(2)
>   oldidx =3D newidx
>   oldmask =3D newmask
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

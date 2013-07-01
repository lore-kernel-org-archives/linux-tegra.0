From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 0/3] ARM: tegra114: cpuidle: add power down state
Date: Mon, 01 Jul 2013 11:38:53 -0600
Message-ID: <51D1BEAD.6060003@wwwdotorg.org>
References: <1372152242-16373-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372152242-16373-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/25/2013 03:23 AM, Joseph Lo wrote:
> This series introduce CPU core power down state for CPU idle. When CPU go
> into this state, it saves it's context and needs a proper configuration
> in flow controller to power gate the CPU when CPU runs into WFI
> instruction. And the CPU also needs to set the IRQ as CPU power down idle
> wake up event in flow controller.
> 
> To prevent race conditions and ensure proper interrupt routing on
> Cortex-A15 CPUs when they are power-gated, add a CPU PM notifier
> call-back to reprogram the GIC CPU interface on PM entry. The
> GIC CPU interface will be reset back to its normal state by
> the common GIC CPU PM exit callback when the CPU wakes up.
> 
> This series depends on the patch of "tick:  Fix
> tick_broadcast_pending_mask not cleared".

Joseph, I applied all 3 of your patches/series on top of next-20130701,
which does include dependency "tick:  Fix tick_broadcast_pending_mask
not cleared":

* ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
* This series
* ARM: tegra114: add support for system suspend

I find that at least on on Tegra114/Dalmore, CPU hotplug doesn't work
correctly.

If I unplug CPU0, I get an immediate system hang:

root@localhost:~# ./cpuonline.py
echo 0 > /sys/devices/system/cpu/cpu0/online
[   73.555696] IRQ73 no longer affine to CPU0
[   73.561965] CPU0: shutdown

If I adjust my script not to hotplug CPU0, I get a hang when plugging a
CPU back in:

root@localhost:~# ./cpuonline.py
echo 0 > /sys/devices/system/cpu/cpu2/online
[   87.141128] CPU2: shutdown
echo 0 > /sys/devices/system/cpu/cpu1/online
[   89.227597] CPU1: shutdown
echo 0 > /sys/devices/system/cpu/cpu3/online
[   91.253870] CPU3: shutdown
echo 1 > /sys/devices/system/cpu/cpu1/online

or simpler:

root@localhost:~# echo 0 > /sys/devices/system/cpu/cpu1/online
[   80.767825] CPU1: shutdown
root@localhost:~# echo 1 > /sys/devices/system/cpu/cpu1/online

Finally, if I boot afresh and enter system suspend, I see the system
suspend OK, but pressing the power button on either the board itself or
the attached PM342 debug board will not wake the system from sleep.

From: Josef <josef-TrqCv2wlXX9AfugRpC6u6w@public.gmane.org>
Subject: CPU clock frequency issues with T124/Jetson TK1 at boot time
Date: Wed, 24 Aug 2016 14:16:00 +0200 (CEST)
Message-ID: <2041954940.418947.1472040961045.JavaMail.open-xchange@app10.ox.hosteurope.de>
Reply-To: Josef <josef-TrqCv2wlXX9AfugRpC6u6w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

the CPU clock setup for the T124 on the Jetson K1 board seems to have some
problems while booting:

The clock-frequency parameter in the default device-tree config is missing:
[ 0.080472] /cpus/cpu@0 missing clock-frequency property
[ 0.085605] /cpus/cpu@1 missing clock-frequency property
[ 0.090963] /cpus/cpu@2 missing clock-frequency property
[ 0.096350] /cpus/cpu@3 missing clock-frequency property

But when you add it, the warning disappears, but the clock still seems not to be
set up correctly:

  cpus {
   cpu@0 {
    clock-frequency = <1938000000>;
   };
   cpu@1 {
    clock-frequency = <1938000000>;
   }
  ...

[ 7.035525] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 696000 KHz
[ 7.042895] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed
to: 714000 KHz

For me this looks like it is using the frequency set up by the u-boot boot
loader. This might also explain why the kernel currently needs about 8 seconds
to boot which seems to be way too much for a Cortex-A15 device.

https://storage.kernelci.org/lsk/lsk-v3.18-16.07-133-ge8aab86f8308/arm-tegra_defconfig/lab-baylibre-seattle/boot-tegra124-jetson-tk1.html

Thanks,
Josef

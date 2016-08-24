From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: CPU clock frequency issues with T124/Jetson TK1 at boot time
Date: Wed, 24 Aug 2016 21:35:56 +0200
Message-ID: <1472067356.2419.3.camel@lynxeye.de>
References: <2041954940.418947.1472040961045.JavaMail.open-xchange@app10.ox.hosteurope.de>
         <e524de76-c894-2167-9fe7-216c46b8f761@kapsi.fi>
         <2719469.oT0Rmx8vKt@hobbiton>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2719469.oT0Rmx8vKt@hobbiton>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josef Raschen <josef-TrqCv2wlXX9AfugRpC6u6w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 24.08.2016, 21:10 +0200 schrieb Josef Raschen:
> On Mittwoch, 24. August 2016 15:47:38 CEST Mikko Perttunen wrote:
> > 
> > Your log indicates you're running on kernel v3.18. Cpufreq for
> > Tegra124
> > is only implemented starting from v4.3, so you'd need to upgrade.
> The log I pointed to was not mine and it was the wrong one, sorry. I
> am 
> actually working with mainline 4.7. 
> 
> Here is a more recent one from kernelci.org showing the same
> behavior:
> 
> https://storage.kernelci.org/next/next-20160822/arm-tegra_defconfig/l
> ab-baylibre-seattle/boot-tegra124-jetson-tk1.html
> 
> The 12 seconds they need to boot to user space are caused by the NFS
> rootfs. I 
> am booting from eMMC and need about 8 seconds. From the hardware
> specification 
> I would expect this to be less than 2 seconds. 
> 
> > 
> > > 
> > > [ 7.035525] cpufreq: cpufreq_online: CPU0: Running at unlisted
> > > freq:
> > > 696000 KHz [ 7.042895] cpufreq: cpufreq_online: CPU0: Unlisted
> > > initial
> > > frequency changed to: 714000 KHz
> > > 
> > > For me this looks like it is using the frequency set up by the u-
> > > boot boot
> > > loader. This might also explain why the kernel currently needs
> > > about 8
> > > seconds to boot which seems to be way too much for a Cortex-A15
> > > device.
> > Yes, this is normal. The device boots up with the CPUs on the PLLX
> > clock
> > that runs at 696MHz. Later the cpufreq driver will switch to
> > another
> > clock (which, btw, does not have 696 MHz as an operating point so
> > you
> > will continue to see this message even on newer kernels.)
> Ok, so the code that sets the clock frequency according to the device
> tree 
> seems to be missing. To reduce the boot time of the T124, the easiest
> solution 
> might be to set the clock frequency to maximum in the boot loader and
> then set 
> up cpufreq to use the 'performance' governor?
> 
The bootloader is using 696MHz, as this is the only safe frequency for
all different versions of the Tegra124. If you want to run it at a
higher frequency, the bootloader would need to know a lot more about
the actual SKU it is running on. Probably not going to happen.

Also you might want to make sure that the long boot times aren't caused
by other things than low CPU clock speed. Especially using a serial
console, printing out all the boot messages may be where you are
loosing a lot more time.

Regards,
Lucas

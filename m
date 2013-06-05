From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra baseline test results for v3.10-rc1
Date: Wed, 05 Jun 2013 09:17:44 -0600
Message-ID: <51AF5698.5050106@wwwdotorg.org>
References: <alpine.DEB.2.02.1306050558430.13098@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1306050558430.13098-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/04/2013 11:59 PM, Paul Walmsley wrote:
> 
> Here are some basic Tegra test results for Linux v3.10-rc1.
> Logs and other details at:
> 
>     http://www.pwsan.com/tegra/testlogs/test_v3.10-rc1/20130518212204/

Cool. thanks for running these tests. It's very useful.

That URL is 404, although going up one directory manually lets me find
the logs.

I can access all the log files there, but can't download the zImage; I
get permission denied. I can download the .dtb file. Is this deliberate?

http://www.pwsan.com/tegra/testlogs/test_v3.10-rc1/20130519152115/build_z/tegra_defconfig/zImage

I'm curious what the difference is between the "t33beaver" and
"tegra30-beaver" path entries is, in the following URL:

http://www.pwsan.com/tegra/testlogs/test_v3.10-rc1/20130519152115/boot/t33beaver/tegra30-beaver/

It might be better to call this board just "tegra30-beaver" for
consistency with other upstream tools like cbootimage-configs and the
DTB filename.

In the boot logs, I see:

Tegra30 (Beaver) # setenv bootargs 'console=ttyS0,230400n8
lp0_vec=0x00002000@0x9C406000 video=tegrafb mem=1023M@2048M vmalloc=128M
noinitrd usbcore.old_scheme_first=1 core_edp_mv=1300 panel=lvds
tegraid=30.1.2.0.0 debug_uartport=lsport tegra_fbmem=4104K@0xFF900000
max_cpu_cur_ma=10000 root=/dev/mmcblk0p1 rw rootwait gpt'

Most of those options aren't necessary for the upstream kernel.
Unfortunately, our downstream kernel requires a bunch of crufty options,
but upstream doesn't. It might be worth minimizing the set of options
passed to upstream, so there's no possibility that those options ever do
anything; most won't since they're custom options no supported upstream,
but I wonder if e.g. mem, vmalloc, gpt might have negative effects even now.

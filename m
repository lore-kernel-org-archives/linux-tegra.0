From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Freeze on Colibri T20 about 5 minutes after boot (3.13-rc1)
Date: Mon, 02 Dec 2013 20:47:04 +0100
Message-ID: <24ee0eea02f6d60e8f67825061720004@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: r.sricharan-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Since updating to 3.13-rc1 I experience freezes on my Tegra based module
after 2-5 minutes after boot up. There is no stacktrace, the serial
console is dead as well as X turns black. 

I did a git bisect and could isolate the offending commit:
f52bb722547f43caeaecbcc62db9f3c3b80ead9b
ARM: mm: Correct virt_to_phys patching for 64 bit physical addresses

My main cross compile toolchain is Linaro gnueabihf 4.7 (2013.04). I
also tested with Linaro gnueabihf 4.8 (2013.11).

I use tegra_defconfig with CONFIG_ARM_PATCH_PHYS_VIRT enabled. The
module uses the Tegra T20 SoC featuring two A9 ARM cores and no NEON
extension. I use a Yocto based root filesystem. Let me now if I can help
with testing...

--
Stefan

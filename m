From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: HEADS UP: Requirements for using Tegra114 with upstream kernel
Date: Thu, 04 Apr 2013 13:26:36 -0600
Message-ID: <515DD3EC.80402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If you want to use the upstream Tegra114 support, there are a couple
things to be aware of, once the clock driver is merged (hopefully very
soon):

1)

You will need a bootloader that configures (and enables?) the TSC/ARM
architectural timers.

If you're using upstream U-Boot, a patch has been posted to do this:
http://patchwork.ozlabs.org/patch/233596/

(I haven't tested this yet since I use a downstream U-Boot that has USB
support. I hope to convert to upstream U-Boot very soon once USB support
is there...)

If you're using some other bootloader, see my internal copy of this
email, or ask the person you got the bootloader from!

2)

The kernel needs to enable the architectural timers. If it doesn't, the
system will hang during boot at some point.

To solve this, do one of:

a)

git remote add calxeda_kernel_linux
git://sources.calxeda.com/kernel/linux.git
git fetch calxeda_kernel_linux
git merge calxeda_kernel_linux/arm-timers

b)

Apply http://patchwork.ozlabs.org/patch/233415/

c)

git revert f7db706b132f11c79ae1d74b2382e0926cf31644

NOTE: Neither Tegra's for-next branch nor linux-next do any of these
yet; you'll need to manually do one of those steps. I hope linux-next
will include (a) very soon, and similarly I hope 3.10-rc1 will include
(a). However, this isn't entirely certain yet.

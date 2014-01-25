From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Fwd: mainline build: 15 warnings 1 failures (mainline/v3.13-5617-g3aacd62)
Date: Fri, 24 Jan 2014 19:51:15 -0700
Message-ID: <52E326A3.3070703@wwwdotorg.org>
References: <52e1e955.c1db440a.3b7c.38e6@mx.google.com> <CAOesGMgP2ny--8eKSuSQGz0j=yv36suvpUX-xcwTu2jePr01CQ@mail.gmail.com> <20140124104101.GA31943@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140124104101.GA31943-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/24/2014 03:41 AM, Thierry Reding wrote:
> On Thu, Jan 23, 2014 at 10:10:47PM -0800, Olof Johansson wrote:
>> Hmm, DRM build failures? I didn't see this pre-merge so
>> something recent has changed.
> 
> Indeed. This is caused by the interaction between two things. The
> root proble is that the prototypes for the DRM debugfs helpers are
> #ifdef'ed in the header file, but the Tegra DRM using them within
> IS_ENABLED() protected blocks of code and therefore expects at
> least prototypes to exist.
> 
> This used to work fine because tegra_defconfig enabled DEBUG_FS,
> but it seems like that was dropped in
> 0d8c67218cef8af259e4d12221434a1d7b0f3bbc (ARM: tegra:
> tegra_defconfig updates). I had assumed that it was being dropped
> from the defconfig because something else selected it, but that is
> apparently not what happened.

Sometime after 3.13-rc1 came out, I checked it out and did the
following to update tegra_defconfig:

make tegra_defconfig; make savedefconfig; \
	mv defconfig arch/arm/configs/tegra_defconfig

This removed CONFIG_DEBUG_FS=y from tegra_defconfig, because
drivers/clk/Kconfig contained:

> config COMMON_CLK_DEBUG bool "DebugFS representation of clock
> tree" select DEBUG_FS

... and tegra_defconfig contains CONFIG_COMMON_CLK_DEBUG=y.

However, sometime during 3.14 development, that Kconfig variable was
deleted, and instead drivers/clk/clk.c now builds its debugfs code
conditionally upon CONFIG_DEBUG_FS directly. Hence, CONFIG_DEBUG_FS no
longer gets selected.

I guess the best thing is to rebuild tegra_defconfig to add back
CONFIG_DEBUG_FS and remove the non non-existant
CONFIG_COMMON_CLK_DEBUG. I'll check for any other unexpected changes
relative to 3.13 too.

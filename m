From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: paz00: Add LVDS support to device tree
Date: Fri, 27 Dec 2013 00:18:30 +0100
Message-ID: <4478357.8zXrzzag7Z@ax5200p>
References: <f03a644deb858f10affb7b039f9982bac81b02c9.1387656959.git.marvin24@gmx.de> <1519363.agF5fhqzYs@ax5200p> <12640298.egJ6YnqTYx@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <12640298.egJ6YnqTYx@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 26 December 2013 14:52:10 Marc Dietrich wrote:
> On Saturday 21 December 2013 23:11:58 Marc Dietrich wrote:
> > Sorry, Stephen, I mistyped your email address in the first post.
> > 
> > On Saturday 21 December 2013 21:38:13 Marc Dietrich wrote:
> > > Add backlight and panel nodes for the PAZ00 TFT LCD panel.
> > > 
> > > Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> > > ---
> > > This should enable everything needed. Unfortunately, in my tests it only
> > > switches on the backlight, but the display controller blocks in some
> > > infinit loop, so we get no output (and no working system). I post it
> > > here
> > > in case I missed something obvious...
> 
> Some users reported that it works when using uboot (yeah, shame on me that I
> still use fastboot on my dev machine), so I did a bit more research. It
> indeed works when using uboot, even when the display setup is disabled
> there. So my guess is that maybe some clock isn't setup by fastboot which
> is done by uboot.

ok, to bring this self-conversation to an end, the cpu blocks at a memory 
barrier right after 
	value = tegra_dc_readl(rgb->dc, DC_CMD_DISPLAY_COMMAND);
in tegra_output_rgb_disable (rgb.c).

From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 08/11] ARM: tegra: Switch to new pinctrl driver
Date: Wed, 4 Apr 2012 11:49:49 -0700
Message-ID: <20120404184949.GA30926@quad.lixom.net>
References: <1333148404-17691-1-git-send-email-swarren@wwwdotorg.org>
 <1333148404-17691-9-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333148404-17691-9-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 30, 2012 at 05:00:01PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> * Rename old pinmux and new pinctrl platform driver and DT match table
>   entries, so the new driver gets instantiated.
> * Re-write board-pinmux.c, so that it uses pinctrl APIs to configura the
>   pinmux.
> * Re-write board-*-pinmux.c so that the pinmux configuration tables are
>   in pinctrl format.
> 
> Ventana's pin mux table needed some edits on top of the basic format
> conversion, since some mux options that were previously marked as
> reserved are now valid in the new pinctrl driver. Attempting to use the
> old reserved names will result in a failure. Specifically, groups lpw0,
> lpw2, lsc1, lsck, and lsda were changed from function rsvd4 to displaya,
> and group pta was changed from function rsvd2 to hdmi.
> 
> All boards' pin mux tables needed some edits on top of the based format
> conversion, since function i2c was split into i2c1 (first general I2C
> controller) and i2cp (power I2C controller) to better align function
> definitions with HW blocks.
> 
> Due to the split of mux tables into pure mux and pull/tristate tables,
> many entries in the separate Seaboard/Ventana tables could be merged
> into the common table, since the entries differed only in the portion
> in one of the tables, not both.
> 
> Most pin groups allow configuration of mux, tri-state, and pull. However,
> some don't allow pull configuration, which is instead configured by new
> groups that only allow pull configuration. This is a reflection of the
> true HW capabilities, which weren't fully represented by the old pinmux
> driver. This required adding new pull table entries for those new groups,
> and setting many other entries' pull configuration to
> TEGRA_PINCONFIG_DONT_SET.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is falling into place quite nicely!

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>


-Olof

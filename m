From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 00/11] ARM: tegra: GPIO and pinmux-related changes
Date: Wed, 4 Apr 2012 12:16:01 -0700
Message-ID: <20120404191601.GD10603@quad.lixom.net>
References: <1333148404-17691-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333148404-17691-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 30, 2012 at 04:59:53PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This series:
> * Updates the Tegra GPIO driver to interact with pinctrl per the recent
>   gpio.txt documentation changes. Consequently, there's no need for
>   tegra_gpio_enable() any more, and no need for board-pinmux.c to do
>   anything GPIO-related.
> * Switches to the new Tegra pinctrl driver, and deletes the old one.
> * Moves pinctrl configuration to the device tree when booted using DT, so
>   that board-dt-tegra*.c no longer depend on anything in board*.[ch].
> 
> Note to self: This series relies upon DT support in pinctrl, which
> should be merged in 3.5.

Tested in both legacy and DT boots of seaboard. This is looking great.

As I mentioned in the last patch, I wish the device tree format wasn't quite
this verbose, but it's still a step forward so I'm not too concerned.

>  30 files changed, 1887 insertions(+), 3224 deletions(-)

Woohoo!

We're immimently close to getting rid of board files now.


-Olof

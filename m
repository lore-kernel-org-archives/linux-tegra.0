From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] pinctrl: as3722: fix handling of GPIO invert bit
Date: Tue, 22 Apr 2014 17:05:07 +0200
Message-ID: <CACRpkdbLymoBxJrqdfpHLHDP9ytohqhhd1bdXevKnVS1mVPoNA@mail.gmail.com>
References: <1397611505-17917-1-git-send-email-abrestic@chromium.org>
	<1397680817-28470-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397680817-28470-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 16, 2014 at 10:40 PM, Andrew Bresticker
<abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:

> The AS3722_GPIO_INV bit will always be blindly overwritten by
> as3722_pinctrl_gpio_set_direction() and will be ignored when
> setting the value of the GPIO in as3722_gpio_set() since the
> enable_gpio_invert flag is never set.  This will cause an
> initially inverted GPIO to toggle when requested as an output,
> which could be problematic if, for example, the GPIO controls
> a critical regulator.
>
> Instead of setting up the enable_gpio_invert flag, just leave
> the invert bit alone and check it before setting the GPIO value.
>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.14+
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from v1:
>  - fixed typo

This v2 version applied for fixes with Laxman's ACK.

Yours,
Linus Walleij

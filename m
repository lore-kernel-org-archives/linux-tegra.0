From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/3] pinctrl: add a driver for NVIDIA Tegra
Date: Fri, 9 Dec 2011 15:01:04 +0100
Message-ID: <CACRpkdYDn0V7SeQuFiFDMxGkybvg6PGf7jxid8ECGB7Azkj3zw@mail.gmail.com>
References: <1323382390-14892-1-git-send-email-swarren@nvidia.com>
	<1323382390-14892-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323382390-14892-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 8, 2011 at 11:13 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> This adds a driver for the Tegra pinmux, and required parameterization
> data for Tegra20 and Tegra30.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is looking good from a framework point of view (obviously,
since you've designed the framework with me you sure know what
you're doing).

What we could worry about is the amount of hard-coded chip data
which sort of correlates with the discussion with Tony on how to
provide DT info for pin control drivers.

If say this same controller appear in Tegra 4 with no changes but
different pin names, it makes sense to try to push this into the
DT as soon as possible, so as to avoid the situation Tony is
having with the OMAP muxes. If Tegra 4 will be all-new and not even
related, it doesn't.

So, just think a bit about it.

It will fit way better here than any place under
arch/arm/* in any case, so it's a great achievement!

Yours,
Linus Walleij

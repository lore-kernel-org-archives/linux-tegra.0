From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: refactor probe handling
Date: Fri, 13 Apr 2012 14:41:16 +0200
Message-ID: <CACRpkdZQneBCOGp8oL2O4+J0OnOeW7NUHt2Eo7sKqQ_4jSGKLg@mail.gmail.com>
References: <1334170839-10396-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334170839-10396-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 11, 2012 at 9:00 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Rather than having a single tegra-pinctrl driver that determines whether
> it's running on Tegra20 or Tegra30, instead have separate drivers for
> each that call into utility functions to implement the majority of the
> driver. This change is based on review feedback of the SPEAr pinctrl
> driver, which had originally copied to Tegra driver structure.
>
> This requires that the two drivers have unique names. Update a couple
> spots in arch/arm/mach-tegra for the name change.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Linus, It'll be easiest for me to merge this through the Tegra tree, since
> the arch/arm changes depend on the patches there that switch to using the
> pinctrl driver. If you could ack this, it'd be great. Thanks.

Sure,
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] pinctrl: tegra: consistency cleanup
Date: Wed, 12 Mar 2014 15:28:38 +0100
Message-ID: <CACRpkdbiP-jcuwVu4PeEDwhwjsOKTkOxQ2cQ5ZCv8GBH4OFFUg@mail.gmail.com>
References: <1394220137-16351-1-git-send-email-swarren@wwwdotorg.org>
	<1394220137-16351-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394220137-16351-4-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 7, 2014 at 8:22 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Fix Tegra30/114/124 pinmux drivers consistency issues.
> * Sort all lists of the same object type (e.g. #defines for pins, and
>   the array that defines their names) in the same order.
> * Whitespace fixes.
> * Consistency in layout between the 3 drivers.
>
> These driver files were also auto-generated, which should allow us to
> make e.g. the U-Boot drivers completely consistent with the kernel in
> the future:-)
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Umm yeah I trust you on this, patch applied.

Yours,
Linus Walleij

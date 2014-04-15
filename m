From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] pinctrl: tegra: remove fsafe from data tables
Date: Tue, 15 Apr 2014 18:00:50 +0530
Message-ID: <534D267A.4030708@nvidia.com>
References: <1397511222-28533-1-git-send-email-swarren@wwwdotorg.org> <1397511222-28533-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397511222-28533-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 15 April 2014 03:03 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The fsafe value in the pingroup data tables is only used to implement
> tegra_pinctrl_disable(). The only reason this function is called is when
> dynamically switching between pinmux states, i.e. when disabling the old
> state before programming the new state. It's simpler to have the new
> target state define the expected value of each pin (and all current DTs
> do that). This also gives more flexibility, since it allows individual
> boards explicit control over the "inactive" mux function for each pin,
> rather than requiring it to be an SoC-specific value. Assuming this, we
> can get rid of the fsafe value from the driver completely, thus saving
> some more space in the driver tables.
>
> While re-writing the content of tegra124_pingroups[], fix the indentation
> to use a TAB instead of spaces.
>

Looks good to me.
Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

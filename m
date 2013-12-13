From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: fix pinctrl misconfiguration on Venic2
Date: Fri, 13 Dec 2013 11:55:52 +0530
Message-ID: <52AAA870.4090609@nvidia.com>
References: <1386886322-2700-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386886322-2700-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 13 December 2013 03:42 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Other boards use PULL_NONE for their debug UART pins, and without this
> change, the board doesn't accept any serial input.
>
> Don't set the I2S port pins to tristate mode, or no audio signal will
> be sent out.
>
> Fixes: 605ae5804385 ("ARM: tegra: add default pinctrl nodes for Venice2")
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: Added fix for I2S port.
>
> Laxman, can you please go through the whole pinctrl configuration for
> Venice2 and make sure it's correct. Perhaps the best approach would be
> to compare it against our downstream kernels for this board.
The patch is generated based on downstream ref platforms setting,
Let me again check with very similar board in dowsntream.

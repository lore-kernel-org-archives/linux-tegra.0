From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 RESEND] gpio: tegra: read output value when gpio is set
 in direction_out
Date: Sun, 18 Nov 2012 00:05:08 +0100
Message-ID: <CACRpkdZ9tkd8U-sQH4ysdZvLAROH25oXmBMJe2hU6g71pe5YsQ@mail.gmail.com>
References: <1353020646-14867-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353020646-14867-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 16, 2012 at 12:04 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Read the output value when gpio is set for the output mode for
> gpio_get_value(). Reading input value in direction out does not
> give correct value.
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V1:
> - Keep the if part implementation same the else part to have implementation
>   same kind.
>
> Not too old patchi but just resending in case of it is missed.
> Adding acked by Stephen as he acked this patch.

This patch was already applied in my tree... sorry
no clue why you haven't seen it?

Yours,
Linus Walleij

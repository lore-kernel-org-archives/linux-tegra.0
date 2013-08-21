From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/2] pinctrl: utils : add support to pass config type
 in generic util APIs
Date: Thu, 22 Aug 2013 00:28:46 +0200
Message-ID: <CACRpkdZjrd5xCcKTOMoYqnGVyfjKtN7NOpAw_Vp7XoJsqi_4oQ@mail.gmail.com>
References: <1377084218-13858-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377084218-13858-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 21, 2013 at 1:23 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Add support to pass the config type like GROUP or PIN when using
> the utils or generic pin configuration APIs. This will make the
> APIs more generic.
>
> Added additional inline APIs such that it can be use directly as
> callback for the pinctrl_ops.
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V1:
> - Remove separate implementation for pins and group for
>   pinctrl_utils_dt_free_map and improve this function
>   to support both i.e. PINS and GROUPs.

Patch applied with Stephen's tags.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: clear park bit for all pins
Date: Thu, 14 Apr 2016 14:02:12 +0200
Message-ID: <CACRpkdZYPhx_ma1RH7-HbW-ERg9jLO=5TdPo1-51T3MXypN=DQ@mail.gmail.com>
References: <1460065028-26169-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460065028-26169-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 7, 2016 at 11:37 PM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Parking bits might not be cleared by the bootloader properly (if for
> instance it doesn't use the device configured by that pin). Clear
> the park bits for all the pins during pinctrl probe.
>
> This is present on T210 platforms but not earlier ones, so for earlier
> generations, set parked_reg = -1 to disable.
>
> The park bit is used to prevent glitching when reprogramming pinctrl
> registers.
>
> Based on work by:
> Shravani Dingari <shravanid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Patch applied with Stephen's ACK.

Yours,
Linus Walleij

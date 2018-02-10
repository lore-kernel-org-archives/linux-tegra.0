From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: tegra: apalis-tk1: copyright period,
 spurious newlines
Date: Sat, 10 Feb 2018 08:07:58 +0100
Message-ID: <CAOFm3uH+aasUA9MrV+uXvHUT=fzS63PvC2fDfNo3q687dUQ_dw@mail.gmail.com>
References: <20180210013806.28496-1-marcel@ziswiler.com> <20180210013806.28496-6-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180210013806.28496-6-marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marcel,

On Sat, Feb 10, 2018 at 2:38 AM, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org> wrote:
> From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>
> Update the copyright period and get rid of some spurious newlines.
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>
> ---
>
>  arch/arm/boot/dts/tegra124-apalis-eval.dts |  6 ++----
>  arch/arm/boot/dts/tegra124-apalis.dtsi     | 11 +----------
>  2 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
> index f1010cefb993..a6ad759dddb4 100644
> --- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
> +++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright 2016 Toradex AG
> + * Copyright 2016-2018 Toradex AG
>   *
>   * This file is dual-licensed: you can use it either under the terms
>   * of the GPL or the X11 license, at your option. Note that this dual

Since you are fixing copyrights, would you consider also fixing the
license to use a proper SPDX Id instead?

It would be super gentle of you!

And you will get extra good karma point if you feel like doing the
same for every Toradex-copyrighted files ;)

The (still new and fresh) license documentation contributed by tglx
--the only real-time docu-mentalist-- is in:
Documentation/process/license-rules.rst

Thanks!
-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 2/2] pinctrl: tegra: add pinmux controller driver for Tegra124
Date: Thu, 12 Dec 2013 22:30:30 +0100
Message-ID: <CACRpkdbv8r68r5Lz19sqVq8g7Yk__DbjLgW9c6P6HGtWNj6M=Q@mail.gmail.com>
References: <1386659456-16887-1-git-send-email-ldewangan@nvidia.com>
	<1386659456-16887-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386659456-16887-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 10, 2013 at 8:10 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> From: Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This adds a driver for the Tegra124 pinmux, and required
> parameterization data for Tegra124.
>
> The driver uses the common Tegra pincontrol driver utility
> functions to implement the majority of the driver.
>
> This driver is not compatible with the earlier NVIDIA's SoCs,
> hence add new compatibile as "nvidia,tegra124-pinmux".
>
> Originally written by Ashwini Gguhe.
> Thierry:
>         - Cleanups in patches.
> ldewangan:
>         - Fix some entries for groups.
>         - Fix MUX enums and group sequence.
>
> Signed-off-by: Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> CC: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V1:
> - Lots of cleanups and fixes for string separator by Thierry.
> - Fixes for some of group entries.
> Changes from V2:
> - remove extra space.
> - Added Ack and Tested by: Stephen and cc to Thierry.

Applied this v3 version, thanks!

Yours,
Linus Walleij

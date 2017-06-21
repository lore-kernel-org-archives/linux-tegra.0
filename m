From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v3 3/6] ARM/arm64: dts: enable wakeup for cros-ec-spi devices
Date: Wed, 21 Jun 2017 12:45:22 +0200
Message-ID: <CAJKOXPdL2CB9VWNo=it0dos-4hJYrgHUSZwcG1DS=9c+YxXzhQ@mail.gmail.com>
References: <1498039313-24220-1-git-send-email-jeffy.chen@rock-chips.com> <1498039313-24220-4-git-send-email-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498039313-24220-4-git-send-email-jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 21, 2017 at 12:01 PM, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> We used to enable wakeup for cros-ec-spi devices unconditionally.
> Now we are using the more generic wakeup-source property to enable it.

Using wakeup-source property is still enabling this unconditionally.
What  do you exactly mean here?

>
> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>
> Changes in v3: None
>
>  arch/arm/boot/dts/exynos5420-peach-pit.dts      | 1 +
>  arch/arm/boot/dts/exynos5800-peach-pi.dts       | 1 +
>  arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 1 +
>  arch/arm/boot/dts/tegra124-nyan.dtsi            | 1 +
>  arch/arm/boot/dts/tegra124-venice2.dts          | 1 +
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts  | 1 +
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi    | 1 +
>  7 files changed, 7 insertions(+)

Please split it per arch (arm and arm64) and per machine. I'll take
exynos after splitting.

Best regards,
Krzysztof

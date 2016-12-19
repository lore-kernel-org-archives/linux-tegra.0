From: Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: mark panel regulator as enabled on boot
Date: Mon, 19 Dec 2016 23:20:48 +0300
Message-ID: <CANLc0-ZzB7COEwntY9ndODDtXBrZmeD_=u07+Ut2sQEhLi9+SQ@mail.gmail.com>
References: <1d6749b2aa21112cb73e162a73e9e0e36b32a677.1481273581.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1d6749b2aa21112cb73e162a73e9e0e36b32a677.1481273581.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-dWgojZr1M5Qdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Fri, Dec 9, 2016 at 12:20 PM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Current u-boot enables the display already. Fixes sporadic panel
> initialization failure with tegra_defconfig.
>
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---

Tested on 4.9.0, 4.8.13 and 4.4.39, display starts every time with this patch.
Thank you.

Tested-by: Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

>  arch/arm/boot/dts/tegra20-paz00.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
> index 4e361a8c167e..1be690cce9aa 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -570,6 +570,7 @@
>                         regulator-min-microvolt = <3300000>;
>                         regulator-max-microvolt = <3300000>;
>                         gpio = <&gpio TEGRA_GPIO(A, 4) GPIO_ACTIVE_HIGH>;
> +                       regulator-boot-on;
>                         enable-active-high;
>                 };
>         };
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards,
Misha Komarovskiy
zombahatgmaildotcom

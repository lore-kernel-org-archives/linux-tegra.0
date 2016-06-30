From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Add missing Smaug revision
Date: Thu, 30 Jun 2016 09:15:46 -0700
Message-ID: <CAL1qeaF+Zck_p_1d-cNMvoJ8oMn7c65wL21E6LjGVVMA3BY2yA@mail.gmail.com>
References: <20160629085229.31350-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160629085229.31350-1-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 29, 2016 at 1:52 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> The "google,smaug-rev2" string is missing from the compatible list of
> Smaug's DT. The differences of rev2 are not relevant at our current
> level of support and it boots just fine, so add it.
>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index 431266a48e9c..82a96bd27bc8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -11,7 +11,8 @@
>         compatible = "google,smaug-rev8", "google,smaug-rev7",
>                      "google,smaug-rev6", "google,smaug-rev5",
>                      "google,smaug-rev4", "google,smaug-rev3",
> -                    "google,smaug-rev1", "google,smaug", "nvidia,tegra210";
> +                    "google,smaug-rev2", "google,smaug-rev1",
> +                    "google,smaug", "nvidia,tegra210";
>
>         aliases {
>                 serial0 = &uarta;
> --
> 2.9.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

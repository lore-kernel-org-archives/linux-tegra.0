From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: dts: Kill off "simple-panel" compatibles
Date: Thu, 16 Apr 2020 16:02:58 -0500
Message-ID: <CAL_JsqLDsoJteGC6BRMFvPZ0pekOU71eUNQUqh74we_BB7RZ_g@mail.gmail.com>
References: <20200117230855.25567-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200117230855.25567-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 17, 2020 at 5:08 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> "simple-panel" is a Linux driver and has never been an accepted upstream
> compatible string, so remove it.
>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Ping. This never got picked up.

> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts         | 3 +--
>  arch/arm/boot/dts/tegra124-venice2.dts         | 2 +-
>  arch/arm/boot/dts/tegra20-colibri-eval-v3.dts  | 2 +-
>  arch/arm/boot/dts/tegra20-colibri-iris.dts     | 2 +-
>  arch/arm/boot/dts/tegra20-harmony.dts          | 2 +-
>  arch/arm/boot/dts/tegra20-medcom-wide.dts      | 2 +-
>  arch/arm/boot/dts/tegra20-paz00.dts            | 2 +-
>  arch/arm/boot/dts/tegra20-seaboard.dts         | 2 +-
>  arch/arm/boot/dts/tegra20-ventana.dts          | 2 +-
>  arch/arm/boot/dts/tegra30-apalis-eval.dts      | 2 +-
>  arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts | 2 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi          | 2 +-
>  arch/arm/boot/dts/tegra30-colibri-eval-v3.dts  | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 2 +-
>  14 files changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
> index 97a5c3504bbe..8e48792ecdc8 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -46,8 +46,7 @@
>                         avdd-dsi-csi-supply = <&avdd_1v2_reg>;
>
>                         panel@0 {
> -                               compatible = "panasonic,vvx10f004b00",
> -                                            "simple-panel";
> +                               compatible = "panasonic,vvx10f004b00";
>                                 reg = <0>;
>
>                                 power-supply = <&avdd_lcd_reg>;
> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
> index 7309393bfced..9004fb6dcede 100644
> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> @@ -1087,7 +1087,7 @@
>         };
>
>         panel: panel {
> -               compatible = "lg,lp129qe", "simple-panel";
> +               compatible = "lg,lp129qe";
>
>                 backlight = <&backlight>;
>                 ddc-i2c-bus = <&dpaux>;
> diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> index 3c0f2681fcde..37ad508b61d9 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> +++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> @@ -223,7 +223,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
> index d8004d68efa0..af4740847769 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
> +++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
> @@ -205,7 +205,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
> index 1d96d92b72a7..02cd67ea2503 100644
> --- a/arch/arm/boot/dts/tegra20-harmony.dts
> +++ b/arch/arm/boot/dts/tegra20-harmony.dts
> @@ -665,7 +665,7 @@
>         };
>
>         panel: panel {
> -               compatible = "auo,b101aw03", "simple-panel";
> +               compatible = "auo,b101aw03";
>
>                 power-supply = <&vdd_pnl_reg>;
>                 enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> index cda5448c2ace..c73510cd501c 100644
> --- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
> +++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> @@ -57,7 +57,7 @@
>         };
>
>         panel: panel {
> -               compatible = "innolux,n156bge-l21", "simple-panel";
> +               compatible = "innolux,n156bge-l21";
>
>                 power-supply =  <&vdd_1v8_reg>, <&vdd_3v3_reg>;
>                 enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
> index 85fce5bc72d6..0151cdd09ffb 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -558,7 +558,7 @@
>         };
>
>         panel: panel {
> -               compatible = "samsung,ltn101nt05", "simple-panel";
> +               compatible = "samsung,ltn101nt05";
>
>                 ddc-i2c-bus = <&lvds_ddc>;
>                 power-supply = <&vdd_pnl_reg>;
> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
> index f91441683aad..376ecb6435f4 100644
> --- a/arch/arm/boot/dts/tegra20-seaboard.dts
> +++ b/arch/arm/boot/dts/tegra20-seaboard.dts
> @@ -826,7 +826,7 @@
>         };
>
>         panel: panel {
> -               compatible = "chunghwa,claa101wa01a", "simple-panel";
> +               compatible = "chunghwa,claa101wa01a";
>
>                 power-supply = <&vdd_pnl_reg>;
>                 enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
> index f44551e2d9d0..022649119821 100644
> --- a/arch/arm/boot/dts/tegra20-ventana.dts
> +++ b/arch/arm/boot/dts/tegra20-ventana.dts
> @@ -611,7 +611,7 @@
>         };
>
>         panel: panel {
> -               compatible = "chunghwa,claa101wa01a", "simple-panel";
> +               compatible = "chunghwa,claa101wa01a";
>
>                 power-supply = <&vdd_pnl_reg>;
>                 enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
> index 749fc6d1ff70..b39c26806bf2 100644
> --- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
> +++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
> @@ -195,7 +195,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
> index 0be50e881684..e29dca92ba0a 100644
> --- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
> +++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
> @@ -196,7 +196,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> index 7ce61edd52f5..9048fdf4ad54 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
> +++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> @@ -432,7 +432,7 @@
>         };
>
>         panel: panel {
> -               compatible = "chunghwa,claa101wb01", "simple-panel";
> +               compatible = "chunghwa,claa101wb01";
>                 ddc-i2c-bus = <&panelddc>;
>
>                 power-supply = <&vdd_pnl1_reg>;
> diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
> index 5965150ecdd2..8e106e784dce 100644
> --- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
> +++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
> @@ -159,7 +159,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
> index a0385a386a3f..9f3206c63900 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
> @@ -990,7 +990,7 @@
>         };
>
>         panel: panel {
> -               compatible = "innolux,n116bge", "simple-panel";
> +               compatible = "innolux,n116bge";
>                 backlight = <&backlight>;
>                 ddc-i2c-bus = <&dpaux>;
>         };
> --
> 2.20.1
>

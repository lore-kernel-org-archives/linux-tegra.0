From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add driver to configure voltage and
 power of io pads
Date: Fri, 4 Nov 2016 23:24:46 +0100
Message-ID: <CACRpkdb4DQLzQWHxuZi=TDaeigNzVJV8TN1jsQfOHKF7yPLrUg@mail.gmail.com>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com> <1478077742-25437-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1478077742-25437-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 2, 2016 at 10:09 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> low power state of some of its IO pads. The IO pads can work in
> the voltage of the 1.8V and 3.3V of IO power rail sources. When IO
> interface are not used then IO pads can be configure in low power
> state to reduce the power from that IO pads.
>
> On Tegra124, the IO power rail source is auto detected by SoC and hence
> it is only require to configure in low power mode if IO pads are not
> used.
>
> On T210 onwards, the auto-detection is removed from SoC and hence SW
> must configure the PMC register explicitly to set proper voltage in
> IO pads based on IO rail power source voltage.
>
> This driver adds the IO pad driver to configure the power state and
> IO pad voltage based on the usage and power tree via pincontrol
> framework. The configuration can be static and dynamic.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Looking for an ACK from Stephen &| Thierry.

> ---
> On top of the branch from Thierry's T186 work
>         https://github.com/thierryreding/linux/tree/tegra186

But it's an orthogonal patch right?

The build robot seems to have problems with it so pls fix these.

> +static const struct pinconf_generic_params tegra_io_pads_cfg_params[] = {
> +       {
> +               .property = "nvidia,power-source-voltage",
> +               .param = TEGRA_IO_PAD_POWER_SOURCE_VOLTAGE,
> +       },
> +};

Why can you not use the standard power-source binding
from Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
instead of inventing this nvidia,* variant?

Yours,
Linus Walleij

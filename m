From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 4 Nov 2016 23:29:32 +0100
Message-ID: <CACRpkdZb4dQu431n4gUM=5TDmADpu7P9gE2v0AxokS_2bRSa1Q@mail.gmail.com>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com> <1478077742-25437-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478077742-25437-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
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
> Add DT binding document for detailing the DT properties for
> configuring IO pads voltage levels and its power state.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
(...)

> +-nvidia,power-source-voltage:  Integer. The voltage level of IO pads. The
> +                               valid values are 1.8V and 3.3V. Macros are
> +                               defined for these voltage levels in
> +                               <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
> +                               Use TEGRA_IO_PAD_POWER_SOURCE_1800000UV for 1.8V
> +                               Use TEGRA_IO_PAD_POWER_SOURCE_3300000UV for 3.3V
> +
> +                               All IO pads do not support the 1.8V/3.3V
> +                               configurations. Valid values for "pins" are
> +                               audio-hv, dmic, gpio, sdmmc1, sdmmc3, spi-hv.


As mentioned in another patch, what is wrong with the standard
power-source binding?

Yours,
Linus Walleij

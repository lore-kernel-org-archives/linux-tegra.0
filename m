From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Tue, 22 Nov 2016 13:58:32 +0100
Message-ID: <CACRpkdZK34QfbSBJvshfZekk5TJBU5sZog-9uszLSmFPOGJgiw@mail.gmail.com>
References: <1479810013-29894-1-git-send-email-ldewangan@nvidia.com> <1479810013-29894-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479810013-29894-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 22, 2016 at 11:20 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> low power state of some of its IO pads. The IO pads can work in
> the voltage of the 1.8V and 3.3V of IO voltage from IO power rail
> sources. When IO interfaces are not used then IO pads can be
> configure in low power state to reduce the power consumption from
> that IO pads.
>
> On Tegra124, the voltage level of IO power rail source is auto
> detected by hardware(SoC) and hence it is only require to configure
> in low power mode if IO pads are not used.
>
> On T210 onwards, the auto-detection of voltage level from IO power
> rail is removed from SoC and hence SW need to configure the PMC
> register explicitly to set proper voltage in IO pads based on
> IO rail power source voltage.
>
> This driver adds the IO pad driver to configure the power state and
> IO pad voltage based on the usage and power tree via pincontrol
> framework. The configuration can be static and dynamic.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Overall very nice!

> +               rinfo->regulator = devm_regulator_get_optional(dev,
> +                                               soc_data->cfg[i].vsupply);

Please just use devm_regulator_get().

As has been discussed at lenth elsewhere "optional" in regulator_get_optional
does *not* mean "software optional", it means "hardware optional".

Such as a terminal that may have a voltage connected or not be
connected to anything at all.

If the system does not define a regulator you will anyway get a
dummy regulator.

Yours,
Linus Walleij

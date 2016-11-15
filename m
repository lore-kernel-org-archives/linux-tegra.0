From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Tue, 15 Nov 2016 09:59:11 +0100
Message-ID: <CACRpkdb=mw46NNuqagzX9xas1FZuE37H3m8t3jRRfg7ThzN5vA@mail.gmail.com>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com> <1478696782-11657-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478696782-11657-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 9, 2016 at 2:06 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

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
>
> ---
> Changes from V1:
> - Dropped the custom properties to set pad voltage and use regulator.
> - Added support for regulator to get vottage in boot and configure IO
>   pad voltage.
> - Add support for callback to handle regulator notification and configure
>   IO pad voltage based on voltage change.

I'm waiting for maintainer review on this.
Stephen/Thierry?

Yours,
Linus Walleij

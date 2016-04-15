From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Fri, 15 Apr 2016 10:08:53 +0200
Message-ID: <CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
	<1460473007-11535-8-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460473007-11535-8-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 12, 2016 at 4:56 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
> or 3.3V I/O voltage levels. Also the IO pads can be configured
> for power down state if it is not used. SW needs to configure the
> voltage level of IO pads based on IO rail voltage and its power
> state based on platform usage.
>
> The voltage and power state configurations of pads are provided
> through pin control frameworks. Add pin control driver for Tegra's
> IO pads' voltage and power state configurations.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

(...)
> +config PINCTRL_TEGRA210_IO_PAD

Why does this need its own Kconfig option?
Can't you just unconditionally compile it in if
PINCTRL_TEGRA210 is selected, you seem to say
it is there on all these platforms anyway.

> +static const struct pinconf_generic_params tegra_io_pads_cfg_params[] = {
> +       {
> +               .property = "nvidia,io-rail-voltage",
> +               .param = TEGRA_IO_RAIL_VOLTAGE,
> +       }, {

What's so nvidia-specific about this?
We have power-source in
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
which takes a custom argument. This is obviously what you
are doing (selecting one of two rails), so use that binding.

> +               .property = "nvidia,io-pad-deep-power-down",
> +               .param = TEGRA_IO_PAD_DEEP_POWER_DOWN,
> +       },

Likewise the generic bindings have low-power-enable and
low-power-disable, this seems like a copy of low-power-enable;
Even if it needs a new binding, it doesn't seem very nVidia-specific
so then propose something to the generic bindings.

Even if Tegra is not using the generic code for handling the
standard bindings (GENERIC_PINCONF) it doesn't stop
you from using the generic bindings and contributing to them.

Historically you have a few custom bindings like these:

nvidia,pins
nvidia,function
nvidia,pull
nvidia,tristate

etc etc, but that is just unfortunate and due to preceding the
generic bindings. I would appreciate if you started to support
the generic bindings in parallel, but I'm not gonna push that issue.
However for *new* stuff, I don't want the custom bindings
to proliferate. Use the generic stuff, I'm trying to keep the weirdness
in one place, and the generic stuff is needed for standardization
across platforms going forward.

Yours,
Linus Walleij

From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] dt-bindings: thermal: Get rid of thermal.txt and replace references
Date: Wed, 24 Jun 2020 16:27:00 +0530
Message-ID: <CAHLCerM7hwKS=jNtMLnoCXr6z9ckOo1879e-MR-BnOC0JO=adA@mail.gmail.com>
References: <cbd70c2f0f5ddae0d8e418fcb1e03101e408f6c2.1585753313.git.amit.kucheria@linaro.org>
 <20200414164357.GA11178@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <20200414164357.GA11178@bogus>
Sender: linux-hwmon-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Talel Shenhar <talel@amazon.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, maintainer:BROADCOM STB AVS TMON
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 14, 2020 at 10:14 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed,  1 Apr 2020 20:35:50 +0530, Amit Kucheria wrote:
> > Now that we have yaml bindings for the thermal subsystem, get rid of the
> > old bindings (thermal.txt).
> >
> > Replace all references to thermal.txt in the Documentation with a link
> > to the appropriate YAML bindings using the following search and replace
> > pattern:
> >  - If the reference is specific to the thermal-sensor-cells property,
> >  replace with a pointer to thermal-sensor.yaml
> >  - If the reference is to the cooling-cells property, replace with a
> >  pointer to thermal-cooling-devices.yaml
> >  - If the reference is generic thermal bindings, replace with a
> >  reference to thermal*.yaml.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  .../devicetree/bindings/arm/arm,scmi.txt      |   2 +-
> >  .../devicetree/bindings/arm/arm,scpi.txt      |   2 +-
> >  .../arm/marvell/ap80x-system-controller.txt   |   2 +-
> >  .../arm/marvell/cp110-system-controller.txt   |   2 +-
> >  .../bindings/cpufreq/cpufreq-dt.txt           |   3 +-
> >  .../bindings/cpufreq/cpufreq-mediatek.txt     |   4 +-
> >  .../devicetree/bindings/hwmon/gpio-fan.txt    |   3 +-
> >  .../devicetree/bindings/hwmon/lm90.txt        |   4 +-
> >  .../thermal/allwinner,sun8i-a83t-ths.yaml     |   2 +-
> >  .../bindings/thermal/amazon,al-thermal.txt    |   2 +-
> >  .../bindings/thermal/brcm,avs-ro-thermal.yaml |   2 +-
> >  .../bindings/thermal/brcm,bcm2835-thermal.txt |   2 +-
> >  .../bindings/thermal/hisilicon-thermal.txt    |   2 +-
> >  .../bindings/thermal/max77620_thermal.txt     |   6 +-
> >  .../bindings/thermal/mediatek-thermal.txt     |   2 +-
> >  .../thermal/nvidia,tegra124-soctherm.txt      |  10 +-
> >  .../thermal/nvidia,tegra186-bpmp-thermal.txt  |   2 +-
> >  .../bindings/thermal/qcom-spmi-temp-alarm.txt |   2 +-
> >  .../bindings/thermal/rockchip-thermal.txt     |   2 +-
> >  .../bindings/thermal/tango-thermal.txt        |   2 +-
> >  .../bindings/thermal/thermal-generic-adc.txt  |   2 +-
> >  .../devicetree/bindings/thermal/thermal.txt   | 586 ------------------
> >  .../bindings/thermal/uniphier-thermal.txt     |   2 +-
> >  23 files changed, 33 insertions(+), 615 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/thermal/thermal.txt
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Daniel, Rob,

This seems to have been missed in the 5.8 merge window. I suspect this
should go in through the thermal tree.

Regards,
Amit

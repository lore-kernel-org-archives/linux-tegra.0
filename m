From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/4] mfd: max77620: add documentation for backup
 battery charging
Date: Mon, 18 Feb 2019 12:06:12 -0600
Message-ID: <CAL_JsqKiL8A+SBwqLzYa9djWBT1S+2kxUUB4iuKWX7EoqXouCw@mail.gmail.com>
References: <20190212064353.7451-1-markz@nvidia.com> <20190212064353.7451-3-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212064353.7451-3-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <markz@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 12, 2019 at 12:44 AM Mark Zhang <markz@nvidia.com> wrote:
>
> Adding documentation for 3 new backup battery charging dts
> properties:
> - maxim,charging-current-microamp
> - maxim,charging-voltage-microvolt
> - maxim,output-resister-ohms

What's the difference between the 77620 and 77650 as there's patches
on the list for the 77650 too. The properties are similar, but seems
to be main vs. backup battery charger. We should have common
properties for this.

> Signed-off-by: Mark Zhang <markz@nvidia.com>
> ---
>  .../devicetree/bindings/mfd/max77620.txt      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> index 9c16d51cc15b..88825eaf2567 100644
> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> @@ -122,6 +122,26 @@ For DT binding details of different sub modules like GPIO, pincontrol,
>  regulator, power, please refer respective device-tree binding document
>  under their respective sub-system directories.
>
> +Backup Battery:
> +==============
> +This sub-node configure charging backup battery of the device. Device has
> +support of charging the backup battery. The subnode name is "backup-battery".
> +The property for backup-battery child nodes as:
> +Presence of this child node will enable the backup battery charging.
> +
> +Optional properties:
> +       -maxim,charging-current-microamp: Charging current setting.
> +                       The device supports 50/100/200/400/600/800uA.
> +                       If this property is unavailable then it will
> +                       charge with 50uA.
> +       -maxim,charging-voltage-microvolt: Charging Voltage Limit Setting.
> +                       Device supports 2500000/3000000/3300000/350000uV.
> +                       Default will be set to 2500mV. The voltage will be roundoff
> +                       to nearest lower side if other than above is configured.
> +       -maxim,output-resister-ohms: Output resistor on Ohm.
> +                       Device supports 100/1000/3000/6000 Ohms.
> +                       Default will be set to 1000 Ohm.
> +
>  Example:
>  --------
>  #include <dt-bindings/mfd/max77620.h>
> --
> 2.19.2
>

From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v3 10/16] usb: phy: tegra: Use device-tree notion of
 reset-GPIO's active-state
Date: Fri, 3 Jan 2020 08:58:04 +0100
Message-ID: <20200103075803.GC14228@qmqm.qmqm.pl>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-11-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191228203358.23490-11-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Dec 28, 2019 at 11:33:52PM +0300, Dmitry Osipenko wrote:
[...]
>  static int ulpi_open(struct tegra_usb_phy *phy)
>  {
> -	int err;
> -
> -	err = gpio_direction_output(phy->reset_gpio, 0);
> -	if (err) {
> -		dev_err(phy->u_phy.dev,
> -			"ULPI reset GPIO %d direction not deasserted: %d\n",
> -			phy->reset_gpio, err);
> -		return err;
> -	}
> +	gpiod_set_value_cansleep(phy->reset_gpio, 1);
>  
>  	return 0;
>  }

The message now removed seems inverted to the meaning of the code. Is
this a bug, or the reset really should be asserted here? I can see that
it is deasserted in phy_power_up, but that goes before or after ulpi_open()?
After the change below, the reset is asserted at probe() time now.

[...]
> -		err = devm_gpio_request(&pdev->dev, tegra_phy->reset_gpio,
> -					"ulpi_phy_reset_b");
> +		gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> +						    "nvidia,phy-reset-gpio",
> +						    0, GPIOD_OUT_HIGH,
> +						    "ulpi_phy_reset_b");
> +		err = PTR_ERR_OR_ZERO(gpiod);
>  		if (err) {
> -			dev_err(&pdev->dev, "Request failed for GPIO %d: %d\n",
> -				tegra_phy->reset_gpio, err);
> +			dev_err(&pdev->dev,
> +				"Request failed for reset GPIO: %d\n", err);
>  			return err;
>  		}
> +		tegra_phy->reset_gpio = gpiod;

A nice extension to kernel's printf - "%pe" format - has just landed in
Linus' master tree.

Best Regards,
Micha³ Miros³aw

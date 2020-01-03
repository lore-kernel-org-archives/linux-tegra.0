From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 10/16] usb: phy: tegra: Use device-tree notion of
 reset-GPIO's active-state
Date: Sat, 4 Jan 2020 02:53:24 +0300
Message-ID: <42f1d6c9-99f2-b829-0d2c-649fcdfb156d@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-11-digetx@gmail.com>
 <20200103075803.GC14228@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200103075803.GC14228@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

03.01.2020 10:58, Michał Mirosław пишет:
> On Sat, Dec 28, 2019 at 11:33:52PM +0300, Dmitry Osipenko wrote:
> [...]
>>  static int ulpi_open(struct tegra_usb_phy *phy)
>>  {
>> -	int err;
>> -
>> -	err = gpio_direction_output(phy->reset_gpio, 0);
>> -	if (err) {
>> -		dev_err(phy->u_phy.dev,
>> -			"ULPI reset GPIO %d direction not deasserted: %d\n",
>> -			phy->reset_gpio, err);
>> -		return err;
>> -	}
>> +	gpiod_set_value_cansleep(phy->reset_gpio, 1);
>>  
>>  	return 0;
>>  }
> 
> The message now removed seems inverted to the meaning of the code. Is
> this a bug, or the reset really should be asserted here?

The removed message was added in patch #2 and indeed it should say
"asserted". Good catch, thanks!

> I can see that
> it is deasserted in phy_power_up, but that goes before or after ulpi_open()?

The ulpi_phy_power_on happens after the ulpi_open, please take a look at
tegra_usb_phy_init().

> After the change below, the reset is asserted at probe() time now.

Yes, the probe now asserts the reset. It is an intended change because
it should be a bit better to explicitly per-initialize the GPIO state to
an expected state during of the GPIO retrieval, like most of other
drivers do and which should be a "generic/common way".

Actually, the reset assertion of ulpi_open() could be removed safely now
since it doesn't do anything useful, given that probe asserts the reset.

> [...]
>> -		err = devm_gpio_request(&pdev->dev, tegra_phy->reset_gpio,
>> -					"ulpi_phy_reset_b");
>> +		gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
>> +						    "nvidia,phy-reset-gpio",
>> +						    0, GPIOD_OUT_HIGH,
>> +						    "ulpi_phy_reset_b");
>> +		err = PTR_ERR_OR_ZERO(gpiod);
>>  		if (err) {
>> -			dev_err(&pdev->dev, "Request failed for GPIO %d: %d\n",
>> -				tegra_phy->reset_gpio, err);
>> +			dev_err(&pdev->dev,
>> +				"Request failed for reset GPIO: %d\n", err);
>>  			return err;
>>  		}
>> +		tegra_phy->reset_gpio = gpiod;
> 
> A nice extension to kernel's printf - "%pe" format - has just landed in
> Linus' master tree.

Thank you very much, I didn't know about that.

I'll prepare v4 with the above things addressed, thank you again and
please let me know if you'll spot anything else!

From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 10/16] usb: phy: tegra: Use device-tree notion of
 reset-GPIO's active-state
Date: Sun, 5 Jan 2020 03:58:39 +0300
Message-ID: <9fd12e5f-00c0-0292-b8a1-3fad48bfc4a3@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-11-digetx@gmail.com>
 <20200103075803.GC14228@qmqm.qmqm.pl>
 <42f1d6c9-99f2-b829-0d2c-649fcdfb156d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <42f1d6c9-99f2-b829-0d2c-649fcdfb156d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.01.2020 02:53, Dmitry Osipenko пишет:
> 03.01.2020 10:58, Michał Mirosław пишет:
[snip]
>> [...]
>>> -		err = devm_gpio_request(&pdev->dev, tegra_phy->reset_gpio,
>>> -					"ulpi_phy_reset_b");
>>> +		gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
>>> +						    "nvidia,phy-reset-gpio",
>>> +						    0, GPIOD_OUT_HIGH,
>>> +						    "ulpi_phy_reset_b");
>>> +		err = PTR_ERR_OR_ZERO(gpiod);
>>>  		if (err) {
>>> -			dev_err(&pdev->dev, "Request failed for GPIO %d: %d\n",
>>> -				tegra_phy->reset_gpio, err);
>>> +			dev_err(&pdev->dev,
>>> +				"Request failed for reset GPIO: %d\n", err);
>>>  			return err;
>>>  		}
>>> +		tegra_phy->reset_gpio = gpiod;
>>
>> A nice extension to kernel's printf - "%pe" format - has just landed in
>> Linus' master tree.
> 
> Thank you very much, I didn't know about that.

In this particular case PTR_ERR_OR_ZERO() results in a bit more cleaner
code than with IS_ERR() and PTR_ERR() [IMHO], so I'll probably keep it
as-is. Anyways, thanks again for the pointer to "%pe", it could come
handy later on.

From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: Hook up init/shutdown callbacks
Date: Thu, 19 Dec 2019 18:24:54 +0300
Message-ID: <d10ca21c-3918-3f2c-f279-c0ce9f37aca5@gmail.com>
References: <20191218175313.16235-1-digetx@gmail.com>
 <20191218175313.16235-3-digetx@gmail.com>
 <20191219065619.GA19921@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191219065619.GA19921@b29397-desktop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

19.12.2019 09:56, Peter Chen пишет:
> On 19-12-18 20:53:11, Dmitry Osipenko wrote:
>> Generic PHY provides init/shutdown callbacks which allow USB-host drivers
>> to abstract PHY's hardware management in a common way. This change allows
>> to remove Tegra-specific PHY handling from the ChipIdea driver.
>>
>> Note that ChipIdea's driver shall be changed at the same time because it
>> turns PHY ON without the PHY's initialization and this doesn't work now,
>> resulting in a NULL dereference of phy->freq because it's set during of
>> the PHY's initialization.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/chipidea/ci_hdrc_tegra.c |   9 --
>>  drivers/usb/phy/phy-tegra-usb.c      | 165 +++++++++++++++++----------
>>  2 files changed, 102 insertions(+), 72 deletions(-)
>>
>> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
>> index 0c9911d44ee5..7455df0ede49 100644
>> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
>> @@ -83,13 +83,6 @@ static int tegra_udc_probe(struct platform_device *pdev)
>>  		return err;
>>  	}
>>  
>> -	/*
>> -	 * Tegra's USB PHY driver doesn't implement optional phy_init()
>> -	 * hook, so we have to power on UDC controller before ChipIdea
>> -	 * driver initialization kicks in.
>> -	 */
>> -	usb_phy_set_suspend(udc->phy, 0);
>> -
>>  	/* setup and register ChipIdea HDRC device */
>>  	udc->data.name = "tegra-udc";
>>  	udc->data.flags = soc->flags;
>> @@ -109,7 +102,6 @@ static int tegra_udc_probe(struct platform_device *pdev)
>>  	return 0;
>>  
>>  fail_power_off:
>> -	usb_phy_set_suspend(udc->phy, 1);
>>  	clk_disable_unprepare(udc->clk);
>>  	return err;
>>  }
>> @@ -119,7 +111,6 @@ static int tegra_udc_remove(struct platform_device *pdev)
>>  	struct tegra_udc *udc = platform_get_drvdata(pdev);
>>  
>>  	ci_hdrc_remove_device(udc->dev);
>> -	usb_phy_set_suspend(udc->phy, 1);
>>  	clk_disable_unprepare(udc->clk);
>>  
>>  	return 0;
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>> index ea7ef1dc0b42..15bd253d53c9 100644
>> --- a/drivers/usb/phy/phy-tegra-usb.c
>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>> @@ -238,23 +238,6 @@ static int utmip_pad_open(struct tegra_usb_phy *phy)
>>  {
>>  	int ret;
>>  
>> -	phy->pad_clk = devm_clk_get(phy->u_phy.dev, "utmi-pads");
>> -	if (IS_ERR(phy->pad_clk)) {
>> -		ret = PTR_ERR(phy->pad_clk);
>> -		dev_err(phy->u_phy.dev,
>> -			"Failed to get UTMIP pad clock: %d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	phy->pad_rst = devm_reset_control_get_optional_shared(
>> -						phy->u_phy.dev, "utmi-pads");
>> -	if (IS_ERR(phy->pad_rst)) {
>> -		ret = PTR_ERR(phy->pad_rst);
>> -		dev_err(phy->u_phy.dev,
>> -			"Failed to get UTMI-pads reset: %d\n", ret);
>> -		return ret;
>> -	}
>> -
>>  	ret = clk_prepare_enable(phy->pad_clk);
>>  	if (ret) {
>>  		dev_err(phy->u_phy.dev,
>> @@ -315,6 +298,18 @@ static int utmip_pad_close(struct tegra_usb_phy *phy)
>>  	return ret;
>>  }
> 
> Acked-by: Peter Chen <peter.chen@nxp.com>
> 
> Felipe, would you please queue this series after reviewing for USB PHY
> changes? If not, Dmitry may need to split the patch.

I'll take a closer look whether it is possible to factor out ChipIdea's
driver change into a separate patch in a sensible way. Thanks!

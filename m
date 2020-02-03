From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] usb: phy: tegra: Add clarifying comments about the
 shared registers
Date: Mon, 3 Feb 2020 19:26:04 +0300
Message-ID: <5a8d6489-e8ce-5a6e-3e23-8de97c3bad76@gmail.com>
References: <20200202224259.29187-1-digetx@gmail.com>
 <20200203112818.GA3506060@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200203112818.GA3506060@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

03.02.2020 14:28, Thierry Reding пишет:
> On Mon, Feb 03, 2020 at 01:42:59AM +0300, Dmitry Osipenko wrote:
>> Tools like Coccinelle may erroneously recommend to use the
>> devm_platform_ioremap_resource() API for the registers mapping because
>> these tools are not aware about the implementation details of the driver.
>> Let's add a clarifying comments to the code, which should help to stop
>> future attempts to break the driver.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/phy/phy-tegra-usb.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>> index 037e8eee737d..6153cc35aba0 100644
>> --- a/drivers/usb/phy/phy-tegra-usb.c
>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>> @@ -969,6 +969,10 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
>>  		return  -ENXIO;
>>  	}
>>  
>> +	/*
>> +	 * Note that UTMI pad registers are shared by all PHYs, therefore
>> +	 * devm_platform_ioremap_resource() can't be used here.
>> +	 */
>>  	tegra_phy->pad_regs = devm_ioremap(&pdev->dev, res->start,
>>  					   resource_size(res));
>>  	if (!tegra_phy->pad_regs) {
>> @@ -1087,6 +1091,10 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
>>  		return  -ENXIO;
>>  	}
>>  
>> +	/*
>> +	 * Note that PHY and USB controller are using shared registers,
>> +	 * therefore devm_platform_ioremap_resource() can't be used here.
>> +	 */
>>  	tegra_phy->regs = devm_ioremap(&pdev->dev, res->start,
>>  				       resource_size(res));
>>  	if (!tegra_phy->regs) {
> 
> I'm not sure it's really going to stop *all* attempts. But at least for
> people that go through the trouble of reading the comments, yes, this
> should do the trick, so:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Will see, thanks :)

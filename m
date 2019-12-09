From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [PATCH 05/18] phy: tegra: xusb: Add support to get companion USB
 3 port
Date: Mon, 9 Dec 2019 11:57:51 +0530
Message-ID: <9c93d4ff-29aa-0a59-c667-643939c46c5a@nvidia.com>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
 <1575629421-7039-6-git-send-email-nkristam@nvidia.com>
 <20191206145740.GE2085684@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191206145740.GE2085684@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 06-12-2019 20:27, Thierry Reding wrote:
> On Fri, Dec 06, 2019 at 04:20:08PM +0530, Nagarjuna Kristam wrote:
>> Tegra XUSB host, device mode driver requires the USB 3 companion port
>> number for corresponding USB 2 port. Add API to retrieve the same.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  drivers/phy/tegra/xusb.c       | 21 +++++++++++++++++++++
>>  include/linux/phy/tegra/xusb.h |  2 ++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>> index 4c86c99..2e73cf8 100644
>> --- a/drivers/phy/tegra/xusb.c
>> +++ b/drivers/phy/tegra/xusb.c
>> @@ -1254,6 +1254,27 @@ int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
>>  }
>>  EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
>>  
>> +int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
>> +				    unsigned int port)
>> +{
>> +	struct tegra_xusb_usb2_port *usb2 = tegra_xusb_find_usb2_port(padctl,
>> +								      port);
>> +	struct tegra_xusb_usb3_port *usb3;
>> +	int i;
>> +
>> +	if (!usb2)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
>> +		usb3 = tegra_xusb_find_usb3_port(padctl, i);
>> +		if (usb3 && usb3->port == usb2->base.index)
>> +			return usb3->base.index;
>> +	}
>> +
>> +	return -1;
> Since you return -EINVAL above, callers will have to interpret negative
> return values as standard errors, which would make this EPERM. That does
> not really make sense. Perhaps something like -ENODEV would be more
> appropriate in this case?
> 
> Thierry
> 
Yes, making -ENODEV instead of -1 makes it inline with generic error codes.
Will update accordingly.

-Nagarjuna
>> +}
>> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_get_usb3_companion);
>> +
>>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>>  MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
>>  MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
>> index 1235865..71d9569 100644
>> --- a/include/linux/phy/tegra/xusb.h
>> +++ b/include/linux/phy/tegra/xusb.h
>> @@ -21,4 +21,6 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
>>  int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
>>  					bool val);
>>  int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
>> +int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
>> +					 unsigned int port);
>>  #endif /* PHY_TEGRA_XUSB_H */
>> -- 
>> 2.7.4
>>

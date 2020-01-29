From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Patch V3 03/18] phy: tegra: xusb: Add usb-role-switch support
Date: Wed, 29 Jan 2020 14:45:38 +0530
Message-ID: <b6de0078-f1cd-31a1-70bd-dfc320eab70e@nvidia.com>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-4-git-send-email-nkristam@nvidia.com>
 <20200128173244.GA2293590@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200128173244.GA2293590@ulmo>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 28-01-2020 23:02, Thierry Reding wrote:
> On Mon, Dec 30, 2019 at 04:39:40PM +0530, Nagarjuna Kristam wrote:
>> If usb-role-switch property is present in USB 2 port, register
>> usb-role-switch to receive usb role changes.
>>
>> Signed-off-by: Nagarjuna Kristam<nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> V3:
>>   - Driver aborts if usb-role-switch is not added in dt forotg/peripheral
>>     roles.
>>   - Added role name strings instead of enum values in debug prints.
>>   - Updated arguments and variable allignments as per Thierry inputs.
>> ---
>> V2:
>>   - Removed dev_set_drvdata for port->dev.
>>   - Added of_platform_depopulate during error handling and driver removal.
>> ---
>>   drivers/phy/tegra/Kconfig |  1 +
>>   drivers/phy/tegra/xusb.c  | 57 +++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/phy/tegra/xusb.h  |  3 +++
>>   3 files changed, 61 insertions(+)
>>
>> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
>> index f9817c3..df07c4d 100644
>> --- a/drivers/phy/tegra/Kconfig
>> +++ b/drivers/phy/tegra/Kconfig
>> @@ -2,6 +2,7 @@
>>   config PHY_TEGRA_XUSB
>>   	tristate "NVIDIA Tegra XUSB pad controller driver"
>>   	depends on ARCH_TEGRA
>> +	select USB_CONN_GPIO
>>   	help
>>   	  Choose this option if you have an NVIDIA Tegra SoC.
>>   
>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>> index f98ec39..11ea9b5 100644
>> --- a/drivers/phy/tegra/xusb.c
>> +++ b/drivers/phy/tegra/xusb.c
>> @@ -523,6 +523,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
>>   	port->dev.type = &tegra_xusb_port_type;
>>   	port->dev.of_node = of_node_get(np);
>>   	port->dev.parent = padctl->dev;
>> +	port->dev.driver = padctl->dev->driver;
> This looks wrong. I don't think driver's are supposed to set this
> because it basically means that the device is being attached to the
> driver, but in this case it doesn't get probed by the driver and in
> fact the ports don't match the pad controller, so they can't really
> be driven by the same driver.
> 
> Is there any particular reason why you need this?
> 
> Thierry

Yes, port->dev.driver->owner is accessed in USB role switch driver in 
API usb_role_switch_get. If driver param is not updated, it causes NULL 
pointer exception. Based on your inputs, since this assignment is not 
supposed to used, I believe option available is to create a new 
device_driver structure and assign the same here.
Please share your thoughts.

- Nagarjuna

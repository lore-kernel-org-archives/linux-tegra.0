From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/3] usb: xhci: tegra: Add runtime PM support
Date: Thu, 8 Mar 2018 21:31:07 +0000
Message-ID: <f1a1c300-a558-f31a-bcfa-c3eda697b0fd@nvidia.com>
References: <1518626085-29102-1-git-send-email-jonathanh@nvidia.com>
 <1518626085-29102-2-git-send-email-jonathanh@nvidia.com>
 <54bd00b7-2835-a253-0399-370e8c8203b8@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54bd00b7-2835-a253-0399-370e8c8203b8@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 01/03/18 14:18, Mathias Nyman wrote:
> On 14.02.2018 18:34, Jon Hunter wrote:
>> Add runtime PM support to the Tegra XHCI driver and move the function
>> calls to enable/disable the clocks, regulators and PHY into the runtime
>> PM callbacks.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   drivers/usb/host/xhci-tegra.c | 80
>> ++++++++++++++++++++++++++++++-------------
>>   1 file changed, 56 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-tegra.c
>> b/drivers/usb/host/xhci-tegra.c
>> index 02b0b24faa58..42aa67858b53 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/phy/tegra/xusb.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/reset.h>
>>   #include <linux/slab.h>
>> @@ -1067,22 +1068,12 @@ static int tegra_xusb_probe(struct
>> platform_device *pdev)
>>        */
>>       platform_set_drvdata(pdev, tegra);
>>   -    err = tegra_xusb_clk_enable(tegra);
>> -    if (err) {
>> -        dev_err(&pdev->dev, "failed to enable clocks: %d\n", err);
>> -        goto put_usb2;
>> -    }
>> -
>> -    err = regulator_bulk_enable(tegra->soc->num_supplies,
>> tegra->supplies);
>> -    if (err) {
>> -        dev_err(&pdev->dev, "failed to enable regulators: %d\n", err);
>> -        goto disable_clk;
>> -    }
>> +    pm_runtime_enable(&pdev->dev);
>>   -    err = tegra_xusb_phy_enable(tegra);
>> +    err = pm_runtime_get_sync(&pdev->dev);
>>       if (err < 0) {
> 
> Does this mean that if runtime PM is disabled then clocks and regulator
> will never be enabled
> for Tegra xhci?
> 
> How about keeping the clock and regualtor enabling in probe, and instead
> add something like:
> 
> pm_runtime_set_active(&pdev->dev);
> pm_runtime_enable(&pdev->dev);
> pm_runtime_get_noresume(&pdev->dev);

For 64-bit Tegra there is a dependency on CONFIG_PM, but for 32-bit
AFAIK there is not and so yes we should handle the case when PM_RUNTIME
is disabled.

Typically we do something like ...

    pm_runtime_enable(&pdev->dev);
    if (!pm_runtime_enabled(&pdev->dev))
	ret = tegra_xusb_runtime_resume(&pdev->dev);
    else
        ret = pm_runtime_get_sync(&pdev->dev);

That way we can keep the regulator and clock stuff in the handler. I
will update this series.

Cheers
Jon

-- 
nvpublic

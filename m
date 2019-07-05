From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH] PCI: tegra: Fix support for GPIO based PERST#
Date: Fri, 5 Jul 2019 15:41:24 +0530
Message-ID: <3269adc0-215a-be7b-0820-bea7c07f6dcc@nvidia.com>
References: <20190705084850.30777-1-jonathanh@nvidia.com>
 <20190705095008.GB17491@e121166-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705095008.GB17491@e121166-lin.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 05-Jul-19 3:20 PM, Lorenzo Pieralisi wrote:
> On Fri, Jul 05, 2019 at 09:48:50AM +0100, Jon Hunter wrote:
>> Commit 5e5e9c23f82a ("PCI: tegra: Add support for GPIO based PERST#")
>> calls the function devm_gpiod_get_from_of_node() to request a GPIO.
>> Unfortunately, around the same time this was merged, commit 025bf37725f1
>> ("gpio: Fix return value mismatch of function gpiod_get_from_of_node()")
>> was also merged to fix the return value of the function
>> devm_gpiod_get_from_of_node() that was incorrectly returning NULL
>> instead of an error pointer encoded with -ENOENT if no GPIO was found.
>> When this fix for the GPIO subsystem was merged, PCI support for Tegra
>> devices that did not provide a GPIO for the PERST# (which is optional)
>> broke because the Tegra PCI driver was expecting NULL to be returned if
>> no GPIO was present and not -ENOENT.
>>
>> Fix this by checking to see if -ENOENT is returned from the function
>> devm_gpiod_get_from_of_node(), to indicate there is no GPIO for PERST#
>> present, and if this is the case set the variable 'reset_gpio' to NULL.
>> If the variable 'reset_gpio' is NULL then the Tegra PCI driver will
>> fallback to using the AFI register to toggle the PERST#. Finally,
>> correct the comment now that NULL is no longer returned from
>> devm_gpiod_get_from_of_node().
>>
>> Fixes: 5e5e9c23f82a ("PCI: tegra: Add support for GPIO based PERST#")
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 16 ++++++++++------
>>  1 file changed, 10 insertions(+), 6 deletions(-)
> Can I squash this in the original commit (ie Fixes: tag above) ? I do
> not think there is any issue with that, if there is please do let me
> know.
>
> Thanks,
> Lorenzo

Reviewed-by: Manikanta Maddireddy

Thank you Jon for publishing the fix.

Hi Lorenzo,

Yes, this patch can be squashed in the original commit.

Apologies for the inconvenience.

Manikanta

>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 9cc03a2549c0..ff8a346f3e04 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -2295,18 +2295,22 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>>  		}
>>  
>>  		/*
>> -		 * Returns null if reset-gpios property is not populated and
>> -		 * fall back to using AFI per port register to toggle PERST#
>> -		 * SFIO line.
>> +		 * Returns -ENOENT if reset-gpios property is not populated
>> +		 * and in this case fall back to using AFI per port register
>> +		 * to toggle PERST# SFIO line.
>>  		 */
>>  		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
>>  							     "reset-gpios", 0,
>>  							     GPIOD_OUT_LOW,
>>  							     label);
>>  		if (IS_ERR(rp->reset_gpio)) {
>> -			err = PTR_ERR(rp->reset_gpio);
>> -			dev_err(dev, "failed to get reset GPIO: %d\n", err);
>> -			return err;
>> +			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
>> +				rp->reset_gpio = NULL;
>> +			} else {
>> +				dev_err(dev, "failed to get reset GPIO: %d\n",
>> +					err);
>> +				return PTR_ERR(rp->reset_gpio);
>> +			}
>>  		}
>>  
>>  		list_add_tail(&rp->list, &pcie->ports);
>> -- 
>> 2.17.1
>>

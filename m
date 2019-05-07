From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V5 02/16] PCI/PME: Export pcie_pme_disable_msi() &
 pcie_pme_no_msi() APIs
Date: Tue, 7 May 2019 12:40:36 +0530
Message-ID: <b8f482f4-8136-07b5-3d68-f45a6fd580ba@nvidia.com>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-3-vidyas@nvidia.com> <20190503110159.GB32400@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503110159.GB32400@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 5/3/2019 4:31 PM, Thierry Reding wrote:
> On Wed, Apr 24, 2019 at 10:49:50AM +0530, Vidya Sagar wrote:
>> Export pcie_pme_disable_msi() & pcie_pme_no_msi() APIs to enable drivers
>> using this API be able to build as loadable modules.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes from [v4]:
>> * None
>>
>> Changes from [v3]:
>> * None
>>
>> Changes from [v2]:
>> * Exported pcie_pme_no_msi() API after making pcie_pme_msi_disabled a static
>>
>> Changes from [v1]:
>> * This is a new patch in v2 series
>>
>>   drivers/pci/pcie/pme.c     | 14 +++++++++++++-
>>   drivers/pci/pcie/portdrv.h | 16 +++-------------
>>   2 files changed, 16 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
>> index 54d593d10396..d5e0ea4a62fc 100644
>> --- a/drivers/pci/pcie/pme.c
>> +++ b/drivers/pci/pcie/pme.c
>> @@ -25,7 +25,19 @@
>>    * that using MSI for PCIe PME signaling doesn't play well with PCIe PME-based
>>    * wake-up from system sleep states.
>>    */
>> -bool pcie_pme_msi_disabled;
>> +static bool pcie_pme_msi_disabled;
>> +
>> +void pcie_pme_disable_msi(void)
>> +{
>> +	pcie_pme_msi_disabled = true;
>> +}
>> +EXPORT_SYMBOL_GPL(pcie_pme_disable_msi);
>> +
>> +bool pcie_pme_no_msi(void)
>> +{
>> +	return pcie_pme_msi_disabled;
>> +}
>> +EXPORT_SYMBOL_GPL(pcie_pme_no_msi);
>>   
>>   static int __init pcie_pme_setup(char *str)
>>   {
>> diff --git a/drivers/pci/pcie/portdrv.h b/drivers/pci/pcie/portdrv.h
>> index 1d50dc58ac40..7c8c3da4bd58 100644
>> --- a/drivers/pci/pcie/portdrv.h
>> +++ b/drivers/pci/pcie/portdrv.h
>> @@ -125,22 +125,12 @@ void pcie_port_bus_unregister(void);
>>   struct pci_dev;
>>   
>>   #ifdef CONFIG_PCIE_PME
>> -extern bool pcie_pme_msi_disabled;
>> -
>> -static inline void pcie_pme_disable_msi(void)
>> -{
>> -	pcie_pme_msi_disabled = true;
>> -}
>> -
>> -static inline bool pcie_pme_no_msi(void)
>> -{
>> -	return pcie_pme_msi_disabled;
>> -}
>> -
>> +void pcie_pme_disable_msi(void);
>> +bool pcie_pme_no_msi(void);
>>   void pcie_pme_interrupt_enable(struct pci_dev *dev, bool enable);
>>   #else /* !CONFIG_PCIE_PME */
>>   static inline void pcie_pme_disable_msi(void) {}
>> -static inline bool pcie_pme_no_msi(void) { return false; }
>> +static inline bool pcie_pme_no_msi(void) {}
> 
> This looks wrong.
Can you please give more info on what is wrong in this?

> 
> Thierry
> 

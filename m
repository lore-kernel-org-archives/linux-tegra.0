From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V2 02/16] PCI/PME: Export pcie_pme_disable_msi() API
Date: Tue, 16 Apr 2019 19:00:50 +0530
Message-ID: <f47408e4-c02d-bd28-31f9-96b92be02df5@nvidia.com>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-3-git-send-email-vidyas@nvidia.com>
 <20190411101657.GF4633@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411101657.GF4633@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 4/11/2019 3:46 PM, Thierry Reding wrote:
> On Fri, Apr 05, 2019 at 01:24:29AM +0530, Vidya Sagar wrote:
>> Export pcie_pme_disable_msi() API to enable drivers using this API be able to
>> build as loadable modules
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes from [v1]:
>> * This is a new patch in v2 series
>>
>>   drivers/pci/pcie/pme.c     | 6 ++++++
>>   drivers/pci/pcie/portdrv.h | 5 +----
>>   2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
>> index 54d593d10396..18e815c1e3c9 100644
>> --- a/drivers/pci/pcie/pme.c
>> +++ b/drivers/pci/pcie/pme.c
>> @@ -27,6 +27,12 @@
>>    */
>>   bool pcie_pme_msi_disabled;
>>   
>> +void pcie_pme_disable_msi(void)
>> +{
>> +	pcie_pme_msi_disabled = true;
>> +}
>> +EXPORT_SYMBOL_GPL(pcie_pme_disable_msi);
>> +
>>   static int __init pcie_pme_setup(char *str)
>>   {
>>   	if (!strncmp(str, "nomsi", 5))
>> diff --git a/drivers/pci/pcie/portdrv.h b/drivers/pci/pcie/portdrv.h
>> index 1d50dc58ac40..2be7b7e9a784 100644
>> --- a/drivers/pci/pcie/portdrv.h
>> +++ b/drivers/pci/pcie/portdrv.h
>> @@ -127,10 +127,7 @@ struct pci_dev;
>>   #ifdef CONFIG_PCIE_PME
>>   extern bool pcie_pme_msi_disabled;
>>   
>> -static inline void pcie_pme_disable_msi(void)
>> -{
>> -	pcie_pme_msi_disabled = true;
>> -}
>> +void pcie_pme_disable_msi(void);
>>   
>>   static inline bool pcie_pme_no_msi(void)
>>   {
> 
> Perhaps also export pcie_pme_no_msi()? That way you could get rid of the
> extern declaration of the pcie_pme_msi_disabled variable and make it
> static to drivers/pci/pcie/pme.c?
Agree. I'll take care of this in V3 patch series.

> 
> Thierry
> 

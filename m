From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V4 05/16] PCI: dwc: Move config space capability search
 API
Date: Wed, 24 Apr 2019 08:41:59 +0530
Message-ID: <22c7a99b-2d6c-e49b-43b0-219c60f7e5e9@nvidia.com>
References: <20190423082730.370-1-vidyas@nvidia.com>
 <20190423082730.370-6-vidyas@nvidia.com> <20190423203244.GD14616@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423203244.GD14616@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lorenzo.pieralisi@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 4/24/2019 2:02 AM, Bjorn Helgaas wrote:
> On Tue, Apr 23, 2019 at 01:57:19PM +0530, Vidya Sagar wrote:
>> Move PCIe config space capability search API to common DesignWare file
>> as this can be used by both host and ep mode codes.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
>> ---
>> Changes from [v3]:
>> * Rebased to linux-next top of the tree
>>
>> Changes from [v2]:
>> * None
>>
>> Changes from [v1]:
>> * Removed dw_pcie_find_next_ext_capability() API from here and made a
>>    separate patch for that
>>
>>   drivers/pci/controller/dwc/pcie-designware.c | 33 ++++++++++++++++++++
>>   drivers/pci/controller/dwc/pcie-designware.h |  2 ++
> 
> You claim this is a "move", but I only see adds.  Where did it move
> *from*?
These are supposed to be moved from pcie-designware-ep.c file. That was the case
with my old patches but when I rebased them onto ToT, I missed the change that
removes them from pcie-designware-ep.c file. Thanks for catching this. I'll
address it in the next patch.

> 
> While you're at it, can you add a comment in the code about why we
> can't use the regular pci_find_capability() interface?  It's really a
> shame to have to reimplement that.
Regular pci_find_capability() uses 'struct pci_dev *dev' pointer and can be used
only after device enumeration is done. Whereas, these APIs are used particularly
before link up and use 'struct dw_pcie *pci' pointer.

> 
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
>> index 8e0081ccf83b..6a98135244d6 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware.c
>> @@ -20,6 +20,39 @@
>>   #define PCIE_PHY_DEBUG_R1_LINK_UP	(0x1 << 4)
>>   #define PCIE_PHY_DEBUG_R1_LINK_IN_TRAINING	(0x1 << 29)
>>   
>> +static u8 __dw_pcie_find_next_cap(struct dw_pcie *pci, u8 cap_ptr,
>> +				  u8 cap)
>> +{
>> +	u8 cap_id, next_cap_ptr;
>> +	u16 reg;
>> +
>> +	reg = dw_pcie_readw_dbi(pci, cap_ptr);
>> +	next_cap_ptr = (reg & 0xff00) >> 8;
>> +	cap_id = (reg & 0x00ff);
>> +
>> +	if (!next_cap_ptr || cap_id > PCI_CAP_ID_MAX)
>> +		return 0;
>> +
>> +	if (cap_id == cap)
>> +		return cap_ptr;
>> +
>> +	return __dw_pcie_find_next_cap(pci, next_cap_ptr, cap);
>> +}
>> +
>> +u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap)
>> +{
>> +	u8 next_cap_ptr;
>> +	u16 reg;
>> +
>> +	reg = dw_pcie_readw_dbi(pci, PCI_CAPABILITY_LIST);
>> +	next_cap_ptr = (reg & 0x00ff);
>> +
>> +	if (!next_cap_ptr)
>> +		return 0;
>> +
>> +	return __dw_pcie_find_next_cap(pci, next_cap_ptr, cap);
>> +}
>> +
>>   int dw_pcie_read(void __iomem *addr, int size, u32 *val)
>>   {
>>   	if (!IS_ALIGNED((uintptr_t)addr, size)) {
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>> index 9ee98ced1ef6..35160b4ce929 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
>> @@ -248,6 +248,8 @@ struct dw_pcie {
>>   #define to_dw_pcie_from_ep(endpoint)   \
>>   		container_of((endpoint), struct dw_pcie, ep)
>>   
>> +u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
>> +
>>   int dw_pcie_read(void __iomem *addr, int size, u32 *val);
>>   int dw_pcie_write(void __iomem *addr, int size, u32 val);
>>   
>> -- 
>> 2.17.1
>>

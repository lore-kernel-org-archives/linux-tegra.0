From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V7 02/15] PCI: Disable MSI for Tegra194 root port
Date: Tue, 21 May 2019 22:17:26 +0530
Message-ID: <f63051b0-a220-125b-219e-25156d65ea6d@nvidia.com>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-3-vidyas@nvidia.com> <20190521102729.GB29166@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521102729.GB29166@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 5/21/2019 3:57 PM, Thierry Reding wrote:
> On Fri, May 17, 2019 at 06:08:33PM +0530, Vidya Sagar wrote:
>> Tegra194 rootports don't generate MSI interrupts for PME events and hence
>> MSI needs to be disabled for them to avoid root ports service drivers
>> registering their respective ISRs with MSI interrupt.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes since [v6]:
>> * This is a new patch
>>
>>   drivers/pci/quirks.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index 0f16acc323c6..28f9a0380df5 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -2592,6 +2592,20 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA,
>>   			PCI_DEVICE_ID_NVIDIA_NVENET_15,
>>   			nvenet_msi_disable);
>>   
>> +/*
>> + * Tegra194's PCIe root ports don't generate MSI interrupts for PME events
>> + * instead legacy interrupts are generated. Hence, to avoid service drivers
>> + * registering their respective ISRs for MSIs, need to disable MSI interrupts
>> + * for root ports.
>> + */
>> +static void disable_tegra194_rp_msi(struct pci_dev *dev)
>> +{
>> +	dev->no_msi = 1;
>> +}
>> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x1ad0, disable_tegra194_rp_msi);
>> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x1ad1, disable_tegra194_rp_msi);
>> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x1ad2, disable_tegra194_rp_msi);
>> +
> 
> Later functions in this file seem to use a more consistent naming
> pattern, according to which the name for this would become:
> 
> 	pci_quirk_nvidia_tegra194_disable_rp_msi
> 
> Might be worth considering making this consistent.
> 
> This could also be moved to the DWC driver to restrict this to where it
> is needed. In either case, this seems like a good solution, so:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> 
Ok. I'll move it to DWC driver along with name change for the quirk API.

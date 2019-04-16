From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V2 01/16] PCI: Add #defines for PCIe spec r4.0 features
Date: Tue, 16 Apr 2019 18:45:14 +0530
Message-ID: <4f672035-262b-1e53-2718-8c0c5612b3f3@nvidia.com>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-2-git-send-email-vidyas@nvidia.com>
 <20190411101353.GE4633@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411101353.GE4633@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 4/11/2019 3:43 PM, Thierry Reding wrote:
> On Fri, Apr 05, 2019 at 01:24:28AM +0530, Vidya Sagar wrote:
>> Add #defines for the Data Link Feature and Physical Layer 16.0 GT/s
>> features.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes from [v1]:
>> * None
>>
>>   include/uapi/linux/pci_regs.h | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
>> index 5c98133f2c94..3e01b55d548d 100644
>> --- a/include/uapi/linux/pci_regs.h
>> +++ b/include/uapi/linux/pci_regs.h
>> @@ -705,7 +705,9 @@
>>   #define PCI_EXT_CAP_ID_DPC	0x1D	/* Downstream Port Containment */
>>   #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
>>   #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
>> -#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PTM
>> +#define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
>> +#define PCI_EXT_CAP_ID_PL	0x26	/* Physical Layer 16.0 GT/s */
>> +#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL
>>   
>>   #define PCI_EXT_CAP_DSN_SIZEOF	12
>>   #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
>> @@ -1045,4 +1047,22 @@
>>   #define  PCI_L1SS_CTL1_LTR_L12_TH_SCALE	0xe0000000  /* LTR_L1.2_THRESHOLD_Scale */
>>   #define PCI_L1SS_CTL2		0x0c	/* Control 2 Register */
>>   
>> +/* Data Link Feature */
>> +#define PCI_DLF_CAP		0x04	/* Capabilities Register */
>> +#define  PCI_DLF_LOCAL_DLF_SUP_MASK	0x007fffff  /* Local Data Link Feature Supported */
>> +#define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
>> +#define PCI_DLF_STS		0x08	/* Status Register */
>> +#define  PCI_DLF_REMOTE_DLF_SUP_MASK	0x007fffff  /* Remote Data Link Feature Supported */
>> +#define  PCI_DLF_REMOTE_DLF_SUP_VALID	0x80000000  /* Remote Data Link Feature Support Valid */
>> +
>> +/* Physical Layer 16.0 GT/s */
>> +#define PCI_PL_16GT_CAP		0x04	/* Capabilities Register */
>> +#define PCI_PL_16GT_CTRL	0x08	/* Control Register */
>> +#define PCI_PL_16GT_STS		0x0c	/* Status Register */
>> +#define PCI_PL_16GT_LDPM_STS	0x10	/* Local Data Parity Mismatch Status Register */
>> +#define PCI_PL_16GT_FRDPM_STS	0x14	/* First Retimer Data Parity Mismatch Status Register */
>> +#define PCI_PL_16GT_SRDPM_STS	0x18	/* Second Retimer Data Parity Mismatch Status Register */
>> +#define PCI_PL_16GT_RSVD	0x1C	/* Reserved */
>> +#define PCI_PL_16GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
> 
> This looks correct comparing to the specification. However, this leaves
> out some definitions, so I'm wondering if perhaps this should include
> all field definitions. There are also extended capabilities between the
> current maximum 0x1F and 0x25. Perhaps those should be added as well. I
> guess this could always be done as a follow-up.
> 
> Perhaps it'd be better to change the subject to more accurately reflect
> that you're only adding a couple of PCIe 4.0 features.
I'll change subject accordingly.

> 
> Other than that:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> 

From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V2 07/16] dt-bindings: PCI: designware: Add binding for
 CDM register check
Date: Tue, 16 Apr 2019 19:59:12 +0530
Message-ID: <ccaf5077-4fb8-847c-d8b6-6e8a25f27660@nvidia.com>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-8-git-send-email-vidyas@nvidia.com>
 <20190415145402.GF29254@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415145402.GF29254@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 4/15/2019 8:24 PM, Thierry Reding wrote:
> On Fri, Apr 05, 2019 at 01:24:34AM +0530, Vidya Sagar wrote:
>> Add support to enable CDM (Configuration Dependent Module) registers check
>> for any data corruption. CDM registers include standard PCIe configuration
>> space registers, Port Logic registers and iATU and DMA registers.
>> Refer Section S.4 of Synopsys DesignWare Cores PCI Express Controller Databook
>> Version 4.90a
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes since [v1]:
>> * This is a new patch in v2 series
>>
>>   Documentation/devicetree/bindings/pci/designware-pcie.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
>> index c124f9bc11f3..728281b5bcd5 100644
>> --- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
>> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
>> @@ -31,6 +31,10 @@ Optional properties:
>>   - clock-names: Must include the following entries:
>>   	- "pcie"
>>   	- "pcie_bus"
>> +- cdm-check: This is a boolean property and if present enables automatic
>> +   checking of CDM (Configuration Dependent Module) registers for data
>> +   corruption. CDM registers include configuration space registers and iATU
>> +   (internal Address Translation Unit) registers.
> 
> By comparison the commit message also lists "Port Logic" and "DMA"
> registers as being part of the CDM registers. Shouldn't they be part of
> the bindings document as well?
Ok. I'll add them in V3 patch series.

> 
> Perhaps it'd also be a good idea to rename this property to something
> more imperative, like "enable-cdm" or similar.
Ok. I'll go with "enable-cdm-check". I hope that should be fine.

> 
> Thierry
> 
>>   RC mode:
>>   - num-viewport: number of view ports configured in hardware. If a platform
>>     does not specify it, the driver assumes 2.
>> -- 
>> 2.7.4
>>

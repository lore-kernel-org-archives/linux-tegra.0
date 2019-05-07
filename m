From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V5 10/16] dt-bindings: PCI: tegra: Add device tree support
 for T194
Date: Tue, 7 May 2019 14:56:19 +0530
Message-ID: <af37a21a-a14e-70c0-8687-de2c29e2d99b@nvidia.com>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-11-vidyas@nvidia.com> <20190503111923.GE32400@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503111923.GE32400@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 5/3/2019 4:49 PM, Thierry Reding wrote:
> On Wed, Apr 24, 2019 at 10:49:58AM +0530, Vidya Sagar wrote:
>> Add support for Tegra194 PCIe controllers. These controllers are based
>> on Synopsys DesignWare core IP.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes since [v4]:
>> * None
>>
>> Changes since [v3]:
>> * None
>>
>> Changes since [v2]:
>> * Using only 'Cx' (x-being controller number) format to represent a controller
>> * Changed to 'value: description' format where applicable
>> * Changed 'nvidia,init-speed' to 'nvidia,init-link-speed'
>> * Provided more documentation for 'nvidia,init-link-speed' property
>> * Changed 'nvidia,pex-wake' to 'nvidia,wake-gpios'
>>
>> Changes since [v1]:
>> * Added documentation for 'power-domains' property
>> * Removed 'window1' and 'window2' properties
>> * Removed '_clk' and '_rst' from clock and reset names
>> * Dropped 'pcie' from phy-names
>> * Added entry for BPMP-FW handle
>> * Removed offsets for some of the registers and added them in code and would be pickedup based on
>>    controller ID
>> * Changed 'nvidia,max-speed' to 'max-link-speed' and is made as an optional
>> * Changed 'nvidia,disable-clock-request' to 'supports-clkreq' with inverted operation
>> * Added more documentation for 'nvidia,update-fc-fixup' property
>> * Removed 'nvidia,enable-power-down' and 'nvidia,plat-gpios' properties
>> * Added '-us' to all properties that represent time in microseconds
>> * Moved P2U documentation to a separate file
>>
>>   .../bindings/pci/nvidia,tegra194-pcie.txt     | 187 ++++++++++++++++++
>>   1 file changed, 187 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
>>
>> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
>> new file mode 100644
>> index 000000000000..208dff126108
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
>> @@ -0,0 +1,187 @@
>> +NVIDIA Tegra PCIe controller (Synopsys DesignWare Core based)
>> +
>> +This PCIe host controller is based on the Synopsis Designware PCIe IP
>> +and thus inherits all the common properties defined in designware-pcie.txt.
>> +
>> +Required properties:
>> +- compatible: For Tegra19x, must contain "nvidia,tegra194-pcie".
>> +- device_type: Must be "pci"
>> +- power-domains: A phandle to the node that controls power to the respective
>> +  PCIe controller and a specifier name for the PCIe controller. Following are
>> +  the specifiers for the different PCIe controllers
>> +    TEGRA194_POWER_DOMAIN_PCIEX8B: C0
>> +    TEGRA194_POWER_DOMAIN_PCIEX1A: C1
>> +    TEGRA194_POWER_DOMAIN_PCIEX1A: C2
>> +    TEGRA194_POWER_DOMAIN_PCIEX1A: C3
>> +    TEGRA194_POWER_DOMAIN_PCIEX4A: C4
>> +    TEGRA194_POWER_DOMAIN_PCIEX8A: C5
>> +  these specifiers are defined in
>> +  "include/dt-bindings/power/tegra194-powergate.h" file.
>> +- reg: A list of physical base address and length for each set of controller
> 
> Perhaps "list of physical base address and length pairs".
Ok.

> 
>> +  registers. Must contain an entry for each entry in the reg-names property.
>> +- reg-names: Must include the following entries:
>> +  "appl": Controller's application logic registers
>> +  "config": As per the definition in designware-pcie.txt
>> +  "atu_dma": iATU and DMA registers. This is where the iATU (internal Address
>> +             Translation Unit) registers of the PCIe core are made available
>> +             fow SW access.
> 
> s/fow/for/
Done.

> 
> Thierry
> 

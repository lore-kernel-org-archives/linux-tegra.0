From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V5 11/16] dt-bindings: PHY: P2U: Add Tegra 194 P2U block
Date: Tue, 7 May 2019 15:27:56 +0530
Message-ID: <c13db22f-0557-8e98-0a1d-00ee4405e6db@nvidia.com>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-12-vidyas@nvidia.com> <20190426154519.GA19329@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426154519.GA19329@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 4/26/2019 9:15 PM, Rob Herring wrote:
> On Wed, Apr 24, 2019 at 10:49:59AM +0530, Vidya Sagar wrote:
>> Add support for Tegra194 P2U (PIPE to UPHY) module block which is a glue
>> module instantiated one for each PCIe lane between Synopsys Designware core
>> based PCIe IP and Universal PHY block.
> 
> Missing Sob.
Done.

> 
>> ---
>> Changes since [v4]:
>> * None
>>
>> Changes since [v3]:
>> * None
>>
>> Changes since [v2]:
>> * Changed node label to reflect new format that includes either 'hsio' or
>>    'nvhs' in its name to reflect which UPHY brick they belong to
>>
>> Changes since [v1]:
>> * This is a new patch in v2 series
>>
>>   .../bindings/phy/phy-tegra194-p2u.txt         | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
>> new file mode 100644
>> index 000000000000..8b543cba483b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
>> @@ -0,0 +1,28 @@
>> +NVIDIA Tegra194 P2U binding
>> +
>> +Tegra194 has two PHY bricks namely HSIO (High Speed IO) and NVHS (NVIDIA High
>> +Speed) each interfacing with 12 and 8 P2U instances respectively.
>> +A P2U instance is a glue logic between Synopsys DesignWare Core PCIe IP's PIPE
>> +interface and PHY of HSIO/NVHS bricks. Each P2U instance represents one PCIe
>> +lane.
>> +
>> +Required properties:
>> +- compatible: For Tegra19x, must contain "nvidia,tegra194-p2u".
>> +- reg: Should be the physical address space and length of respective each P2U
>> +       instance.
>> +- reg-names: Must include the entry "ctl".
> 
> -names is pointless when there is only 1.
I did it this way to make it future proof as there could be more regions that might get
added at a later point of time.

> 
>> +
>> +Required properties for PHY port node:
>> +- #phy-cells: Defined by generic PHY bindings.  Must be 0.
>> +
>> +Refer to phy/phy-bindings.txt for the generic PHY binding properties.
>> +
>> +Example:
>> +
>> +p2u_hsio_0: p2u@3e10000 {
> 
> phy@...
Done.

> 
>> +	compatible = "nvidia,tegra194-p2u";
>> +	reg = <0x03e10000 0x10000>;
>> +	reg-names = "ctl";
>> +
>> +	#phy-cells = <0>;
>> +};
>> -- 
>> 2.17.1
>>

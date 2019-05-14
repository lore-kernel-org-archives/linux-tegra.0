From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V5 07/16] dt-bindings: PCI: designware: Add binding for
 CDM register check
Date: Tue, 14 May 2019 10:59:31 +0530
Message-ID: <f340cb14-a6df-340b-ce37-227685f78b80@nvidia.com>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-8-vidyas@nvidia.com> <20190426143247.GA25107@bogus>
 <031df2ca-27de-2388-5f23-078320203f5d@nvidia.com>
 <CAL_JsqKvES6OuPRgu8A009j6L4rkc11rB9TyxPe1iUJhvk1O8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKvES6OuPRgu8A009j6L4rkc11rB9TyxPe1iUJhvk1O8w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, kthota@nvidia.com, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 5/13/2019 8:45 PM, Rob Herring wrote:
> On Tue, May 7, 2019 at 3:25 AM Vidya Sagar <vidyas@nvidia.com> wrote:
>>
>> On 4/26/2019 8:02 PM, Rob Herring wrote:
>>> On Wed, Apr 24, 2019 at 10:49:55AM +0530, Vidya Sagar wrote:
>>>> Add support to enable CDM (Configuration Dependent Module) registers check
>>>> for any data corruption. CDM registers include standard PCIe configuration
>>>> space registers, Port Logic registers and iATU and DMA registers.
>>>> Refer Section S.4 of Synopsys DesignWare Cores PCI Express Controller Databook
>>>> Version 4.90a
>>>>
>>>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>>>> ---
>>>> Changes since [v4]:
>>>> * None
>>>>
>>>> Changes since [v3]:
>>>> * None
>>>>
>>>> Changes since [v2]:
>>>> * Changed flag name from 'cdm-check' to 'enable-cdm-check'
>>>> * Added info about Port Logic and DMA registers being part of CDM
>>>>
>>>> Changes since [v1]:
>>>> * This is a new patch in v2 series
>>>>
>>>>    Documentation/devicetree/bindings/pci/designware-pcie.txt | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
>>>> index 5561a1c060d0..85b872c42a9f 100644
>>>> --- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
>>>> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
>>>> @@ -34,6 +34,11 @@ Optional properties:
>>>>    - clock-names: Must include the following entries:
>>>>       - "pcie"
>>>>       - "pcie_bus"
>>>> +- enable-cdm-check: This is a boolean property and if present enables
>>>
>>> This needs a vendor prefix.
>> Why only for this? Since this whole file is for Synopsys DesignWare core based PCIe IP,
>> I thought there is specific prefix required. Am I wrong? Also, CDM checking is a feature
>> of IP and DWC based implementations can choose either to enable this feature at hardware level
>> or not. And whoever enabled it at hardware level (like Tegra194) can set this flag to
>> enable corresponding software support.
> 
> TBC, I meant a Synopsys vendor prefix, not NVIDIA.
> 
> Any property that's not from a common binding should have a vendor
> prefix. That hasn't always happened, so we do have lots of examples
> without.
Ok. got it. I'm going to take care of this in V7 series.

> 
> Rob
> 

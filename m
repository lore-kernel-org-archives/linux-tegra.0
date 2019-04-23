From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V3 04/16] PCI: dwc: Perform dbi regs write lock towards
 the end
Date: Tue, 23 Apr 2019 11:41:18 +0530
Message-ID: <f0b5973a-b7a5-ac59-06d6-fdce71fda03d@nvidia.com>
References: <20190416192730.15681-1-vidyas@nvidia.com>
 <20190416192730.15681-5-vidyas@nvidia.com>
 <305100E33629484CBB767107E4246BBB0A22C127@de02wembxa.internal.synopsys.com>
 <20190422154608.6e6f8ae3@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190422154608.6e6f8ae3@xhacker.debian>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "kishon@ti.com" <kishon@ti.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mmaddireddy@nvidia.com" <mmaddireddy@nvidia.com>, "kthota@nvidia.com" <kthota@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mperttunen@nvidia.com" <mperttun>
List-Id: linux-tegra@vger.kernel.org

On 4/22/2019 1:24 PM, Jisheng Zhang wrote:
> On Wed, 17 Apr 2019 09:56:33 +0000 Gustavo Pimentel wrote:
> 
>>
>> On Tue, Apr 16, 2019 at 20:27:18, Vidya Sagar <vidyas@nvidia.com> wrote:
>>
>>> Remove multiple write enable and disable sequences of dbi registers as
>>> Tegra194 implements writes to BAR-0 register (offset: 0x10) controlled by
>>> DBI write-lock enable bit thereby not allowing any further writes to BAR-0
>>> register in config space to take place. Hence disabling write permission
>>> only towards the end.
>>>
>>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>>> ---
>>> Changes since [v2]:
>>> * None
>>>
>>> Changes since [v1]:
>>> * None
>>>
>>>   drivers/pci/controller/dwc/pcie-designware-host.c | 3 ---
>>>   1 file changed, 3 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>>> index 2a5332e5ccfa..c0334c92c1a6 100644
>>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>>> @@ -683,7 +683,6 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>>>        val &= 0xffff00ff;
>>>        val |= 0x00000100;
>>>        dw_pcie_writel_dbi(pci, PCI_INTERRUPT_LINE, val);
>>> -     dw_pcie_dbi_ro_wr_dis(pci);
>>>
>>>        /* Setup bus numbers */
>>>        val = dw_pcie_readl_dbi(pci, PCI_PRIMARY_BUS);
>>> @@ -723,8 +722,6 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>>>
>>>        dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
>>>
>>> -     /* Enable write permission for the DBI read-only register */
>>> -     dw_pcie_dbi_ro_wr_en(pci);
>>>        /* Program correct class for RC */
>>>        dw_pcie_wr_own_conf(pp, PCI_CLASS_DEVICE, 2, PCI_CLASS_BRIDGE_PCI);
>>>        /* Better disable write permission right after the update */
>>> --
>>> 2.17.1
>>
>> This setup sequence was written by Jingoo Han, let's check if he did this
>> by some particular reason.
>> Jingoo do you remember why you wrote the code like this?
> 
> FWICT, enabling RO writeable in the setup sequence is introduced in
> commit d91dfe5054d4 ("PCI: dwc: Enable write permission for Class Code,
> Interrupt Pin updates"). The Reason why not towards the end maybe
> only enable the RO writeable when necessary.
In that case, my patch shouldn't cause any issue and if any it would avoid
few writes to speed up the process. So, in my opinion, it is a good to go change.
Please let me know if you have disagree with me on this.

> 
> thanks
> 

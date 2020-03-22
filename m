From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V5 5/5] PCI: tegra: Add support for PCIe endpoint mode in
 Tegra194
Date: Sun, 22 Mar 2020 22:45:50 +0530
Message-ID: <7e6a9643-fcdb-fd80-8e84-2983975889a9@nvidia.com>
References: <20200303181052.16134-1-vidyas@nvidia.com>
 <20200303181052.16134-6-vidyas@nvidia.com>
 <20200322145020.GA2040@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200322145020.GA2040@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org



On 3/22/2020 8:20 PM, Guenter Roeck wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, Mar 03, 2020 at 11:40:52PM +0530, Vidya Sagar wrote:
>> Add support for the endpoint mode of Synopsys DesignWare core based
>> dual mode PCIe controllers present in Tegra194 SoC.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> ERROR: modpost: "dw_pcie_ep_init" [drivers/pci/controller/dwc/pcie-tegra194.ko] undefined!
> ERROR: modpost: "dw_pcie_ep_linkup" [drivers/pci/controller/dwc/pcie-tegra194.ko] undefined!
> ERROR: modpost: "dw_pcie_ep_init_notify" [drivers/pci/controller/dwc/pcie-tegra194.ko] undefined!
> ERROR: modpost: "dw_pcie_ep_init_complete" [drivers/pci/controller/dwc/pcie-tegra194.ko] undefined!
> 
> Either the symbols must be exported, or the driver's Kconfig entry must be
> bool, not tristate.
Qiujun has already posted a patch to fix it @ 
http://patchwork.ozlabs.org/patch/1258659/

Thanks,
Vidya Sagar
> 
> Guenter
> 

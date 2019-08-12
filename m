From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V15 00/13] PCI: tegra: Add Tegra194 PCIe support
Date: Mon, 12 Aug 2019 15:59:39 +0530
Message-ID: <aa666d78-43b3-dbea-dac6-386deaca3e12@nvidia.com>
References: <20190809044609.20401-1-vidyas@nvidia.com>
 <20190812102519.GN8903@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812102519.GN8903@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 8/12/2019 3:55 PM, Thierry Reding wrote:
> On Fri, Aug 09, 2019 at 10:15:56AM +0530, Vidya Sagar wrote:
>> Tegra194 has six PCIe controllers based on Synopsys DesignWare core.
>> There are two Universal PHY (UPHY) blocks with each supporting 12(HSIO:
>> Hisg Speed IO) and 8(NVHS: NVIDIA High Speed) lanes respectively.
>> Controllers:0~4 use UPHY lanes from HSIO brick whereas Controller:5 uses
>> UPHY lanes from NVHS brick. Lane mapping in HSIO UPHY brick to each PCIe
>> controller (0~4) is controlled in XBAR module by BPMP-FW. Since PCIe
>> core has PIPE interface, a glue module called PIPE-to-UPHY (P2U) is used
>> to connect each UPHY lane (applicable to both HSIO and NVHS UPHY bricks)
>> to PCIe controller
>> This patch series
>> - Adds support for P2U PHY driver
>> - Adds support for PCIe host controller
>> - Adds device tree nodes each PCIe controllers
>> - Enables nodes applicable to p2972-0000 platform
>> - Adds helper APIs in Designware core driver to get capability regs offset
>> - Adds defines for new feature registers of PCIe spec revision 4
>> - Makes changes in DesignWare core driver to get Tegra194 PCIe working
>>
>> Testing done on P2972-0000 platform
>> - Able to get PCIe link up with on-board Marvel eSATA controller
>> - Able to get PCIe link up with NVMe cards connected to M.2 Key-M slot
>> - Able to do data transfers with both SATA drives and NVMe cards
>> - Able to perform suspend-resume sequence
> 
> Do you happen to have a patch for P2972-0000 PCI support? I don't see it
> in this series.
It is already merged.
V10 link @ http://patchwork.ozlabs.org/patch/1114445/

- Vidya Sagar
> 
> Thierry
> 

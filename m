From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH V4 0/6] PCI: tegra: Enable PCIe C5 controller of Tegra194
 in p2972-0000 platform
Date: Thu, 5 Sep 2019 12:20:55 +0100
Message-ID: <20190905112055.GB16642@e121166-lin.cambridge.arm.com>
References: <20190905104553.2884-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190905104553.2884-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 05, 2019 at 04:15:47PM +0530, Vidya Sagar wrote:
> This patch series enables Tegra194's C5 controller which owns x16 slot in
> p2972-0000 platform. C5 controller's PERST# and CLKREQ# are not configured as
> output and bi-directional signals by default and hence they need to be
> configured explicitly. Also, x16 slot's 3.3V and 12V supplies are controlled
> through GPIOs and hence they need to be enabled through regulator framework.
> This patch series adds required infrastructural support to address both the
> aforementioned requirements.
> Testing done on p2972-0000 platform
> - Able to enumerate devices connected to x16 slot (owned by C5 controller)
> - Enumerated device's functionality verified
> - Suspend-Resume sequence is verified with device connected to x16 slot
> 
> V4:
> * Rebased (Patch-4/6 particularly) on top of Lorenzo's pci/tegra branch
> 
> V3:
> * Addressed some more review comments from Andrew Murray and Thierry Reding
> 
> V2:
> * Changed the order of patches in the series for easy merging
> * Addressed review comments from Thierry Reding and Andrew Murray
> 
> Vidya Sagar (6):
>   dt-bindings: PCI: tegra: Add sideband pins configuration entries
>   dt-bindings: PCI: tegra: Add PCIe slot supplies regulator entries
>   PCI: tegra: Add support to configure sideband pins
>   PCI: tegra: Add support to enable slot regulators
>   arm64: tegra: Add configuration for PCIe C5 sideband signals
>   arm64: tegra: Add PCIe slot supply information in p2972-0000 platform
> 
>  .../bindings/pci/nvidia,tegra194-pcie.txt     | 16 ++++
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 24 +++++
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  4 +-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 38 +++++++-
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 94 ++++++++++++++++++-
>  5 files changed, 172 insertions(+), 4 deletions(-)

Applied to pci/tegra for v5.4, thanks.

Lorenzo

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/6] dt-bindings: PCI: tegra: Add sideband pins configuration entries
Date: Mon, 02 Sep 2019 14:38:49 +0100
Message-ID: <5d6d1b6a.1c69fb81.73f8d.ac61@mx.google.com>
References: <20190828172850.19871-1-vidyas@nvidia.com> <20190828172850.19871-2-vidyas@nvidia.com>
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828172850.19871-2-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Wed, 28 Aug 2019 22:58:45 +0530, Vidya Sagar wrote:
> Add optional bindings "pinctrl-names" and "pinctrl-0" to describe pin
> configuration information of a particular PCIe controller.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V3:
> * None
> 
> V2:
> * None
> 
>  .../devicetree/bindings/pci/nvidia,tegra194-pcie.txt      | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

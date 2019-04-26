From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 09/16] Documentation/devicetree: Add PCIe
 supports-clkreq property
Date: Fri, 26 Apr 2019 10:22:29 -0500
Message-ID: <20190426152229.GA8492@bogus>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-10-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424052004.6270-10-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 24, 2019 at 10:49:57AM +0530, Vidya Sagar wrote:
> Some host controllers need to know the existence of clkreq signal routing to
> downstream devices to be able to advertise low power features like ASPM L1
> substates. Without clkreq signal routing being present, enabling ASPM L1 sub
> states might lead to downstream devices falling off the bus. Hence a new device
> tree property 'supports-clkreq' is added to make such host controllers
> aware of clkreq signal routing to downstream devices.

Please be consistent with subjects (Use 'dt-bindings: ...')

With that change,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v4]:
> * None
> 
> Changes since [v3]:
> * Rebased on top of linux-next top of the tree
> 
> Changes since [v2]:
> * None
> 
> Changes since [v1]:
> * This is a new patch in v2 series
> 
>  Documentation/devicetree/bindings/pci/pci.txt | 5 +++++
>  1 file changed, 5 insertions(+)

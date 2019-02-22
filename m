From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: tegra: Add Tegra186 support
Date: Fri, 22 Feb 2019 17:39:10 -0600
Message-ID: <20190222233910.GA14887@bogus>
References: <20190221154634.10684-1-thierry.reding@gmail.com>
 <20190221154634.10684-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190221154634.10684-2-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 21 Feb 2019 16:46:30 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Extend the bindings to cover the set of features found in Tegra186. Note
> that, technically, there are four more supplies connected to the XUSB
> pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL), but
> the power sequencing requirements of Tegra186 require these to be under
> the control of the PMIC.
> 
> Reviewed-by: JC Kuo <jckuo@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt         | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

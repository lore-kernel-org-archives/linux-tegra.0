From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/5] dt-bindings: usb: xhci-tegra: Add power-domain
 details
Date: Fri, 12 Oct 2018 14:38:18 -0500
Message-ID: <20181012193818.GA4502@bogus>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538143910-24400-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, 28 Sep 2018 15:11:46 +0100, Jon Hunter wrote:
> Add details for power-domains to the Tegra xHCI bindings so that
> generic power-domains can be used for inconjunction with the xHCI
> driver.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

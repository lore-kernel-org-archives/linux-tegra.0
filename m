From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V4 0/5] Add support for PCIe endpoint mode in Tegra194
Date: Tue, 3 Mar 2020 17:01:16 +0000
Message-ID: <20200303170103.GA9641@e121166-lin.cambridge.arm.com>
References: <20200303105418.2840-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200303105418.2840-1-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 03, 2020 at 04:24:13PM +0530, Vidya Sagar wrote:
> Tegra194 has three (C0, C4 & C5) dual mode PCIe controllers that can operate
> either in root port mode or in end point mode but only in one mode at a time.
> Platform P2972-0000 supports enabling endpoint mode for C5 controller. This
> patch series adds support for PCIe endpoint mode in both the driver as well as
> in DT.
> This patch series depends on the changes made for Synopsys DesignWare endpoint
> mode subsystem that are recently accepted.
> @ https://patchwork.kernel.org/project/linux-pci/list/?series=202211
> which in turn depends on the patch made by Kishon
> @ https://patchwork.kernel.org/patch/10975123/
> which is also under review.
> 
> V4:
> * Started using threaded irqs instead of kthreads

Hi Vidya,

sorry for the bother, may I ask you to rebase the series (after
answering Thierry's query) on top of my pci/endpoint branch please ?

Please resend it and I will merge patches {1,2,5} then.

Thanks,
Lorenzo

> V3:
> * Re-ordered patches in the series to make the driver change as the last patch
> * Took care of Thierry's review comments
> 
> V2:
> * Addressed Thierry & Bjorn's review comments
> * Added EP mode specific binding documentation to already existing binding documentation file
> * Removed patch that enables GPIO controller nodes explicitly as they are enabled already
> 
> Vidya Sagar (5):
>   soc/tegra: bpmp: Update ABI header
>   dt-bindings: PCI: tegra: Add DT support for PCIe EP nodes in Tegra194
>   arm64: tegra: Add PCIe endpoint controllers nodes for Tegra194
>   arm64: tegra: Add support for PCIe endpoint mode in P2972-0000
>     platform
>   PCI: tegra: Add support for PCIe endpoint mode in Tegra194
> 
>  .../bindings/pci/nvidia,tegra194-pcie.txt     | 125 +++-
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  18 +
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  99 +++
>  drivers/pci/controller/dwc/Kconfig            |  30 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 681 +++++++++++++++++-
>  include/soc/tegra/bpmp-abi.h                  |  10 +-
>  6 files changed, 918 insertions(+), 45 deletions(-)
> 
> -- 
> 2.17.1
> 

From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V5 5/5] PCI: tegra: Add support for PCIe endpoint mode in
 Tegra194
Date: Mon, 30 Mar 2020 16:47:21 -0500
Message-ID: <20200330214721.GA128269@google.com>
References: <20200303181052.16134-6-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200303181052.16134-6-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 03, 2020 at 11:40:52PM +0530, Vidya Sagar wrote:
> Add support for the endpoint mode of Synopsys DesignWare core based
> dual mode PCIe controllers present in Tegra194 SoC.
> 
> Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V5:
> * Added Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> * Removed unwanted header file inclusion
> 
> V4:
> * Addressed Lorenzo's review comments
> * Started using threaded irqs instead of kthreads
> 
> V3:
> * Addressed Thierry's review comments
> 
> V2:
> * Addressed Bjorn's review comments
> * Made changes as part of addressing review comments for other patches
> 
>  drivers/pci/controller/dwc/Kconfig         |  30 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c | 679 ++++++++++++++++++++-
>  2 files changed, 691 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 0830dfcfa43a..169cde58dd92 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -248,14 +248,38 @@ config PCI_MESON
>  	  implement the driver.
>  
>  config PCIE_TEGRA194
> -	tristate "NVIDIA Tegra194 (and later) PCIe controller"
> +	tristate
> +
> +config PCIE_TEGRA194_HOST
> +	tristate "NVIDIA Tegra194 (and later) PCIe controller - Host Mode"
>  	depends on ARCH_TEGRA_194_SOC || COMPILE_TEST
>  	depends on PCI_MSI_IRQ_DOMAIN
>  	select PCIE_DW_HOST
>  	select PHY_TEGRA194_P2U
> +	select PCIE_TEGRA194
> +	default y

Sorry I missed this before, but why is this "default y"?  From
Documentation/kbuild/kconfig-language.rst:

  The default value deliberately defaults to 'n' in order to avoid
  bloating the build. With few exceptions, new config options should
  not change this. The intent is for "make oldconfig" to add as little
  as possible to the config from release to release.

I do see that several other things in other drivers/pci/ Kconfig files
are also "default y", and we should probably change some of them.  But
I don't want to add even more unless there's a good reason.

I'm not looking for more reactions like these:

https://lore.kernel.org/r/CAHk-=wiZ24JuVehJ5sEC0UG1Gk2nvB363wO02RRsR1oEht6R9Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org
https://lore.kernel.org/r/CA+55aFzPpuHU1Nqd595SEQS=F+kXMzPs0Rba9FUgTodGxmXsgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org

Can you please update this patch to either remove the "default y" or
add the rationale for keeping it?

> +	help
> +	  Enables support for the PCIe controller in the NVIDIA Tegra194 SoC to
> +	  work in host mode. There are two instances of PCIe controllers in
> +	  Tegra194. This controller can work either as EP or RC. In order to
> +	  enable host-specific features PCIE_TEGRA194_HOST must be selected and
> +	  in order to enable device-specific features PCIE_TEGRA194_EP must be
> +	  selected. This uses the DesignWare core.

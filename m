From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 12/14] ARM: tegra: tec: Add PCIe support
Date: Thu, 10 Jan 2013 17:22:30 -0700
Message-ID: <50EF5B46.8010806@wwwdotorg.org>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de> <1357764194-12677-13-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357764194-12677-13-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/09/2013 01:43 PM, Thierry Reding wrote:
> Enable the first PCIe root port which is connected to an FPGA on the
> Tamonten Evaluation Carrier and add device nodes for each of the PCI
> endpoints available in the standard configuration.

> diff --git a/arch/arm/boot/dts/tegra20-tec.dts b/arch/arm/boot/dts/tegra20-tec.dts

> +	pcie-controller {
> +		vdd-supply = <&pci_vdd_reg>;
> +		pex-clk-supply = <&pci_clk_reg>;
> +		status = "okay";

Sorry this is also really picky. I'd prefer properties that exist in
/include/d files and are overidden here to appear first, followed by new
properties. In other words, move the status property to be first. I
believe/hope all the other (Tegra) .dts files follow this convention.

> +		pci@1,0 {
> +			bus-range = <0x01 0x0a>;
> +			status = "okay";
> +
> +			pci@0,0 {
> +				reg = <0x010000 0 0 0 0>;

Hmm. The unit address in that node name doesn't match the address in the
reg property, although I suppose there's nothing we can do about it
since those formats are both defined by the standard PCI binding?

What do the numbers "0,0" represent here; device/function? Is the same
true for the "0,0" in the child nodes?

> +				bus-range = <0x02 0x0a>;
> +
> +				compatible = "plda,pcie";

Are there DT binding documents for all these devices; plda,pcie,
ad,pcie, ad,pcie-test, etc.?

> +				pci@4,0 {
> +					reg = <0x022000 0 0 0 0>;
> +					bus-range = <0x07 0x07>;
> +
> +					compatible = "ad,pcie";
> +					device_type = "pci";
> +
> +					#address-cells = <3>;
> +					#size-cells = <2>;
> +
> +					pci@0,0 {
> +						compatible = "opencores,uart";
> +						reg = <0x070000 0 0 0 0>;
> +					};
> +				};

Do you need to include a node for the UART; I can see you need to for
the SPI/I2C controllers so you can instantiate the appropriate devices
on non-probe-able buses, but I think you can just let regular PCI device
probing find the UART, Ethernet MAC, etc., can't you?

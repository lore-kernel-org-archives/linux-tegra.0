From: jckuo <jckuo@nvidia.com>
Subject: Re: [PATCH 1/6] dt-bindings: usb: xhci-tegra: Add Tegra186 support
Date: Mon, 28 Jan 2019 15:46:28 +0800
Message-ID: <69c05dea-0e52-addf-c119-04d1a241e3b2@nvidia.com>
References: <20190125113013.11447-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125113013.11447-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: JC Kuo <jckuo@nvidia.com>

On 1/25/19 7:30 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Extend the bindings to cover the set of features found in Tegra186.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   .../devicetree/bindings/usb/nvidia,tegra124-xusb.txt          | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> index 4156c3e181c5..5bfcc0b4d6b9 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> @@ -10,6 +10,7 @@ Required properties:
>     - Tegra124: "nvidia,tegra124-xusb"
>     - Tegra132: "nvidia,tegra132-xusb", "nvidia,tegra124-xusb"
>     - Tegra210: "nvidia,tegra210-xusb"
> +  - Tegra186: "nvidia,tegra186-xusb"
>   - reg: Must contain the base and length of the xHCI host registers, XUSB FPCI
>     registers and XUSB IPFS registers.
>   - reg-names: Must contain the following entries:
> @@ -59,6 +60,8 @@ For Tegra210:
>   - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
>   - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
>   - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
> +
> +For Tegra210 and Tegra186:
>   - power-domains: A list of PM domain specifiers that reference each power-domain
>     used by the xHCI controller. This list must comprise of a specifier for the
>     XUSBA and XUSBC power-domains. See ../power/power_domain.txt and
> @@ -78,6 +81,7 @@ Optional properties:
>     - Tegra132: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
>     - Tegra210: usb2-0, usb2-1, usb2-2, usb2-3, hsic-0, usb3-0, usb3-1, usb3-2,
>                 usb3-3
> +  - Tegra186: usb2-0, usb2-1, usb2-2, hsic-0, usb3-0, usb3-1, usb3-2
>   
>   Example:
>   --------

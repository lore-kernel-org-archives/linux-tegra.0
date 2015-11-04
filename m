From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy: tegra-xusb-padctl: Add Tegra210
 support
Date: Wed, 4 Nov 2015 13:59:51 -0700
Message-ID: <563A71C7.9030002@wwwdotorg.org>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
 <1446657109-15568-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446657109-15568-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/04/2015 10:11 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Extend the binding to cover the set of feature found in Tegra210.

> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt

> +PCIe pad:
> +---------
> +
> +Required properties:
> +- clocks: Must contain an entry for each entry in clock-names.
> +- clock-names: Must contain the following entries:
> +  - "pll": phandle and specifier referring to the PLLE
> +- resets: Must contain an entry for each entry in reset-names.
> +- reset-names: Must contain the following entries:
> +  - "phy": reset for the PCIe UPHY block

I don't recall any clocks or resets properties in the pads for Tegra124. 
Do we really not need any?

> +SATA pad:
> +---------
> +
> +Required properties:
> +- resets: Must contain an entry for each entry in reset-names.
> +- reset-names: Must contain the following entries:
> +  - "phy": reset for the SATA UPHY block
> +
>
>   PHY nodes:

Nit: 2 blank lines there.

> +For Tegra210, the list of valid PHY nodes is given below:
> +- utmi: utmi-0, utmi-1, utmi-2, utmi-3
> +  - functions: "snps", "xusb", "uart"
> +- hsic: hsic-0, hsic-1
> +  - functions: "snps", "xusb"
> +- pcie: pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, pcie-5, pcie-6
> +  - functions: "pcie-x1", "usb3-ss", "pcie-x4"
> +- sata: sata-0
> +  - functions: "usb3-ss", "sata"

usb2-bias also needs to be present.

> +
> +
>   Port nodes:
>   ===========

Nit: 2 blank lines there.

> +For Tegra210, the XUSB pad controller exposes the following ports:
> +- 4x UTMI: utmi-0, utmi-1, utmi-2, utmi-3
> +- 2x HSIC: hsic-0, hsic-1
> +- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
> +
>
>   Examples:
>   =========

Nit: 2 blank lines there.

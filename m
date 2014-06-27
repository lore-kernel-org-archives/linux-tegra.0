From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/3] of: Add NVIDIA Tegra flow controller bindings
Date: Fri, 27 Jun 2014 15:20:18 -0600
Message-ID: <53ADE012.5080401@wwwdotorg.org>
References: <1403870848-1754-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403870848-1754-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/27/2014 06:07 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add device tree bindings for the flow controller found on NVIDIA Tegra
> SoCs.
> 

> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt

> +NVIDIA Tegra20 Flow Controller
> +
> +Required properties:
> +- compatible: "nvidia,tegra20-flowctrl"
> +- reg: Should contain one register range (address and length)
> +
> +Example:
> +
> +	flow-controller@60007000 {
> +		compatible = "nvidia,tegra20-flowctrl";
> +		reg = <0x60007000 0x1000>;
> +	};

The bindings all have the same structure. Can we collapse them all into
this one file and just list all the valid compatible values and say pick
one?

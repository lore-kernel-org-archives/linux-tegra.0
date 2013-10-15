From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 04/13] ARM: tegra: Add MIPI calibration DT entries
 for Tegra114
Date: Tue, 15 Oct 2013 14:41:44 -0600
Message-ID: <525DA888.2060800@wwwdotorg.org>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com> <1381850883-12722-5-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-5-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/15/2013 09:27 AM, Thierry Reding wrote:
> Add a device node for the MIPI calibration block on Tegra114. There is
> no need to disable it by default because it only enables the clock while
> performing calibration and therefore shouldn't be consuming any power
> when unused.

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

> +	mipi: mipi {
> +		compatible = "nvidia,tegra114-mipi";
> +		reg = <0x700e3000 0x100>;
> +		clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>;
> +		#calibrate-cells = <1>;
> +	};

Do you have a link to the binding documentation for this? I'm still in
the dark re: why there's a need for #calibrate-cells at all. It seems
like this should be some internal implementation detail of the Tegra
DC/..., or implicit based on the compatible value (if cell count
changes, just rev the compatible value; it's not like this is a generic
service for loosely coupled drivers).

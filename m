From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] ARM: tegra124: pmu support
Date: Tue, 16 Jun 2015 00:45:08 +0100
Message-ID: <557F6384.5030207@nvidia.com>
References: <1434393968-1105-1-git-send-email-khuey@kylehuey.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434393968-1105-1-git-send-email-khuey@kylehuey.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kyle Huey <me@kylehuey.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyle Huey <khuey@kylehuey.com>
List-Id: linux-tegra@vger.kernel.org


On 15/06/15 19:46, Kyle Huey wrote:
> This patch modifies the device tree for tegra124 based devices to enable the Cortex A15 PMU.  The interrupt numbers are taken from NVIDIA TRM DP-06905-001_v03p.  This patch was tested on a Jetson TK1.
> 
> Signed-off-by: Kyle Huey <khuey@kylehuey.com>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index 4be06c6..d966d4e 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -906,16 +906,24 @@
>  
>  		cpu@3 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a15";
>  			reg = <3>;
>  		};
>  	};
>  
> +	pmu {
> +		compatible = "arm,cortex-a15-pmu";
> +		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
>  	thermal-zones {
>  		cpu {
>  			polling-delay-passive = <1000>;
>  			polling-delay = <1000>;
>  
>  			thermal-sensors =
>  				<&soctherm TEGRA124_SOCTHERM_SENSOR_CPU>;
>  		};
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Jon

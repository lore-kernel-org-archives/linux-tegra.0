From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V3 4/6] ARM: tegra: Add Tegra30 GMI support
Date: Thu, 3 Nov 2016 10:15:57 +0000
Message-ID: <d1c2fe5d-fb20-459a-2f85-95df8fb777a2@nvidia.com>
References: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
 <1477576872-2665-5-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1477576872-2665-5-git-send-email-mirza.krak@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mirza Krak <mirza.krak@gmail.com>, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: gnurou@gmail.com, linux@armlinux.org.uk, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 27/10/16 15:01, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>
> Add a device node for the GMI controller found on Tegra30.
>
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> ---
>
> Changes in v2:
> - added address-cells, size-cells and ranges properties
>
> Changes in v3:
> - no changes
>
>  arch/arm/boot/dts/tegra30.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> index 5030065..bbb1c00 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -439,6 +439,19 @@
>  		status = "disabled";
>  	};
>
> +	gmi@70009000 {
> +		compatible = "nvidia,tegra30-gmi";
> +		reg = <0x70009000 0x1000>;
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0x48000000 0x7ffffff>;
> +		clocks = <&tegra_car TEGRA30_CLK_NOR>;
> +		clock-names = "gmi";
> +		resets = <&tegra_car 42>;
> +		reset-names = "gmi";
> +		status = "disabled";
> +	};
> +

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

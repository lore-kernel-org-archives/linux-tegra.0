From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v3 01/15] dt-bindings: soc: tegra-pmc: Add Tegra PMC
 clock bindings
Date: Fri, 6 Dec 2019 19:58:00 +0100
Message-ID: <20191206185800.GB20259@qmqm.qmqm.pl>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1575600535-26877-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh-dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms-renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 05, 2019 at 06:48:41PM -0800, Sowjanya Komatineni wrote:
> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 clocks and each of
> these clocks has mux and a gate as a part of PMC controller.
[...]
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
[...]
> +Clock consumer example:
> +	host1x@50000000 {
> +		...
> +		vi@54080000 {
> +			...
> +			assigned-clocks = <&pmc TEGRA_PMC_CLK_OUT_3_MUX>;
> +			assigned-clock-parents = <&tegra_car TEGRA210_CLK_EXTERN3>;
> +		};
> +		...
> +	};
> +	...
> +	i2c@7000c500 {
> +		cam_sensor {
> +			...
> +			clocks = <&pmc TEGRA_PMC_CLK_OUT_3>;
> +			clock-names = "mclk";
> +			...
> +		};
> +	};

The assigned-clocks should be in the cam_sensor node, unless vi device
also uses the clock.

Best Regards,
Micha³ Miros³aw

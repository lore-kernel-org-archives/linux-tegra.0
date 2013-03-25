From: Prashant Gaikwad <pgaikwad@nvidia.com>
Subject: Re: [PATCH v8 10/14] ARM: tegra: Define Tegra114 CAR binding
Date: Mon, 25 Mar 2013 16:45:47 +0530
Message-ID: <515031E3.40007@nvidia.com>
References: <1363956029-31873-1-git-send-email-pdeschrijver@nvidia.com> <1363956029-31873-11-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1363956029-31873-11-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@wwwdotorg.org>, Russell King <linux@arm.linux.org.uk>, Simon Glass <sjg@chromium.org>, Rhyland Klein <rklein@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Hiroshi Doyu <hdoyu@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Andrew Chew <AChew@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 22 March 2013 06:09 PM, Peter De Schrijver wrote:
> The device tree binding models Tegra114 CAR (Clock And Reset) as a single
> monolithic clock provider.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---

<snip>

> +  263	cclk_lp
> +  264	dfll_ref
> +  265	dfll_soc
> +

Peter,

Please remove following clock IDs from binding.

> +Mux clocks
> +
> +  300	audio0_mux
> +  301	audio1_mux
> +  302	audio2_mux
> +  303	audio3_mux
> +  304	audio4_mux
> +  305	spdif_mux
> +  306	clk_out_1_mux
> +  307	clk_out_2_mux
> +  308	clk_out_3_mux
> +  309	dsia_mux
> +  310	dsib_mux
> +
> +Example SoC include file:
> +
> +/ {
> +	tegra_car: clock {
> +		compatible = "nvidia,tegra114-car";
> +		reg = <0x60006000 0x1000>;
> +		#clock-cells = <1>;
> +	};
> +
> +	usb@c5004000 {
> +		clocks = <&tegra_car 58>; /* usb2 */
> +	};
> +};
> +
> +Example board file:
> +
> +/ {
> +	clocks {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		osc: clock@0 {
> +			compatible = "fixed-clock";
> +			reg = <0>;
> +			#clock-cells = <0>;
> +			clock-frequency = <12000000>;
> +		};
> +
> +		clk_32k: clock@1 {
> +			compatible = "fixed-clock";
> +			reg = <1>;
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +		};
> +	};
> +
> +	&tegra_car {
> +		clocks = <&clk_32k> <&osc>;
> +	};
> +};


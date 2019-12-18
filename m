From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 17/19] ARM: tegra: Update sound node clocks in device
 tree
Date: Wed, 18 Dec 2019 10:47:44 +0300
Message-ID: <3dd0e953-220a-e265-8a12-aa68682aa9f0@gmail.com>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-18-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576613046-17159-18-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.12.2019 23:04, Sowjanya Komatineni пишет:
> clk_out_1, clk_out_2, and clk_out_3 are part of Tegra PMC block
> and are moved from clock driver to pmc driver with pmc as clock
> provider.
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
> 	t=1576613055; bh=aZWp4sScdv8qprM+UpGS0w1DX7YelR50gFqoThf23X4=;
> 	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
> 	 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
> 	 Content-Type;
> 	b=p9EmVtuTvJK6owqo0lmnZnAvftCWc6+7Mkp/Ks9y26tKN5c4jU+I+YEAaMWoHuzd+
> 	 7n0vS98WNMGomj19IUXoaH49IeTgPAlqOkU57IIiL2qEnX3sYNYpl/rCRUIs7vd33t
> 	 LSn8tQeu9Lz+Yfl8hvXcN3sdxRQOEPDYwzWG+tVy1FCnwouTHSfBhgado2Tx/9cWgi
> 	 HlSWkzjvodag7mAmZtLCl5P4J+oVEJnpYnjSZKNojqszn8u651ErvnVI/VbhZwQ0G5
> 	 Yg8kEr8YECPk2L4MXUe8J2YmKtNyZaADOkUhjyxqMjZ2bGrB9RDm5dKNFxkWuEeSpb
> 	 U3nMi7MNcvBmQ==
> 
> clk_out_1 is dedicated for audio mclk on Tegra30 through Tegra210.
> 
> This patch updates device tree sound node to use clk_out_1 from
> pmc provider as mclk and uses assigned-clock properties to specify
> clock parents for clk_out_1 and extern1.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts      | 7 ++++++-
>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 7 ++++++-
>  arch/arm/boot/dts/tegra124-apalis.dtsi      | 7 ++++++-
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts   | 7 ++++++-
>  arch/arm/boot/dts/tegra124-nyan.dtsi        | 7 ++++++-
>  arch/arm/boot/dts/tegra124-venice2.dts      | 7 ++++++-
>  arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi  | 7 ++++++-
>  arch/arm/boot/dts/tegra30-apalis.dtsi       | 7 ++++++-
>  arch/arm/boot/dts/tegra30-beaver.dts        | 7 ++++++-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi       | 7 ++++++-
>  arch/arm/boot/dts/tegra30-colibri.dtsi      | 7 ++++++-
>  11 files changed, 66 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
> index 97a5c3504bbe..c1914b590f5c 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -1296,7 +1296,12 @@
>  
>  		clocks = <&tegra_car TEGRA114_CLK_PLL_A>,
>  			 <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
> -			 <&tegra_car TEGRA114_CLK_EXTERN1>;
> +			 <&pmc TEGRA_PMC_CLK_OUT_1>;
>  		clock-names = "pll_a", "pll_a_out0", "mclk";
> +
> +		assigned-clocks = <&tegra_car TEGRA114_CLK_EXTERN1>,
> +				  <&pmc TEGRA_PMC_CLK_OUT_1>;

Won't hurt to add a blank line here, similarly in other places below.

> +		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
> +					 <&tegra_car TEGRA114_CLK_EXTERN1>;

[snip]

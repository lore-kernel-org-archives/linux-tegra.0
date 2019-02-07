From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 21:50:10 +0300
Message-ID: <e09062b7-9c74-6aee-477a-72fb72bbd5d3@gmail.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

06.02.2019 22:16, Sowjanya Komatineni пишет:
> @@ -920,6 +1238,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>  	.has_mst_fifo = false,
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = false,
> +	.has_apb_dma = true,
>  };
>  
>  static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
> @@ -935,6 +1254,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>  	.has_mst_fifo = false,
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = false,
> +	.has_apb_dma = true,
>  };
>  
>  static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
> @@ -950,6 +1270,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>  	.has_mst_fifo = false,
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = true,
> +	.has_apb_dma = true,
>  };
>  
>  static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
> @@ -965,6 +1286,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
>  	.has_mst_fifo = false,
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = true,
> +	.has_apb_dma = true,
>  };
>  
>  static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
> @@ -980,6 +1302,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
>  	.has_mst_fifo = false,
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = true,
> +	.has_apb_dma = true,
>  };

T186 is missed here.

>  
>  static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
> @@ -995,6 +1318,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>  	.has_mst_fifo = true,
>  	.quirks = &tegra194_i2c_quirks,
>  	.supports_bus_clear = true,
> +	.has_apb_dma = false,
>  };

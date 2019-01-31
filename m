From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V7 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 21:15:15 +0300
Message-ID: <7ddf46a8-ae98-c567-6d3d-8155989effb5@gmail.com>
References: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
 <1548864096-20974-3-git-send-email-skomatineni@nvidia.com>
 <1f10cb76-59a1-93c5-ae03-ccc0cd8db1a3@gmail.com>
 <20190131120640.GF23438@ulmo>
 <0e832fa6-f143-7b24-2685-b88a55e77e51@gmail.com>
 <20190131144344.GP23438@ulmo>
 <bdb5ab9f-b047-6b9e-696a-8d6ef4065c77@gmail.com>
 <6c2909cb-f31c-921d-8449-79ec77c02d9b@gmail.com>
 <48135b67-eed7-9a9d-de3e-e400e8ef8176@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <48135b67-eed7-9a9d-de3e-e400e8ef8176@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.01.2019 21:08, Dmitry Osipenko пишет:
> 31.01.2019 19:55, Dmitry Osipenko пишет:
> +config I2C_TEGRA_DMA_SUPPORT
> +	bool "NVIDIA Tegra internal I2C controller DMA support"
> +	depends on I2C_TEGRA
> +	depends on TEGRA20_APB_DMA && ARCH_TEGRA_2x_SOC
> +	depends on TEGRA20_APB_DMA && ARCH_TEGRA_3x_SOC
> +	depends on TEGRA20_APB_DMA && ARCH_TEGRA_114_SOC
> +	depends on TEGRA20_APB_DMA && ARCH_TEGRA_124_SOC
> +	depends on TEGRA20_APB_DMA && ARCH_TEGRA_210_SOC
> +	help
> +	  If you say yes to this option, DMA engine integration support will
> +	  be included for the I2C controller embedded in NVIDIA Tegra SOCs
> +

Actually, seems should be like that:

config I2C_TEGRA_DMA_SUPPORT
	bool "NVIDIA Tegra internal I2C controller DMA support"
	depends on I2C_TEGRA
	depends on (TEGRA20_APB_DMA && ARCH_TEGRA_2x_SOC) || \
		   (TEGRA20_APB_DMA && ARCH_TEGRA_3x_SOC) || \
		   (TEGRA20_APB_DMA && ARCH_TEGRA_114_SOC) || \
		   (TEGRA20_APB_DMA && ARCH_TEGRA_124_SOC) || \
		   (TEGRA20_APB_DMA && ARCH_TEGRA_210_SOC)
	help
	  If you say yes to this option, DMA engine integration support will
	  be included for the I2C controller embedded in NVIDIA Tegra SOCs 

But you got the idea.

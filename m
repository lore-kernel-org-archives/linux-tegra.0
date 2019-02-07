From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 2/5] i2c: tegra: add bus clear Master Support
Date: Thu, 7 Feb 2019 21:26:04 +0300
Message-ID: <bc380ff9-48e2-d938-279b-4022c6862c66@gmail.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549480569-24860-2-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

06.02.2019 22:16, Sowjanya Komatineni пишет:
> +		reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
> +		if (!(reg & I2C_BC_STATUS)) {
> +			dev_err(i2c_dev->dev,
> +				"Un-recovered arbitration lost\n");

Minor nit: let's keep messages starting with the lowercase letter everywhere, for consistency

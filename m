From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Thu, 9 Apr 2020 22:00:13 +0300
Message-ID: <7b2f8a7c-94f1-08d0-b0ce-c61f4eb0a436@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200409175238.3586487-10-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static void tegra210_emc_debugfs_init(struct tegra210_emc *emc)
> +{
> +	struct device *dev = emc->dev;
> +	unsigned int i;
> +	int err;
> +
> +	emc->debugfs.min_rate = ULONG_MAX;
> +	emc->debugfs.max_rate = 0;
> +
> +	for (i = 0; i < emc->num_timings; i++) {
> +		if (emc->timings[i].rate * 1000UL < emc->debugfs.min_rate)
> +			emc->debugfs.min_rate = emc->timings[i].rate * 1000UL;
> +
> +		if (emc->timings[i].rate * 1000UL > emc->debugfs.max_rate)
> +			emc->debugfs.max_rate = emc->timings[i].rate * 1000UL;
> +	}
> +
> +	if (!emc->num_timings) {
> +		emc->debugfs.min_rate = clk_get_rate(emc->clk);
> +		emc->debugfs.max_rate = emc->debugfs.min_rate;
> +	}
> +
> +	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
> +				 emc->debugfs.max_rate);
> +	if (err < 0) {
> +		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
> +			emc->debugfs.min_rate, emc->debugfs.max_rate,
> +			emc->clk);
> +		return;
> +	}
> +
> +	emc->debugfs.root = debugfs_create_dir("emc", NULL);
> +	if (!emc->debugfs.root) {
> +		dev_err(dev, "failed to create debugfs directory\n");
> +		return;
> +	}
> +
> +	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root, emc,
> +			    &tegra210_emc_debug_available_rates_fops);
> +	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
> +			    emc, &tegra210_emc_debug_min_rate_fops);
> +	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
> +			    emc, &tegra210_emc_debug_max_rate_fops);

I assume you used the checkpatch before sending the patches, no?

I sent out a patch recently to make the permissions readable, please
take a look if you haven't seen it yet.

https://patchwork.ozlabs.org/patch/1254301/

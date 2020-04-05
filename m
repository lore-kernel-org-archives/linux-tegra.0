From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sun, 5 Apr 2020 22:45:56 +0300
Message-ID: <3033ce67-fd77-f646-71b5-3a9671341a87@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.04.2020 04:25, Sowjanya Komatineni пишет:
...
> +static int tegra_vi_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct tegra_vi *vi;
> +	int ret;
> +
> +	vi = kzalloc(sizeof(*vi), GFP_KERNEL);

devm_kzalloc()?

> +	if (!vi)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	vi->iomem = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource()?

> +	if (IS_ERR(vi->iomem)) {
> +		ret = PTR_ERR(vi->iomem);
> +		goto cleanup;
> +	}
> +
> +	vi->soc = of_device_get_match_data(&pdev->dev);

This can't fail because match already happened.

> +	if (!vi->soc) {
> +		ret = -ENODATA;
> +		goto cleanup;
> +	}
> +
> +	vi->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(vi->clk)) {
> +		ret = PTR_ERR(vi->clk);
> +		dev_err(&pdev->dev, "failed to get vi clock: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	vi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
> +	if (IS_ERR(vi->vdd)) {
> +		ret = PTR_ERR(vi->vdd);
> +		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	if (!pdev->dev.pm_domain) {
> +		ret = -ENOENT;
> +		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"failed to populate vi child device: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	vi->dev = &pdev->dev;
> +	vi->ops = vi->soc->ops;
> +	platform_set_drvdata(pdev, vi);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	/* initialize host1x interface */
> +	INIT_LIST_HEAD(&vi->client.list);
> +	vi->client.ops = &vi_client_ops;
> +	vi->client.dev = &pdev->dev;
> +
> +	ret = host1x_client_register(&vi->client);
> +	if (ret < 0) {
> +		dev_err(vi->dev,
> +			"failed to register host1x client: %d\n", ret);
> +		ret = -ENODEV;
> +		goto rpm_disable;
> +	}
> +
> +	return 0;
> +
> +rpm_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	of_platform_depopulate(vi->dev);
> +cleanup:
> +	kfree(vi);
> +	return ret;
> +}
> +
> +static int tegra_vi_remove(struct platform_device *pdev)
> +{
> +	struct tegra_vi *vi = platform_get_drvdata(pdev);
> +	int err;
> +
> +	pm_runtime_disable(vi->dev);
> +
> +	err = host1x_client_unregister(&vi->client);
> +	if (err < 0) {
> +		dev_err(vi->dev,
> +			"failed to unregister host1x client: %d\n", err);
> +		return err;
> +	}

The removal order should be opposite to the registration order.

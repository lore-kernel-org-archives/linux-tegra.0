From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sun, 5 Apr 2020 22:57:52 +0300
Message-ID: <4545a0f5-8f52-37d3-7237-8d8dcb846926@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <3033ce67-fd77-f646-71b5-3a9671341a87@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3033ce67-fd77-f646-71b5-3a9671341a87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

05.04.2020 22:45, Dmitry Osipenko пишет:
> 04.04.2020 04:25, Sowjanya Komatineni пишет:
> ...
>> +static int tegra_vi_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res;
>> +	struct tegra_vi *vi;
>> +	int ret;
>> +
>> +	vi = kzalloc(sizeof(*vi), GFP_KERNEL);
> 
> devm_kzalloc()?
> 
>> +	if (!vi)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	vi->iomem = devm_ioremap_resource(&pdev->dev, res);
> 
> devm_platform_ioremap_resource()?
> 
>> +	if (IS_ERR(vi->iomem)) {
>> +		ret = PTR_ERR(vi->iomem);
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->soc = of_device_get_match_data(&pdev->dev);
> 
> This can't fail because match already happened.
> 
>> +	if (!vi->soc) {
>> +		ret = -ENODATA;
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(vi->clk)) {
>> +		ret = PTR_ERR(vi->clk);
>> +		dev_err(&pdev->dev, "failed to get vi clock: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
>> +	if (IS_ERR(vi->vdd)) {
>> +		ret = PTR_ERR(vi->vdd);
>> +		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	if (!pdev->dev.pm_domain) {
>> +		ret = -ENOENT;
>> +		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev,
>> +			"failed to populate vi child device: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->dev = &pdev->dev;
>> +	vi->ops = vi->soc->ops;
>> +	platform_set_drvdata(pdev, vi);
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	/* initialize host1x interface */
>> +	INIT_LIST_HEAD(&vi->client.list);
>> +	vi->client.ops = &vi_client_ops;
>> +	vi->client.dev = &pdev->dev;
>> +
>> +	ret = host1x_client_register(&vi->client);
>> +	if (ret < 0) {
>> +		dev_err(vi->dev,
>> +			"failed to register host1x client: %d\n", ret);
>> +		ret = -ENODEV;
>> +		goto rpm_disable;
>> +	}
>> +
>> +	return 0;
>> +
>> +rpm_disable:
>> +	pm_runtime_disable(&pdev->dev);
>> +	of_platform_depopulate(vi->dev);
>> +cleanup:
>> +	kfree(vi);
>> +	return ret;
>> +}
>> +
>> +static int tegra_vi_remove(struct platform_device *pdev)
>> +{
>> +	struct tegra_vi *vi = platform_get_drvdata(pdev);
>> +	int err;
>> +
>> +	pm_runtime_disable(vi->dev);
>> +
>> +	err = host1x_client_unregister(&vi->client);
>> +	if (err < 0) {
>> +		dev_err(vi->dev,
>> +			"failed to unregister host1x client: %d\n", err);
>> +		return err;
>> +	}
> 
> The removal order should be opposite to the registration order.
> 

All the same to the tegra_csi, btw.

Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D86111712;
	Tue, 10 Jun 2025 03:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527424; cv=none; b=gyAysiA0grshak9BOmf83yWTEmAh4xeXgbSUhQIfI0d16Ta8UUPGSiZPSo+TYE6YMaLZqeVLpaIXgDQhbddVNw2dJQY5fBzAf14FZQH2TqzTKicFnKplPRZ+q+t3AT5+Q0/yai7Nx5Ri9norUqZD4c/Tb+6nc+Ah+3V9tx0i2xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527424; c=relaxed/simple;
	bh=VXsAjM2QXcPXbvD1ITfVpephKRy63w8SnaJkJK382CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrADWs8i0XUcxZGV0VVQRPF7PeJ7yeYO/Y5srvV/pVSaaV6hyhwPJqml4tblljmeFg+81U2SxtML8QbNtm0KaFYP1Iat0uwQ3l47yHRmg+TVdZBex689RDcgM9LAOUentkwoqXbouU/jr7mBG+XZc7apGen/69+6ELFYdzwd/H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=1MKtmw0s; arc=none smtp.client-ip=91.232.154.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="1MKtmw0s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=affox4Kq1bjPy2ctrshBc/luTilar3kM1+7WxMRnXhk=; b=1MKtmw0stbFdFaEP07QMflhn5v
	6OzXDVRpnyoJFWyaRE5BuY04kss9NGiP7nSQm3uVJXcfddytQaiUeWv8mwC4bPM3XBT3yzJqgiPiT
	BFy5gBGEBbn3tvx0yGbwaUsJH6Tz9Fg5IPx7PIFcBVfY+VI50hMDO3WUK5MdErdFpFDSurf1q+Ej3
	EGjryscY+F9vGMcfXvECefEVwYz3hIEq5cry6bUn7zuyzsrzplU14AsJlLb+1w7kPDYfNas7yGuUM
	ozghhO/5e75yqV6LNpPvB1hldZ20HfnTMu8QdZCHuYjnjcYXxLxQFm4CrzHjBl/dL0YHNwodR1hvS
	GhEY2/cg==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1uOpe1-0077Zu-0r;
	Tue, 10 Jun 2025 06:27:25 +0300
Message-ID: <811ad406-4afb-45c5-9783-683779f874cc@kapsi.fi>
Date: Tue, 10 Jun 2025 12:26:07 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/tegra: Add NVJPG driver
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-1-5f2c36feeb39@tecnico.ulisboa.pt>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20250606-diogo-nvjpg-v1-1-5f2c36feeb39@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

On 6/6/25 7:45 PM, Diogo Ivo wrote:
> Add support for booting and using NVJPG on Tegra210 to the Host1x
> and TegraDRM drivers. This driver only supports the new TegraDRM uAPI.

Hello Diogo -- I'm happy to see this driver!

> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   drivers/gpu/drm/tegra/Makefile |   1 +
>   drivers/gpu/drm/tegra/drm.c    |   2 +
>   drivers/gpu/drm/tegra/drm.h    |   1 +
>   drivers/gpu/drm/tegra/nvjpg.c  | 379 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 383 insertions(+)
> ...
> +
> +static __maybe_unused int nvjpg_runtime_resume(struct device *dev)
> +{
> +	struct nvjpg *nvjpg = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = clk_prepare_enable(nvjpg->clk);
> +	if (err < 0)
> +		return err;
> +
> +	usleep_range(20, 30);
> +
> +	if (nvjpg->rst) {
> +		err = reset_control_acquire(nvjpg->rst);
> +		if (err < 0) {
> +			dev_err(dev, "failed to acquire reset: %d\n", err);
> +			goto disable_clk;
> +		}
> +
> +		err = reset_control_deassert(nvjpg->rst);
> +		if (err < 0) {
> +			dev_err(dev, "failed to deassert reset: %d\n", err);
> +			goto release_reset;
> +		}
> +
> +		usleep_range(20, 30);
> +	}

Do we need this manual reset handling? NVJPG is only on T210+ where the 
power domain code handles the reset as well. Did you run into any issues 
with it?

(As a note, the reset_control_* functions are no-ops on a NULL reset. So 
the 'if' here is unnecessary.)

> +
> +	err = nvjpg_load_falcon_firmware(nvjpg);
> +	if (err < 0)
> +		goto assert_reset;
> +
> +	err = falcon_boot(&nvjpg->falcon);
> +	if (err < 0)
> +		goto assert_reset;
> +
> +	return 0;
> +
> +assert_reset:
> +	reset_control_assert(nvjpg->rst);
> +release_reset:
> +	reset_control_release(nvjpg->rst);
> +disable_clk:
> +	clk_disable_unprepare(nvjpg->clk);
> +	return err;
> +}
> ...
> +
> +static int nvjpg_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvjpg *nvjpg;
> +	int err;
> +
> +	/* inherit DMA mask from host1x parent */
> +	err = dma_coerce_mask_and_coherent(dev, *dev->parent->dma_mask);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
> +		return err;
> +	}
> +
> +	nvjpg = devm_kzalloc(dev, sizeof(*nvjpg), GFP_KERNEL);
> +	if (!nvjpg)
> +		return -ENOMEM;
> +
> +	nvjpg->config = of_device_get_match_data(dev);
> +
> +	nvjpg->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);

This can be devm_platform_ioremap_resource -- slightly simpler.

> +	if (IS_ERR(nvjpg->regs))
> +		return PTR_ERR(nvjpg->regs);
> +
> +	nvjpg->rst = devm_reset_control_get_exclusive_released(&pdev->dev, "nvjpg");
> +	if (IS_ERR(nvjpg->rst)) {
> +		err = PTR_ERR(nvjpg->rst);
> +
> +		if (err != -EBUSY || WARN_ON(!pdev->dev.pm_domain)) {
> +			dev_err(&pdev->dev, "failed to get reset control: %d\n",
> +				err);
> +			return err;
> +		}
> +
> +		/*
> +		 * At this point, the reset control is most likely being used
> +		 * by the generic power domain implementation. With any luck
> +		 * the power domain will have taken care of resetting the SOR
> +		 * and we don't have to do anything.
> +		 */
> +		nvjpg->rst = NULL;
> +	}

I see you've taken this from sor.c, but I think it should be 
unnecessary. I imagine the code in sor.c is overcomplicated as well, 
maybe because we used not to have the power domain implementation.

> +
> +	nvjpg->clk = devm_clk_get(dev, "nvjpg");
> +	if (IS_ERR(nvjpg->clk)) {
> +		dev_err(&pdev->dev, "failed to get clock\n");
> +		return PTR_ERR(nvjpg->clk);
> +	}

Probably a good idea to set the clock rate to max (see vic.c).

> +
> +	nvjpg->falcon.dev = dev;
> +	nvjpg->falcon.regs = nvjpg->regs;
> +
> +	err = falcon_init(&nvjpg->falcon);
> +	if (err < 0)
> +		return err;
> +
> +	platform_set_drvdata(pdev, nvjpg);
> +
> +	INIT_LIST_HEAD(&nvjpg->client.base.list);
> +	nvjpg->client.base.ops = &nvjpg_client_ops;
> +	nvjpg->client.base.dev = dev;
> +	nvjpg->client.base.class = HOST1X_CLASS_NVJPG;
> +	nvjpg->dev = dev;
> +
> +	INIT_LIST_HEAD(&nvjpg->client.list);
> +	nvjpg->client.version = nvjpg->config->version;
> +	nvjpg->client.ops = &nvjpg_ops;
> +
> +	err = host1x_client_register(&nvjpg->client.base);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register host1x client: %d\n", err);
> +		goto exit_falcon;
> +	}
> +
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 500);
> +	devm_pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +exit_falcon:
> +	falcon_exit(&nvjpg->falcon);
> +
> +	return err;
> +}
> +
> +static void nvjpg_remove(struct platform_device *pdev)
> +{
> +	struct nvjpg *nvjpg = platform_get_drvdata(pdev);
> +
> +	host1x_client_unregister(&nvjpg->client.base);
> +	falcon_exit(&nvjpg->falcon);
> +}
> +
> +static const struct dev_pm_ops nvjpg_pm_ops = {
> +	SET_RUNTIME_PM_OPS(nvjpg_runtime_suspend, nvjpg_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +};

There are modern, improved variants with no SET_ prefix.

Thanks,
Mikko

> +
> +struct platform_driver tegra_nvjpg_driver = {
> +	.driver = {
> +		.name = "tegra-nvjpg",
> +		.of_match_table = tegra_nvjpg_of_match,
> +		.pm = &nvjpg_pm_ops
> +	},
> +	.probe = nvjpg_probe,
> +	.remove = nvjpg_remove,
> +};
> +
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
> +MODULE_FIRMWARE(NVIDIA_TEGRA_210_NVJPG_FIRMWARE);
> +#endif
> 


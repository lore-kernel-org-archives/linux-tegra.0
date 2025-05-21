Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824E021CA04;
	Wed, 21 May 2025 09:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818857; cv=none; b=A+cmHTF+aHbzMQv+Uue+1tj/caxlXGUdJnQj86rPsRdud4V5D1CThASr2z3VozAokVzp0JmgGiBdXpXpPyNey1puisrlkTHZxKEYIxQk7oP7ZGFsNZDQrhZth6pXsKibPjqH8RK/o1uRhOGJdaiiah753nbDoFe8FEhOP9qdxXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818857; c=relaxed/simple;
	bh=tYRJUOPfNGsvrTGCxbsmOXCb/gzW8sQ71iGyz2Pu0GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAEfMLuDyKUCAXTT0DsghvkfD2ZZFknGJ0DoqNJIdb2e1tA3O33xUabIYoLL3cclEccERNLaMjZ/2K/KAT6H3/COO17HKbqnS7GW2AZXmiVctnEBd6q0vuW3E+unOserqd8uEBIPH8UZ3IHSFhaIFAmgGQNYRwlK/DNtPRlIHlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0cq9G0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0cq9G0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D64EC4CEE4;
	Wed, 21 May 2025 09:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818856;
	bh=tYRJUOPfNGsvrTGCxbsmOXCb/gzW8sQ71iGyz2Pu0GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0cq9G0s8SFScGuuBh9JbnvFXY//UN+Qd8WClmF5MqvQQcYjfEZ9EYccKZXvLzun0
	 hNC+C/wrabE17Ds8v16dKMTxhxwf9FWY0oqg4oWRgALSNSGR1WlXBbIwELavAP/QQD
	 DIvYmvA1U+GlzGAhIRXc+1KECRpsuk1YsE1l6xTVEObg7B27bClUNFJbjMFcVxX0Ov
	 ot5gDPkE7JRJQd/RLyCNgQNxSMsdrFfSXml1MNnALRM2HtZwFwWbUJJCQ9stPKDoXH
	 pnlfQ0fDREeMlN11H80S5rYO6Fl0k+9tOtzem2+VR/d4cvM/6SaT3JKO1DgbTW3X99
	 U5dpGqjCk++Yw==
Date: Wed, 21 May 2025 11:14:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: jonathanh@nvidia.com, lee@kernel.org, robh@kernel.org, 
	alexandre.belloni@bootlin.com, thierry.reding@gmail.com, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 4/6] rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
Message-ID: <20250521-dazzling-myrtle-flounder-a9e57d@kuoka>
References: <20250520090832.3564104-1-shgarg@nvidia.com>
 <20250520090832.3564104-5-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520090832.3564104-5-shgarg@nvidia.com>

On Tue, May 20, 2025 at 09:08:30AM GMT, Shubhi Garg wrote:
> Add support for NVIDIA VRS (Voltage Regulator Specification) Power
> Sequencer RTC device driver. This RTC can be used to get/set system
> time, retain system time across boot, wake system from suspend and
> shutdown state.
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v2:
> - removed regmap struct since it is not required
> - removed rtc_map definition to directly use register definition
> - removed unnecessary dev_err logs
> - fixed dev_err logs to dev_dbg
> - used rtc_lock/unlock in irq handler
> - changed RTC allocation and register APIs as per latest kernel
> - removed nvvrs_rtc_remove function since it's not required
> 
>  drivers/rtc/Kconfig               |  10 +
>  drivers/rtc/Makefile              |   1 +
>  drivers/rtc/rtc-nvidia-vrs-pseq.c | 456 ++++++++++++++++++++++++++++++
>  3 files changed, 467 insertions(+)
>  create mode 100644 drivers/rtc/rtc-nvidia-vrs-pseq.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 838bdc138ffe..3b6dc27a50af 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-max77686.
>  
> +config RTC_DRV_NVVRS_PSEQ
> +	tristate "NVIDIA VRS Power Sequencer RTC device"
> +	depends on MFD_NVVRS_PSEQ

I bet this fails when MFD_NVVRS_PSEQ is a module.

> +	help
> +	  If you say yes here you will get support for the battery backed RTC device
> +	  of NVIDIA VRS Power Sequencer. The RTC is connected via I2C interface and
> +	  supports alarm functionality.
> +	  This driver can also be built as a module. If so, the module will be called
> +	  rtc-nvidia-vrs-pseq.
> +

...

> +static int nvvrs_rtc_probe(struct platform_device *pdev)
> +{
> +	struct nvvrs_rtc_info *info;
> +	struct device *parent;
> +	struct i2c_client *client;
> +	int ret;
> +
> +	info = devm_kzalloc(&pdev->dev, sizeof(struct nvvrs_rtc_info), GFP_KERNEL);

sizeof(*)

> +	if (!info)
> +		return -ENOMEM;
> +
> +	mutex_init(&info->lock);
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to get irq\n");

return dev_err_probe

> +		return ret;
> +	}
> +	info->rtc_irq = ret;
> +
> +	info->dev = &pdev->dev;
> +	parent = info->dev->parent;
> +	client = to_i2c_client(parent);
> +	client->flags |= I2C_CLIENT_PEC;
> +	i2c_set_clientdata(client, info);
> +	info->client = client;
> +	info->rtc_irq_chip = &nvvrs_rtc_irq_chip;
> +	platform_set_drvdata(pdev, info);
> +
> +	/* Allocate RTC device */
> +	info->rtc_dev = devm_rtc_allocate_device(info->dev);
> +	if (IS_ERR(info->rtc_dev))
> +		return PTR_ERR(info->rtc_dev);
> +
> +	info->rtc_dev->ops = &nvvrs_rtc_ops;
> +	info->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	info->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
> +
> +	ret = devm_request_threaded_irq(info->dev, info->rtc_irq, NULL,
> +					nvvrs_rtc_irq_handler, 0, "rtc-alarm", info);
> +	if (ret < 0)
> +		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
> +			info->rtc_irq, ret);
> +
> +	/* RTC as a wakeup source */
> +	device_init_wakeup(info->dev, true);

You leak wakeup.

> +
> +	return devm_rtc_register_device(info->rtc_dev);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int nvvrs_rtc_suspend(struct device *dev)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	if (device_may_wakeup(dev)) {
> +		/* Set RTC_WAKE bit for auto wake system from suspend state */
> +		ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
> +					NVVRS_PSEQ_REG_CTL_2_RTC_WAKE,
> +					NVVRS_PSEQ_REG_CTL_2_RTC_WAKE);
> +		if (ret < 0) {
> +			dev_err(info->dev, "Failed to set RTC_WAKE bit (%d)\n", ret);
> +			return ret;
> +		}
> +
> +		ret = enable_irq_wake(info->rtc_irq);
> +	}
> +
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_resume(struct device *dev)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (device_may_wakeup(dev)) {
> +		/* Clear FORCE_ACT bit */
> +		ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_1,
> +					NVVRS_PSEQ_REG_CTL_1_FORCE_ACT, 0);
> +		if (ret < 0) {
> +			dev_err(info->dev, "Failed to clear FORCE_ACT bit (%d)\n", ret);
> +			return ret;
> +		}
> +
> +		return disable_irq_wake(info->rtc_irq);
> +	}
> +
> +	return 0;
> +}
> +
> +#endif
> +static SIMPLE_DEV_PM_OPS(nvvrs_rtc_pm_ops, nvvrs_rtc_suspend, nvvrs_rtc_resume);
> +
> +static const struct platform_device_id nvvrs_rtc_id[] = {
> +	{ "nvvrs-pseq-rtc", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(platform, nvvrs_rtc_id);
> +
> +static struct platform_driver nvvrs_rtc_driver = {
> +	.driver		= {
> +		.name   = "nvvrs-pseq-rtc",
> +		.pm     = &nvvrs_rtc_pm_ops,
> +	},
> +	.probe		= nvvrs_rtc_probe,
> +	.id_table       = nvvrs_rtc_id,
> +};
> +
> +module_platform_driver(nvvrs_rtc_driver);
> +
> +MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
> +MODULE_DESCRIPTION("NVVRS PSEQ RTC driver");
> +MODULE_LICENSE("GPL");
> \ No newline at end of file

You have patch warnings.

> -- 
> 2.43.0
> 

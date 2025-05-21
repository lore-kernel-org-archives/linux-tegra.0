Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED911A9B4C;
	Wed, 21 May 2025 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818745; cv=none; b=fWvedgIVr6vc4JUeszXtGdNB3krRWYhjBH8+U15tLL3CQEvL75oKgA2ZYYkMl8iXsbfGWcCziLmRQczCSopckP5AwdTsHRAByBka+mbhr20O7GfzFZS6wLz0ddNqgMfkV3X86VQw+cGJ/DKaOVTns8Ciz+oWUCPNU9e2H/jwv2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818745; c=relaxed/simple;
	bh=Y79uDuogax25dTt9+OzgCk6nHYwyKb9v3cGEu2DGz+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayI9SBvhejXJ6F/sULny9WLdLWJ/k5+3qqHk4seLiLQNaY9+xmeFzirVIsDUzmEyut7Qm3eWth5VbUxu/so3yHW0fQ9ExlyfwQJ20fOgC0vaEtUcQrxoNl/iIgImv3uaz9o84qwIpwPiz5GjSNhBq9A0RPR9Uk2IJEtvoRpH+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2ZqpZVY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2ZqpZVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BB7C4CEE4;
	Wed, 21 May 2025 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818744;
	bh=Y79uDuogax25dTt9+OzgCk6nHYwyKb9v3cGEu2DGz+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2ZqpZVY1GHVQvRnH+uS7bAcwOBaeSTumQS66Srfn7xj+j7LlO+ktInrIjSC0n1z5
	 Mop4xRkyEeXpYUd1sXgZA1PbIsxrSoy08anRBx6uhut3Ugb2V/J12aVEKzr6iQXoU0
	 powBgA1aXpH0J0yVHeLMCEfgPYh+09+/x0ld2pEYZ7r5aqAqIFMkeWWlRBGy/54J6I
	 x57UfcllCfGdE5juXSdZwDGxN5215O/VY2Aa92ku1PBKW9mdKIJTRhL4A1LxgRtxRd
	 RzErkNhAdxYQjbOdoP9Auqi2JccH/TZt55kOb9mpyP9IOxad/WzQfqLuDfknrCSIwe
	 +c4rL0NVdPbVA==
Date: Wed, 21 May 2025 11:12:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: jonathanh@nvidia.com, lee@kernel.org, robh@kernel.org, 
	alexandre.belloni@bootlin.com, thierry.reding@gmail.com, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/6] mfd: nvvrs: add NVVRS PSEQ MFD driver
Message-ID: <20250521-observant-wildcat-of-weather-8ecc4e@kuoka>
References: <20250520090832.3564104-1-shgarg@nvidia.com>
 <20250520090832.3564104-4-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520090832.3564104-4-shgarg@nvidia.com>

On Tue, May 20, 2025 at 09:08:29AM GMT, Shubhi Garg wrote:
> Add support for NVIDIA VRS (Voltage Regulator Specification) power
> sequencer device driver. This driver manages ON/OFF and suspend/resume
> power sequencing of system power rails for NVIDIA Tegra234 SoC. It also
> provides 32kHz RTC clock support with backup battery for system timing.
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v2:
> - removed unnecessary error logs
> - changed dev_info to dev_dbg
> - changed dev_err to dev_err_probe
> - fixed "of_match_table" assignment
> 
>  drivers/mfd/Kconfig                 |  12 ++
>  drivers/mfd/Makefile                |   1 +
>  drivers/mfd/nvidia-vrs-pseq.c       | 270 ++++++++++++++++++++++++++++
>  include/linux/mfd/nvidia-vrs-pseq.h | 127 +++++++++++++
>  4 files changed, 410 insertions(+)
>  create mode 100644 drivers/mfd/nvidia-vrs-pseq.c
>  create mode 100644 include/linux/mfd/nvidia-vrs-pseq.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6fb3768e3d71..3144b8f3eb9b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1437,6 +1437,18 @@ config MFD_SC27XX_PMIC
>  	  This driver provides common support for accessing the SC27xx PMICs,
>  	  and it also adds the irq_chip parts for handling the PMIC chip events.
>  
> +config MFD_NVVRS_PSEQ
> +	tristate "NVIDIA Voltage Regulator Specification Power Sequencer"
> +	depends on I2C=y

Why I2C cannot be a module? This is a module.

> +	select MFD_CORE
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	help
> +	  Say Y here to add support for NVIDIA Voltage Regulator Specification
> +	  Power Sequencer. NVVRS_PSEQ supports ON/OFF, suspend/resume sequence of
> +	  system power rails. It provides 32kHz RTC clock support with backup
> +	  battery for system timing.
> +

...

> +static int nvvrs_pseq_irq_clear(void *irq_drv_data)
> +{
> +	struct nvvrs_pseq_chip *chip = (struct nvvrs_pseq_chip *)irq_drv_data;
> +	struct i2c_client *client = chip->client;
> +	u8 reg, val;
> +	unsigned int i;
> +	int ret = 0;
> +
> +	/* Write 1 to clear the interrupt bit in the Interrupt
> +	 * Source Register, writing 0 has no effect, writing 1 to a bit
> +	 * which is already at 0 has no effect
> +	 */
> +
> +	for (i = 0; i < chip->irq_chip->num_regs; i++) {
> +		reg = (u8)(chip->irq_chip->status_base + i);
> +		ret = i2c_smbus_read_byte_data(client, reg);
> +		if (ret) {
> +			val = (u8)ret;
> +			dev_dbg(chip->dev, "Clearing interrupts! Interrupt status reg 0x%02x = 0x%02x\n",
> +				reg, val);

ratelimit

...

> +
> +static int nvvrs_pseq_probe(struct i2c_client *client)
> +{
> +	const struct regmap_config *rmap_config;
> +	struct nvvrs_pseq_chip *nvvrs_chip;
> +	const struct mfd_cell *mfd_cells;
> +	int n_mfd_cells;
> +	int ret;
> +
> +	nvvrs_chip = devm_kzalloc(&client->dev, sizeof(*nvvrs_chip), GFP_KERNEL);
> +	if (!nvvrs_chip)
> +		return -ENOMEM;
> +
> +	/* Set PEC flag for SMBUS transfer with PEC enabled */
> +	client->flags |= I2C_CLIENT_PEC;
> +
> +	i2c_set_clientdata(client, nvvrs_chip);
> +	nvvrs_chip->client = client;
> +	nvvrs_chip->dev = &client->dev;
> +	nvvrs_chip->chip_irq = client->irq;
> +	mfd_cells = nvvrs_pseq_children;
> +	n_mfd_cells = ARRAY_SIZE(nvvrs_pseq_children);
> +	rmap_config = &nvvrs_pseq_regmap_config;
> +	nvvrs_chip->irq_chip = &nvvrs_pseq_irq_chip;
> +
> +	nvvrs_chip->rmap = devm_regmap_init_i2c(client, rmap_config);
> +	if (IS_ERR(nvvrs_chip->rmap)) {
> +		ret = PTR_ERR(nvvrs_chip->rmap);

Useless assignment

> +		return dev_err_probe(nvvrs_chip->dev, ret,
> +				     "Failed to initialise regmap\n");
> +	}

Drop }

> +
> +	ret = nvvrs_pseq_vendor_info(nvvrs_chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	nvvrs_pseq_irq_chip.irq_drv_data = nvvrs_chip;
> +	ret = devm_regmap_add_irq_chip(nvvrs_chip->dev, nvvrs_chip->rmap, client->irq,
> +				       IRQF_ONESHOT | IRQF_SHARED, 0,
> +				       &nvvrs_pseq_irq_chip,
> +				       &nvvrs_chip->irq_data);
> +	if (ret < 0) {
> +		return dev_err_probe(nvvrs_chip->dev, ret,
> +				     "Failed to add regmap irq\n");
> +	}

Drop }

Your entire code is full of that.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


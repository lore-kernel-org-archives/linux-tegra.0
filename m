Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F97A18DB2B;
	Thu, 17 Apr 2025 05:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867616; cv=none; b=PBCCiq5Q+LgYQZf+RsE39CGzIMulmSYAnH2loQdjCQtJkSgw9BMbJyXevlHROhHTLirMhLEAPCphW96hVZ6zHJ42KVqPDa+xTIzGZGH+N07hw7IGYxlYmaEANWAVz1iA9r7FnQK3pdASHLbt5c8L9ACOXeYuMeGYF3VGx3xUlbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867616; c=relaxed/simple;
	bh=PTnUzRspr5uGJr1SScar+9G8HT8t4g+VMZ5aQnDWrdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KYRI9Hoz6fU2TYTOSwmW2nJa83ZBy4B748IX8YAw6BZXodfEpfwdm+NTBYzZZ2mP72OhJPKuFUOOnJqoFmOSg7GwE2SkyvEnuIpNP7Ik0rzpDL1w1vS9A6JxqwSDefzPlyE03k+qzX0gQYrBJadpM+icB5eRypw+6Ug342Mp0EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIARE3j4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIARE3j4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD68C4CEE4;
	Thu, 17 Apr 2025 05:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744867615;
	bh=PTnUzRspr5uGJr1SScar+9G8HT8t4g+VMZ5aQnDWrdg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=VIARE3j4/5uQm6PJQTgsQnPZQpA5zEM3ypmouqI4aRGqsX/Q0R/AVIzNHdNDbqcHT
	 r1qF5rWzMJO++n2k0JWzRvOEoCo/+1wIujcvP5cWVLFZsac3tn91eoXw5t8zqIwqco
	 /MevJw10QpM3hBni7Wu3CNZ+nF+M1gVpUMYZTNs7VoD4mdylUSUrKAKeGpj10x2XAx
	 XYDUvvuf7duZ0vg2HbJtaFTe7tzRf/Uv8W+TAuOzNR8yxUOdmKcYYvcwzgO5wenSXB
	 Phl0C32b/L+sGQ/ZtlIJdB7Nr+bNEfJ5r2XW9ktInA6j6K7M2R6Y87Vk/9AV7HnY/G
	 xrU5NPAmaGIDA==
Message-ID: <ed4210f4-7f67-4446-bda3-2ca0061daf12@kernel.org>
Date: Thu, 17 Apr 2025 07:26:47 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] mfd: nvvrs: add NVVRS PSEQ MFD driver
To: Shubhi Garg <shgarg@nvidia.com>, lee@kernel.org,
 alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250416120619.483793-1-shgarg@nvidia.com>
 <20250416120619.483793-4-shgarg@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250416120619.483793-4-shgarg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2025 14:06, Shubhi Garg wrote:

> +
> +	if (model_rev < 0x40) {
> +		dev_err(chip->dev, "Chip revision 0x%02x is not supported!\n",
> +			model_rev);
> +		return -ENODEV;
> +	}
> +
> +	dev_info(chip->dev, "NVVRS Vendor ID: 0x%02x, Model Rev: 0x%02x\n",
> +		 vendor_id, model_rev);

dev_dbg

> +
> +	return 0;
> +}
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
> +		dev_err(nvvrs_chip->dev, "Failed to initialise regmap: %d\n", ret);
> +		return ret;

Syntax is: return dev_err_probe

> +	}
> +
> +	ret = nvvrs_pseq_vendor_info(nvvrs_chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	nvvrs_chip->irq_drv_data = nvvrs_chip;
> +	ret = devm_regmap_add_irq_chip(nvvrs_chip->dev, nvvrs_chip->rmap, client->irq,
> +				       IRQF_ONESHOT | IRQF_SHARED, 0,
> +				       &nvvrs_pseq_irq_chip,
> +				       &nvvrs_chip->irq_data);
> +	if (ret < 0) {
> +		dev_err(nvvrs_chip->dev, "Failed to add regmap irq: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =  devm_mfd_add_devices(nvvrs_chip->dev, PLATFORM_DEVID_NONE,
> +				    mfd_cells, n_mfd_cells, NULL, 0,
> +				    regmap_irq_get_domain(nvvrs_chip->irq_data));
> +	if (ret < 0) {
> +		dev_err(nvvrs_chip->dev, "Failed to add MFD children: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_info(nvvrs_chip->dev, "NVVRS PSEQ probe successful");


Drop, useless message.

> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int nvvrs_pseq_i2c_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	/*
> +	 * IRQ must be disabled during suspend because if it happens
> +	 * while suspended it will be handled before resuming I2C.
> +	 *
> +	 * When device is woken up from suspend (e.g. by RTC wake alarm),
> +	 * an interrupt occurs before resuming I2C bus controller.
> +	 * Interrupt handler tries to read registers but this read
> +	 * will fail because I2C is still suspended.
> +	 */
> +	disable_irq(client->irq);
> +
> +	return 0;
> +}
> +
> +static int nvvrs_pseq_i2c_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	enable_irq(client->irq);
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops nvvrs_pseq_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(nvvrs_pseq_i2c_suspend, nvvrs_pseq_i2c_resume)
> +};
> +
> +static const struct of_device_id nvvrs_dt_match[] = {
> +	{ .compatible = "nvidia,vrs-pseq" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, nvvrs_dt_match);
> +
> +static struct i2c_driver nvvrs_pseq_driver = {
> +	.driver = {
> +		.name = "nvvrs_pseq",
> +		.pm = &nvvrs_pseq_pm_ops,
> +		.of_match_table = of_match_ptr(nvvrs_dt_match),

Drop of_mathc_ptr, you have warnings here.

> +	},
> +	.probe = nvvrs_pseq_probe,
> +};
> +
> +module_i2c_driver(nvvrs_pseq_driver);
> +
> +MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
> +MODULE_DESCRIPTION("NVIDIA Voltage Regulator Specification Power Sequencer Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/nvidia-vrs-pseq.h b/include/linux/mfd/nvidia-vrs-pseq.h
> new file mode 100644
> index 000000000000..7e6f3aa940e7
> --- /dev/null
> +++ b/include/linux/mfd/nvidia-vrs-pseq.h
> @@ -0,0 +1,127 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +// SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved
> +
> +#ifndef _MFD_NVIDIA_VRS_PSEQ_H_
> +#define _MFD_NVIDIA_VRS_PSEQ_H_
> +
> +#include <linux/types.h>
> +
> +/* Vendor ID */
> +#define NVVRS_PSEQ_REG_VENDOR_ID		0x00
> +#define NVVRS_PSEQ_REG_MODEL_REV		0x01
> +
> +/*  Interrupts and Status registers */
> +#define NVVRS_PSEQ_REG_INT_SRC1			0x10
> +#define NVVRS_PSEQ_REG_INT_SRC2			0x11
> +#define NVVRS_PSEQ_REG_INT_VENDOR		0x12
> +#define NVVRS_PSEQ_REG_CTL_STAT			0x13
> +#define NVVRS_PSEQ_REG_EN_STDR1			0x14
> +#define NVVRS_PSEQ_REG_EN_STDR2			0x15
> +#define NVVRS_PSEQ_REG_EN_STRD1			0x16
> +#define NVVRS_PSEQ_REG_EN_STRD2			0x17
> +#define NVVRS_PSEQ_REG_WDT_STAT			0x18
> +#define NVVRS_PSEQ_REG_TEST_STAT		0x19
> +#define NVVRS_PSEQ_REG_LAST_RST			0x1A
> +
> +/* Configuration Registers */
> +#define NVVRS_PSEQ_REG_EN_ALT_F			0x20
> +#define NVVRS_PSEQ_REG_AF_IN_OUT		0x21
> +#define NVVRS_PSEQ_REG_EN_CFG1			0x22
> +#define NVVRS_PSEQ_REG_EN_CFG2			0x23
> +#define NVVRS_PSEQ_REG_CLK_CFG			0x24
> +#define NVVRS_PSEQ_REG_GP_OUT			0x25
> +#define NVVRS_PSEQ_REG_DEB_IN			0x26
> +#define NVVRS_PSEQ_REG_LP_TTSHLD		0x27
> +#define NVVRS_PSEQ_REG_CTL_1			0x28
> +#define NVVRS_PSEQ_REG_CTL_2			0x29
> +#define NVVRS_PSEQ_REG_TEST_CFG			0x2A
> +#define NVVRS_PSEQ_REG_IEN_VENDOR		0x2B
> +
> +/* RTC */
> +#define NVVRS_PSEQ_REG_RTC_T3			0x70
> +#define NVVRS_PSEQ_REG_RTC_T2			0x71
> +#define NVVRS_PSEQ_REG_RTC_T1			0x72
> +#define NVVRS_PSEQ_REG_RTC_T0			0x73
> +#define NVVRS_PSEQ_REG_RTC_A3			0x74
> +#define NVVRS_PSEQ_REG_RTC_A2			0x75
> +#define NVVRS_PSEQ_REG_RTC_A1			0x76
> +#define NVVRS_PSEQ_REG_RTC_A0			0x77
> +
> +/* WDT */
> +#define NVVRS_PSEQ_REG_WDT_CFG			0x80
> +#define NVVRS_PSEQ_REG_WDT_CLOSE		0x81
> +#define NVVRS_PSEQ_REG_WDT_OPEN			0x82
> +#define NVVRS_PSEQ_REG_WDTKEY			0x83
> +
> +/* Interrupt Mask */
> +#define NVVRS_PSEQ_INT_SRC1_RSTIRQ_MASK		BIT(0)
> +#define NVVRS_PSEQ_INT_SRC1_OSC_MASK		BIT(1)
> +#define NVVRS_PSEQ_INT_SRC1_EN_MASK		BIT(2)
> +#define NVVRS_PSEQ_INT_SRC1_RTC_MASK		BIT(3)
> +#define NVVRS_PSEQ_INT_SRC1_PEC_MASK		BIT(4)
> +#define NVVRS_PSEQ_INT_SRC1_WDT_MASK		BIT(5)
> +#define NVVRS_PSEQ_INT_SRC1_EM_PD_MASK		BIT(6)
> +#define NVVRS_PSEQ_INT_SRC1_INTERNAL_MASK	BIT(7)
> +#define NVVRS_PSEQ_INT_SRC2_PBSP_MASK		BIT(0)
> +#define NVVRS_PSEQ_INT_SRC2_ECC_DED_MASK	BIT(1)
> +#define NVVRS_PSEQ_INT_SRC2_TSD_MASK		BIT(2)
> +#define NVVRS_PSEQ_INT_SRC2_LDO_MASK		BIT(3)
> +#define NVVRS_PSEQ_INT_SRC2_BIST_MASK		BIT(4)
> +#define NVVRS_PSEQ_INT_SRC2_RT_CRC_MASK		BIT(5)
> +#define NVVRS_PSEQ_INT_SRC2_VENDOR_MASK		BIT(7)
> +#define NVVRS_PSEQ_INT_VENDOR0_MASK		BIT(0)
> +#define NVVRS_PSEQ_INT_VENDOR1_MASK		BIT(1)
> +#define NVVRS_PSEQ_INT_VENDOR2_MASK		BIT(2)
> +#define NVVRS_PSEQ_INT_VENDOR3_MASK		BIT(3)
> +#define NVVRS_PSEQ_INT_VENDOR4_MASK		BIT(4)
> +#define NVVRS_PSEQ_INT_VENDOR5_MASK		BIT(5)
> +#define NVVRS_PSEQ_INT_VENDOR6_MASK		BIT(6)
> +#define NVVRS_PSEQ_INT_VENDOR7_MASK		BIT(7)
> +
> +/* Controller Register Mask */
> +#define NVVRS_PSEQ_REG_CTL_1_FORCE_SHDN		(BIT(0) | BIT(1))
> +#define NVVRS_PSEQ_REG_CTL_1_FORCE_ACT		BIT(2)
> +#define NVVRS_PSEQ_REG_CTL_1_FORCE_INT		BIT(3)
> +#define NVVRS_PSEQ_REG_CTL_2_EN_PEC		BIT(0)
> +#define NVVRS_PSEQ_REG_CTL_2_REQ_PEC		BIT(1)
> +#define NVVRS_PSEQ_REG_CTL_2_RTC_PU		BIT(2)
> +#define NVVRS_PSEQ_REG_CTL_2_RTC_WAKE		BIT(3)
> +#define NVVRS_PSEQ_REG_CTL_2_RST_DLY		0xF0
> +
> +enum {
> +	NVVRS_PSEQ_INT_SRC1_RSTIRQ,		/* Reset or Interrupt Pin Fault */
> +	NVVRS_PSEQ_INT_SRC1_OSC,		/* Crystal Oscillator Fault */
> +	NVVRS_PSEQ_INT_SRC1_EN,			/* Enable Output Pin Fault */
> +	NVVRS_PSEQ_INT_SRC1_RTC,		/* RTC Alarm */
> +	NVVRS_PSEQ_INT_SRC1_PEC,		/* Packet Error Checking */
> +	NVVRS_PSEQ_INT_SRC1_WDT,		/* Watchdog Violation */
> +	NVVRS_PSEQ_INT_SRC1_EM_PD,		/* Emergency Power Down */
> +	NVVRS_PSEQ_INT_SRC1_INTERNAL,		/* Internal Fault*/
> +	NVVRS_PSEQ_INT_SRC2_PBSP,		/* PWR_BTN Short Pulse Detection */
> +	NVVRS_PSEQ_INT_SRC2_ECC_DED,		/* ECC Double-Error Detection */
> +	NVVRS_PSEQ_INT_SRC2_TSD,		/* Thermal Shutdown */
> +	NVVRS_PSEQ_INT_SRC2_LDO,		/* LDO Fault */
> +	NVVRS_PSEQ_INT_SRC2_BIST,		/* Built-In Self Test Fault */
> +	NVVRS_PSEQ_INT_SRC2_RT_CRC,		/* Runtime Register CRC Fault */
> +	NVVRS_PSEQ_INT_SRC2_VENDOR,		/* Vendor Specific Internal Fault */
> +	NVVRS_PSEQ_INT_VENDOR0,			/* Vendor Internal Fault Bit 0 */
> +	NVVRS_PSEQ_INT_VENDOR1,			/* Vendor Internal Fault Bit 1 */
> +	NVVRS_PSEQ_INT_VENDOR2,			/* Vendor Internal Fault Bit 2 */
> +	NVVRS_PSEQ_INT_VENDOR3,			/* Vendor Internal Fault Bit 3 */
> +	NVVRS_PSEQ_INT_VENDOR4,			/* Vendor Internal Fault Bit 4 */
> +	NVVRS_PSEQ_INT_VENDOR5,			/* Vendor Internal Fault Bit 5 */
> +	NVVRS_PSEQ_INT_VENDOR6,			/* Vendor Internal Fault Bit 6 */
> +	NVVRS_PSEQ_INT_VENDOR7,			/* Vendor Internal Fault Bit 7 */
> +};
> +
> +struct nvvrs_pseq_chip {
> +	struct device *dev;
> +	struct regmap *rmap;
> +	int chip_irq;
> +	struct i2c_client *client;
> +	struct regmap_irq_chip_data *irq_data;
> +	const struct regmap_irq_chip *irq_chip;
> +	void *irq_drv_data;
> +};
> +
> +#endif /* _MFD_NVIDIA_VRS_PSEQ_H_ */


Best regards,
Krzysztof

Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ADE3010C;
	Wed, 16 Apr 2025 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813226; cv=none; b=u9iDAFQmaCo4khC1dxGCxvUWmoYZG0gAdEf1LOL7emnBWj3aEHPZzZP6rZ873g0aneJwIdbnJEfW8LyDgbr6Z2Uo+cKHSMXLmWbl/ZZptlA+BTd/1DQf+bC2la4I+tx32ypAfIDerFvH+wVjAFWxc6EOw80l6FwJZ377K8JGFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813226; c=relaxed/simple;
	bh=1C8G3Pm9jAq7Fwm55YMSYwYz10MFq17lawTizC45DpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9TbEbV7L87kdK4jBlV7FRNg+5XfXxpo3pYbkYlyqYzSKP2CNqzGDBSKj/ch8JF66cfJmB3qy34X/BK8QwPrVXe5O5pDNJ48yl/quL5lnoNxk/0htT37ooz90KjfD4nw69C0PzsX+VjFOp/yEzVFDmJDUcMvlPfgMzsJM2uu2L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dJS5aYEY; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dJS5aYEY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A770E43A1D;
	Wed, 16 Apr 2025 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744813216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=95G2prtoXMAoiwp7P6wUh0gLXo1yX9c+y7W0MTBG0f4=;
	b=dJS5aYEY/R/qjojDqI9zy1X8ZzdhpAuWnBiyX5Lpz5Ohdcrs7HXpfxXqXUXhOMNDReJ6o9
	v3VpXOmSJHiUwNgLDhSz6sNV8jYfzh+HQa1tgUgUiSoIOsg61pdTQkJW8RvAxbjn4Ck/bz
	2yjbkSX1v5SGFGrJcUihLgPvrYbU3efrxyCEL5GI7ozQqCaFY5m8WWb8Pm47rms92U41eE
	vbAKPpwvz2iN94Fl9ygdnCzOIbuK1fx34rLGy3SLAejgmWlSwp/ONRQA0S6qup3wntGoVC
	z8c0AGc98kN0K+6icq9zFIF18PEGKWmDQZBjwncNuNXp88InJ4TVO/r04JuISA==
Date: Wed, 16 Apr 2025 16:20:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: lee@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/5] rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
Message-ID: <2025041613211528675cb8@mail.local>
References: <20250416120619.483793-1-shgarg@nvidia.com>
 <20250416120619.483793-5-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120619.483793-5-shgarg@nvidia.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtugemvgegkeejmedvuddvfhemfheiiedvmedvtdgttgemugehtgegmeefgeeksgemvgehugdunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdgumegvgeekjeemvdduvdhfmehfieeivdemvddttggtmeguhegtgeemfeegkegsmegvheguuddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehshhhgrghrghesnhhvihguihgrrdgtohhmpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughin
 hhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 16/04/2025 12:06:18+0000, Shubhi Garg wrote:
> Add support for NVIDIA VRS (Voltage Regulator Specification) Power
> Sequencer RTC device driver. This RTC can be used to get/set system
> time, retain system time across boot, wake system from suspend and
> shutdown state.
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
>  drivers/rtc/Kconfig               |  10 +
>  drivers/rtc/Makefile              |   1 +
>  drivers/rtc/rtc-nvidia-vrs-pseq.c | 559 ++++++++++++++++++++++++++++++
>  3 files changed, 570 insertions(+)
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
> +	help
> +	  If you say yes here you will get support for the battery backed RTC device
> +	  of NVIDIA VRS Power Sequencer. The RTC is connected via I2C interface and
> +	  supports alarm functionality.
> +	  This driver can also be built as a module. If so, the module will be called
> +	  rtc-nvidia-vrs-pseq.
> +
>  config RTC_DRV_NCT3018Y
>  	tristate "Nuvoton NCT3018Y"
>  	depends on OF
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 31473b3276d9..543c5a9fe851 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
>  obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
>  obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
>  obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
> +obj-$(CONFIG_RTC_DRV_NVVRS_PSEQ)+= rtc-nvidia-vrs-pseq.o
>  obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
>  obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
>  obj-$(CONFIG_RTC_DRV_OPTEE)	+= rtc-optee.o
> diff --git a/drivers/rtc/rtc-nvidia-vrs-pseq.c b/drivers/rtc/rtc-nvidia-vrs-pseq.c
> new file mode 100644
> index 000000000000..1a4194e4edf4
> --- /dev/null
> +++ b/drivers/rtc/rtc-nvidia-vrs-pseq.c
> @@ -0,0 +1,559 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.

How old is this driver actually, it uses decades old APIs :)

> + *
> + * RTC driver for NVIDIA Voltage Regulator Power Sequencer
> + *
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/rtc.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <linux/mfd/nvidia-vrs-pseq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/regmap.h>
> +#include <linux/bits.h>
> +
> +#define ALARM_RESET_VAL		0xFFFFFFFF /* Alarm reset/disable value */
> +#define NVVRS_INT_RTC_INDEX	0	   /* Only one RTC interrupt register */
> +#define	REG_LEN_IN_BYTES	4
> +
> +struct nvvrs_rtc_info {
> +	struct device          *dev;
> +	struct i2c_client      *client;
> +	struct rtc_device      *rtc_dev;
> +	struct regmap          *regmap;

So you have a regmap but never use it?

> +	struct regmap_irq_chip_data *rtc_irq_data;
> +	/* Mutex to protect RTC operations */
> +	struct mutex           lock;

This lock is useless, simply use rtc_lock/rtc_unlock in your irq handler

> +	unsigned int           rtc_irq;
> +	/* Registers offset to I2C addresses map */
> +	const u8               *map;

I don't get how this indirection is useful

> +	/* RTC IRQ CHIP */
> +	const struct regmap_irq_chip *rtc_irq_chip;
> +};
> +
> +/* RTC Registers offsets */
> +enum nvvrs_rtc_reg_offset {
> +	RTC_T3 = 0,
> +	RTC_T2,
> +	RTC_T1,
> +	RTC_T0,
> +	RTC_A3,
> +	RTC_A2,
> +	RTC_A1,
> +	RTC_A0,
> +	CTL1_REG,
> +	CTL2_REG,
> +	RTC_END,
> +};
> +
> +static const struct regmap_irq nvvrs_rtc_irq[] = {
> +	REGMAP_IRQ_REG(NVVRS_INT_RTC_INDEX, 0, NVVRS_PSEQ_INT_SRC1_RTC_MASK),
> +};
> +
> +static const struct regmap_irq_chip nvvrs_rtc_irq_chip = {
> +	.name	   = "nvvrs-rtc",
> +	.status_base    = NVVRS_PSEQ_REG_INT_SRC1,
> +	.num_regs       = 1,
> +	.irqs	   = nvvrs_rtc_irq,
> +	.num_irqs       = ARRAY_SIZE(nvvrs_rtc_irq),
> +};
> +
> +static const u8 rtc_map[RTC_END] = {
> +	[RTC_T3] = NVVRS_PSEQ_REG_RTC_T3,
> +	[RTC_T2] = NVVRS_PSEQ_REG_RTC_T2,
> +	[RTC_T1] = NVVRS_PSEQ_REG_RTC_T1,
> +	[RTC_T0] = NVVRS_PSEQ_REG_RTC_T0,
> +	[RTC_A3] = NVVRS_PSEQ_REG_RTC_A3,
> +	[RTC_A2] = NVVRS_PSEQ_REG_RTC_A2,
> +	[RTC_A1] = NVVRS_PSEQ_REG_RTC_A1,
> +	[RTC_A0] = NVVRS_PSEQ_REG_RTC_A0,
> +	[CTL1_REG]  = NVVRS_PSEQ_REG_CTL_1,
> +	[CTL2_REG]  = NVVRS_PSEQ_REG_CTL_2,
> +};
> +
> +static int nvvrs_update_bits(struct nvvrs_rtc_info *info, u8 reg,
> +			     u8 mask, u8 value)
> +{
> +	int ret;
> +	u8 val;
> +
> +	ret = i2c_smbus_read_byte_data(info->client, reg);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read reg:0x%02x ret:(%d)\n",
> +			reg, ret);

The driver is too verbose, you have plenty of dev_err that are very
unlikely to happen and that have no impact on the user actions but those
strings will always be bloating the kernel.

> +		return ret;
> +	}
> +	val = (u8)ret;
> +	val &= ~mask;
> +	val |= (value & mask);
> +
> +	ret = i2c_smbus_write_byte_data(info->client, reg, val);
> +	if (ret < 0)
> +		dev_err(info->dev, "Failed to write reg:0x%02x val:0x%02x ret:(%d)\n",
> +			reg, val, ret);
> +
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_update_alarm_reg(struct i2c_client *client,
> +				      struct nvvrs_rtc_info *info, u8 *time)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, info->map[RTC_A3], time[3]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to write alarm reg: 0x%02x ret:(%d)\n",
> +			info->map[RTC_A3], ret);
> +		goto out;
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(client, info->map[RTC_A2], time[2]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to write alarm reg: 0x%02x ret:(%d)\n",
> +			info->map[RTC_A2], ret);
> +		goto out;
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(client, info->map[RTC_A1], time[1]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to write alarm reg: 0x%02x ret:(%d)\n",
> +			info->map[RTC_A1], ret);
> +		goto out;
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(client, info->map[RTC_A0], time[0]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to write alarm reg: 0x%02x ret:(%d)\n",
> +			info->map[RTC_A0], ret);
> +		goto out;
> +	}
> +
> +out:
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_enable_alarm(struct nvvrs_rtc_info *info)
> +{
> +	int ret;
> +
> +	/* Set RTC_WAKE bit for autonomous wake from sleep */
> +	ret = nvvrs_update_bits(info, info->map[CTL2_REG],
> +				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE,
> +				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to set RTC_WAKE bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* Set RTC_PU bit for autonomous wake from shutdown */
> +	ret = nvvrs_update_bits(info, info->map[CTL2_REG],
> +				NVVRS_PSEQ_REG_CTL_2_RTC_PU,
> +				NVVRS_PSEQ_REG_CTL_2_RTC_PU);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to set RTC_PU bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_disable_alarm(struct nvvrs_rtc_info *info)
> +{
> +	struct i2c_client *client = info->client;
> +	u8 val[REG_LEN_IN_BYTES];
> +	int ret;
> +
> +	/* Clear RTC_WAKE bit */
> +	ret = nvvrs_update_bits(info, info->map[CTL2_REG],
> +				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE, 0);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to clear RTC_WAKE bit (%d)\n", ret);
> +		goto out;
> +	}
> +
> +	/* Clear RTC_PU bit */
> +	ret = nvvrs_update_bits(info, info->map[CTL2_REG],
> +				NVVRS_PSEQ_REG_CTL_2_RTC_PU, 0);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to clear RTC_PU bit (%d)\n", ret);
> +		goto out;
> +	}
> +
> +	/* Write ALARM_RESET_VAL in RTC Alarm register to disable alarm */
> +	val[0] = 0xff;
> +	val[1] = 0xff;
> +	val[2] = 0xff;
> +	val[3] = 0xff;
> +
> +	ret = nvvrs_rtc_update_alarm_reg(client, info, val);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to disable Alarm (%d)\n", ret);
> +		goto out;
> +	}
> +out:
> +	return ret;
> +}
> +
> +static irqreturn_t nvvrs_rtc_irq_handler(int irq, void *data)
> +{
> +	struct nvvrs_rtc_info *info = data;
> +
> +	dev_dbg(info->dev, "RTC alarm IRQ: %d\n", irq);
> +
> +	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int nvvrs_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	struct i2c_client *client = info->client;
> +	time64_t secs = 0;
> +	int ret;
> +	u8 val;
> +
> +	mutex_lock(&info->lock);
> +
> +	/* Multi-byte transfers are not supported with PEC enabled */
> +	/* Read MSB first to avoid coherency issues */
> +	ret = i2c_smbus_read_byte_data(client, info->map[RTC_T3]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read time reg:0x%02x ret:(%d)\n",
> +			info->map[RTC_T3], ret);
> +		goto out;
> +	}
> +	val = (u8)ret;
> +	secs |= (time64_t)val << 24;
> +
> +	ret = i2c_smbus_read_byte_data(client, info->map[RTC_T2]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read time reg:0x%02x ret:(%d)\n",
> +			info->map[RTC_T2], ret);
> +		goto out;
> +	}
> +	val = (u8)ret;
> +	secs |= (time64_t)val << 16;
> +
> +	ret = i2c_smbus_read_byte_data(client, info->map[RTC_T1]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read time reg:0x%02x ret:(%d)\n",
> +			info->map[RTC_T1], ret);
> +		goto out;
> +	}
> +	val = (u8)ret;
> +	secs |= (time64_t)val << 8;
> +
> +	ret = i2c_smbus_read_byte_data(client, info->map[RTC_T0]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read time reg:0x%02x ret:(%d)\n",
> +			info->map[RTC_T0], ret);
> +		goto out;
> +	}
> +	val = (u8)ret;
> +	secs |= val;
> +
> +	rtc_time64_to_tm(secs, tm);
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	struct i2c_client *client = info->client;
> +	u8 time[REG_LEN_IN_BYTES];
> +	time64_t secs;
> +	int ret;
> +
> +	mutex_lock(&info->lock);
> +
> +	secs = rtc_tm_to_time64(tm);
> +	time[0] = secs & 0xff;
> +	time[1] = (secs >> 8) & 0xff;
> +	time[2] = (secs >> 16) & 0xff;
> +	time[3] = (secs >> 24) & 0xff;
> +
> +	ret = i2c_smbus_write_byte_data(client, info->map[RTC_T3], time[3]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to write time reg: 0x%02x ret:(%d)\n",
> +			info->map[RTC_T3], ret);
> +		goto out;
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(client, info->map[RTC_T2], time[2]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to write time reg: 0x%02x ret:(%d)\n",
> +			info->map[RTC_T2], ret);
> +		goto out;
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(client, info->map[RTC_T1], time[1]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to write time reg: 0x%02x ret:(%d)\n",
> +			info->map[RTC_T1], ret);
> +		goto out;
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(client, info->map[RTC_T0], time[0]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to write time reg: 0x%02x ret:(%d)\n",
> +			info->map[RTC_T0], ret);
> +		goto out;
> +	}
> +
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	struct i2c_client *client = info->client;
> +	time64_t alarm_val = 0;
> +	int ret;
> +	u8 val;
> +
> +	mutex_lock(&info->lock);
> +
> +	/* Multi-byte transfers are not supported with PEC enabled */
> +	ret = i2c_smbus_read_byte_data(client, info->map[RTC_A3]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read alarm reg:0x%02x ret:(%d)\n",
> +			info->map[RTC_A3], ret);
> +		goto out;
> +	}
> +	val = (u8)ret;
> +	alarm_val |= (time64_t)val << 24;
> +
> +	ret = i2c_smbus_read_byte_data(client, info->map[RTC_A2]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read alarm reg:0x%02x ret:(%d)\n",
> +			info->map[RTC_A2], ret);
> +		goto out;
> +	}
> +	val = (u8)ret;
> +	alarm_val |= (time64_t)val << 16;
> +
> +	ret = i2c_smbus_read_byte_data(client, info->map[RTC_A1]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read alarm reg:0x%02x ret:(%d)\n",
> +			info->map[RTC_A1], ret);
> +		goto out;
> +	}
> +	val = (u8)ret;
> +	alarm_val |= (time64_t)val << 8;
> +
> +	ret = i2c_smbus_read_byte_data(client, info->map[RTC_A0]);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read alarm reg:0x%02x ret:(%d)\n",
> +			info->map[RTC_A0], ret);
> +		goto out;
> +	}
> +	val = (u8)ret;
> +	alarm_val |= val;
> +
> +	if (alarm_val == ALARM_RESET_VAL)
> +		alrm->enabled = 0;
> +	else
> +		alrm->enabled = 1;
> +
> +	rtc_time64_to_tm(alarm_val, &alrm->time);
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	struct i2c_client *client = info->client;
> +	u8 time[REG_LEN_IN_BYTES];
> +	time64_t secs;
> +	int ret;
> +
> +	mutex_lock(&info->lock);
> +
> +	ret = nvvrs_rtc_enable_alarm(info);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to enable alarm! (%d)\n", ret);
> +		goto out;
> +	}
> +
> +	secs = rtc_tm_to_time64(&alrm->time);
> +	time[0] = secs & 0xff;
> +	time[1] = (secs >> 8) & 0xff;
> +	time[2] = (secs >> 16) & 0xff;
> +	time[3] = (secs >> 24) & 0xff;
> +
> +	ret = nvvrs_rtc_update_alarm_reg(client, info, time);
> +
> +	alrm->enabled = 1;
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	mutex_lock(&info->lock);
> +	if (enabled)
> +		ret = nvvrs_rtc_enable_alarm(info);
> +	else
> +		ret = nvvrs_rtc_disable_alarm(info);
> +
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static const struct rtc_class_ops nvvrs_rtc_ops = {
> +	.read_time = nvvrs_rtc_read_time,
> +	.set_time = nvvrs_rtc_set_time,
> +	.read_alarm = nvvrs_rtc_read_alarm,
> +	.set_alarm = nvvrs_rtc_set_alarm,
> +	.alarm_irq_enable = nvvrs_rtc_alarm_irq_enable,
> +};
> +
> +static int nvvrs_rtc_probe(struct platform_device *pdev)
> +{
> +	struct nvvrs_rtc_info *info;
> +	struct device *parent;
> +	struct i2c_client *client;
> +	int ret;
> +
> +	info = devm_kzalloc(&pdev->dev, sizeof(struct nvvrs_rtc_info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to get irq\n");
> +		return ret;
> +	}
> +	info->rtc_irq = ret;
> +
> +	mutex_init(&info->lock);
> +	info->dev = &pdev->dev;
> +	parent = info->dev->parent;
> +	client = to_i2c_client(parent);
> +	client->flags |= I2C_CLIENT_PEC;
> +	i2c_set_clientdata(client, info);
> +	info->client = client;
> +	info->map = rtc_map;
> +	info->rtc_irq_chip = &nvvrs_rtc_irq_chip;
> +	platform_set_drvdata(pdev, info);
> +
> +	/* Initialize regmap */
> +	info->regmap = dev_get_regmap(parent, NULL);
> +	if (!info->regmap) {
> +		dev_err(info->dev, "Failed to get RTC regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	/* RTC as a wakeup source */
> +	device_init_wakeup(info->dev, 1);
> +
> +	/* Register RTC device */
> +	info->rtc_dev = devm_rtc_device_register(info->dev, "nvvrs-rtc",
> +						 &nvvrs_rtc_ops, THIS_MODULE);


You must use devm_rtc_allocate_device and devm_rtc_register_device,
devm_rtc_allocate_device is deprecated.

You must also set range_min and range_max.


> +
> +	if (IS_ERR(info->rtc_dev)) {
> +		ret = PTR_ERR(info->rtc_dev);
> +		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = request_threaded_irq(info->rtc_irq, NULL, nvvrs_rtc_irq_handler, 0,
> +				   "rtc-alarm", info);

Why don't you use the devm_ version and drop nvvrs_rtc_remove() ?

> +	if (ret < 0)
> +		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
> +			info->rtc_irq, ret);

It is not allowed to fail after registering an rtc_device

> +
> +	return ret;
> +}
> +
> +static void nvvrs_rtc_remove(struct platform_device *pdev)
> +{
> +	struct nvvrs_rtc_info *info = platform_get_drvdata(pdev);
> +
> +	free_irq(info->rtc_irq, info);
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
> +		ret = nvvrs_update_bits(info, info->map[CTL2_REG],
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
> +		ret = nvvrs_update_bits(info, info->map[CTL1_REG],
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
> +	.remove	        = nvvrs_rtc_remove,
> +	.id_table       = nvvrs_rtc_id,
> +};
> +
> +module_platform_driver(nvvrs_rtc_driver);
> +
> +MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
> +MODULE_DESCRIPTION("NVVRS PSEQ RTC driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

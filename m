Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9443BFE33;
	Wed, 18 Mar 2026 18:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773857990; cv=none; b=gwejSA6F5kIzsUKg6YO7HVOg8HhEllkJyvcYAwCHwylWnrTSf247g7Jf1tTariOpd7g1SMaJnsz4cZiwT+eGZyEuRbeRWJ3HRCOATfA1ShElT6C/taFTdqYg35mXFxyqFUuxLFEIYN4wWJY9R525hzjBT77kti96sQGV6kGXf1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773857990; c=relaxed/simple;
	bh=vj7tS7uIMvZSXYU425dVU9YT132ngTU9jfQFxZte628=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxUFBQsFPNjmBykGCPiCTKakJ/qpnqQgkHAQuFQb3/y+hHDSE88Ot22XXfriVOF9VePZAAtret/ldzu/ZaiPDmyga58dj9z0ZPeM2XEInBJ37lizCdzbXetA3CYjmzbghrGkz4VyZKYogTgeSVX5q+/njc4zxKelhSwX2749dtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wC05hgGu; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wC05hgGu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41CDF4E426F8;
	Wed, 18 Mar 2026 18:19:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1C1D6004F;
	Wed, 18 Mar 2026 18:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2878510450431;
	Wed, 18 Mar 2026 19:19:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773857982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GFiGghzPl6g8oEQeQrcO9TafT5x7gCN92iALR8Yy2dM=;
	b=wC05hgGuVfa+8EvwpROQS7dqjARjeKaWIU113kVPpWKO9oJMZR7+p4+5qakt+7dNOXwT4Y
	5DnoW5/51sYHsUt67qtSiLOELpz0LbWYtNq1eu4fVCpGKQ6H/1t0Is4PMy5YWyuE783a7j
	LQ6shnjEo6aAPupfW+6MPI4Xq1QbP1evicCA6W18jltj/xHBBkMs8k1sxpMPX5/LhR0jDu
	YRrNoRzGBVtsGscmtlEpz9wGUVJD0neM+6vaOnJkRaC396auEzOO/ADgY2/2MlyIYZD2B1
	WYQ4YdXSQXv1ymLaqL15eMTElJc49798VPeRb9dxn+z1nWK5ClpPEz56vJ5JFA==
Date: Wed, 18 Mar 2026 19:19:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 11/12] hwmon: spd5118: Add I3C support
Message-ID: <202603181819360a32c641@mail.local>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-12-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318172820.13771-12-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On 18/03/2026 22:57:24+0530, Akhil R wrote:
> Add a regmap config and a probe function to support for I3C based
> communication to SPD5118 devices.
> 
> On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
> ACPI or device tree entry. The device matching is hence through the OF
> match tables only and do not need an I3C class match table. The device
> identity is verified in the type registers before proceeding to the
> common probe function.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/hwmon/Kconfig   |  7 +++--
>  drivers/hwmon/spd5118.c | 66 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8af80e17d25e..23604c05ad22 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2300,10 +2300,13 @@ config SENSORS_SPD5118
>  	tristate "SPD5118 Compliant Temperature Sensors"
>  	depends on I2C

Please use I3C_OR_I2C here

>  	select REGMAP_I2C
> +	select REGMAP_I3C if I3C
>  	help
>  	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
> -	  compliant temperature sensors. Such sensors are found on DDR5 memory
> -	  modules.
> +	  compliant temperature sensors using I2C or I3C bus interface.
> +	  Such sensors are found on DDR5 memory modules.
> +
> +	  This driver supports both I2C and I3C interfaces.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called spd5118.
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5da44571b6a0..d70123e10616 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -18,6 +18,7 @@
>  #include <linux/bits.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> +#include <linux/i3c/device.h>
>  #include <linux/hwmon.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -482,6 +483,25 @@ static const struct regmap_config spd5118_regmap16_config = {
>  	.cache_type = REGCACHE_MAPLE,
>  };
>  
> +/*
> + * I3C uses 2-byte register addressing -
> + *   Byte 1: MemReg | BlkAddr[0] | Address[5:0]
> + *   Byte 2: 0000   | BlkAddr[4:1]
> + *
> + * The low byte carries the register/NVM address and the high byte carries the
> + * upper block address bits, so little-endian format is required. No range
> + * config is needed since I3C does not use MR11 page switching.
> + */
> +static const struct regmap_config spd5118_regmap_i3c_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.max_register = 0x7ff,
> +	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.writeable_reg = spd5118_writeable_reg,
> +	.volatile_reg = spd5118_volatile_reg,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
>  static int spd5118_suspend(struct device *dev)
>  {
>  	struct spd5118_data *data = dev_get_drvdata(dev);
> @@ -770,7 +790,51 @@ static struct i2c_driver spd5118_i2c_driver = {
>  	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
>  };
>  
> -module_i2c_driver(spd5118_i2c_driver);
> +/* I3C */
> +
> +static int spd5118_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	struct device *dev = i3cdev_to_dev(i3cdev);
> +	struct regmap *regmap;
> +	unsigned int regval;
> +	int err;
> +
> +	regmap = devm_regmap_init_i3c(i3cdev, &spd5118_regmap_i3c_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
> +
> +	/* Verify this is a SPD5118 device */
> +	err = regmap_read(regmap, SPD5118_REG_TYPE, &regval);
> +	if (err)
> +		return err;
> +
> +	if (regval != 0x51) {
> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x51\n", regval);
> +		return -ENODEV;
> +	}
> +
> +	err = regmap_read(regmap, SPD5118_REG_TYPE + 1, &regval);
> +	if (err)
> +		return err;
> +
> +	if (regval != 0x18) {
> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x18\n", regval);
> +		return -ENODEV;
> +	}
> +
> +	return spd5118_common_probe(dev, regmap, false);
> +}
> +
> +static struct i3c_driver spd5118_i3c_driver = {
> +	.driver = {
> +		.name	= "spd5118_i3c",
> +		.of_match_table = spd5118_of_ids,
> +		.pm = pm_sleep_ptr(&spd5118_pm_ops),
> +	},
> +	.probe		= spd5118_i3c_probe,
> +};
> +
> +module_i3c_i2c_driver(spd5118_i3c_driver, &spd5118_i2c_driver);
>  
>  MODULE_AUTHOR("René Rebe <rene@exactcode.de>");
>  MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
> -- 
> 2.50.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

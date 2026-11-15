Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775748;
	b=mOvOhWgOplcXt6V4jue2ySo5hoEZwUmWf1BcxO9MC2HGfTZQegwEEBi7xBYqiXv5Ikrv
	 1lcoyu/e+xJOny873wdTojyAt0W8nlSGBZt8VtGomgIHq9bFkQ/Mihr6pZnGvW++A+bPP
	 gtzC/HszSUjZmR/KJO5+jkVGAlWPVHeKhDmnDkeBs+rVTiCpDGqIPVYRr/uH2fZ6QloHF
	 y6/U5F7kzpe9bGBFncPlgOyxAz7s7ahn/4JhQkoj2Wm+5me/wud+yrUVcFEXp2hYRVLT1
	 1ae2IriYEGNqUAnfbj7y0kAaMbWM5UYf8guAhF874cJj4xP0W0kK97d3HNinqgc2GeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775748;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport:Content-Transfer-Encoding;
	bh=S1FHOEfkOTMG6muHGon2/DN/6oag3xCIErugwiwsjL4=;
	b=wEmGgwrn7nuM+3zqb7zNF44ZJdwJgCtDcLEQaYQTkkKVFtvSWo0Zb7zV+1Wk3ACVRdAb
	 XpxBKsfPUgcXFOVbMyEbFnrmLLCl4Qf2RDI2Oxn+txcfK0XZS4AeXzOn2Uo/SNOWKRsj1
	 t54y2fzwKkj6vXASQZnQGA4n6NafKMCtpN8BPnlqj/RvAMNzGivkFVX48oAYjSFfw0yHi
	 WCYKcaNyi//klEPvnQkIxWzAq258dXEpdLy2EawUPSrEymPYyLnpP1Wmj6kyaRBklSgjJ
	 DxUtH/RFExx0WyKfMY9R1n+lBWDbzHP0BjEO1lWgYZ2j12apABHHahG0sgK1+a17aRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sKxg7okO;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1229606A329
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 20:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1229606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sKxg7okO
DKIM2-Signature:  i=1; m=1; t=1794775745;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:pWM/rKgwHZUhBgTBxPGItwJyZP9M
   0j4QKHz8L0xbOqhPjV77NC09lTjsL96JG+JfnXjWS6skYU4V8CeGcbJ/ZD81VJ44rcMSCEWkerw
   xqJzYJbte6F2k0nxNL668Uo3w4NVwEOqm4500fe+1xnHdzh6nCGNiu5OGmusJGnzC392jBUdOg3
   rexf8QRabGCCEgWibqmYDNkW4nWE3YgJRjKEBsjJ50HjdWMupKePajpjab/ExJqxf5VQl6hPSFU
   D/S6l+4u8cR7SMYraqNr7a8Qi648iqCQLqY60IhyIbsELSb67Lafxtv7LSEkn6k4dtio/ByqwIa
   Co9fPxDq7yXQkg==;
Message-Instance:  m=1;
 h=sha256:
   50AHoeT2etOSib64Dq8hsHYR6ZGuy6nu88cdObjh8gM=:
   mlULZlV1I0nf4r2zKywtIR3zueyZZUOgTmgtmVkY9yI=,
  sha512:
   9x0BhWFRq4M/PDKnRZr4xX++ABbQ6wkQZ6vwN9EoaoGSs/daVF9XwHJijRVzAMIti8vI0p/poNEX3sWvlmkIXw==:
   63LsSjraRYB7z5vfp8Ut1/griZgm7MmirxJfTWBTGTMu+DdPw6asItXXHC0c9NrRUlrBao633hy5Wo/YzhcGhA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794775721; x=1795380521; i=marvin24@gmx.de;
	bh=S1FHOEfkOTMG6muHGon2/DN/6oag3xCIErugwiwsjL4=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sKxg7okOJ6k3phiF/C2IiPRBCaeXKfJFh2XqBL5Dc9wPFMukx/La/26jX49sdcTL
	 9sUK+bDDu8QDMPWQm6+Lqf/4UoHVI63t/RWTLcDOIGkX2v/CD6apRd7BL8GkHnUt9
	 hYhlTkc6a1M/DvYDFBucRBVxXFJmi/QL0SiPZNH6g3mfE+YyVQTAK4ItEymD+TTn5
	 SEaT0EEUSJZ/0KlvyZsMPVWLge/2nQu2XF3jEVu6+5QNkcTzig4cL4hdfZ5InU5AW
	 uMQtrmqmpuZCTzskIDnOEHjZhjvTtZtK8uBWqTof3TLGx05JX+/cGom+vnrl6T12C
	 IpMK3PE/9eZcOdI57g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KTy-1wSmrL2hLm-011eHm; Sun, 15
 Nov 2026 21:48:41 +0100
Date: Sun, 15 Nov 2026 21:48:40 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: linux-tegra@vger.kernel.org
cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
    Thierry Reding <thierry.reding@kernel.org>, 
    Jonathan Hunter <jonathanh@nvidia.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH 2/2] i2c: tegra20: Add driver for Tegra20 I2C target
 controller instances
In-Reply-To: <20261115182616.354580-2-marvin24@gmx.de>
Message-ID: <830cd248-f46a-2b8a-1fd5-204c945c6654@gmx.de>
References: <20261115182616.354580-1-marvin24@gmx.de> <20261115182616.354580-2-marvin24@gmx.de>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:Yw05XuWZZ6nXiUKlI1Ii3OtDaNuBpMqzkw6wKMe3c7mTiW1LSzp
 jtlwBD+zaOszFGXO40NiOOZUaCNbtv+mt5K5b+uFWoL3Y+iG0yr19vEubPeRop1NJn0csKM
 AhT5sssjPTAWHbD6q3s7U5TXzNmSzgbC45LNgemOnWuOzO3odv89a+T1R61rT2VuG/sklsl
 1HZq/2MlcYjq1zaN4WW3Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PbFMoruxZEo=;OG/ETMSqQoDur0CHq6icEJIAXOr
 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
 MpoquDRL6jhnkv+ntSTg5sPLIEqtPaYhtxfwKQ==
Content-Transfer-Encoding: quoted-printable

Sorry, please ignore this patch. I accidentally sent the initial series
again.

Marc

On Sun, 15 Nov 2026, Marc Dietrich wrote:

> Tegra20 SoC support 3 instances of the I2C target controller. It shares
> ressouces with the I2C controller. Only exclusive operation as an i2c
> target is supported for now.
>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
> MAINTAINERS                           |   7 +
> drivers/i2c/busses/Kconfig            |  14 +
> drivers/i2c/busses/Makefile           |   1 +
> drivers/i2c/busses/i2c-tegra-target.c | 372 ++++++++++++++++++++++++++
> 4 files changed, 394 insertions(+)
> create mode 100644 drivers/i2c/busses/i2c-tegra-target.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 95cd976a068c..7846aea22c96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26579,6 +26579,13 @@ R:	Dmitry Osipenko <digetx@gmail.com>
> S:	Supported
> F:	drivers/i2c/busses/i2c-tegra.c
>
> +TEGRA I2C TARGET DRIVER
> +M:	Marc Dietrich <marvin24@gmx.de>
> +L:	linux-tegra@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c-target.yaml
> +F:	drivers/i2c/busses/i2c-tegra-target.c
> +
> TEGRA IOMMU DRIVERS
> M:	Thierry Reding <thierry.reding@kernel.org>
> R:	Krishna Reddy <vdumpa@nvidia.com>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index d35456994280..4c5b0d15ec8e 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1242,6 +1242,20 @@ config I2C_TEGRA_BPMP
> 	  of the BPMP firmware, and this driver merely communicates with that
> 	  real driver.
>
> +config I2C_TEGRA_TARGET
> +	tristate "NVIDIA Tegra20 I2C controller in target mode"
> +	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
> +	select I2C_SLAVE
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  I2C controller embedded in NVIDIA Tegra20 SoCs when it is used as
> +	  an I2C target (slave) on the bus. A controller instance that is
> +	  described with the target compatible in the device tree cannot be
> +	  used as an I2C controller at the same time.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called i2c-tegra-target.
> +
> config I2C_UNIPHIER
> 	tristate "UniPhier FIFO-less I2C controller"
> 	depends on ARCH_UNIPHIER || COMPILE_TEST
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3755c54b3d82..724931114412 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_I2C_SUN6I_P2WI)	+=3D i2c-sun6i-p2wi.o
> obj-$(CONFIG_I2C_SYNQUACER)	+=3D i2c-synquacer.o
> obj-$(CONFIG_I2C_TEGRA)		+=3D i2c-tegra.o
> obj-$(CONFIG_I2C_TEGRA_BPMP)	+=3D i2c-tegra-bpmp.o
> +obj-$(CONFIG_I2C_TEGRA_TARGET)	+=3D i2c-tegra-target.o
> obj-$(CONFIG_I2C_UNIPHIER)	+=3D i2c-uniphier.o
> obj-$(CONFIG_I2C_UNIPHIER_F)	+=3D i2c-uniphier-f.o
> obj-$(CONFIG_I2C_VERSATILE)	+=3D i2c-versatile.o
> diff --git a/drivers/i2c/busses/i2c-tegra-target.c b/drivers/i2c/busses/=
i2c-tegra-target.c
> new file mode 100644
> index 000000000000..6a8642983ea2
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-tegra-target.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for the I2C target controller on Tegra20 SoC
> + *
> + * Copyright (C) 2026 Marc Dietrich
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/reset.h>
> +
> +#define I2C_CNFG				0x000
> +#define I2C_CNFG_DEBOUNCE_CNT			GENMASK(14, 12)
> +#define I2C_CNFG_PACKET_MODE_EN			BIT(10)
> +#define I2C_CNFG_NEW_MASTER_FSM			BIT(11)
> +
> +#define I2C_SL_CNFG				0x020
> +#define I2C_SL_CNFG_NACK			BIT(1)
> +#define I2C_SL_CNFG_NEWSL			BIT(2)
> +
> +#define I2C_SL_RCVD				0x024
> +
> +#define I2C_SL_STATUS				0x028
> +#define I2C_SL_STATUS_RNW			BIT(1)
> +#define I2C_SL_STATUS_RCVD			BIT(2)
> +#define I2C_SL_STATUS_SL_IRQ			BIT(3)
> +#define I2C_SL_STATUS_END_TRANS			BIT(4)
> +
> +#define I2C_SL_ADDR1				0x02c
> +#define I2C_SL_ADDR1_7BIT_ADDR			GENMASK(6, 0)
> +#define I2C_SL_ADDR2				0x030
> +
> +#define I2C_CLK_MULTIPLIER			8
> +
> +/*
> + * This delay is used for a Tegra20 specific workaround which requires =
the
> + * delayed acknowledge of the address byte during read access
> + */
> +#define I2C_READ_ACK_DELAY_US			33
> +
> +/**
> + * struct tegra_i2c_target_dev - per device I2C target context
> + * @dev: device reference
> + * @adapter: core I2C layer adapter information
> + * @clocks: array of I2C controller clocks
> + * @div_clk: clock reference for div clock of I2C controller
> + * @base: ioremapped registers cookie
> + * @irq: IRQ number of the target interrupt
> + * @timings: i2c timings information like bus frequency
> + * @target: registered target client, NULL if none
> + * @nack: bytes of the current transfer are not acknowledged
> + */
> +struct tegra_i2c_target_dev {
> +	struct device *dev;
> +	struct i2c_adapter adapter;
> +
> +	struct clk_bulk_data clocks[2];
> +	struct clk *div_clk;
> +
> +	void __iomem *base;
> +	unsigned int irq;
> +
> +	struct i2c_timings timings;
> +	struct i2c_client *target;
> +	bool nack;
> +};
> +
> +static u32 i2c_readl(struct tegra_i2c_target_dev *i2c_dev, unsigned int=
 reg)
> +{
> +	return readl_relaxed(i2c_dev->base + reg);
> +}
> +
> +static void i2c_writel(struct tegra_i2c_target_dev *i2c_dev, u32 val,
> +		       unsigned int reg)
> +{
> +	writel_relaxed(val, i2c_dev->base + reg);
> +
> +	/* read back register to make sure that register writes completed */
> +	readl_relaxed(i2c_dev->base + reg);
> +}
> +
> +static int tegra_i2c_target_init(struct tegra_i2c_target_dev *i2c_dev)
> +{
> +	u32 val;
> +	int err;
> +
> +	err =3D device_reset(i2c_dev->dev);
> +	if (err)
> +		return err;
> +
> +	val =3D I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
> +	      FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 2);
> +	i2c_writel(i2c_dev, val, I2C_CNFG);
> +
> +	err =3D clk_set_rate(i2c_dev->div_clk,
> +			   i2c_dev->timings.bus_freq_hz * I2C_CLK_MULTIPLIER);
> +	if (err) {
> +		dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
> +		return err;
> +	}
> +
> +	i2c_writel(i2c_dev, I2C_SL_CNFG_NEWSL, I2C_SL_CNFG);
> +
> +	/* only 7-bit target address is supported for now */
> +	val =3D FIELD_PREP(I2C_SL_ADDR1_7BIT_ADDR, i2c_dev->target->addr);
> +	i2c_writel(i2c_dev, val, I2C_SL_ADDR1);
> +	i2c_writel(i2c_dev, 0, I2C_SL_ADDR2);
> +
> +	return 0;
> +}
> +
> +static void tegra_i2c_target_deinit(struct tegra_i2c_target_dev *i2c_de=
v)
> +{
> +	/* stop acknowledging the own address */
> +	i2c_writel(i2c_dev, I2C_SL_CNFG_NEWSL | I2C_SL_CNFG_NACK, I2C_SL_CNFG)=
;
> +}
> +
> +static void tegra_i2c_target_set_nack(struct tegra_i2c_target_dev *i2c_=
dev,
> +				      bool nack)
> +{
> +	u32 val =3D I2C_SL_CNFG_NEWSL;
> +
> +	if (nack)
> +		val |=3D I2C_SL_CNFG_NACK;
> +
> +	i2c_dev->nack =3D nack;
> +	i2c_writel(i2c_dev, val, I2C_SL_CNFG);
> +}
> +
> +static irqreturn_t tegra_i2c_target_isr(int irq, void *dev_id)
> +{
> +	struct tegra_i2c_target_dev *i2c_dev =3D dev_id;
> +	struct i2c_client *target =3D i2c_dev->target;
> +	bool read, new_xfer;
> +	u32 status;
> +	u8 val =3D 0xff;
> +
> +	status =3D i2c_readl(i2c_dev, I2C_SL_STATUS);
> +	if (!(status & I2C_SL_STATUS_SL_IRQ))
> +		return IRQ_NONE;
> +
> +	/* RNW is set if the controller reads from the target */
> +	read =3D status & I2C_SL_STATUS_RNW;
> +
> +	/* RCVD is set if the interrupt is for the address byte */
> +	new_xfer =3D status & I2C_SL_STATUS_RCVD;
> +
> +	if (!read) {
> +		val =3D i2c_readl(i2c_dev, I2C_SL_RCVD);
> +		if (new_xfer)
> +			i2c_writel(i2c_dev, 0, I2C_SL_RCVD);
> +	}
> +
> +	if (status & I2C_SL_STATUS_END_TRANS) {
> +		i2c_slave_event(target, I2C_SLAVE_STOP, &val);
> +
> +		if (i2c_dev->nack)
> +			tegra_i2c_target_set_nack(i2c_dev, false);
> +
> +		/* a new transfer may already have started */
> +		if (!new_xfer)
> +			return IRQ_HANDLED;
> +	}
> +
> +	if (read) {
> +		if (new_xfer) {
> +			udelay(I2C_READ_ACK_DELAY_US);
> +			i2c_slave_event(target, I2C_SLAVE_READ_REQUESTED, &val);
> +		} else {
> +			i2c_slave_event(target, I2C_SLAVE_READ_PROCESSED, &val);
> +		}
> +
> +		/* send the byte and release the bus */
> +		i2c_writel(i2c_dev, val, I2C_SL_RCVD);
> +	} else if (new_xfer) {
> +		/* the address phase is always acknowledged */
> +		if (i2c_slave_event(target, I2C_SLAVE_WRITE_REQUESTED, &val))
> +			tegra_i2c_target_set_nack(i2c_dev, true);
> +	} else if (!i2c_dev->nack) {
> +		if (i2c_slave_event(target, I2C_SLAVE_WRITE_RECEIVED, &val))
> +			tegra_i2c_target_set_nack(i2c_dev, true);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int tegra_i2c_target_reg_target(struct i2c_client *target)
> +{
> +	struct tegra_i2c_target_dev *i2c_dev =3D i2c_get_adapdata(target->adap=
ter);
> +	int err;
> +
> +	if (i2c_dev->target)
> +		return -EBUSY;
> +
> +	if (target->flags & I2C_CLIENT_TEN)
> +		return -EAFNOSUPPORT;
> +
> +	err =3D clk_bulk_prepare_enable(ARRAY_SIZE(i2c_dev->clocks),
> +				      i2c_dev->clocks);
> +	if (err) {
> +		dev_err(i2c_dev->dev, "failed to enable clocks: %d\n", err);
> +		return err;
> +	}
> +
> +	i2c_dev->target =3D target;
> +	i2c_dev->nack =3D false;
> +
> +	err =3D tegra_i2c_target_init(i2c_dev);
> +	if (err) {
> +		i2c_dev->target =3D NULL;
> +		clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks),
> +					   i2c_dev->clocks);
> +		return err;
> +	}
> +
> +	enable_irq(i2c_dev->irq);
> +
> +	return 0;
> +}
> +
> +static int tegra_i2c_target_unreg_target(struct i2c_client *target)
> +{
> +	struct tegra_i2c_target_dev *i2c_dev =3D i2c_get_adapdata(target->adap=
ter);
> +
> +	WARN_ON(!i2c_dev->target);
> +
> +	disable_irq(i2c_dev->irq);
> +	tegra_i2c_target_deinit(i2c_dev);
> +	i2c_dev->target =3D NULL;
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks), i2c_dev->clock=
s);
> +
> +	return 0;
> +}
> +
> +static u32 tegra_i2c_target_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_SLAVE;
> +}
> +
> +static const struct i2c_algorithm tegra_i2c_target_algo =3D {
> +	.functionality =3D tegra_i2c_target_func,
> +	.reg_target =3D tegra_i2c_target_reg_target,
> +	.unreg_target =3D tegra_i2c_target_unreg_target,
> +};
> +
> +static int tegra_i2c_target_probe(struct platform_device *pdev)
> +{
> +	struct tegra_i2c_target_dev *i2c_dev;
> +	int err;
> +
> +	i2c_dev =3D devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
> +	if (!i2c_dev)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, i2c_dev);
> +
> +	i2c_dev->dev =3D &pdev->dev;
> +
> +	i2c_dev->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c_dev->base))
> +		return PTR_ERR(i2c_dev->base);
> +
> +	err =3D platform_get_irq(pdev, 0);
> +	if (err < 0)
> +		return err;
> +
> +	i2c_dev->irq =3D err;
> +
> +	i2c_parse_fw_timings(&pdev->dev, &i2c_dev->timings, true);
> +
> +	i2c_dev->clocks[0].id =3D "div-clk";
> +	i2c_dev->clocks[1].id =3D "fast-clk";
> +
> +	err =3D devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(i2c_dev->clocks),
> +				i2c_dev->clocks);
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err,
> +				     "failed to get controller clocks\n");
> +
> +	i2c_dev->div_clk =3D i2c_dev->clocks[0].clk;
> +
> +	err =3D devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_target_is=
r,
> +			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), i2c_dev);
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err,
> +				     "failed to request IRQ %u\n", i2c_dev->irq);
> +
> +	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
> +	i2c_dev->adapter.dev.of_node =3D pdev->dev.of_node;
> +	i2c_dev->adapter.dev.parent =3D &pdev->dev;
> +	i2c_dev->adapter.owner =3D THIS_MODULE;
> +	i2c_dev->adapter.algo =3D &tegra_i2c_target_algo;
> +	strscpy(i2c_dev->adapter.name, dev_name(&pdev->dev),
> +		sizeof(i2c_dev->adapter.name));
> +
> +	return devm_i2c_add_adapter(&pdev->dev, &i2c_dev->adapter);
> +}
> +
> +static int tegra_i2c_target_suspend(struct device *dev)
> +{
> +	struct tegra_i2c_target_dev *i2c_dev =3D dev_get_drvdata(dev);
> +
> +	if (!i2c_dev->target)
> +		return 0;
> +
> +	disable_irq(i2c_dev->irq);
> +	tegra_i2c_target_deinit(i2c_dev);
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks), i2c_dev->clock=
s);
> +
> +	return 0;
> +}
> +
> +static int tegra_i2c_target_resume(struct device *dev)
> +{
> +	struct tegra_i2c_target_dev *i2c_dev =3D dev_get_drvdata(dev);
> +	int err;
> +
> +	if (!i2c_dev->target)
> +		return 0;
> +
> +	err =3D clk_bulk_prepare_enable(ARRAY_SIZE(i2c_dev->clocks),
> +				      i2c_dev->clocks);
> +	if (err) {
> +		dev_err(dev, "failed to enable clocks: %d\n", err);
> +		return err;
> +	}
> +
> +	err =3D tegra_i2c_target_init(i2c_dev);
> +	if (err) {
> +		clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks),
> +					   i2c_dev->clocks);
> +		return err;
> +	}
> +
> +	enable_irq(i2c_dev->irq);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(tegra_i2c_target_pm,
> +				tegra_i2c_target_suspend,
> +				tegra_i2c_target_resume);
> +
> +static const struct of_device_id tegra_i2c_target_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra20-i2c-target", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tegra_i2c_target_of_match);
> +
> +static struct platform_driver tegra_i2c_target_driver =3D {
> +	.probe =3D tegra_i2c_target_probe,
> +	.driver =3D {
> +		.name =3D "tegra-i2c-target",
> +		.of_match_table =3D tegra_i2c_target_of_match,
> +		.pm =3D pm_sleep_ptr(&tegra_i2c_target_pm),
> +	},
> +};
> +module_platform_driver(tegra_i2c_target_driver);
> +
> +MODULE_DESCRIPTION("NVIDIA Tegra20 I2C controller driver for target mod=
e");
> +MODULE_AUTHOR("Marc Dietrich <marvin24@gmx.de>");
> +MODULE_LICENSE("GPL");
> --=20
> 2.55.0
>
>
>

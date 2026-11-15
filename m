Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767203;
	b=P7J04jyuseMyQk+vZCerEorcpeXQkLAVgD+6I8k1uf4aexABemm3QvVuUUaG5/ELM1jI
	 TUlgNCady2f1WRnguqvRFmrQdXVSy9WmEBqleg7dsoZo438vfO0V8z2SQ6dLfiBtn/3gM
	 2YZBhdHuJnmvJUBgktRAE9zicdkD2ofznJMk7g8PnwGgpBpket+gw7KeHwK/a3UOLXDjg
	 ZSuT4jd/uDoM0VwtrJw/9XcrKN5aSS6AZ81BLskJwNxaG1Ews9TphFwRsoBVeOq2GK5Gt
	 A0+HmFRdCdTaXgeM5R7i8/YOkbylAMrWRLqv5RDldEji1+gArKHuZENb36O2UUfNRNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767203;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=89pP++7znW1qLM31h1F3XJ20ZL7ZnQ2yY1JPo3kpUZY=;
	b=JT/zXBEaJWXz6Phrwu6rCQ+tWu7OOvCKP+GNSinyLIuMeJ759i04VHS51t3YRgqItERL
	 Tg26uigsgx16shQ8fL7oA2+sIIHESWJcF+kN1MFXN/h+i9LatP0yXFzsgQfyFIgF+d65q
	 /L8RnFgV6jKUqNsVjidEAdT+0f1bCrUgtcVDG96uLFlil8VVgVbODfP4NIn+QP+fU2+GY
	 IyQJli7GPXk7MZ3GiwO3dE3HoYb5WoO5SUbrdsDVtXGHPmPLJ6cRcVsWZImo8gcostrWf
	 8GhrX+jmaNvgABpKQF1wowSjo5IWWXny0e/RwO2Kv/gVm11LftLUc5iiml6rBA0EicA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=baL1jDc0;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C0606A31A
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 18:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=baL1jDc0
DKIM2-Signature:  i=1; m=1; t=1794767200;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:CDHoAS5ZEO+6JovdDd9/qQ8vORoF
   rlsWmUwWjNUnMIErsOPdrYOjuESUNxoJz45i7w+S8caw6iokIkwtYxEbOxUxRBqkctG8E/InIBZ
   U399x2X+zGKfdGAfLtY1MYzU8QTI2sg8f23KDHB3cpMr8oyJYK3HY18QjrXL7/Q6lOvoafrLoyV
   lY55wDtKljfEkymvJsozjrGxsEwFEv9oC+hi5DYf4wA7tKvwbWA6BtZEw0wLWW971bpeeQ3ufiF
   R4z2Eo+iLn9mNrIENExM1cU9YbXLDijq9Y+aXZ32BK8d/2D9m267nZG+Z2LfYL6CY0/wo17FkSZ
   jWCPHR/LV3qolg==;
Message-Instance:  m=1;
 h=sha256:
   Dq/oEMW1Z+0tp8OksYs64wyoYvHIPAGGtRYkHbIP5yQ=:
   CXxqz5gZH1e15kG8ESL27yEdRgaL5scS85sNgc0LF5w=,
  sha512:
   jo4SwvUJ2TIeIgvOF8kuCnVnsQbICmlOmhmZdMmAzH4XGuhGVoE04duP/v6Y7Kzmhjer5DXpGgqDQItNsdnKOg==:
   7eMh0Pae6ngmdVu/x86XM3ZQaV73IJ5/E23U00qG9zkyW/AQfgh19N5Ut0ZsAyR6IztWfm5POrKT13rwhjXf4g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794767191; x=1795371991; i=marvin24@gmx.de;
	bh=89pP++7znW1qLM31h1F3XJ20ZL7ZnQ2yY1JPo3kpUZY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=baL1jDc0JwLWDT7olynaO4fwDV/cj46EqUGZxweD5SwMIqjMqSYeB5miEdUEJ3Wc
	 AivsaJHgYPv8LMszInX1VsutxMo0fNfWegd6Nco49RZRti+p8f8JwvkqlMG71pGsJ
	 ddAYB2ayCF5caUQT2LjtuAmX7nVFu8v7tnFnMFWHO15l3qy4ci0Ujm9IwCCt5T9JO
	 Ml/SUH5nYrOQuZ+S/m7VKmrX1ahIyGUFBfh4tz6IBVoMqncPNYsIGXHi6KL47RTTr
	 ah6jGNldeLEGHxq5yjUQ2uLvHBFnYz5HdALWCxYPLj1mtFlw9cZ08r1cawN80XIZu
	 SJyGV8VpWf8rr+Ln6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1wm9BZ2MMA-00qEeb; Sun, 15
 Nov 2026 19:26:31 +0100
From: Marc Dietrich <marvin24@gmx.de>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 2/2] i2c: tegra20: Add driver for Tegra20 I2C target controller instances
Date: Sun, 15 Nov 2026 19:26:15 +0100
Message-ID: <20261115182616.354580-2-marvin24@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115182616.354580-1-marvin24@gmx.de>
References: <20261115182616.354580-1-marvin24@gmx.de>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vsJCdXI5MiZKkvQrap4TNqN3zlkguD0Ya5Dk4UPAXjjIsady4XC
 mDGRs/LmrrL3muytHn2n8NwMnjRkIObB8b9q4tvJLd3ZkkYgJm+tOOU+ampQI76kQ131CHa
 bfrVpCfF4wt0BoUBkrgCEoty+sI8eUM0Qf34E15l14YERp1yL6HSTZFRNT3wSpB1DMB/yWM
 QG/99Fu533zVZwusuDFlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:30z67sh5BH8=;TvyXs5C03/g/pM0xcE3fpakRsl2
 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
 zzIJQMOg3iB4KVEc

Tegra20 SoC support 3 instances of the I2C target controller. It shares
ressouces with the I2C controller. Only exclusive operation as an i2c
target is supported for now.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 MAINTAINERS                           |   7 +
 drivers/i2c/busses/Kconfig            |  14 +
 drivers/i2c/busses/Makefile           |   1 +
 drivers/i2c/busses/i2c-tegra-target.c | 372 ++++++++++++++++++++++++++
 4 files changed, 394 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-tegra-target.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 95cd976a068c..7846aea22c96 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26579,6 +26579,13 @@ R:	Dmitry Osipenko <digetx@gmail.com>
 S:	Supported
 F:	drivers/i2c/busses/i2c-tegra.c
=20
+TEGRA I2C TARGET DRIVER
+M:	Marc Dietrich <marvin24@gmx.de>
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c-target.yaml
+F:	drivers/i2c/busses/i2c-tegra-target.c
+
 TEGRA IOMMU DRIVERS
 M:	Thierry Reding <thierry.reding@kernel.org>
 R:	Krishna Reddy <vdumpa@nvidia.com>
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d35456994280..4c5b0d15ec8e 100644
=2D-- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1242,6 +1242,20 @@ config I2C_TEGRA_BPMP
 	  of the BPMP firmware, and this driver merely communicates with that
 	  real driver.
=20
+config I2C_TEGRA_TARGET
+	tristate "NVIDIA Tegra20 I2C controller in target mode"
+	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
+	select I2C_SLAVE
+	help
+	  If you say yes to this option, support will be included for the
+	  I2C controller embedded in NVIDIA Tegra20 SoCs when it is used as
+	  an I2C target (slave) on the bus. A controller instance that is
+	  described with the target compatible in the device tree cannot be
+	  used as an I2C controller at the same time.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called i2c-tegra-target.
+
 config I2C_UNIPHIER
 	tristate "UniPhier FIFO-less I2C controller"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3755c54b3d82..724931114412 100644
=2D-- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_I2C_SUN6I_P2WI)	+=3D i2c-sun6i-p2wi.o
 obj-$(CONFIG_I2C_SYNQUACER)	+=3D i2c-synquacer.o
 obj-$(CONFIG_I2C_TEGRA)		+=3D i2c-tegra.o
 obj-$(CONFIG_I2C_TEGRA_BPMP)	+=3D i2c-tegra-bpmp.o
+obj-$(CONFIG_I2C_TEGRA_TARGET)	+=3D i2c-tegra-target.o
 obj-$(CONFIG_I2C_UNIPHIER)	+=3D i2c-uniphier.o
 obj-$(CONFIG_I2C_UNIPHIER_F)	+=3D i2c-uniphier-f.o
 obj-$(CONFIG_I2C_VERSATILE)	+=3D i2c-versatile.o
diff --git a/drivers/i2c/busses/i2c-tegra-target.c b/drivers/i2c/busses/i2=
c-tegra-target.c
new file mode 100644
index 000000000000..6a8642983ea2
=2D-- /dev/null
+++ b/drivers/i2c/busses/i2c-tegra-target.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for the I2C target controller on Tegra20 SoC
+ *
+ * Copyright (C) 2026 Marc Dietrich
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/reset.h>
+
+#define I2C_CNFG				0x000
+#define I2C_CNFG_DEBOUNCE_CNT			GENMASK(14, 12)
+#define I2C_CNFG_PACKET_MODE_EN			BIT(10)
+#define I2C_CNFG_NEW_MASTER_FSM			BIT(11)
+
+#define I2C_SL_CNFG				0x020
+#define I2C_SL_CNFG_NACK			BIT(1)
+#define I2C_SL_CNFG_NEWSL			BIT(2)
+
+#define I2C_SL_RCVD				0x024
+
+#define I2C_SL_STATUS				0x028
+#define I2C_SL_STATUS_RNW			BIT(1)
+#define I2C_SL_STATUS_RCVD			BIT(2)
+#define I2C_SL_STATUS_SL_IRQ			BIT(3)
+#define I2C_SL_STATUS_END_TRANS			BIT(4)
+
+#define I2C_SL_ADDR1				0x02c
+#define I2C_SL_ADDR1_7BIT_ADDR			GENMASK(6, 0)
+#define I2C_SL_ADDR2				0x030
+
+#define I2C_CLK_MULTIPLIER			8
+
+/*
+ * This delay is used for a Tegra20 specific workaround which requires th=
e
+ * delayed acknowledge of the address byte during read access
+ */
+#define I2C_READ_ACK_DELAY_US			33
+
+/**
+ * struct tegra_i2c_target_dev - per device I2C target context
+ * @dev: device reference
+ * @adapter: core I2C layer adapter information
+ * @clocks: array of I2C controller clocks
+ * @div_clk: clock reference for div clock of I2C controller
+ * @base: ioremapped registers cookie
+ * @irq: IRQ number of the target interrupt
+ * @timings: i2c timings information like bus frequency
+ * @target: registered target client, NULL if none
+ * @nack: bytes of the current transfer are not acknowledged
+ */
+struct tegra_i2c_target_dev {
+	struct device *dev;
+	struct i2c_adapter adapter;
+
+	struct clk_bulk_data clocks[2];
+	struct clk *div_clk;
+
+	void __iomem *base;
+	unsigned int irq;
+
+	struct i2c_timings timings;
+	struct i2c_client *target;
+	bool nack;
+};
+
+static u32 i2c_readl(struct tegra_i2c_target_dev *i2c_dev, unsigned int r=
eg)
+{
+	return readl_relaxed(i2c_dev->base + reg);
+}
+
+static void i2c_writel(struct tegra_i2c_target_dev *i2c_dev, u32 val,
+		       unsigned int reg)
+{
+	writel_relaxed(val, i2c_dev->base + reg);
+
+	/* read back register to make sure that register writes completed */
+	readl_relaxed(i2c_dev->base + reg);
+}
+
+static int tegra_i2c_target_init(struct tegra_i2c_target_dev *i2c_dev)
+{
+	u32 val;
+	int err;
+
+	err =3D device_reset(i2c_dev->dev);
+	if (err)
+		return err;
+
+	val =3D I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
+	      FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 2);
+	i2c_writel(i2c_dev, val, I2C_CNFG);
+
+	err =3D clk_set_rate(i2c_dev->div_clk,
+			   i2c_dev->timings.bus_freq_hz * I2C_CLK_MULTIPLIER);
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
+		return err;
+	}
+
+	i2c_writel(i2c_dev, I2C_SL_CNFG_NEWSL, I2C_SL_CNFG);
+
+	/* only 7-bit target address is supported for now */
+	val =3D FIELD_PREP(I2C_SL_ADDR1_7BIT_ADDR, i2c_dev->target->addr);
+	i2c_writel(i2c_dev, val, I2C_SL_ADDR1);
+	i2c_writel(i2c_dev, 0, I2C_SL_ADDR2);
+
+	return 0;
+}
+
+static void tegra_i2c_target_deinit(struct tegra_i2c_target_dev *i2c_dev)
+{
+	/* stop acknowledging the own address */
+	i2c_writel(i2c_dev, I2C_SL_CNFG_NEWSL | I2C_SL_CNFG_NACK, I2C_SL_CNFG);
+}
+
+static void tegra_i2c_target_set_nack(struct tegra_i2c_target_dev *i2c_de=
v,
+				      bool nack)
+{
+	u32 val =3D I2C_SL_CNFG_NEWSL;
+
+	if (nack)
+		val |=3D I2C_SL_CNFG_NACK;
+
+	i2c_dev->nack =3D nack;
+	i2c_writel(i2c_dev, val, I2C_SL_CNFG);
+}
+
+static irqreturn_t tegra_i2c_target_isr(int irq, void *dev_id)
+{
+	struct tegra_i2c_target_dev *i2c_dev =3D dev_id;
+	struct i2c_client *target =3D i2c_dev->target;
+	bool read, new_xfer;
+	u32 status;
+	u8 val =3D 0xff;
+
+	status =3D i2c_readl(i2c_dev, I2C_SL_STATUS);
+	if (!(status & I2C_SL_STATUS_SL_IRQ))
+		return IRQ_NONE;
+
+	/* RNW is set if the controller reads from the target */
+	read =3D status & I2C_SL_STATUS_RNW;
+
+	/* RCVD is set if the interrupt is for the address byte */
+	new_xfer =3D status & I2C_SL_STATUS_RCVD;
+
+	if (!read) {
+		val =3D i2c_readl(i2c_dev, I2C_SL_RCVD);
+		if (new_xfer)
+			i2c_writel(i2c_dev, 0, I2C_SL_RCVD);
+	}
+
+	if (status & I2C_SL_STATUS_END_TRANS) {
+		i2c_slave_event(target, I2C_SLAVE_STOP, &val);
+
+		if (i2c_dev->nack)
+			tegra_i2c_target_set_nack(i2c_dev, false);
+
+		/* a new transfer may already have started */
+		if (!new_xfer)
+			return IRQ_HANDLED;
+	}
+
+	if (read) {
+		if (new_xfer) {
+			udelay(I2C_READ_ACK_DELAY_US);
+			i2c_slave_event(target, I2C_SLAVE_READ_REQUESTED, &val);
+		} else {
+			i2c_slave_event(target, I2C_SLAVE_READ_PROCESSED, &val);
+		}
+
+		/* send the byte and release the bus */
+		i2c_writel(i2c_dev, val, I2C_SL_RCVD);
+	} else if (new_xfer) {
+		/* the address phase is always acknowledged */
+		if (i2c_slave_event(target, I2C_SLAVE_WRITE_REQUESTED, &val))
+			tegra_i2c_target_set_nack(i2c_dev, true);
+	} else if (!i2c_dev->nack) {
+		if (i2c_slave_event(target, I2C_SLAVE_WRITE_RECEIVED, &val))
+			tegra_i2c_target_set_nack(i2c_dev, true);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int tegra_i2c_target_reg_target(struct i2c_client *target)
+{
+	struct tegra_i2c_target_dev *i2c_dev =3D i2c_get_adapdata(target->adapte=
r);
+	int err;
+
+	if (i2c_dev->target)
+		return -EBUSY;
+
+	if (target->flags & I2C_CLIENT_TEN)
+		return -EAFNOSUPPORT;
+
+	err =3D clk_bulk_prepare_enable(ARRAY_SIZE(i2c_dev->clocks),
+				      i2c_dev->clocks);
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to enable clocks: %d\n", err);
+		return err;
+	}
+
+	i2c_dev->target =3D target;
+	i2c_dev->nack =3D false;
+
+	err =3D tegra_i2c_target_init(i2c_dev);
+	if (err) {
+		i2c_dev->target =3D NULL;
+		clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks),
+					   i2c_dev->clocks);
+		return err;
+	}
+
+	enable_irq(i2c_dev->irq);
+
+	return 0;
+}
+
+static int tegra_i2c_target_unreg_target(struct i2c_client *target)
+{
+	struct tegra_i2c_target_dev *i2c_dev =3D i2c_get_adapdata(target->adapte=
r);
+
+	WARN_ON(!i2c_dev->target);
+
+	disable_irq(i2c_dev->irq);
+	tegra_i2c_target_deinit(i2c_dev);
+	i2c_dev->target =3D NULL;
+	clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks), i2c_dev->clocks)=
;
+
+	return 0;
+}
+
+static u32 tegra_i2c_target_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_SLAVE;
+}
+
+static const struct i2c_algorithm tegra_i2c_target_algo =3D {
+	.functionality =3D tegra_i2c_target_func,
+	.reg_target =3D tegra_i2c_target_reg_target,
+	.unreg_target =3D tegra_i2c_target_unreg_target,
+};
+
+static int tegra_i2c_target_probe(struct platform_device *pdev)
+{
+	struct tegra_i2c_target_dev *i2c_dev;
+	int err;
+
+	i2c_dev =3D devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
+	if (!i2c_dev)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, i2c_dev);
+
+	i2c_dev->dev =3D &pdev->dev;
+
+	i2c_dev->base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(i2c_dev->base))
+		return PTR_ERR(i2c_dev->base);
+
+	err =3D platform_get_irq(pdev, 0);
+	if (err < 0)
+		return err;
+
+	i2c_dev->irq =3D err;
+
+	i2c_parse_fw_timings(&pdev->dev, &i2c_dev->timings, true);
+
+	i2c_dev->clocks[0].id =3D "div-clk";
+	i2c_dev->clocks[1].id =3D "fast-clk";
+
+	err =3D devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(i2c_dev->clocks),
+				i2c_dev->clocks);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get controller clocks\n");
+
+	i2c_dev->div_clk =3D i2c_dev->clocks[0].clk;
+
+	err =3D devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_target_isr,
+			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), i2c_dev);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to request IRQ %u\n", i2c_dev->irq);
+
+	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
+	i2c_dev->adapter.dev.of_node =3D pdev->dev.of_node;
+	i2c_dev->adapter.dev.parent =3D &pdev->dev;
+	i2c_dev->adapter.owner =3D THIS_MODULE;
+	i2c_dev->adapter.algo =3D &tegra_i2c_target_algo;
+	strscpy(i2c_dev->adapter.name, dev_name(&pdev->dev),
+		sizeof(i2c_dev->adapter.name));
+
+	return devm_i2c_add_adapter(&pdev->dev, &i2c_dev->adapter);
+}
+
+static int tegra_i2c_target_suspend(struct device *dev)
+{
+	struct tegra_i2c_target_dev *i2c_dev =3D dev_get_drvdata(dev);
+
+	if (!i2c_dev->target)
+		return 0;
+
+	disable_irq(i2c_dev->irq);
+	tegra_i2c_target_deinit(i2c_dev);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks), i2c_dev->clocks)=
;
+
+	return 0;
+}
+
+static int tegra_i2c_target_resume(struct device *dev)
+{
+	struct tegra_i2c_target_dev *i2c_dev =3D dev_get_drvdata(dev);
+	int err;
+
+	if (!i2c_dev->target)
+		return 0;
+
+	err =3D clk_bulk_prepare_enable(ARRAY_SIZE(i2c_dev->clocks),
+				      i2c_dev->clocks);
+	if (err) {
+		dev_err(dev, "failed to enable clocks: %d\n", err);
+		return err;
+	}
+
+	err =3D tegra_i2c_target_init(i2c_dev);
+	if (err) {
+		clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks),
+					   i2c_dev->clocks);
+		return err;
+	}
+
+	enable_irq(i2c_dev->irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tegra_i2c_target_pm,
+				tegra_i2c_target_suspend,
+				tegra_i2c_target_resume);
+
+static const struct of_device_id tegra_i2c_target_of_match[] =3D {
+	{ .compatible =3D "nvidia,tegra20-i2c-target", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_i2c_target_of_match);
+
+static struct platform_driver tegra_i2c_target_driver =3D {
+	.probe =3D tegra_i2c_target_probe,
+	.driver =3D {
+		.name =3D "tegra-i2c-target",
+		.of_match_table =3D tegra_i2c_target_of_match,
+		.pm =3D pm_sleep_ptr(&tegra_i2c_target_pm),
+	},
+};
+module_platform_driver(tegra_i2c_target_driver);
+
+MODULE_DESCRIPTION("NVIDIA Tegra20 I2C controller driver for target mode"=
);
+MODULE_AUTHOR("Marc Dietrich <marvin24@gmx.de>");
+MODULE_LICENSE("GPL");
=2D-=20
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173113;
	b=Y9DXzJ+dY+wP3G/bXpBLXpAEPWe6QAVtpstxgi95RkO4/3XLvh5/RkWi7QrRM1j1Kn9m
	 jaz3hvS97dWpgXxXnM+IW/zEThQQe17dj9JiRXgjHy/cF+DGdl1EEeIaxDI2wmmuS3DWq
	 B++4eC2o7G7C4Hy+En3l9e5xNz1JNbqqD/NmcWxIhoLuVATfsBFmFS9lchFt7X5dSQiVG
	 MRKf1U7XcKCK+vGUnqn69yFeG3+nogpzVEZLbMHK5aufyE6r/NWyd2e/DyFVrWT7pWQPi
	 nDryRB2DUIpkadH1Q6EXILmcqp/AdOLLskIphPdM1jd83+7lJnVPhz1zOusWQwooGhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173113;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=89pP++7znW1qLM31h1F3XJ20ZL7ZnQ2yY1JPo3kpUZY=;
	b=GfY+iPShu3EAIfKzrNoMU4pnm2BXEW9bzmZMHF1YPdnGvzW9bdIP9HfcZNTOzbew5/I+
	 +7Oon7bKxcqSrjkabvCarj0Vshyau2Rs/7fM3g8nj0EyJtl/Od13m9jbwnWyk+NJicveP
	 lmQprMXYdXGyko28XQX4TAMJO5/K6LQlIB5PkXqFRbVsntMI/2ds7Wwa9pfJPwCxsnvPc
	 mdBLByhzvlu+C3RrWbw6ngDHq5JywHD4O1otq030BOYTzwMHkkz7zX+1Q95aOD6TOwAvY
	 XZ89OXUE+y/cCHo3cj8xFJIG3VyJUXqvNSkY7Hka2DCJu2UzlCA1PyNvFqT4l+UkJSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sQv57n3j;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8F606A320;
	Sun,  8 Nov 2026 21:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D8F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sQv57n3j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794173109; x=1794777909; i=marvin24@gmx.de;
	bh=89pP++7znW1qLM31h1F3XJ20ZL7ZnQ2yY1JPo3kpUZY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sQv57n3jWxEWNTh+VO+0kusUAT1boK8A7sAJXRLDUbqDXy3rOU5045dLAiEEtg7p
	 nCi1Jg2NrgYquMmxwYvYqjo9lZKUVnzKvPtqpTuWWW2jKTF8mFSpzTElzl5F1tPEa
	 N4yAnNmKM93b2JsYeeBoMsTMjPl2iPr94p1rJ53n58DGtwOoeanDRLGQ6hXtyd/JF
	 M32aWJiESLD9SENz2c6bk/e60CPhcVuYKgOnINThG7CdxVRxJuhEPwFBYW9VqTN9L
	 1Bjp6sGAHe5zhmxR5717Uh6xFkdxG3NuDLaOZfVGA73f4fTwFRztUwjn+k607toH9
	 lZd0JrRNO+Cft63lkQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6llE-1xPdDX1ixi-0090p6; Sun, 08
 Nov 2026 22:25:09 +0100
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
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 2/2] i2c: tegra20: Add driver for Tegra20 I2C target controller instances
Date: Sun,  8 Nov 2026 22:24:58 +0100
Message-ID: <20261108212458.275980-3-marvin24@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108212458.275980-1-marvin24@gmx.de>
References: <20261108212458.275980-1-marvin24@gmx.de>
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
X-Provags-ID: V03:K1:3808GepW1hSo/m1iTfr0631Zl2W0ql05siW5I2ek7tuXHZ1xJKo
 qX8fq4bLJIpNnb8lCjn3Wm3Fclp1rcXbgi5RHctEnmA+oNsoaNxAIiz9xcBkBlYqqvpJt63
 vD5Gv9a9afBetsX/N/7DS6jWd7zn0mOQQqsTVxUcsAc72VqftkU0dgdx87dAjXYs9NZBJLG
 UGygi6e3J1qQG0FqfPGzg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bMgv5MYCvSY=;x2fhuwG1DVIuXf/kEGjBYEFPZAm
 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

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


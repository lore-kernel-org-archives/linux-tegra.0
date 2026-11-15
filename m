Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775561;
	b=SKjrW3KAqDXoAeABvGJk+JXKbSnwIW0fa7wMhzcI/X6/2rKl7wk2IbpJ/BznxMOQ6hqD
	 VgRf2KWSoyK7cM/ndCuu/R/Y6WYU1+ThWREq9Mv8wl2bNMR+izl9NB3X0rCiwfc2qx/RM
	 WYT2e05KM7lwkB2/0+6XOuPPbD40N5mM0bywzlK66GCoMS4wNwqJ9kkNlaB5kbMUCbJI6
	 7mRT75+PQInKtdX0CwSuZqbsnMbUA29soCoSLAzXKVvYZ/ToYJCV0bp0Y31XZcMRoaECF
	 pbyOfRmf9kUvXoQSdAQHFe9ZXVfFqj0MenijcVIIQ4MA8JErj9HVAsMcxW7ojRrTqRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775561;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=IcYSmyjDv5yePCGpUZ3ttrKC89cYpzCHPooQEszBkaw=;
	b=Otg+cT+8f8rNU+JeSr6zxyB8DM6s8+kQmxtiJlTlOnp1j4EEaZXV0Wl3tmFUODJ/pU7G
	 4Y+NUy/x8OpUp24bZ7rqS4EBQFHfhHtpbIGozYsgHw0RCXTuYAndYC/+FcMbo0iJS3dP8
	 eSLahh0BRkN2d+ODu/8DW31j4EQHeGKywwxa9w4Z8j0Lk+QAtETHBs2Z8AjTZfLPmqSoA
	 h2h73bpelEQpYUHSalnkzOCjdHs/JZmroLb22DoH3V/BYNqkSeuRPBr+xiUHYtZbvYxBC
	 wvVz9+RJnWmekHtcV/CPqVlDUTgc2e1ZyM9taWj+wU0zhh54LI/vfFZUGGtHHscqvqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="ci//8Xc/";
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574AA606A336
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 20:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574AA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ci//8Xc/
DKIM2-Signature:  i=1; m=1; t=1794775558;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:HpPlYv4ZyecGYqjxrMX7gC2uuiJZ
   MtmLuFtXxO9d+8dH1SzU7NlyQX/L5e0DiaeuvhnS6gdrIQuHObP8U5eVA8M66ippe2xPlGsPJdY
   phWhEV4oWs1MxCqhxtHCpqMRZljTO3QtkuW90aMpx58Y6jJKG9e/cMMAWbEyOLk+UP4++6Qiskp
   lEKSMvq1TDfEFwofbU1qaSNvlPUrSs4xhg3EgcahFnnyX1Ssf3X1koUwTS+dxDdJkOmYuXJFbWN
   uITNBzSc3ixWDnqIH8stPYuBEXZfuMpTtFEg/XHVXV2mIPjb9XCvoTEliAaLX+HCWC8SOIHh9R8
   4AwEhT96Eitixg==;
Message-Instance:  m=1;
 h=sha256:
   2cpb/j6ckML4kxoqWPiyDlI0jVwV3Xk9CdfNe7FZ+G4=:
   sQwx1b+3Tkr2w03sCCmNpp3E14dTiQRgqLQdWkMcbXI=,
  sha512:
   ImYt/Yr2Z8Mlivn7jujLSYJ7lfpyQ1PXRJ+JK2Ielgia80IJc/Map52hsG4mL2Hk0WIO55VCLqimC14R958rBA==:
   MNd89GCGuEVqkV+xEB+LYUirqzns+rz/uHOEBe4RG28iXOpaw1cZgouSJW54nMmcfOWlkAntwM3azqSIUMuPiw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794775534; x=1795380334; i=marvin24@gmx.de;
	bh=IcYSmyjDv5yePCGpUZ3ttrKC89cYpzCHPooQEszBkaw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ci//8Xc/t0sF0Rtm1FiqeFnZ2o4+aPFysZiZX5jCqIiQ2gurQjEQKds+Qrhcn7Ec
	 V6G0x6Wt2E2XMgx9nT6FKnETlE4F812vkyZSZ5HPrDTJdYp6349DESlBI2koDRS3U
	 wtyFGNfa0Jbs/GCg2k5QnEcvr1JWOudYRz8QxIM4bkhi+tEK557yq+SVW62QhVFLy
	 L9LQaTb0l2bbz4eB7SMVAhWrqo4//TYrgFd6/ezfHJwRl+Os/xXUppPHUGyWHR2vn
	 a9ezf4pWtpkDDJffvdjqDwmJVsh6infSDFoBqHDDrvyab+Lfu8HnSvsEbJQkBJlLk
	 9QBrZMEwlDrHyDioHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKBc-1xJNhE1B46-00FnNc; Sun, 15
 Nov 2026 21:45:34 +0100
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
Subject: [PATCH v2 2/2] i2c: tegra20: Add driver for Tegra20 I2C target controller instances
Date: Sun, 15 Nov 2026 21:45:22 +0100
Message-ID: <20261115204522.360063-3-marvin24@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115204522.360063-1-marvin24@gmx.de>
References: <20261115204522.360063-1-marvin24@gmx.de>
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
X-Provags-ID: V03:K1:aQfdlUuvp3NeVqRIS3w6yEts9gUkJaH8BMWy5mXSTvsgBphVLK0
 q2eqSfvx/4RK4FxKUiKf/tkBigC7RfY+EVesSPUPI0MHl6F4z+1oC5HcOOVKjYIEkiagGQo
 re8/CxBBzPfWi0SLB3kYc7X9ZXyK/7jkpF3udkNm3qkNKZVFd95UPjlZo5O7gFJiNnov+/Z
 MxlCmjY58jVxjdvpUHTEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Iz/5uYgpMng=;obFyf49aM0xwtBZwbfvryHTa4IV
 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
 NWE7KDecgVnDJ3oJtEXWI=

Tegra20 SoC support 3 instances of the I2C target controller. It shares
ressouces with the I2C controller. Only exclusive operation as an i2c
target is supported for now.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 MAINTAINERS                           |   6 +
 drivers/i2c/busses/Kconfig            |  14 +
 drivers/i2c/busses/Makefile           |   1 +
 drivers/i2c/busses/i2c-tegra-target.c | 351 ++++++++++++++++++++++++++
 4 files changed, 372 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-tegra-target.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3..e47734742cba 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26894,6 +26894,12 @@ R:	Dmitry Osipenko <digetx@gmail.com>
 S:	Supported
 F:	drivers/i2c/busses/i2c-tegra.c
=20
+TEGRA I2C TARGET DRIVER
+M:	Marc Dietrich <marvin24@gmx.de>
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-tegra-target.c
+
 TEGRA IOMMU DRIVERS
 M:	Thierry Reding <thierry.reding@kernel.org>
 R:	Krishna Reddy <vdumpa@nvidia.com>
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d7b89508311f..b8c5f9fb6c86 100644
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
index 000000000000..bca63cc89fce
=2D-- /dev/null
+++ b/drivers/i2c/busses/i2c-tegra-target.c
@@ -0,0 +1,351 @@
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
+ * @running: clocks and interrupt are enabled, the registers can be acces=
sed
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
+	bool running;
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
+static int tegra_i2c_target_start(struct tegra_i2c_target_dev *i2c_dev)
+{
+	int err;
+
+	err =3D clk_bulk_prepare_enable(ARRAY_SIZE(i2c_dev->clocks),
+				      i2c_dev->clocks);
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to enable clocks: %d\n", err);
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
+	i2c_dev->running =3D true;
+
+	return 0;
+}
+
+static void tegra_i2c_target_stop(struct tegra_i2c_target_dev *i2c_dev)
+{
+	if (!i2c_dev->running)
+		return;
+
+	disable_irq(i2c_dev->irq);
+	tegra_i2c_target_deinit(i2c_dev);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks), i2c_dev->clocks)=
;
+	i2c_dev->running =3D false;
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
+		i2c_slave_event(target, I2C_SLAVE_WRITE_REQUESTED, &val);
+	} else {
+		i2c_slave_event(target, I2C_SLAVE_WRITE_RECEIVED, &val);
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
+	i2c_dev->target =3D target;
+
+	err =3D tegra_i2c_target_start(i2c_dev);
+	if (err)
+		i2c_dev->target =3D NULL;
+
+	return err;
+}
+
+static int tegra_i2c_target_unreg_target(struct i2c_client *target)
+{
+	struct tegra_i2c_target_dev *i2c_dev =3D i2c_get_adapdata(target->adapte=
r);
+
+	WARN_ON(!i2c_dev->target);
+
+	tegra_i2c_target_stop(i2c_dev);
+	i2c_dev->target =3D NULL;
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
+	if (i2c_dev->target)
+		tegra_i2c_target_stop(i2c_dev);
+
+	return 0;
+}
+
+static int tegra_i2c_target_resume(struct device *dev)
+{
+	struct tegra_i2c_target_dev *i2c_dev =3D dev_get_drvdata(dev);
+
+	if (!i2c_dev->target)
+		return 0;
+
+	return tegra_i2c_target_start(i2c_dev);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tegra_i2c_target_pm,
+				tegra_i2c_target_suspend,
+				tegra_i2c_target_resume);
+
+static const struct of_device_id tegra_i2c_target_of_match[] =3D {
+	{ .compatible =3D "nvidia,tegra20-i2c-target" },
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


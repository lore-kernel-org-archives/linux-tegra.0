Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446E82C6B0;
	Sat,  6 Apr 2024 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712406699; cv=none; b=qjHn0PusPDKD51z+lzr2uezXiz0qrceak6bKJveRx0xl9KhTIbP7OCL/RVo1hzNLYoKdcz2DfHjOr9GNUe/qv2MbBtZw6xGbKIdEujpAUOc0y9ZS7KUUtVImnlWCT2ObZK0PaHxIqeFDiSas8/AiwAaO8O3wninQW6j77/2E2CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712406699; c=relaxed/simple;
	bh=SM/pSeREcZxRJBymGBgr2b/gAtaWPSkVvJa2VB2F504=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7ksOd3Cl5Y03WW9GCb2zmYLs1s9e/J/5M4t6Sq1II55ce2nb5q7YFE8ND/JqNRWzFOggQfPIz7XOrmk+vbS8O8d42JJnVJ7Fe8Cicy1xkEr5vZFxLvoFanOpudPJS8z0sB2I+eGbCNHYuA83pLc1w6UFE/8WhfYDv5T9bpHjHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=gw4mezeK; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="gw4mezeK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712406692; x=1713011492; i=marvin24@gmx.de;
	bh=HS2Lxlwc46+n1BOtuy4NlhsXKSmp87WkMscTM0DvPJ4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=gw4mezeKNttoWaGgh7SBmNGLtKXuTR9Jezf4zjzgCgWbRuXy4xTx80S11ejxB0Zw
	 aj4OP4BzgudTclEYwpInNWzQ4oHk1tpzVLa4IDiuIkmkHCM0d3F6QD3N0qQDhMwC8
	 Xfc1TcDiEyMggrbdwiwLeFYQpkb3cGGu3iKl79t7LYAUx7PoJhs8nOxWvaBWjN/By
	 rY2DiCop8bSOHmwL9OxvGM6H7UIDUdwEyOFCgkOqspZYsWrwR+JCYB+sDIThr0wwh
	 6AMFDjcxg6wdwQoX1hZXyhA2EmYRJ6zom+N6TDR9JPZFiGmYyh1dI1s/Gi21LzWta
	 u/I83xmujAAg5N7ktQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK4Z-1sjfrJ1DRB-00rDEB; Sat, 06
 Apr 2024 14:31:32 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	thierry.reding@gmail.com,
	dan.carpenter@linaro.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 4/5] staging: nvec: make i2c controller register writes robust
Date: Sat,  6 Apr 2024 14:31:22 +0200
Message-ID: <20240406123123.37148-5-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406123123.37148-1-marvin24@gmx.de>
References: <20240406123123.37148-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h1WTYvTjzxoB5q61KOXyDiiVqBrlmiXQZANtfZwu39QmUOF3v55
 qjeVVc5/dW9P1+GTFmv2atmAgTJFQgsZQa3BOKGVdUcZLwNDmaGwruWAzcIV9Fj45F3u6kU
 23/fg+V+PTU5Ix0+VupNAVfGl6IL6wwzuTD5+KHvABrbzctw4utBRUq5GFJypKa19FT+FoX
 VhzMOwLpyRopxqdJ0looQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZyQciNQTkNk=;tnP6u4U3H2T2QjimPhga7DDuMd5
 rtjyanzeuq/EcRDAxKR+GbwxEPROP9UIeDdl8oGbLRgoBdMcFvKzjlgq2P+OBLcqm/VbvaDaR
 tJaJUuoyNOm0bsk6KUQ4sN4NTKrF5LP+EARkQyKW05ggwH4a5zHtZntCCZE8yGh8LQFklJjRE
 9JpnMY1I+31uZ43CV+KKptE9pfbEzyB1Pfz99aHqtq+pH7O3y26xyf/RX+IP34t3inWuPL/Fe
 9EGBj3oHC0u/CpKjuUf/I14F1Ix2eAERU2k4vIByasKWpnRa250jnuF82zrY8OuDklc9Wqan/
 E4CtpmuQj+gdlGQXMxLLzdKjDdim8tmgBHKEW9q1IGbl9Rye4IBEDnUdmOAyti6kwC9OQvB0x
 eJUL4jbkfTfjEhGVYYYGG5R4aEraMnsYwK2xqE6ZLcVxcVrEmza4u2WQTiNri0MY41RutPBIL
 1op7Jm7ywoPUP9OEiuAO6WJLBoHD1bLFf+5SPjxLns3jw0CcY+bj6PCNv617chD4pSwTjnAQF
 /Yc3ITHAZe5PtS20OvJJfael/xKbqphjP6zD5k7lP5xJkZkAiY2N5lW5p6w61cNulX50rGwC2
 sHQ3v4tqHix3CD3ML04BqL9TsukQ1NYS2zSEDhX4x8GzC0hR+UXwlXYqPCIhTmxGUvG1WoeWT
 FKWtWe/Y/uxOBlm8ZvkujYEhl4O76bdGvNypUF2JzXZ9Nqh7fINGoacfBC1ahmKfohLuIemPY
 8LpJujxGwk/wKDRNCvOWnd1fQWYhHOVIWzsUAcBsIV2HG93nxUfIs6yG5fRimJE26wGGpkdrw
 BbFgytIfr9PCdt3TILn5wyr7ONJH3lai1z+NaBEV0qAyc=

The i2c controller needs to read back the data written to its registers.
This way we can avoid the long delay in the interrupt handler.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 45df190c2f94..214839f51048 100644
=2D-- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -570,6 +570,22 @@ static void nvec_tx_set(struct nvec_chip *nvec)
 		(uint)nvec->tx->size, nvec->tx->data[1]);
 }

+/**
+ * i2c_writel - safely write to an I2C client controller register
+ * @val: value to be written
+ * @reg: register to write to
+ *
+ * A write to an I2C controller register needs to be read back to make su=
re
+ * that the value has arrived.
+ */
+static void i2c_writel(u32 val, void *reg)
+{
+	writel_relaxed(val, reg);
+
+	/* read back register to make sure that register writes completed */
+	readl_relaxed(reg);
+}
+
 /**
  * nvec_interrupt - Interrupt handler
  * @irq: The IRQ
@@ -604,7 +620,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	if ((status & RNW) =3D=3D 0) {
 		received =3D readl(nvec->base + I2C_SL_RCVD);
 		if (status & RCVD)
-			writel(0, nvec->base + I2C_SL_RCVD);
+			i2c_writel(0, nvec->base + I2C_SL_RCVD);
 	}

 	if (status =3D=3D (I2C_SL_IRQ | RCVD))
@@ -696,7 +712,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)

 	/* Send data if requested, but not on end of transmission */
 	if ((status & (RNW | END_TRANS)) =3D=3D RNW)
-		writel(to_send, nvec->base + I2C_SL_RCVD);
+		i2c_writel(to_send, nvec->base + I2C_SL_RCVD);

 	/* If we have send the first byte */
 	if (status =3D=3D (I2C_SL_IRQ | RNW | RCVD))
@@ -713,15 +729,6 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		status & RCVD ? " RCVD" : "",
 		status & RNW ? " RNW" : "");

-	/*
-	 * TODO: replace the udelay with a read back after each writel above
-	 * in order to work around a hardware issue, see i2c-tegra.c
-	 *
-	 * Unfortunately, this change causes an intialisation issue with the
-	 * touchpad, which needs to be fixed first.
-	 */
-	udelay(100);
-
 	return IRQ_HANDLED;
 }

@@ -737,15 +744,15 @@ static void tegra_init_i2c_slave(struct nvec_chip *n=
vec)

 	val =3D I2C_CNFG_NEW_MASTER_SFM | I2C_CNFG_PACKET_MODE_EN |
 	    (0x2 << I2C_CNFG_DEBOUNCE_CNT_SHIFT);
-	writel(val, nvec->base + I2C_CNFG);
+	i2c_writel(val, nvec->base + I2C_CNFG);

 	clk_set_rate(nvec->i2c_clk, 8 * 80000);

-	writel(I2C_SL_NEWSL, nvec->base + I2C_SL_CNFG);
-	writel(0x1E, nvec->base + I2C_SL_DELAY_COUNT);
+	i2c_writel(I2C_SL_NEWSL, nvec->base + I2C_SL_CNFG);
+	i2c_writel(0x1E, nvec->base + I2C_SL_DELAY_COUNT);

-	writel(nvec->i2c_addr >> 1, nvec->base + I2C_SL_ADDR1);
-	writel(0, nvec->base + I2C_SL_ADDR2);
+	i2c_writel(nvec->i2c_addr >> 1, nvec->base + I2C_SL_ADDR1);
+	i2c_writel(0, nvec->base + I2C_SL_ADDR2);

 	enable_irq(nvec->irq);
 }
@@ -754,7 +761,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nve=
c)
 static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
 {
 	disable_irq(nvec->irq);
-	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
+	i2c_writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
 	clk_disable_unprepare(nvec->i2c_clk);
 }
 #endif
=2D-
2.43.0


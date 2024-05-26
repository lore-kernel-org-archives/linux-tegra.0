Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C712DD9C;
	Sun, 26 May 2024 19:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716752389; cv=none; b=G0gbB5/XvZdd9Ss8v3EXR8/4IbcfPCkdmwjVPjA/pnOPcGbMayJXP31KapBFpiSk4wZUuv3Gt6FegRyVCFAP5h+vLxBHybYB8h/VDoTCPrSTXMw4yaByqBM7oSyh7N5HZteBRkOJKT515dSwez5Pk2/VSCxzAaM9bJNKwIoH7y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716752389; c=relaxed/simple;
	bh=DHnxGzUjirj3ro/q+oFs0viVYvr+WWC0vNzE9V8uOAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L65dZzsp7ItBEzfHjoMxb9PgeUlHKOkRCTiEDmquCM+RHJx6QMOwM/rtXt3WUtpIYazAsNhE7T/s+RaEADK+RWjWrN+Mn7Kaw7MJjzvHcWmzF496dYbe88uhoFnKM0yUheNj17MMpFKDrL0rItgRRgfQJTGIJINfk/rKLprYkJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=hVjM8i/H; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="hVjM8i/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1716752384; x=1717357184; i=marvin24@gmx.de;
	bh=iUgMShb90flR5m9FQ9PSPkiCnj/h6cUBtPJjHv1ZPLI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hVjM8i/HYsTj6G0+W2DWKEIXcbtbDclhUU1JAxzrb34itex1zBHzWL773hhBIWK7
	 T/uYCVbcvvOLZrgF4fB/mp07TkpPhy04wnCwYr4Ve2GeYQowa4xum6YoHC266NVGS
	 qmUiKaPyPTKqqjwTU/iD3EKUl3xeYXLxmboQgLrd5S58SBcScRPD2uhOUxhCXD2HX
	 QJQnVo/X646fCXZ3LFkz8eigjlOSA9eOiL3szHZ25X76wSrSk+2A90fEW+mpFC7e0
	 c71ZMbnW0nVqHYiglicRiM6lHjiDOUwiOkPGzI7EBhGSGjecfQ58DO5aZ+UqDS6bZ
	 F/HWei+ILAjFnPelNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.32.108]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7GS-1sLn1x3tl4-00AaIk; Sun, 26
 May 2024 21:39:44 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH V2] staging: nvec: make i2c controller register writes robust
Date: Sun, 26 May 2024 21:39:32 +0200
Message-ID: <20240526193932.57277-1-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IkrPGArL2/7FQ5cbH76I+IdVWjalBd19PQ4jtxjxvn/S+8DKXzb
 uSm6+2y1V7enf/+w8WUOyADy3oKsIMUh2AOPqAa36jpR7gDN+tXqYaff3pwhVpzEXVth/oz
 MIqSvfr3yb0BBQKjleVJ7MxKKG2vcSpIu7m9E0AQB0s6ofHxZjy9MH2Q+Aa6O6WDcXi1Bt4
 P9SkbpEEHUv04qNDpbgpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gHoqkMsPaxU=;9H362u2bbsZO10Quo6UWaeRhgXw
 JxjsKrD0mrKFXv/J4GzA6vRFhJAwJ/P90d2N+dEztuoxOlrzeq3qcdjMPFEq8MQrBKGDdaJb4
 RECpCuzuE4BZgHA/6hhNbd+5pplnay73HMRn6NuaaGJ+iduOwIwzXJxiWEsxP2x+HRWaHeCtr
 xgB01ie6EaqDcwbb+/6Wdu3pZ9OTOyIxRQAGyljO586DEYQA+l5Aj5BJbkxtQLPE24dY3Hoia
 dO2iLWAEYVBdX8cCuQl+gsfvdfcLojxapr8Umk6ktQf17oCGLlnVHn9XVp/SHFx78E1O42rpX
 EiyKmYTzJM4gBwyhWKWmR/J10CV4VSHGYCU62sT4Jd1eTS8KwDWXilgq0ihMAQDp/jqQ0VGRa
 VylJklb/gI3J0VY2JNRD8Y9beFqO/qz4coS2fkkg3WyfCc2VNp3/PDQbZv+ADcnYqbHEZg/25
 Z8wIboAqHDtXI/vFakj6DH5+kgbQ47V9HJWqdeaNpVQgQ7Vv1iRDXGayrpBSNsvoWdSkh7MGq
 WVKXkKyOuVbqNlzHVwJJUFFksdgFX1CYuxA9wzEh7dlLt74TsrbdW8uVdB+fuqlIztvr9beWJ
 DHr+f1l5NcXw2JQXyUb9nWYUOXuN/AgvcwoCUaZDVtjWrFnZRcCLG3fnT2+2wkXkRpIBkXj2Q
 y2jBcFtBf+Q+noWGfF3Fsg/MXlBF6SAUEN7TmXiKsJgSlTbuJzJzKtbgdiNW3/2Sj1MPxWmtF
 NzHeeyP/9KJSp4h7FFmmV4QJmxtpkkauid45rCpoEruHsj+CGD7VtDv5FAf0lEFYzlLb8oXN9
 aC+yUeyrTcurJTfbraTPUDOx27q4q/cp3QATiOJ1sf9T4=

The i2c controller needs to read back the data written to its registers.
This way we can avoid the long delay in the interrupt handler.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
V2: rename i2c_writel to tegra_i2c_writel
 drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e5ca78e57384..d67d2f3338b2 100644
=2D-- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -570,6 +570,22 @@ static void nvec_tx_set(struct nvec_chip *nvec)
 		(uint)nvec->tx->size, nvec->tx->data[1]);
 }

+/**
+ * tegra_i2c_writel - safely write to an I2C client controller register
+ * @val: value to be written
+ * @reg: register to write to
+ *
+ * A write to an I2C controller register needs to be read back to make su=
re
+ * that the value has arrived.
+ */
+static void tegra_i2c_writel(u32 val, void *reg)
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
+			tegra_i2c_writel(0, nvec->base + I2C_SL_RCVD);
 	}

 	if (status =3D=3D (I2C_SL_IRQ | RCVD))
@@ -696,7 +712,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)

 	/* Send data if requested, but not on end of transmission */
 	if ((status & (RNW | END_TRANS)) =3D=3D RNW)
-		writel(to_send, nvec->base + I2C_SL_RCVD);
+		tegra_i2c_writel(to_send, nvec->base + I2C_SL_RCVD);

 	/* If we have send the first byte */
 	if (status =3D=3D (I2C_SL_IRQ | RNW | RCVD))
@@ -713,15 +729,6 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		status & RCVD ? " RCVD" : "",
 		status & RNW ? " RNW" : "");

-	/*
-	 * TODO: replace the udelay with a read back after each writel above
-	 * in order to work around a hardware issue, see i2c-tegra.c
-	 *
-	 * Unfortunately, this change causes an initialisation issue with the
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
+	tegra_i2c_writel(val, nvec->base + I2C_CNFG);

 	clk_set_rate(nvec->i2c_clk, 8 * 80000);

-	writel(I2C_SL_NEWSL, nvec->base + I2C_SL_CNFG);
-	writel(0x1E, nvec->base + I2C_SL_DELAY_COUNT);
+	tegra_i2c_writel(I2C_SL_NEWSL, nvec->base + I2C_SL_CNFG);
+	tegra_i2c_writel(0x1E, nvec->base + I2C_SL_DELAY_COUNT);

-	writel(nvec->i2c_addr >> 1, nvec->base + I2C_SL_ADDR1);
-	writel(0, nvec->base + I2C_SL_ADDR2);
+	tegra_i2c_writel(nvec->i2c_addr >> 1, nvec->base + I2C_SL_ADDR1);
+	tegra_i2c_writel(0, nvec->base + I2C_SL_ADDR2);

 	enable_irq(nvec->irq);
 }
@@ -754,7 +761,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nve=
c)
 static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
 {
 	disable_irq(nvec->irq);
-	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
+	tegra_i2c_writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
 	clk_disable_unprepare(nvec->i2c_clk);
 }
 #endif
=2D-
2.43.0


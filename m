Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BD6C132;
	Sun, 21 Apr 2024 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713696414; cv=none; b=Og3n4DNWG3DnEgj2pm/qz5uoABhH7HQKbk4KKYfO0G6Q1xA0Pn8kTHzkFNP88fhD9PV1PIYfsA1OWAe9gFBQNg36myQ7qFlY4f22tGEPHGb0DCy7hKyRR/zhV88iN9SuMsDW/8fqUvSl75nWNuH9L//M9z1s96mOoJDnWwa1Umw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713696414; c=relaxed/simple;
	bh=+6jkqo7bx2eBWdWkuUQDSRe+EEbStjxJwp7fYyxYc7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Liijw09NiwanwORC0dbufrbxvvPY/b83sbzBy6ek8bAtTpeMHFmwvu2NpEpFYvUj4BhabRE5hP8GqvrRWEUXpar7mVLM4qHyS68CwvKtOlChX7W1CEKTx9ka8C1lcnTbRFDvWjNqKZf44lcyBmKUaV5H9RCXunboGxHencCJIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=DEyq/t60; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="DEyq/t60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713696408; x=1714301208; i=marvin24@gmx.de;
	bh=JHDf34r4g8ewz9UWOAYwffoU2McK+j3XP7wrY3n2V3A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DEyq/t60UuF0SHlWJFDtpwM0IzPIrUj/wH17cVxAA1TDuvlBsmTwEB5qT6y/eLPo
	 J55p6X6FTa4zGpslb4AQr2io0irAdzp83gN6Z9bZEbJ6qzN99s/tQ7vB+6uRF9Y+3
	 WV5ftOiq+ujuI/ISgnzPLUxcf3RPNsXP0WC74yhT1AH3KCshFPwlDNUTQRC4WOdJg
	 2T/hKjkXosJSoXo2ChnN5KFTz76cjhrmEFTS0zO7kYrZj1mqklVbFogwmOwpF4Uae
	 eH9sKCQNhS/ZkHlXgBj6WYnlfqcOzcue2M0T7tkky9yBESUv1FrjfmX8SICrU0zWt
	 sJg+rjhWFM2+W3hN1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.33.78]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf0BG-1sei5S10m2-00gXDP; Sun, 21
 Apr 2024 12:46:48 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH] staging: nvec: make i2c controller register writes robust
Date: Sun, 21 Apr 2024 12:46:42 +0200
Message-ID: <20240421104642.25417-1-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4wTVb6vFwfayWz76vpc1Gg8r0jWhiKUYUvdIc2mV06P7g5Tfxli
 JtsdBy8316TbhWoUMO5MBXdpjtdAzzYKtW67njEUVwP+T+pJ066sB0LDoER4rvcIa2UaOty
 U4Td3OjQeya9T6zNY933v1tyRvfDdQC1BZ0qDB2UYcHXu8QeeERzxRGYMyCg27+nNjO6wbB
 Qr1L0UrR/bEpKDD9WyLkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O6Twng5TBDg=;78KbT2eX3/Y+Y42olTobeR1Ea/M
 4JiIANC8ioqu7oHIhCTMKFnq/Vj1qDIgc5f0oo//Pn2F0eD4fdHt6g25pJvQRlYuGB6F6RUEB
 kAvyeqtglxwZvCT6B6g3/4wJK0Gz7T996Tul8V9jb757knZa5gVntAniH7KOgXA+NSbZoHI6/
 wR90Fwdwk+OeL9Thgdzu/cypIbhWbiNCiX7GiL8JRc2ppjAmHN4y2EZw+Bmdj0U8TlbJIVHKV
 Q8xCKvDakTmPUjTzJowTpaWcg1qCQzrA3MYr72vfI1fjMbvnDXilVJTk1d8JKjj0CyxUnLhbL
 UEzckJBOJ8WrPi2Rq5JTsitoj6C7XK0lKRsGau3pfbDoQ5kfNb+3ORBpJEbfeRX9nRj+cVPFE
 pd1zTf036tArt/aYSV0nWAMjFV6tDGPRcW9ZJ7cXAwErah5DYs6uNkozMCLW2ZKtF+Q66Mp6P
 uvZeiXW40dYA8YqwSzNuHbiwvGpvte/99CEt1lY2mK2iij27qOhykTQpMyc5BGODA4Yk3k3QY
 wDs9kAWsB6OkBIDDikS1ZEa/pFdqD77lejrW+SyPpAJuoPksW4tXaab46tEsx8H7bpUwB5zDC
 0fAeeKFKxVqP4nch/Kpj5KdXkvJqlz+NFtuJAbhRaJXQCOVWNnZLTJWPUrIrLn0jjYHaTNSZ9
 PzFylSZTuSsX6ssaYk3RwwalUO2LLta3n5/Oio7qax40TegpA3AcaILgrTXauqtjExdNKpVYd
 7snN0G9DqodVfApOwUNjkKuYsfmW2Sfce/1wTPM7CguPPyIEaIYvTZXxsNAYv8dh+E2Y3zA+c
 W0qrAPki0R3ex89oRbu7GVLqPlRwoDmhCvN1SslUxMHng=

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


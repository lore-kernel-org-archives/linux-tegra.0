Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FECB53E3B;
	Sun, 14 Apr 2024 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713107399; cv=none; b=LPLcSW1VsJj0Mt72D/S+BJx3+QU+CSg4trvp+VhDatkrv6DuY9GOPdEtk/2CNr3SXi9BJ05Dv5Z+FtC8g5xcnv48uZ0Rjo7Nqg1IqVW/eNbOgdnSKv40QWXxJw0ZeQdLhEwNr7zPH36Yr8p7L2QYRrrX18gh+8luZpUDHB6KjZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713107399; c=relaxed/simple;
	bh=RUUUUU/+MRaqLUQ6S2Lt6OlxPXhSdGhtCyfL9ss746A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3bAf8I+TVIiR1lpQwROss5ZE0Af85162hWEYMKVAZszgO1UF0LAkvh3/SwTHghrRIzDN3dktVqo2ygnHSJi8HW8ZRmYvdW7UWh2ksZH3+HLj4oMheTD1l1gZQ8vOpYmeOLQv8ViEGwoV/Ptw+rRQbe0VIY7CBkYkR4NzvgdEPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=DdqFIUYA; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="DdqFIUYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713107393; x=1713712193; i=marvin24@gmx.de;
	bh=ntElP8UDVq6xXia05JurblK5tesZnH1qmkBN4MkVbYY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=DdqFIUYA9NUpTQxT+Jg4xUUZNKqdHlnnmj7DHFMUNInzyFmzlh0KajRHlP2LYuu/
	 i2sKJwBOIafCesP5VMUt97Fkjzkm/jICIEB03D/lt1kst8WUabTtT/+1Xsz8cFoCM
	 aWr9tw/7axj3BlvZgT7ocoDF7FRblPdODoRBDzV+O2iRaVAwammuoysGFeHGfdseE
	 rtBYtbUEP0agfalHmwLyDgajGpEYtt40++xYoF9NdBTLkPRz+uDrSYEUEmuSTnQJa
	 1j78ZxUVcRz4TSYP7q1oucCFnwMAu8TdcXQZMr2HEPvn7SfMavfxW37LCsT58h9XE
	 qh9lvu6qQQ/7zZFT4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.32.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzfG-1sLlop1t2I-00R2p9; Sun, 14
 Apr 2024 17:09:53 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH V2 4/5] staging: nvec: make i2c controller register writes robust
Date: Sun, 14 Apr 2024 17:09:37 +0200
Message-ID: <20240414150937.22621-1-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2024041156-renderer-shrunk-6da7@gregkh>
References: <2024041156-renderer-shrunk-6da7@gregkh>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7Jpo07An8cN1gA5xybhRGtBNc+u3X8qRhKQSvsYTaFkAIU8w0Up
 LC9DXivBjiphxXF/Yxb7eRs/sK10NyO2HXaxbXgR6B7rfYIjwCbz5jSWwojIagMU6gkwCGL
 VkuMmnN90LKfzFsz0NQdv8TUgHwtVIYPgGWoXJtGq9ipyPBZDVdjqI6PK1h431u5Pn9hyXb
 FAI6Tnk8TOWUztdEvDgkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XcgkCco9oVo=;6nqHHAEBT3kun2Raos3pUvmHXoa
 79kyxb/Mzw+yIXc6A9vXantw98I9DYJzj3HNpdT8AHmFtwjPMBAZRY3ZqlqL1NlrZevmiy9PX
 Er2Nix2ZW3KTxTRu6ggwAQY6wPOpsEAdPKbQP292HFTZ8BkPyjW3rJffa2E0dJ+5S+MuR2r8Y
 3nMPuuTCnqYSsqWwOpUQt+W2xSE7+hRCNBk9ojmKXDrFsA+uwKpTiC45oTkwzvoQzWHEBmlTX
 0Bdb2cJLXoB/XozXj7Srqf+MNHoAOZn0LQypvk3Pp5+hksHSWz7US/11v6eqv8VVGjTUe7RD5
 +Lw9tGDK4Qe+tOHdKu30Cq8j5r7hJAeyr04/JTt2Vqnsy0DbGMC1Ugxem57Omqfz2wcNa64UV
 NB3HGtPlQ/IgmUj8K0ByTwGs6Glh44xMiEaYWkxK2uVIV2dcl8a+WQKbSfuuTamvF5DEDfbCj
 Ch9L/MiytJWMTaanJZRqRMkh023BKjvjmDwLpFOHNjlFSzZoaLf/fHj0f5v5awgfwKsTvlCSq
 ATbYuPJiVCiC9PJz6j4LN0+vT5s1Qrso/mPVMRL/0HMxcXJiO7RDnMMBHfE/n0cDndEbzQ2O6
 JyCX1DGyA03EZeZiqEkAuwmcm7aE9m/QdSuT0Ghh7KgKr5BUF/JYRrZN6DCnyC1ipqFY4/D+5
 QEqDMXiXzYb+LTTN6KD2EexIDsZBAgSQg0v4nY0vRwwBiEYgZRY8HKl5u3Mq8je9uEH/38+jq
 2ASJPXyvGj0oaPGVUuf7sN+QX0ZZn+70eaRJFPu/MNxBemtue0fn8mBuu7cXboDmvPDkYcYo4
 7HxDTfMaKZOjHmgJWWvW2phEK1vr66Tcm9dccOcKt8lGs=

The i2c controller needs to read back the data written to its registers.
This way we can avoid the long delay in the interrupt handler.

V2: rebase against staging-next

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


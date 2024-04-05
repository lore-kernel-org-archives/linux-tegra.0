Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30016DED7;
	Fri,  5 Apr 2024 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326186; cv=none; b=JnrjVBPpDYyM2G8snHT9NF/GXLnjIp1cs5iyxv65iBXs1fxeGjUmpMcieFCItPEzXAEOOSoQFYHkmj0EdP6IfcwGbNMPV5o4mthJu8E+LwhaRhz1iHFNYHfevkfgW5e3ZmFODeS05Ls/pSRJhsY4etM0733yRfxphDnH52ECOJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326186; c=relaxed/simple;
	bh=qQLca1mk06ctY8h2gaJrKNfWQ3nAnwuygru0fnMDTgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wc6Pb8lUQZay1KNVovkOayguUEZOfC0TW++bH9/xD2zzY45teFl6+ueSylcTuwd4sGeabeO1MnWViXC2cX3ssMLbppzkFJAxFrlWYFtvVTsifWgry1YqUJ9UNvrt6JX8JKhZZ2Xo8crm/+6mlsRqVZanQU2yc8SSjbZjeu+xeo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=fNdpq5Ez; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="fNdpq5Ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712326182; x=1712930982; i=marvin24@gmx.de;
	bh=wPjd+zdgyv1iUH1JsuBjUx4h71WzLlRwG28d7jg6uOU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=fNdpq5EzdlU2AdR+EfK33x7SQvXgqPze3p2T+gENxjHEAkaP5FCP6SpalVyPO0jE
	 DmNFErTbVQE6ktOFUxsm2hy22bgozDPRragf1ozGfVUpZAmVQxPv+P59jiK95f/Xd
	 4S13LQdF3t0VxEANho776KvIMslGpgtKzWh6ognF5XnUhvdeUqrV7ml/MkTWzMCxh
	 ys84UUZwrsYutjZDKkk34wxmW9skGvmf8f/2HGIdrDxGjhb3yuSRhWeBd02EE9sVW
	 AY00snrZ8tTkGKEOole+AUBytws1Fnpw28f1k/jRyUjt82vx1McPeZ686phOw8OQh
	 /vrqhLrTQISPu3hDYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNh7-1sRpIf0y6x-00hxUz; Fri, 05
 Apr 2024 16:09:42 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 3/4] staging: nvec: make i2c controller register writes robust
Date: Fri,  5 Apr 2024 16:09:05 +0200
Message-ID: <20240405140906.77831-4-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405140906.77831-1-marvin24@gmx.de>
References: <20240405140906.77831-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ObnDNpcfh74Y00/fiY6iCYuToyt4122/E+3ww0JWg5Xy7nd7PSl
 CZTkzAAClbmetA5yMCNgYSS8NuHinqOZUWxAv5D5YNf7Ed/Q4N9WkdZ1UCWbGyEe+/7GNjT
 +OcvspoXoO5wJg+pBRPYB95JZxtMAuxaeyT/nL0lVT270it/w7tDEJ7SdJ8pDnbOLEayoWY
 eKbG/wa0SDYzlDIFcXEvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bv67JWCeKEI=;qNq1YvZ1VuPj+IVRijbLpaiZA4P
 c3xUOB8jrSJj5GorGmrVLTvpB6a1J+h4tbRByTkWVNYjUCBJuuySLQEeHwVD5aKX9YDs95rKy
 rdr4TQgGF5PFsBCCRHTPiaLXD24IP9dqPIwZbHr4qNwnkNNd0RMNJNwqPb+2aHyrGmGOaPZjV
 VGHE1q0qkXI6jzdGkt7ixAN2xTgG5oeBERPTia2KwBkUoa+8PyTKfvd5md1+14iR3O7aljqQM
 ItMgt/3WHtFjUH1AXRkbZ0q9q+K+L9rmMPcYaj3xM0SWJRLKVxD9KwpdmiW+1AcIR9TWRloE4
 wYTiI5+U83OkCGVPmF9rXT+4hEmJeZfM+45bZfZSGrFlDgQlNoPAcsWxYxoGAGeVFYiOMXWmQ
 51t2Z2IA+8DwWKYk3TVaPrHcR/2fG7c8x3goJbyfVhsYUek19P47rGq5HHmMilddf7TthoZwi
 uiP4+fEtpKs4dZbr4TDHXv2LDEb328CaFZnMq+KdytnRpi9glJVUo18RiVPpsy0y9mK6Ni7/k
 eowzXaokd86ftOfv+ZKiXs1OaGIYId7vWJ8pqXVxeC0uYs6Go2JMPhggPlYfDxJhjYUG8ut9H
 rEPAmLPIEGTodVu84Yx6MD+8EIRi4Q7laQoYmu2H7SxQihYBLHKYQ+Wo5HsLH7pTjgCuyjjQa
 qV6Jd13s3jgjX3CMoGJL54ijMwYI2oUESxST5bDhO5a8WDGXS2P8kbk/OgheDj9T0cPnx9ovS
 7JF9VImZ3s14g0QpwIyLL39UTUKA9jR5Iv0GPz/Kgi8wpQ6Ks6RhQ4Md9QH2rTYxoBQ4dwURz
 7Hvr1vxvc4zjAs9pMvv91PgBRoStzkbUAQAIjfhZ2gWeg=

The i2c controller needs to read back the data written to its registers.
This way we can avoid the long delay in the interrupt handler.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/nvec.c | 39 +++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 282a664c9176..9914c30b6933 100644
=2D-- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -565,6 +565,20 @@ static void nvec_tx_set(struct nvec_chip *nvec)
 		(uint)nvec->tx->size, nvec->tx->data[1]);
 }

+/**
+ * i2c_writel - savely write to an i2c client controller register
+ @ val: value to be written
+ @ reg: register to write to
+ */
+
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
@@ -599,7 +613,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	if ((status & RNW) =3D=3D 0) {
 		received =3D readl(nvec->base + I2C_SL_RCVD);
 		if (status & RCVD)
-			writel(0, nvec->base + I2C_SL_RCVD);
+			i2c_writel(0, nvec->base + I2C_SL_RCVD);
 	}

 	if (status =3D=3D (I2C_SL_IRQ | RCVD))
@@ -691,7 +705,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)

 	/* Send data if requested, but not on end of transmission */
 	if ((status & (RNW | END_TRANS)) =3D=3D RNW)
-		writel(to_send, nvec->base + I2C_SL_RCVD);
+		i2c_writel(to_send, nvec->base + I2C_SL_RCVD);

 	/* If we have send the first byte */
 	if (status =3D=3D (I2C_SL_IRQ | RNW | RCVD))
@@ -708,15 +722,6 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
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

@@ -732,15 +737,15 @@ static void tegra_init_i2c_slave(struct nvec_chip *n=
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
@@ -749,7 +754,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nve=
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


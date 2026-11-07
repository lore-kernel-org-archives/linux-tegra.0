Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046598;
	b=KOEiDMujkWt6kTgXdpob9+M+8qbatQfWCZ4N9wOtzSwMDRuZdpDpCX1jNcIzJwH7DzjB
	 NXDtwr/vbvvfSjGwaCwMihjCDELicl9oQjkf+2l953JC+jXco2zFAiiZy7i6hUqMKuYQj
	 F5rgKrhBEf2fIZzmsJCqodLgRb87vK1UKUOch3RKmfCZXw8sY/Si0/qo2GbUbrznmnYTN
	 W4rm3TpARm1+CYp8J2NIUn5WV/+MCDC2KISSBlJ3wQJhoz/YkoYol5GDfcpncLWQjzJ8o
	 OLBCizN3rSVlWZVhqezVke502hUd5igJVmu+W0NAOF3uJDu5+IIveQnLKL+3k031H1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0zdj0JMmNNgvImUjXW+dc1czDRoUybgPmc34A31iLmc=;
	b=GO+hYhU1O6VeR/2nl3hFi37D/TeKB4RVepk8li4Qhmj89grzJSDW8fYOhiIGK198BSpH
	 BiKROMBg3S3HR+8ww5p3m5rKpVmolD1c/hu+RNv0nAud4lFiM4JNSa3YiSuGdcPqiA9sG
	 20609mcTw1Ny0zcAp15Z7yI2e7Lg5Ns6QvxEEKVpq2iA5RA328sK+GE9pymiWZ/9uRTAJ
	 RGCcTZB+QD0TggMiF1nJ+WVxmfqjDSgZ7G9/BZQEDRQxVmURJLPHELGDAcBp+S5DHrAKv
	 +RSc3gKf2z/WFRqwIcTX5mpBK128+SDQ7UsfYnKTHozXIf33o6eMXiZrZDFNH7R99zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNkb04W1;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BE9606EE9E
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BE9606EE9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNkb04W1
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-85d363fb73cso858697a34.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046597; x=1794651397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zdj0JMmNNgvImUjXW+dc1czDRoUybgPmc34A31iLmc=;
        b=aNkb04W1py1ku5H1xgnLz0dOS/ffVHHWmxnZk4B7K3C/uVx54QSdRIyoFJfZDFr5A7
         vxaYhbuK6uTCVyWuDO8oQ7Nq8XPbRHDpuSB0bE31yHnRptWKZZgeXlNGfz5zYsEBSVhn
         9gxd6cdieqFLeditUU2MDgb4lpcm1sLHYRmsYimYTfj69ViD1IZLyo6WSuTT+ftlcbiH
         2B6S2INmpYCA2zz2EHsPzupzYKUap2PrGwXmPMYzJCHlyPgVQFw8IzesXaJ3QaT55akW
         6ch7xOYYxQDmZa/WhtppzU6uUOOSOU2rBMkFiPC/jLpfEQHFegwmfRLhzQiGiw0ihEw9
         xtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046597; x=1794651397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zdj0JMmNNgvImUjXW+dc1czDRoUybgPmc34A31iLmc=;
        b=zw60WG46UDH3WtQAYEuH8nVC5qo3rDnUJI9fbNiLaTrxbAakiv0it029Xw/933pj6o
         +SFZPxRlYWYekvY+CQSwEG1upNDfjqz+JGvYHV8LLICwZWjk6DxfQzxcCSuhbgJBwMRg
         bpfXg/MU2ivhDBZfUdaRRYxPhbWhEO74yAZZsOJMHc9IuuEum3Y6vp22ZeyhIJrTXuGF
         qLu1S1iXOL2Nm7J48uB3H8sxpkAAgXyNWEzfkbr/q0+YiUmbhAGvnDLu8JCjvQirf/2a
         IBz25N7ckGnqk+sd2IqROMjo+9PlPfkAhryrxkG0S5ahLAS4BM/6zn0j2WTe/fgpSVhG
         0Iug==
X-Forwarded-Encrypted: i=1; AKwUvBw8WJFi0QRLjqvYJtm1BhQt+wHyj5q45vU735hm7/a81E8ZGIXG8P1PSgx7Q7hxtmsUpsA/Azxec7OSyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fKSAeAMgu3svG5IkLLZcPsMH+UKeJuFzGT6jopgToDFGsLpHI
	9+iaP2hHxwCiUuOVgXUVXr2LhNFNX5k26PjwsEdEOmrYOjyzhIE0jUhP
X-Gm-Gg: AYBFou3dE2k0Aq3QzBMNMSRj4cTgMEH+yNoKio0YM+zsgeXCnJ7zCfp7xR7ybK0vLO0
	TnKUAb66Ns7kIwRYHrqcbTC6v+fSKXHQalbSuJNB8CeUEC0r+yfN1Z3laBusja6LZ8nZDfrtzYS
	+2W+q46mWcfoI0rJnmBDOdn5cefzuNdCCTo5BcHUz+HPcoXOJT/Q1NM1WX/D4GcFzQQJZhCU81g
	i9UJib5abl6dFPLHS9lCQWO+0JhD2QrsATk5wJXSaH8PO8CbCEpYYXkJUahYwSie/Nsyzd29jiZ
	Y11+mX6r+u3jfSCkpL92APNP3q/TTYghOjPIzI0MKZrGcHvSzL8IaNbQT5laCiMu3+wdf6izeSg
	H5k7Qhk6Ta9MEZTX1khGyLZC6X0Pz7oLIzulYKRa0WxjPvOThg9L4pEEkwfnNdMnKBEv6woW4r9
	BxFv0dutGDMJEBTFrdRgnFAMK8USRKEOsiB9r7DIDGEPTBk3fneSfvjJym4eNHJbrgIK5BpbNSN
	ngj1Ft1/LXMs0EFetw2TrSvAaea8Lq3djz4Jyj9tIkjVPrppyqys46avaowfK0uOlxVFadOEWyW
	GebZbq+dNZlu2giBPPQZ11+aNfbt0uhH6uGEHry102CvFd3MoMnaN9gwvvO0QyG2AXGQpCBkzfK
	fNVnRA3UAGtKlt9CSvbNXRpVZEuY+rsIWopQHLtgaSr2IHDSW+3JidlH6Uc4d6Y1WaH9/uFKpz0
	Q8Q2ZUqajKB77lOGRO5pctRJt6Uw8h2+HKm11pNZGi6+5gyj8/8CaI
X-Received: by 2002:a05:6830:6809:b0:85e:ef69:238a with SMTP id 46e09a7af769-85f1cfce0famr5153719a34.11.1794046596984;
        Sat, 07 Nov 2026 02:16:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:01 -0700
Subject: [PATCH 04/58] mtd: rawnand: separate hardware disconnection from
 cleanup
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-4-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A retained MTD handle can still enter NAND operations after its
controller is unbound. Closing a writable character device also calls
nand_sync(), which takes the chip and controller locks. Freeing their
storage during remove is therefore unsafe even without another explicit
read or write.

Add nand_disconnect() to serialize disconnection with regular operations
under the chip and controller locks. Make nand_get_device() reject a
disconnected chip and propagate that error through its callers. A sync
after disconnection becomes a no-op. Suspend and resume also honor the
disconnected state.

Unregister MTD devices first so removal notifiers can finish their I/O,
then disconnect before releasing controller resources. Wake any
remaining suspended waiters when disconnecting. Panic writes also check
the disconnected flag; their notifier clients must be drained by MTD
unregistration before controller resources are released.

Keep nand_cleanup() separate. Controllers adopting this interface must
retain the chip, controller lock storage and NAND metadata until their
last MTD and device references are gone.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c | 76 +++++++++++++++++++++++++++++++++-------
 include/linux/mtd/rawnand.h      |  9 +++--
 2 files changed, 69 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..8f7d2571e8d9 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -336,21 +336,47 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static void nand_get_device(struct nand_chip *chip)
+static int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
 		mutex_lock(&chip->lock);
+		if (chip->disconnected) {
+			mutex_unlock(&chip->lock);
+			return -ENODEV;
+		}
 		if (!chip->suspended) {
 			mutex_lock(&chip->controller->lock);
-			return;
+			return 0;
 		}
 		mutex_unlock(&chip->lock);
 
-		wait_event(chip->resume_wq, !chip->suspended);
+		wait_event(chip->resume_wq, !READ_ONCE(chip->suspended) ||
+			   READ_ONCE(chip->disconnected));
 	}
 }
 
+/**
+ * nand_disconnect - drain hardware access and reject further operations
+ * @chip: NAND chip object
+ *
+ * Unregister the MTD device first so removal notifiers can finish their I/O.
+ * Call before releasing controller resources. Operations waiting for resume
+ * are woken and fail with -ENODEV.
+ * The chip, controller lock and NAND metadata must remain alive
+ * until existing MTD handles are released; nand_cleanup() is a separate step.
+ */
+void nand_disconnect(struct nand_chip *chip)
+{
+	mutex_lock(&chip->lock);
+	mutex_lock(&chip->controller->lock);
+	WRITE_ONCE(chip->disconnected, true);
+	mutex_unlock(&chip->controller->lock);
+	mutex_unlock(&chip->lock);
+	wake_up_all(&chip->resume_wq);
+}
+EXPORT_SYMBOL_GPL(nand_disconnect);
+
 /**
  * nand_check_wp - [GENERIC] check if the chip is write protected
  * @chip: NAND chip object
@@ -581,7 +607,9 @@ static int nand_block_markbad_lowlevel(struct nand_chip *chip, loff_t ofs)
 		nand_erase_nand(chip, &einfo, 0);
 
 		/* Write bad block marker to OOB */
-		nand_get_device(chip);
+		ret = nand_get_device(chip);
+		if (ret)
+			return ret;
 
 		ret = nand_markbad_bbm(chip, ofs);
 		nand_release_device(chip);
@@ -3879,7 +3907,9 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	    ops->mode != MTD_OPS_RAW)
 		return -ENOTSUPP;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	old_stats = mtd->ecc_stats;
 
@@ -4449,6 +4479,9 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
+	if (READ_ONCE(chip->disconnected))
+		return -ENODEV;
+
 	nand_select_target(chip, chipnr);
 
 	/* Wait for the device to get ready */
@@ -4479,7 +4512,9 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	ops->retlen = 0;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
@@ -4539,7 +4574,9 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		return -EIO;
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
@@ -4627,7 +4664,8 @@ static void nand_sync(struct mtd_info *mtd)
 	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip);
+	if (nand_get_device(chip))
+		return;
 	/* Release it and go back */
 	nand_release_device(chip);
 }
@@ -4644,7 +4682,9 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 	int ret;
 
 	/* Select the NAND device */
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	nand_select_target(chip, chipnr);
 
@@ -4688,10 +4728,14 @@ static int nand_suspend(struct mtd_info *mtd)
 	int ret = 0;
 
 	mutex_lock(&chip->lock);
+	if (chip->disconnected) {
+		mutex_unlock(&chip->lock);
+		return -ENODEV;
+	}
 	if (chip->ops.suspend)
 		ret = chip->ops.suspend(chip);
 	if (!ret)
-		chip->suspended = 1;
+		WRITE_ONCE(chip->suspended, true);
 	mutex_unlock(&chip->lock);
 
 	return ret;
@@ -4706,10 +4750,12 @@ static void nand_resume(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	scoped_guard(mutex, &chip->lock) {
+		if (chip->disconnected)
+			return;
 		if (chip->suspended) {
 			if (chip->ops.resume)
 				chip->ops.resume(chip);
-			chip->suspended = 0;
+			WRITE_ONCE(chip->suspended, false);
 		} else {
 			pr_err("%s called for a chip which is not in suspended state\n",
 				__func__);
@@ -4743,7 +4789,9 @@ static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (!chip->ops.lock_area)
 		return -ENOTSUPP;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 	ret = chip->ops.lock_area(chip, ofs, len);
 	nand_release_device(chip);
 
@@ -4764,7 +4812,9 @@ static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (!chip->ops.unlock_area)
 		return -ENOTSUPP;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 	ret = chip->ops.unlock_area(chip, ofs, len);
 	nand_release_device(chip);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5c70e7bd3ed5..90b2169cc745 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1264,9 +1264,10 @@ struct nand_secure_region {
  * @pagecache.page: Page number currently in the cache. -1 means no page is
  *                  currently cached
  * @buf_align: Minimum buffer alignment required by a platform
- * @lock: Lock protecting the suspended field. Also used to serialize accesses
- *        to the NAND device
+ * @lock: Lock protecting the suspended and disconnected fields. Also serializes
+ *        accesses to the NAND device
  * @suspended: Set to 1 when the device is suspended, 0 when it's not
+ * @disconnected: Controller resources are unavailable; reject hardware access
  * @resume_wq: wait queue to sleep if rawnand is in suspended state.
  * @cur_cs: Currently selected target. -1 means no target selected, otherwise we
  *          should always have cur_cs >= 0 && cur_cs < nanddev_ntargets().
@@ -1326,7 +1327,8 @@ struct nand_chip {
 
 	/* Internals */
 	struct mutex lock;
-	unsigned int suspended : 1;
+	bool suspended;
+	bool disconnected;
 	wait_queue_head_t resume_wq;
 	int cur_cs;
 	int read_retries;
@@ -1595,6 +1597,7 @@ void nand_wait_ready(struct nand_chip *chip);
  * sucessful nand_scan().
  */
 void nand_cleanup(struct nand_chip *chip);
+void nand_disconnect(struct nand_chip *chip);
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0


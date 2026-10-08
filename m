Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8AE346766;
	Thu,  8 Oct 2026 18:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483899; cv=none; b=PBF6bCCrAlzde4qrvJ9LECILfcsJbzrnNwQ2Mzt0HdXkhGR8v2ftjnqONx4ZihiwAUmcyn54orYE1sHDXdcKnkpHrDZTjhagysPSYeQpydpnlD+V4hGQ4cmp1OhffIG90GdMaxasB804zJ1usj3Z3HXXOGjq3RpApGl7629meMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483899; c=relaxed/simple;
	bh=Z6dDStlBha2SD7JvKL72qbGcPL+lvXsOt+9Uc6SfJQo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=raEWsZTv/m+4PCZH20CvikjvY2bz9++owpW1mfT6klCMSAYTVvl9/iD9U+s2Tux2UYaT0t9KyqY2YIpVtbsWt0e7fL9XiXHKD5mOsYNIB/rdJP9qw+ReTxwsyYls7Bw9WtIIuLYYq6x2ehQ6VJwr9P4/PPPjIvKjC3pNwfww838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTDrn38dqil8QCg--.13270S2;
	Fri, 09 Oct 2026 02:24:40 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Stefan Agner <stefan@agner.ch>,
	Lucas Stach <dev@lynxeye.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: tegra: fix OF node leak in tegra_nand_chips_init()
Date: Fri,  9 Oct 2026 02:24:42 +0800
Message-Id: <20261008182442.2770036-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHTDrn38dqil8QCg--.13270S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1UWr4DAF4rAr1DCF4xCrg_yoW5Jw43pr
	WUCa90kw4jkF4xGa4Syan5Z3WYyw1xt3yUG3sa9as29wn5Jr1UGr98GFy0qFs8CFZ7C3W3
	Xr45JF18Cr45ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9jb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
	C2KfnxnUUI43ZEXa7IU5qeHPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMOA2rHpDmH8wACsR

tegra_nand_chips_init() takes an extra reference on the child NAND node
with of_get_next_child() and passes it to nand_set_flash_node(), which
only stores the pointer in mtd->dev.of_node. None of the return paths,
including the successful one, drop that reference, so the device node is
leaked. The get/put pair performed by the MTD core in add_mtd_device()
and mtd_release() is balanced and cannot compensate for it.

Release the reference with of_node_put() right after the node has been
stored, and route the earlier error paths through an err_put_node label
so that they release it as well.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/tegra_nand.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 7f9eb5f042a7..752ec3768b73 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1086,19 +1086,22 @@ static int tegra_nand_chips_init(struct device *dev,
 	nsels = of_property_count_elems_of_size(np_nand, "reg", sizeof(u32));
 	if (nsels != 1) {
 		dev_err(dev, "Missing/invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put_node;
 	}
 
 	/* Retrieve CS id, currently only single die NAND supported */
 	ret = of_property_read_u32(np_nand, "reg", &cs);
 	if (ret) {
 		dev_err(dev, "could not retrieve reg property: %d\n", ret);
-		return ret;
+		goto err_put_node;
 	}
 
 	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
-	if (!nand)
-		return -ENOMEM;
+	if (!nand) {
+		ret = -ENOMEM;
+		goto err_put_node;
+	}
 
 	nand->cs[0] = cs;
 
@@ -1107,7 +1110,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto err_put_node;
 	}
 
 	chip = &nand->chip;
@@ -1119,6 +1122,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	mtd->owner = THIS_MODULE;
 
 	nand_set_flash_node(chip, np_nand);
+	of_node_put(np_nand);
 
 	if (!mtd->name)
 		mtd->name = "tegra_nand";
@@ -1141,6 +1145,11 @@ static int tegra_nand_chips_init(struct device *dev,
 	ctrl->chip = chip;
 
 	return 0;
+
+err_put_node:
+	of_node_put(np_nand);
+
+	return ret;
 }
 
 static int tegra_nand_probe(struct platform_device *pdev)
-- 
2.25.1


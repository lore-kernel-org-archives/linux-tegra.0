Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59637410D2F;
	Thu, 14 May 2026 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770534; cv=none; b=GaQh2TPuC0QfbQOto4cMMH4kLFK9qR42Db5RO0+gUI4N1DMW2iPprtGmi1K4yuCPOIl0wlXWXy10/6FOaapQ3mYndiMOl84a36NtPZ5ctP7IQPFpQi6HKVBXyyc6W8AQA7ogPlERb72fobvc0KYLCNJwoI77mdR/ckLmn2iQQ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770534; c=relaxed/simple;
	bh=JA8yV+QK8BosoCH/4FosyvERNGhrrE+s1PDY8QHwMQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HYcwvrQUNhhm1P9tBm6C1I1liMRU5OQw4Xnmj6UF/Ts6o2aH+rtbpai3QMzwIChBBqumIqAJ/GIlwd2Lj+FvQ/y+cgeu1QpCcKSsqDL5Dp/SFrkm/W3PdWGYcLGvQfG7Nls0STZ2ag29FfHCIo9QCQsyIDmNj496vg863sf22vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=SOdhjUAR; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="SOdhjUAR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 6FE2A600025B;
	Thu, 14 May 2026 15:47:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id lD8sePFOM8qE; Thu, 14 May 2026 15:47:28 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6FAAE60020C2;
	Thu, 14 May 2026 15:47:28 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NA2Gtf+fFj04PTND+0t9TktuWb6JGQ89xyKhXYc0Ko=;
	b=SOdhjUARqCKdZbYd3+mDEviLLdgU3eHXwCvuH3/HrD9xWUHHGowHA692kRk6UAefc6L2h8
	xCPEB11f+RRaT/tVOwT0cH/iR+uen/MAC/uBVFIo+73Lj9qdtvgHmLZjcXCpeSkEKwCuPd
	XvnQVMT6uTU7r5GZVlb0r0DoSRei6VLwBoweMN5k899BTKbcZ3BOwNppBrTjz5Rdig5fCU
	e2p+bv0S2A7PePTGPnvwaapk2GJr5S7XVhGyQoVUyfJ2Z7ap2JfqEeWe58OnJaTgnzmiLL
	udvL3zYZ8nalY/trLk8XV0XE8IVsbTGrUrA6v8M6lPJbk7FiGzS+4JXJBY0yrw==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CFB77360275;
	Thu, 14 May 2026 15:47:27 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 14 May 2026 16:47:20 +0200
Subject: [PATCH 2/4] mfd: max77620: convert poweroff support to sys-off API
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-smaug-poweroff-v1-2-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=2514;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=JA8yV+QK8BosoCH/4FosyvERNGhrrE+s1PDY8QHwMQo=;
 b=/6m/rVtf/FFgBTVMU3mf1D+Nq4W2412regH0ZRKIDlq+HysxVx1mFgB+mH39nKoW6Yk48uCWe
 WWU6XsMiq/fDeyer6NtnFNpnkWAsnJeCIq42/DXH+speBG7hh2pJ5RY
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Convert max77620_pm_power_off() to the sys-off callback prototype and
register it with the sys-off API when the device tree marks the PMIC as
a system power controller. This also removes the global max77620_scratch
pointer by passing the chip instance through the callback data.

This modernizes the driver's poweroff handling and aligns it with
the kernel sys-off infrastructure.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/mfd/max77620.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index 3af2974b3023..c4f89a9681f3 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -31,11 +31,10 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-static struct max77620_chip *max77620_scratch;
-
 static const struct resource gpio_resources[] = {
 	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_GPIO),
 };
@@ -484,13 +483,15 @@ static int max77620_read_es_version(struct max77620_chip *chip)
 	return ret;
 }
 
-static void max77620_pm_power_off(void)
+static int max77620_pm_power_off(struct sys_off_data *data)
 {
-	struct max77620_chip *chip = max77620_scratch;
+	struct max77620_chip *chip = data->cb_data;
 
 	regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG1,
 			   MAX77620_ONOFFCNFG1_SFT_RST,
 			   MAX77620_ONOFFCNFG1_SFT_RST);
+
+	return NOTIFY_DONE;
 }
 
 static int max77620_probe(struct i2c_client *client)
@@ -501,7 +502,6 @@ static int max77620_probe(struct i2c_client *client)
 	struct regmap_irq_chip *chip_desc;
 	const struct mfd_cell *mfd_cells;
 	int n_mfd_cells;
-	bool pm_off;
 	int ret;
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
@@ -573,10 +573,14 @@ static int max77620_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	pm_off = of_device_is_system_power_controller(client->dev.of_node);
-	if (pm_off && !pm_power_off) {
-		max77620_scratch = chip;
-		pm_power_off = max77620_pm_power_off;
+	if (of_device_is_system_power_controller(client->dev.of_node)) {
+		ret = devm_register_sys_off_handler(&client->dev,
+						    SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_DEFAULT,
+						    max77620_pm_power_off, chip);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					"failed to register power-off handler\n");
 	}
 
 	return 0;

-- 
2.54.0


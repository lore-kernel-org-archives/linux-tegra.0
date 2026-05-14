Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A41F4219F2;
	Thu, 14 May 2026 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770533; cv=none; b=O4aO/okkFFNsv/0QAVkEei7HeqDD79lfyAwsaZYsqt/jvd4wn1Cu9cX89U7ISMoGTr7idkwXb7MFrE1j+Q06FuWbe+8m9GmfElzJISNHYwUHQS4IV7pBhAoplhIG9X23N3cJWA2hWZdM/rRO7yUoW0xiRDCo29B77GfzfYC1MBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770533; c=relaxed/simple;
	bh=EMOZ9KhOtUkr6GKfd7Yj0yXxYgXnjs2s04jA5kPD/MA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vtz+IykeJ/aZVTeyDYzd/Ub9M/8mdisY+D7/F55L2K2raQ2FnDrjcWi1bRyclgXwrm2jNOq7LhKKMOsGgSGa9ffIwXHqlqZk70XtIgR57jQFD/Ja30wLxvetZexPFU7vkVYRLd92I5afII99STk/yNOoc5l+Y6OQv5diubW21R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=hDCTM9jp; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="hDCTM9jp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0AC3560020C2;
	Thu, 14 May 2026 15:47:31 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ZK7wsflRmjsw; Thu, 14 May 2026 15:47:29 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 11DBE600022B;
	Thu, 14 May 2026 15:47:29 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gIIHohhxfreSLoAD8V86VP5969wDk4fLYdaYpGL5+hE=;
	b=hDCTM9jpfH6mxlb0r21LnH72Q705EDZh1yiX+WmPT/akRA2rAmHe8h3+11srOT7UDQLw4p
	jZkZduEWEsyOVixPaFIr+mfSKNrViyeNowmGmAvuFS6UnX2YOBCfaSiPnubmLCBT78zep8
	zAGA1EWT2fMxGUm/OITeVHw7KV0cRHkZC0Cex0yzgRsVj2wgLmi+/wKFE9kNV1wJDDKww4
	VsMs6GDwov4q+6z66Dtl7eKcphYA6E5mLr/GpIvBvQvhidqRfTJMiSCovROH6NZxPg7y6M
	/5X3J+UCi9skguR9NdxwGuIZkAXFwv6q9VtTvpsza09N/fOZbQF4Nv62vTIztg==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 74154360260;
	Thu, 14 May 2026 15:47:28 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 14 May 2026 16:47:21 +0200
Subject: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on Pixel
 C
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=2174;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=EMOZ9KhOtUkr6GKfd7Yj0yXxYgXnjs2s04jA5kPD/MA=;
 b=JvvfsRUjLwodi/WBii3lHYcZxJOSU4Bt5SpfGjYqjnt23eP5enKTC44EU9YYmiXQ3+cP6SCwW
 e0UixKEGxEeDwXgdYZ1b+ophNehQuOJyU4OLrcNEAeLlS9bhbrjzBa6
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
than the PSCI SYSTEM_OFF call, whose firmware implementation is:

__dead2 void tegra_system_off(void)
{
        ERROR("Tegra System Off: operation not handled.\n");
        panic();
}

Raise the MAX77620 sys-off handler priority above SYS_OFF_PRIO_FIRMWARE
on Pixel C systems so it takes precedence over the PSCI poweroff handler.

Other systems continue to use the default sys-off priority.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/mfd/max77620.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index c4f89a9681f3..3b1f3a2f3566 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -494,6 +494,18 @@ static int max77620_pm_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max77620_power_off_priority(void)
+{
+	/*
+	 * For Smaug  we need to override the PSCI poweroff handler
+	 * which is registered at priority SYS_OFF_PRIO_FIRMWARE.
+	 */
+	if (of_machine_is_compatible("google,smaug"))
+		return SYS_OFF_PRIO_FIRMWARE + 1;
+
+	return SYS_OFF_PRIO_DEFAULT;
+}
+
 static int max77620_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -502,6 +514,7 @@ static int max77620_probe(struct i2c_client *client)
 	struct regmap_irq_chip *chip_desc;
 	const struct mfd_cell *mfd_cells;
 	int n_mfd_cells;
+	int priority;
 	int ret;
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
@@ -574,10 +587,11 @@ static int max77620_probe(struct i2c_client *client)
 	}
 
 	if (of_device_is_system_power_controller(client->dev.of_node)) {
+		priority = max77620_power_off_priority();
 		ret = devm_register_sys_off_handler(&client->dev,
 						    SYS_OFF_MODE_POWER_OFF,
-						    SYS_OFF_PRIO_DEFAULT,
-						    max77620_pm_power_off, chip);
+						    priority, max77620_pm_power_off,
+						    chip);
 		if (ret)
 			return dev_err_probe(&client->dev, ret,
 					"failed to register power-off handler\n");

-- 
2.54.0


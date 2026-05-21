Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE5C3806C1;
	Thu, 21 May 2026 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371348; cv=none; b=Q6+EzvG7o4J/Xb0nNfFDCjK8uaKnsknIu+cU92BnXEJZd7gA3mwrGbIOYs2fI5io8DemVgHIPUUOXPjPykIbAdCvm5LLsDWdc/MdCgLxiXFmgdXfHGgyFXfcJIkDKh3axT1kncJcGHv0APCLBz9g5VD8O+fqB4l9t1iFmp+LCaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371348; c=relaxed/simple;
	bh=30I1zq1fbN1304iqR3Yq8890rzS3VPpWaE4zkD/puC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SiFU6Twop+ghKySYnKMYzD3vR/AWUd2fqVQ8qQWZ/R53lo2mzvll0i6bLQIco8W5PNh39w3aldIcM1MEApvSHBCUsB3X7Cy1AeP9Y/56781z5bzCNtDLOkmPGKWLzmBX0tupMblebJe4+4DcbXfz6JGYA5/+nU+nUiQjSMd/xJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=mL76+Enr; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="mL76+Enr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id BCF39600BDE8;
	Thu, 21 May 2026 14:49:02 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 7SZv9AG3iHQf; Thu, 21 May 2026 14:49:00 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 96F71600BDF1;
	Thu, 21 May 2026 14:49:00 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1779371340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VvVHUbmQ+WjkloSk1zk0pWkVzdva6UL6PuIGsy545lg=;
	b=mL76+Enr8GhNoJE91V2BPPqAbKmRZMEZsx2kci+KlK7wQwecVJ1HBcBfmH5+BrTKUHy1qh
	H8f12VD+XnKv+f5i4yrKUQvQ5PC3nfj77c7QzwU7iNsREGMSw/Ca2Y1p+67vxu5y9e7mHb
	5SImsasrMKCXavVxHe75SQDNANLbnq0U6Ax6OqHuUgy/nfxhn7Oms/xWp7F9MDhXd/LtDg
	DrEeKfb232+hHrx1Vkts6sMBR/G/fcIzKZ6wgTqjkY+YpPeiC8RcACGIkIh+mV/6x9M/JU
	3lWy/DcvO3dSYvh4u/MfPYK+jR2r6hzse5ZivhgWy2rUf+1uEfQfMvTFtmJnLg==
Received: from [192.168.1.1] (unknown [IPv6:2001:861:8c82:4ef0:2bc6:7ef1:5c9b:813f])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id C118236029D;
	Thu, 21 May 2026 14:48:59 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 21 May 2026 15:48:48 +0200
Subject: [PATCH] soc/tegra: pmc: Restrict power-off handler to Nexus 7
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-smaug-poweroff-v1-1-a0b3a778fbe0@tecnico.ulisboa.pt>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr2JmbUmL0IAr72FYtHUKY5SSTkEN4
 e4Crl2+5P33Z2CMhAznwwwRJ2IK/QrqeADXmb5FQbeVIZe5lqUqBD/N2IohvDAG70Wtc+3KUip
 rHayjIaKn9x68Nj/m0d7Rpa2yGR1xCvGzP05q8/7GJyWkOElfm0JXVa31JaHryYVsfBDbYLIhQ
 bMsyxetgwNgxwAAAA==
X-Change-ID: 20260514-smaug-poweroff-9626c5501bbc
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779371338; l=2996;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=30I1zq1fbN1304iqR3Yq8890rzS3VPpWaE4zkD/puC0=;
 b=BpvmdCgBW9TfiHnCPjuZGJjc3yV6Apfjp5OrOSBTJnqLhZXB7FBglg0jmfqcGAgxtCJkBA+bY
 /I+GqbDOzTeCRqjawhZa1E5tiNDE8PJ8o1ye/uuJA7aTOylomB/LHQM
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The Tegra PMC power-off handler exists solely to reboot the Nexus 7 into
a special bootloader mode when a USB cable is connected, so that the
bootloader can display battery status instead of powering off. There is
no reason to register it on any other Tegra board.

Guard the registration behind of_machine_is_compatible("asus,grouper")
and rename the handler to tegra_pmc_grouper_power_off_handler to make
its scope explicit. The of_machine_is_compatible() check inside the
handler itself is now redundant and is removed.

This also avoids occupying SYS_OFF_PRIO_FIRMWARE on boards that have
other handlers at that priority level.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/soc/tegra/pmc.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2ee6539d796a..d0fcee898388 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1310,7 +1310,7 @@ static int tegra_pmc_restart_handler(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
-static int tegra_pmc_power_off_handler(struct sys_off_data *data)
+static int tegra_pmc_grouper_power_off_handler(struct sys_off_data *data)
 {
 	struct tegra_pmc *pmc = data->cb_data;
 
@@ -1318,8 +1318,7 @@ static int tegra_pmc_power_off_handler(struct sys_off_data *data)
 	 * Reboot Nexus 7 into special bootloader mode if USB cable is
 	 * connected in order to display battery status and power off.
 	 */
-	if (of_machine_is_compatible("asus,grouper") &&
-	    power_supply_is_system_supplied()) {
+	if (power_supply_is_system_supplied()) {
 		const u32 go_to_charger_mode = 0xa5a55a5a;
 
 		tegra_pmc_writel(pmc, go_to_charger_mode, PMC_SCRATCH37);
@@ -3211,18 +3210,20 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * PMC should be primary power-off method if it soft-resets CPU,
-	 * asking bootloader to shutdown hardware.
+	 * PMC should be primary power-off method on Grouper if it soft-resets
+	 * CPU, asking bootloader to shutdown hardware.
 	 */
-	err = devm_register_sys_off_handler(&pdev->dev,
-					    SYS_OFF_MODE_POWER_OFF,
-					    SYS_OFF_PRIO_FIRMWARE,
-					    tegra_pmc_power_off_handler,
-					    pmc);
-	if (err) {
-		dev_err(&pdev->dev, "failed to register sys-off handler: %d\n",
-			err);
-		return err;
+	if (of_machine_is_compatible("asus,grouper")) {
+		err = devm_register_sys_off_handler(&pdev->dev,
+						    SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_FIRMWARE,
+						    tegra_pmc_grouper_power_off_handler,
+						    pmc);
+		if (err) {
+			dev_err(&pdev->dev, "failed to register sys-off handler: %d\n",
+				err);
+			return err;
+		}
 	}
 
 	/*

---
base-commit: 6f94cdc0024ebf5a2d306bfed49c9e729c2bff4e
change-id: 20260514-smaug-poweroff-9626c5501bbc

Best regards,
--  
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>


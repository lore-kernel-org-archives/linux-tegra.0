Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31566239085
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 21:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387012; cv=none; b=ixGpL5zBmPOjYAY6M1jBJCVYD23qG3F2m6yFLN+/mbXi9XCff8E8rUt4c6wCNnsLH5bKQHo6C/O9wiqWDPUiEb18RZfMPzwDZ+eeVFVgyVYFQh9/FL99Gd66KHwIhmczvEXB7PdXix3h+23RTzynCkneAdWt90D5EaQsAiwBAPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387012; c=relaxed/simple;
	bh=FppXID+0J4nDRs3X3TyPmxeAe0SJrDM6eTzwu4T3obM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVeWl/h/7B/Km6eqznlMQpAWstu1Z5x+5HNVQp5rk6+ObBUR5QlnIwY4ajXcNWJHJ7mFBYV1HGcKiDzgUQ0YJ3drgrG01Xl18YwGzEYXY0IYewLa/UykpTvEoXjEVTBGZYj1qQcrxzXZQ3vI6b4UdTBU7xTffW8K1+dlTOEXsAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkBQE7uJ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkBQE7uJ"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cfc3ca1922so28796585a.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 14:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774387010; x=1774991810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sm/4nEkrkeSiZOQFxxtUg+CAIgNYlGGhCoF4Utum28A=;
        b=FkBQE7uJ2pMeTYgZBvq0jjU0PHytkjtlHvnq8TbcrwCDNvsW6GZ9OBJJhYWkP8uJ6k
         iy0lyvXzd5n+oLOqkqn4ZmrHY3A4TXM6vAbOQguS25iiQR7yENL+oJrtOMo209CwrieK
         5viuE6J/TW+8nE3jOriw1UMHYHB77kBPZRJS8DKvoy7YFT8e757BkM7due+TxiRDEZYE
         2dHZjRrQZwIjrmu1EKDr7dQ7Xwea/BhEoME4r2NcKpO6nRsIKe9GMDjaSC4r423kPQ0C
         LwkQ9hpFetckb/y4TSzh/KzAXiMtfljQqK+QHMCTky1rESz6Zmu9Y4snYSv3J1os3ktP
         7qQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387010; x=1774991810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sm/4nEkrkeSiZOQFxxtUg+CAIgNYlGGhCoF4Utum28A=;
        b=qtIwBWAQuywJkUhedH8wSPu3xpuUzP7jB6W/oOxhr6wu/u0XHvci9jWcchILSRystX
         DVHr1Vhw5MeBzmrEXcZ3IEJJtxQim225q2hJpMwY82SeOB//mqYdCXEwj+R5HvfK89ck
         IeDyIUAd4uSFBA9uIbCvVE6gJmpicQSERR8zE7vAeCy3dxuHSt0o2sNyDD9p6lUg7GoZ
         ZyhVxLu9y1JyysAqe6u44HJU8eKd6gPGD7uCUA4/6WZP/QI4kUjrfGgm5Ymma6xIiWAv
         GW0qgbqP7dtpxWzMGvCwbVWzFedZNR7j/icef+0LX4/pebGgK3nZcNME5vHCnnkHEPQH
         5GqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMsSEgUy6NlJxr8sF049QtVWAADfYblkRE10sVQxtgDd7eurdqGRgpfjpEUtkXkMlGymLI4DFHVaW+Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpPtcOfwsiTFSeJk2WQ/rbHd1cvg9Cl6kIBzY8+60uzUxoYTSu
	XTVGblmXIPc5wbV+2m404erN44wHKnVP9EIbVVTGNZbkXlBInu9bBVUCCEwtyw==
X-Gm-Gg: ATEYQzwuQ7vr2IbPrsnsKjKOJ0uprdlOX01/uQii2Qnyx6/IwgA/4qLmyUxme1r/yFt
	WPQWjUqDqyfBy1UoC5X5C6HUFu3n4uiuJsT9sECdyAjCAxmlqzPYeT3rfbsveC3ADylCmf1piSi
	2o6Fe3+oPYhLpltscYOyYvWkookl5QiFn2zlyiV/r7SWV+jfAB62lUCoKR5T5mVD5sQsSyH+s1T
	A+zYcYo0P9fT3glpvrzftpZz1Hl/jyjMjp5t1Y7FVkSLaWu7aTMMgfTDaOP6TosNviVPADAuV2b
	seaE/2k+oSOAGUzQBB5h6UJnFNr/jSs9DgES6KI+ZkF9WCiqfYC/IYeRz8i9mVo6+Xh45P8i0Od
	vLmlulmxfqmU1MotajZq2ta/i2UXUA8/w1tIFh2dZ0YvGzHFv+eMEb93Z//hZlUVnGtGY5l4s+b
	JCWcVV7hBt1m2XDKqCZHyo7U7kSPvrv3YfY/1tjMpTYRFcS22uZWuecwU=
X-Received: by 2002:a05:620a:4149:b0:8cf:c4e1:9761 with SMTP id af79cd13be357-8d000561a93mr192888585a.20.1774387010169;
        Tue, 24 Mar 2026 14:16:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90bab92sm1117594685a.34.2026.03.24.14.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:16:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-ide@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ata: ahci_tegra: remove kcalloc
Date: Tue, 24 Mar 2026 14:16:29 -0700
Message-ID: <20260324211629.26924-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine allocations into one by using a flexible array member.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/ata/ahci_tegra.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 44584eed6374..5972fe04ff3f 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -175,8 +175,9 @@ struct tegra_ahci_priv {
 	struct reset_control	   *sata_cold_rst;
 	/* Needs special handling, cannot use ahci_platform */
 	struct clk		   *sata_clk;
-	struct regulator_bulk_data *supplies;
 	const struct tegra_ahci_soc *soc;
+
+	struct regulator_bulk_data supplies[];
 };
 
 static void tegra_ahci_handle_quirks(struct ahci_host_priv *hpriv)
@@ -512,6 +513,7 @@ static const struct scsi_host_template ahci_platform_sht = {
 
 static int tegra_ahci_probe(struct platform_device *pdev)
 {
+	const struct tegra_ahci_soc *soc;
 	struct ahci_host_priv *hpriv;
 	struct tegra_ahci_priv *tegra;
 	struct resource *res;
@@ -521,14 +523,15 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 	if (IS_ERR(hpriv))
 		return PTR_ERR(hpriv);
 
-	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
+	soc = of_device_get_match_data(&pdev->dev);
+	tegra = devm_kzalloc(&pdev->dev, struct_size(tegra, supplies, soc->num_supplies), GFP_KERNEL);
 	if (!tegra)
 		return -ENOMEM;
 
 	hpriv->plat_data = tegra;
 
 	tegra->pdev = pdev;
-	tegra->soc = of_device_get_match_data(&pdev->dev);
+	tegra->soc = soc;
 
 	tegra->sata_regs = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(tegra->sata_regs))
@@ -571,12 +574,6 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 		return PTR_ERR(tegra->sata_clk);
 	}
 
-	tegra->supplies = devm_kcalloc(&pdev->dev,
-				       tegra->soc->num_supplies,
-				       sizeof(*tegra->supplies), GFP_KERNEL);
-	if (!tegra->supplies)
-		return -ENOMEM;
-
 	regulator_bulk_set_supply_names(tegra->supplies,
 					tegra->soc->supply_names,
 					tegra->soc->num_supplies);
-- 
2.53.0


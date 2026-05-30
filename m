Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4335D1F4634
	for <linux-tegra@vger.kernel.org>; Sat, 30 May 2026 00:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101715; cv=none; b=r2rnR2/hiFrkW8bcUwjG2v4MnQLZS1ITsGqL0SiVu9devK8MmEcib/Gik1UD+bli6E/6Iyvk4J2Pbjz5WRWpIt7oKBd55ubelvUcFMzOPYzjlnK5xNOaVzrFhxKVIPBCU9HUgAPYMPvMgiOnZz7S8+JAD7WvhcJllAR8Z9qdSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101715; c=relaxed/simple;
	bh=jof8jAzXw0Rb5BCOmVEpdgEV9GpQ7Qgy8eSg3wcMZ1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sK+FWAcqgD002QkfqU8LDBPocaiNukI3M8XtX/oMdnnmUcEC5yc/rBTboNIVp3dgNN+9AkFY7lVscewSYtGIyOfEiy84rIqsJTX/djRBD5S8XXdIiuWriVRmB35x9p/30a9q66OnkGltXARsyDRi4HwVZMwqzAiGXW15+SWzzhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp0Wi/Q3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp0Wi/Q3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf18c30bb2so11739075ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 17:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780101713; x=1780706513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQZwpWi6lhEFzRyzbt9FIh0qakqtgNCNAKMGR2a1m7A=;
        b=Kp0Wi/Q3xOpbb86vf5rL7j14l8oXeWUDYNfB7p8eSFIANhpjyNwPR+egNTfK50B1FZ
         DnXx2Pp7goJF/ssYaDaN4xkzQQO+dlkQg2TFbwhEKEHEDn/1SSFtMozVL6qzQk+OW+CS
         QegcHmpv85cVpthKXPNpo2//Sa7aHLe1xtMdnoBJDbmJeUsZ47HsMhH2NOllpO9JGGpa
         Ir7jEbuR1Z+BQ5vHeCvNJ5nS0d/NM8F7ca6Rtgxs3BBEa6k2BLJJVg/ENQPc7wHEqaWO
         VM8mq87Qw2HL3GoWxzYbffg2v2nEqivW19hhwlAwp+fFZ9g4y+46P6tcF2dMOSYt/67k
         Sarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780101713; x=1780706513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQZwpWi6lhEFzRyzbt9FIh0qakqtgNCNAKMGR2a1m7A=;
        b=HFMc0xouvL2Dv+8tZcn2dSng5HFERgiEsW47nlEH0tDBJqyA91m2caDiq5A20O6eAc
         hNXvHJth3UKmPr1JfEP4Y8/+oTrXABzPDWWNU4OIn6YF15QSK84fsh6/WldEQ0Hctzsr
         pOSekm1U1le9FzQHTyDRLOyhr4b8OsOYkT+qUJkfO6MvN5LWwf7jx2SazadcgfV3Ld78
         DWzvMXEK0R2BDjBM6Om18oeaURdXs74KnKy0+fPC3K4lzSxVVKDo9kzwyPPJc4lw0iYz
         FQiSe4GhPKB94aWU8dH3C0aFdD62d4nn0KHEckMvHcEGw5R8Flxb4Zpgm2ETZwZUDy4y
         Yt7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8okQWlDy131YTE0YpdVKsUbtrQkx+caOzcW/TebNGjv4LmS0na626qoKvkNc+Y5fhBJYH53Il5XQ26Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7F2FubpNZSP69FWgr5oodQ+7pz/pDkvRO11L/Txq00e3iFaKh
	GlW1DHoNJGBqEMy+NQddJEmtOasZLkhajYWg9Wcbjk3WwmkMH0MPxeVc
X-Gm-Gg: Acq92OF5nnZTXA1uCvnfr5HMZ2NHQRUp5tNKpXU2q/7ZN/ECG41YcC0hYK1r0cM3Fy+
	+0ZNLp0ksDo6Kl84PC4ICLj8KIxoGQkjA3Edbvmqp6S2ZHZCOsU7QGa2vGTU+GdS5fZfW/KpK5t
	W1q4NyYLaTITEbdZmgcDVaiT2M4lvNg8BkZuhKJE2ypl/GiH4UuYcW/zCMauEMoNbZypYghDzQw
	7sx5vxWRZgI0LJplYczRYLXqy3AffAyl3iRLDaVM5Wx7eJI065rhc9ymwnHxA0ZsP61HHMzeuHl
	Glq9vgfzFUS7NEryUz9SDW8AwF7sQLkAUntDhywDFwzhhDsZuE1RSzBIj5wzi7i0RDxOfD7Axyo
	ePtXTYh5ThQb9Szj723oiERkIa3Pm838nlVCbWF7QVKWJhgMKqL3AuSkeFT2n+gxCICOlQKfXNF
	G3azSl3NQfqnjQk2qmUKGNP/V04CbJI/Z/tcNWLyAos060T1SsZdKCkyMqbtiDcGi3l05mU7knK
	bDh2bimGVr1Sm6WLPbpPXrpcXbB+AkIBeG8ihA8XRehMA==
X-Received: by 2002:a17:903:2f8d:b0:2bf:23cf:3eb with SMTP id d9443c01a7336-2bf3684befemr22359245ad.28.1780101713376;
        Fri, 29 May 2026 17:41:53 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a1e095sm34158365ad.32.2026.05.29.17.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 17:41:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-ide@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ata: ahci_tegra: remove devm_kcalloc()
Date: Fri, 29 May 2026 17:41:35 -0700
Message-ID: <20260530004135.43088-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
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
 v2: Rebase
 drivers/ata/ahci_tegra.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 554f05e09f98..142ba2ae1c83 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -176,8 +176,9 @@ struct tegra_ahci_priv {
 	/* Needs special handling, cannot use ahci_platform */
 	struct clk		   *sata_clk;
 	struct tegra_pmc	   *pmc;
-	struct regulator_bulk_data *supplies;
 	const struct tegra_ahci_soc *soc;
+
+	struct regulator_bulk_data supplies[];
 };
 
 static void tegra_ahci_handle_quirks(struct ahci_host_priv *hpriv)
@@ -514,6 +515,7 @@ static const struct scsi_host_template ahci_platform_sht = {
 
 static int tegra_ahci_probe(struct platform_device *pdev)
 {
+	const struct tegra_ahci_soc *soc;
 	struct ahci_host_priv *hpriv;
 	struct tegra_ahci_priv *tegra;
 	struct resource *res;
@@ -523,14 +525,15 @@ static int tegra_ahci_probe(struct platform_device *pdev)
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
@@ -578,12 +581,6 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->pmc),
 				     "failed to get PMC\n");
 
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
2.54.0


Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0C72874E3
	for <linux-tegra@vger.kernel.org>; Sun, 15 Mar 2026 23:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773616220; cv=none; b=TyAAsr2YdYPNg9i3lJbvNPTqKzxNfyNSwkHHE+YjsQiunuo3Zl/MBAc/G4T/8e73exirFr2OkWLseFkAX8bY+JmyF/pFq1LL5Zo5bOP04zXokdloErSr1bcVEAFWscataaO3JgwTezuqhSg2SatHAR9nsEjnvbWmyQWeMd91DTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773616220; c=relaxed/simple;
	bh=fLloq4+x8At7hQovZLrmBNB1XxjUka1iComkdFuv2dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BoN9ECOzBk2XkHcuRdadpLc2v+1+sziXknmQPan6NfyD7dx5G9/VgiSlSXn6BIgXsyR7RkVZAVpBUZdr7r79CEFL2kf/6lwH4pI8g6AQcgNnBNFnZDPBP4egSepz+EU8mbxPgbndCFmf8S89urT478Vz7UaZAe7ewJHhsRbveo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y65crVlR; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y65crVlR"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso2534400a91.1
        for <linux-tegra@vger.kernel.org>; Sun, 15 Mar 2026 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773616218; x=1774221018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEWsD2Q8KtTGsEAWmFS/iNWR9RG+AhbQpSE8inJiSCs=;
        b=Y65crVlR74PkKRkO8mL4eeqPXhF782C26loL0teMr+PV7x/KxM9veSRd4A/9JLYNfe
         PY8IjmzJUDAx+nDk5krQVFaYqZCtxJ85cIyI7eVuLXQV1mR7wtqp0+EYxgFTs4MRgMmz
         bQoELgCedf0pews2p8+Srzggs5OO/UAk/wpRAMBr5XYXO/xzsf6peOhBKbxGpvV5girZ
         ATu8+/9gXuvtpkQn0J/Vdj+S9tnwZr0XyTfnkOAJNtZytlUwF9ymDAdhzyF2ublQR9PZ
         Ds7mMvctffhKb6RZqbK73noFjqDtCQm1tEB3TERpt2L3hqaP+2X1ssPaWh1YK28Jeilv
         KDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773616218; x=1774221018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEWsD2Q8KtTGsEAWmFS/iNWR9RG+AhbQpSE8inJiSCs=;
        b=HSPqzRSpu/C+rLT+wBg/RYYYqnuSsP1E5l6ta2SNSLqA8znAw0XVKPOarTjOAvDJoF
         LJJxL9Tlvv6us116Cyqe+EM/+cCewuLLhC8nsXjqdDyHExMNQFLOKn5XWFnK3wnEmWE0
         uB+/JnfgKvBN7c+Y8VcX2JAGDJPaIGaoBqi5C92lI+XHIdta/dzyljaSQ7btqa8zW3cL
         bwzV4HDh1RkUjEIbfnhAs1srbJ0dN1c79Oi4RDzOtjkY1gkCS+9H1Lv2w19QfR2ECWMm
         6NP0bAm1u6kvVPmbjvKMDgTyOM7G7dBeJsW6hJfeea5cjlTEAF0B0t8DbGQshU44Y2VO
         dsaQ==
X-Gm-Message-State: AOJu0YyvGnGZo1Mp3UuUhuvVEXhKy/LswWg/G2Rsxf/vC8BZaRD6jkdf
	98UtEMj+GVr/MDqsy37v1suONh2fqbUtwlQoOZCGjzT01u3Hwaws0ftSjdJUuA==
X-Gm-Gg: ATEYQzxUoVUetno7SvHrXwm5tkWr0NTgYqCh1MSFz/MMvCfYZjDQJUwCqXwqibHJZG4
	2teiYYpvmISbmXxfg0y4WQzMpskH77t5jz6c3+98gmawkRpg/AGpjHApLwZuPY1BmCrkxn7bDbm
	ZEOYgd1I2XrSdbWg6/u7OxC5GyzlTU882AJYcoS5w2OE5MyRPDaT2GBRS9k6bUzXPYfDdX9y8Nc
	C3rIx6xl2MCzASi8HEO+kxQOz9w+U08I3upP9sl8Nq9NyATnGOdc6NM4SS1kUBpbXU9XdVkNOvn
	nZUYtOZUBUtlD6R+mmv0BSSRcTQ0G7OckIn9m6tEvCteiCM6YLcv+QjLoT1Fk3MXuO1SiDVmV9k
	+I0PYCc7GwEgQYkRYPBqg0KGfuFzPv+KEzD5mXzr67hE5teXjnRCfV5eUTXwz4XBP4g5eG5SPpb
	iIgoAr4JmRN0szC4wHXEZsHflExjBnfTwOTHxQtw8dF0PlY/HEtmtdwg4=
X-Received: by 2002:a17:90a:da90:b0:35b:91e1:e110 with SMTP id 98e67ed59e1d1-35b91e1e214mr3925378a91.20.1773616218024;
        Sun, 15 Mar 2026 16:10:18 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9db7dfe6sm1399177a91.8.2026.03.15.16.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 16:10:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: tegra: use flexible array member for array
Date: Sun, 15 Mar 2026 16:10:00 -0700
Message-ID: <20260315231000.50543-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies allocation slightly by removing a kcalloc call and using
struct_size.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 9 ++-------
 drivers/pinctrl/tegra/pinctrl-tegra.h | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 11ecbd6a9b2a..b09d7675a33a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -832,19 +832,14 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	int fn, gn, gfn;
 	unsigned long backup_regs_size = 0;
 
-	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
+	pmx = devm_kzalloc(&pdev->dev,
+			struct_size(pmx, pingroup_configs, soc_data->ngroups), GFP_KERNEL);
 	if (!pmx)
 		return -ENOMEM;
 
 	pmx->dev = &pdev->dev;
 	pmx->soc = soc_data;
 
-	pmx->pingroup_configs = devm_kcalloc(&pdev->dev,
-					     pmx->soc->ngroups, sizeof(*pmx->pingroup_configs),
-					     GFP_KERNEL);
-	if (!pmx->pingroup_configs)
-		return -ENOMEM;
-
 	/*
 	 * Each mux group will appear in 4 functions' list of groups.
 	 * This over-allocates slightly, since not all groups are mux groups.
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index bc7b70913b89..c74272c82828 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -26,7 +26,7 @@ struct tegra_pmx {
 	void __iomem **regs;
 	u32 *backup_regs;
 	/* Array of size soc->ngroups */
-	struct tegra_pingroup_config *pingroup_configs;
+	struct tegra_pingroup_config pingroup_configs[];
 };
 
 enum tegra_pinconf_param {
-- 
2.53.0


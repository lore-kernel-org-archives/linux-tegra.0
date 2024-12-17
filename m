Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DCB1DEFEC
	for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426882; cv=none; b=ud3RKpgZOeAgdxpIcVVS+QBljIJv6oesPc1lg5LIpbb0symgELCAKMbiVQfUXH9v3HaAYwnw/0GSTPCsJ2dkpaQ8qdxQlNIsR4PNST45eQ9fbaakDjH7wfYojWM2Dw+v2F7hki1192ZSUtgqYUoWii9WCPXLpBCqlCSKxMf5iT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426882; c=relaxed/simple;
	bh=iu+Rdp4I3vdNwdhPLHRLakuxjBWKlTYcgQ82AHq/eqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ao/tUQIcabcrQK8qe9XeSnr10MI7qVNXsQnW0lhm8T/+cBnT+BGU5EAR5CwyqAZ8soXKhO/eRxavQLcZ8rc4m/eo1L+8kL9zNHmaRvWEqrT4291Tkvw/uf9JuKgrwwaBdhNMSqFSGoxSriJIxN4JuUFuiQ64zX6YblmTrrNtBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=EnmU/h1N; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="EnmU/h1N"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fcf59a41ddso2480313a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 01:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734426879; x=1735031679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rz7FD+d/zk+Uau+OZFcJ0e6MF4Ir2UyYClW9/tX9JDY=;
        b=EnmU/h1Nd6c6Idsr/HJXT6qTVnKZBCVKTZGcAKYgfEmekdpcZWKCQN3PDe1ut02/AR
         pAPTvLEGaDh81fZPgj2uiYuOWuyKHXFlQB4MgFTvdMc9SbumsmMtxVoIMnxDGhAgELY/
         74RZsYlXthhFUSdcp4P00pfOkMP8cvrr5BNLiSiMkYxJ6g0vue1xSdfRFLpv0+VLhOXp
         h4y5Uzl9DGtT20lPUekwLiPQg/U47RMHFFryv9bM2FXuXj9TTM+oejUqmUy5ME55dlFf
         TPGj45fpGSmSsSYnP/3qZGjRzlY1SdFWEz2yCIodzUSo4MENbCAIjbIPOray8yDqr7S7
         p4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734426879; x=1735031679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rz7FD+d/zk+Uau+OZFcJ0e6MF4Ir2UyYClW9/tX9JDY=;
        b=mI8VyftICg2Uf/gPFlgNGgLQWx90+wSZ0hXqoa9ZYNfHsDlnz8qWv0Nj69MgtfbADE
         2iRARFKSTg1Lau1opAA9IWVOACSOM1lslieNgw4R1pDOg6y95AikpddYB6nKcSMTV6z/
         G/yQGm8+wC65rGNhUJW6j39i4+PGaNjP5E56TCLAEPYcksVYbV1kEpm8D9er1+DHr8Ek
         UAveVGgfn8JGQVnkJtRqw8w6YWD4HmxjYoemTNm2duXgtbHUeBZIGi5V/3cW0Bbs0j66
         3z2XieENlRzlaR+pExeiyDMZ/DB3c+Q6ZM9UxyQWh4sNsH1UeptzSWGPwXhbHoHen2DN
         tf1g==
X-Gm-Message-State: AOJu0Yycl688bnSxsCDpaT6VGFd0XFweoyauF2U+27Cnyo6koWNho4ee
	Qw09p2igmYTbVHnMArdPbuVyWyof7s9BCTQ5p0R0yVW6Ng3OUXN6TEN+NCWAqxOThGTfAz2pFQX
	3xKoi1w==
X-Gm-Gg: ASbGnct7cGrUM80Me14X4+OBR2o0Okah9XbBu3TS2v/Tf/Zq9GfToQNlqzm+kKH311o
	n7mv2gZbqlD0xBPQHR+B1oXebUXPYEUuj5bIxTkVkY7wMafUZ8KW0yfVEXGAL2psB1mNS4VMxb6
	X0bGmiGJ72QpWct34TEXAoqWhgxgyUCrNxUoXG9MJlGbDN00e/q/T2hf51ASz8rZdjTaG4VF7DW
	0dDEM820+qzVyQHDqM0qXBeFQSABIJEQt2sf09jiDyCSvrHLss7C7hlqDCqqQJqmKHfeTdQGGR0
	vt3S0EKJFgui7IwzF+Q5TLfoEvEBNvOZXwZC/oauxlE=
X-Google-Smtp-Source: AGHT+IF706mgYeJlfBbniyH+ZqmjtXnGIg7VaCz2YSK8WNEob77uAfMt1LXf+gLaP7MNfKHbYklGFA==
X-Received: by 2002:a17:90b:164c:b0:2ea:63e8:f24 with SMTP id 98e67ed59e1d1-2f2901b24f7mr19761266a91.36.1734426879099;
        Tue, 17 Dec 2024 01:14:39 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e502d8sm54957475ad.117.2024.12.17.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 01:14:38 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: krzk@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()
Date: Tue, 17 Dec 2024 18:14:34 +0900
Message-Id: <20241217091434.1993597-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of_find_node_by_name() release the reference of the given OF node,
tegra_emc_find_node_by_ram_code() releases some OF nodes while still in
use, resulting in possible UAFs. Given the DT structure, utilize the
for_each_child_of_node macro and of_get_child_by_name() to avoid the bug.

This bug was found by an experimental verification tool that I am
developing.

Fixes: 96e5da7c8424 ("memory: tegra: Introduce Tegra20 EMC driver")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/memory/tegra/tegra20-emc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 7193f848d17e..9b7d30a21a5b 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -474,14 +474,15 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
 
 	ram_code = tegra_read_ram_code();
 
-	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
-	     np = of_find_node_by_name(np, "emc-tables")) {
+	for_each_child_of_node(dev->of_node, np) {
+		if (!of_node_name_eq(np, "emc-tables"))
+			continue;
 		err = of_property_read_u32(np, "nvidia,ram-code", &value);
 		if (err || value != ram_code) {
 			struct device_node *lpddr2_np;
 			bool cfg_mismatches = false;
 
-			lpddr2_np = of_find_node_by_name(np, "lpddr2");
+			lpddr2_np = of_get_child_by_name(np, "lpddr2");
 			if (lpddr2_np) {
 				const struct lpddr2_info *info;
 
@@ -518,7 +519,6 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
 			}
 
 			if (cfg_mismatches) {
-				of_node_put(np);
 				continue;
 			}
 		}
-- 
2.34.1


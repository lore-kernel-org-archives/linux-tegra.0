Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A421513AA53
	for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2024 02:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734489885; cv=none; b=VBZapAl64XCqCqQWinQwC94PwaO+CXGncyRcDhfxyYqUivsOhQ2KhE/RkPgGKd9yrpZg3MO4vomaEJWEPs88+JcBdLfo0X4rv5Eot1y7BBZzcOFdQLqgm43EbDBSyuvylo/CQSN8fhI29eI0uuAJqSPBdFRW2bBWRVT7NsoFtog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734489885; c=relaxed/simple;
	bh=8klLqyCSX5VssUWCGfWkVvIxIwXijwTHWvuTG5U+If8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UJCm3crYGiFOJmf61qpxMANP2JUX1UbHTWNI1nxPovanttuBgdhu+eFnmn3998ZghvE+9oU1bQDRNJNdrCIIgxQO8z6nK7RRiwp1rxlR1vLtuobUTMBsnBuKxUJkVfNbUqI8m0c/XRUR6Wm7eNf8KGDIFlojrVxfCtj5ILBruh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=xiBS1750; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="xiBS1750"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-215770613dbso40750835ad.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 18:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734489883; x=1735094683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWpP8EEP0IJjqZcRfsJULWXauzW58oHVw0gt4bL9lEg=;
        b=xiBS1750UOFDUOSr8zfL2NEAVFbIabSWsdPXrnmuXiooH9HVDRajApym0AKkJlCG2v
         cwIzrKDPlJOib014/+F4yoEpyIY19tmSF6YRTiTSJlNsaUhjy0q8xkR4wOMHA1vRjXLU
         y0io6gcopPz522jzYVBbcmYsX3GzHOMTmxWBIBy4zI2+dj9/s1vz3S24yt1KuLSShkpd
         JxpWfVCWHn7WdieC3QldvSJAO9wJuEkwKPF4orxHuPIW2vzBdD39cCgANNwdwXF9NOMs
         FKP2gMM/SqsAazJ+h62kjTOt45HVvwckcgbBkL4ODeLMD+ANkGuHrr7nsMzEt/IHgxxY
         x2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734489883; x=1735094683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWpP8EEP0IJjqZcRfsJULWXauzW58oHVw0gt4bL9lEg=;
        b=YFNtWrgry8Dj7zIJmhWWVCh0xvYyyWd0HlSnkzlwdEdYTZTsYq2uDZonf0wpz5gM7l
         m+fi/brgYRx4ElhxBf8PL3Oq+RtXnUUSJLrhKVRl4sRCX+zUWEsvP0whYiAEZ6QD7SwX
         t7fHdo6IRxqQ6Lt7IlC4elZirp9flCgV00BMmOmiTvk/qvdFfD5yFK9l1548Bosmp86q
         zY3BXK273LELv4IuNaBiHoGRhE4cb97lUyzEoxAYu1cGehS4cuHO/6H8ZBRenjwv3fWq
         GQs6R31B6376l9bEVaxe8XAkRqkW1pCIDhTdSF1A4CNUk7X0GQpQlJUYGYh7DHSXf++C
         izTw==
X-Gm-Message-State: AOJu0Yw0KP9U/g1OIs0kUBlWuXnAKQUhriDht85+PohsrgLPUAO/eQYT
	ulXiyAU0VlB4zypSocvKtcJ+XEq06qNgwP4vlndYqt4GCObGnHkJGcHFn1Y/9/k=
X-Gm-Gg: ASbGncsMIu8TCZgPK9B2sXvY3r838Hj2qPhKiGL/ZeGLXNRnVDdlyfcQyVtqi4hPzIB
	W3CNC3VcQlgZSoDSDPoNWV7MKdSQM4D8Si8j+XurQogDKWzZ0E0fO1K7U8IUSiziia0zi8WgV2/
	yOv8R25bV2c55u8uiK1tHt8nP/otJxu6K7rY4W/4F/n1Q6d8luhNpab7TRNnvaJ8ZYu+LniAqnW
	+5IrmcSj1AQr8qaJ+04mXpzoLEa2EntT8h8mL+Gee0/0UVwnO8cexlI2ilCjAruNN50hzm5HIer
	f3+UensAo0HjUDEiV+zqY6Ivjb6POkOyuHrX2v7O6v4=
X-Google-Smtp-Source: AGHT+IGMu4Qyldx7xp6+Pi+DA9ILuLCuP3UeF08n9DsTL0S2PpFfbjHYlX7csZNN9TOHlkkfIwv5wA==
X-Received: by 2002:a17:902:fac5:b0:216:6769:9ed7 with SMTP id d9443c01a7336-218d724960fmr15489515ad.40.1734489883011;
        Tue, 17 Dec 2024 18:44:43 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64085sm66229375ad.233.2024.12.17.18.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 18:44:42 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: krzk@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	dan.carpenter@linaro.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2 1/2] memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()
Date: Wed, 18 Dec 2024 11:44:14 +0900
Message-Id: <20241218024415.2494267-2-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218024415.2494267-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241218024415.2494267-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of_find_node_by_name() release the reference of the argument OF node,
tegra_emc_find_node_by_ram_code() releases some OF nodes while still in
use, resulting in possible UAFs. Avoid calling of_node_put() at the end
of the loop, and call of_node_get() before some calls of
of_find_node_by_name().

This bug was found by an experimental verification tool that I am
developing.

Fixes: 96e5da7c8424 ("memory: tegra: Introduce Tegra20 EMC driver")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/memory/tegra/tegra20-emc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 7193f848d17e..fef54179ddee 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -474,6 +474,7 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
 
 	ram_code = tegra_read_ram_code();
 
+	of_node_get(dev->of_node);
 	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
 	     np = of_find_node_by_name(np, "emc-tables")) {
 		err = of_property_read_u32(np, "nvidia,ram-code", &value);
@@ -481,6 +482,7 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
 			struct device_node *lpddr2_np;
 			bool cfg_mismatches = false;
 
+			of_node_get(np);
 			lpddr2_np = of_find_node_by_name(np, "lpddr2");
 			if (lpddr2_np) {
 				const struct lpddr2_info *info;
@@ -518,7 +520,6 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
 			}
 
 			if (cfg_mismatches) {
-				of_node_put(np);
 				continue;
 			}
 		}
-- 
2.34.1


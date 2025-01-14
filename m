Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCCF16DEA0
	for <linux-tegra@vger.kernel.org>; Tue, 14 Jan 2025 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887004; cv=none; b=fe4WlFvD2cnXMMYQbJ2UNgY0LJmGCpipZfKLm27uJRp4OFWyh9vDjhMOhCMM71MBUJEccgT0cAj0bOkFgMjahDCdtj8kyJsko4abFfTrltiqaQm1khuRRkP1VORwpZb80qHOg8afHp10cceEIbMq7hp/PNveKjk1ZAmTCXVNAoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887004; c=relaxed/simple;
	bh=5LlDYnhDQy/CTVyf15fqH+zL86j9XCfqYHnb4U/2x0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NmzavpY+s7HsXHpxQDZHu/7/QSWRFk2NTUM91Y2aLMYxtnCBhUCZmzdJZMnKLaPYuCmtBHXwpvC9hjgV2OOugfkqfx/d8Xv78duKL1OtZwQy5zlkDUNcQKR1cOkxq3kqh2DHbVM/4k+Zw+wzLkDt2atSbqgyiFkNL8+B6N75rAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bnKCYWYN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bnKCYWYN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385db79aafbso496508f8f.1
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jan 2025 12:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736887001; x=1737491801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+lsixf07wBww2d6F+mQkaeTl25Y76AXbSXm7yKhxjQ=;
        b=bnKCYWYNA6UeDYeNjNKnFoesfheZaz7SjYdm32BghGt02tZRySBas1qQNe+jhZRiKG
         HQ7aeAo44DKNbh0fd7pWvWq9vk2DOaTtWDeiEXbtdGTOLRXiczGYptBbgDCWig5mSPhq
         1AUyUU7R7v8UVqmnILXdvjGZmvHdI3jLivx4gFhwfqr0SM2WzjTfs+MMcXlS8UW/XAFh
         agUL1XZwsK9JYrYh7mrydB7ndjEIcHKd8/DN5cbTtESeqs6ufxDQTX/8HpMhp4++4/xS
         ZlIrb11rkbRkE+FjTYaRSILBtZAbUwQZ04NXG/rq9PmOhlqzYZ3CKQEgs3MPCZy0Bojl
         kS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736887001; x=1737491801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+lsixf07wBww2d6F+mQkaeTl25Y76AXbSXm7yKhxjQ=;
        b=peqbrLUKQiKUfA8wpmpINhl5OKQBTbNeLFFPk4tSGisvdr+Jio+4UWCIUsk2JrQOPf
         t9NS0VEdMgJ2dAFjWmIO+YH41C+yAlvME33anU5DbLTrECb5iGQM4/u2ISPzsCxBtRHU
         NHkyrlhHgoZaw24HvEVLzuovIRlBtDBMRdCa/BC9mpLJPs9adMBAT1caXh41rAcV28R4
         G9okIoJmGG6MR0BMGH6gmlsha0uMj1ksoBPsnVVdG3QZiU1Sk0JbPUawyiO2YiGJmJJL
         Gh9i2UjKSurhOrIPAAiqL0Q87Oq9Ut4SoZFU3OayO+ArUAoll8osFr0nbFJiVONQBd34
         FSQw==
X-Forwarded-Encrypted: i=1; AJvYcCUKSY61+lSpX/dODFVCnHCfU3X9wdeG+IEZ7Zuf5xP0hhBJraUepqOz+qiPAxHa0GlwHx1rldQE8EZ4eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxobUW2PbxsL2PPvJunnVLvvGrbT+7pf3f6ZoFAvLIRRCChoE8A
	K+Ot4is79RiVQLdaV3HIIhVfIgHRTiztAWFVK+TiWDWE3A47v79Q1Pd0fqQjKU8=
X-Gm-Gg: ASbGncuT+VZXmcjXwOSBllGf06knW23S31+BmljsSqqImLKb/5Q2/gU95fyR3kGwKgr
	hfQZqGsHBEOGtn0+SV9Be5+W9ujiupAFNyY2adPnwPYaYNzyYk232HGG2vsMPW1rHImUPVN2pTC
	30MEghzOr5wO7fkSxUjp25cRp0oNCRiG0KGMZFSiMIavypuuf6T3lM6d2jiDh19iKPN8jfvjwh+
	TmwRFTFEenAoeYcdalHXmKHj55xTFkjIv9LxkNuLizCgVWVDRouqSItfV+Y7pzMT+CJo1o=
X-Google-Smtp-Source: AGHT+IG05k7ldjwYGdQ0daGvcc4Y7On2+HYBKjfdpsnn0s+T+xqpKhe4RXJNnRJVKJglKIkdA59Y9g==
X-Received: by 2002:a5d:5f86:0:b0:385:dd10:213f with SMTP id ffacd0b85a97d-38a8730ce34mr9913253f8f.9.1736887001180;
        Tue, 14 Jan 2025 12:36:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3834fbsm15614287f8f.26.2025.01.14.12.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:36:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: tegra: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 21:36:38 +0100
Message-ID: <20250114203638.1013670-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index a08c377933c5..51b9d852bb6a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -47,6 +47,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/syscore_ops.h>
 
 #include <soc/tegra/common.h>
@@ -1181,7 +1182,7 @@ static int powergate_show(struct seq_file *s, void *data)
 			continue;
 
 		seq_printf(s, " %9s %7s\n", pmc->soc->powergates[i],
-			   status ? "yes" : "no");
+			   str_yes_no(status));
 	}
 
 	return 0;
-- 
2.43.0


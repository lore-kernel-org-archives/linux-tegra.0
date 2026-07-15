Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D03B4E9B
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 05:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092325; cv=none; b=aoxSkLeocBf7TBSFyBkRL5Y6Hzg26ezuv+ZqeraiuK27eYO2h7edHU3ZdUuJUIalB3oWM7CeEKjL1KGUVMfVHGeewmUc9/B8HZp/9Rx1ELgX1mSFDesc2h7SZWuEUncFsJbMM6A8Zw3S/iDIlSyJsg6ymmQUzDYGqOIGWYeX9HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092325; c=relaxed/simple;
	bh=JPBdZyzURlk1+bQObNjx1u7L1CoI0zKQeh16Th7K6Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqD5aI2C1bTV3M9Cqlv52UKvNgVa28QAWvit6VMe31zW7ta9ikKiswERAJJTZzJjW2R+YizEnozmo/nrutWzgaRZIWnKrf4orzJyD4NlAWXKbbO6nFhjCMlGR2u7+GFAu0kJ8TGNXCXzAcfszB3dlT7U58hH3keCPmWiGyyk4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAIj8UDR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAIj8UDR"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84874b52eabso2327371b3a.0
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2026 22:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784092323; x=1784697123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3PRPoMPx+OET/WGMVQSkA8IuTp6F1i04Nbb1oO1IQs=;
        b=dAIj8UDRRMr8y+FQI+vFcwdOIx/WCErIDc+ydPmROxrCJoydr3vFLETtRh0WLriijJ
         5C283A1JxcBEf5MaiyPbhgVLoIzr9GnzQfvI9z8gdB22IbUyATqiwtQ1wJksWD6oR0sn
         NNB7YvCtK5Wt/kmyjqfyEp8stg+YqSV4pxZcUOMmcnSQB/taGQNOIDcxn3JHvMFpCjhe
         E5/nSKQLpbuLWPUm7S2Y/1mVTXmtS5uprUQ4V7Uu+PpF0VnakgA0zswodhYgKgOxZrEZ
         US2MdrEpa7f0YbAPLw2fVh+ZvFSIOZ1TMhB/gim8W4Q8+gwWhqsQNs4n3EoXP12aklxx
         Z/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092323; x=1784697123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T3PRPoMPx+OET/WGMVQSkA8IuTp6F1i04Nbb1oO1IQs=;
        b=HCA/083fQFPLz6S8paIOoOLbjU284Nu2YI9s8k2NbJMkJy3u7fMqVGWkYjn3pd5aHT
         yZWc7r+Q+utP8Wr22RtKenNluTcET2DMtjL2hEcqRm1UqTANs626BsxTbRYe2CrkafIU
         dvtf9Q+nbWJywoH1BlGK4wFOnBRxvnc64l1eH5iHsygzexGdz+Kh3p49z/dbJepLFEPt
         VOhaqLrkYgjopxW3M0HgFKG1EPbZjDEIeBtabDMkDkng4gXAPxt0NQje57hvFJE8Etv3
         SUelD2dzPba9tGn8/QN/Q58R1HI5yKRsvJBlsCM1hjI11MbYo38oMg6QlaflzrODXSru
         zSXA==
X-Forwarded-Encrypted: i=1; AHgh+RqokJFnuAwAu5w7YWOk7s3X5RCqxIutIv/L+4XVCbYCvO9fVWpd6nK7U56iTP6Fve1UVfUYub9VGw+JpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJI16BDNyRG+ikbwuB4w9TzENp0icRByXhbbltvTn8Lps7p5c+
	7rC9mJy3PZk0+aCWcczXCKby20VGzhM0DlLh4vOzFhiCUKNg7YjwSPLz
X-Gm-Gg: AfdE7cldzBUs/SRHyRX3oqGeWEF5YjENksdCiGFKAo8CkgjoYCZoF6/3Ghge5AzrOql
	8WOUq08LlJVlUuX0Bb4Jk7TcE70pQfxVQKTZ9UZPEzco/WQaxs5DKbB24jaWaBMjDtw1tA3moDK
	ThpSlhgW2aYJI1/dHiAkGfhJiiBEfXdQTvxaNn5DrPSnrGhk58eI5QJI1EOGK+SgpyhfVs54HJi
	07zE1HpMvKDb5juMZaobsLM5w1FOdKQGnLOU5DBYqu84IU80m7sDD+Lnh/Px6IFaHXYjfiu+X1Y
	/begph93Rxb67hnU3fz95w2NfLFlLMFjKRF+fYEjv5H/9R/mB0a4wgaWCmy+bYiBUQNuYJ563Wz
	snOpkCMTzljiPnYr/o9iFu5lDj/hMYfVl6PeNRMrxbaiY56JVX7Q+s4Q1hTT9ZR8uVHg3m9WmZs
	Qm7Nr564E7H+migcRer0HpytqBzCk5VXjJCnJQqkb/giq+Rf0GEdjCGdJcFA==
X-Received: by 2002:a05:6a00:179f:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-8488970ae6fmr14622666b3a.42.1784092323189;
        Tue, 14 Jul 2026 22:12:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f271ddbsm2594093b3a.18.2026.07.14.22.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:12:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sheetal <sheetal@nvidia.com>,
	u.kleine-koenig@baylibre.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rosen Penev <rosenp@gmail.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: tegra: tegra210: Use devm_clk_get_optional() for sync_input clock
Date: Wed, 15 Jul 2026 12:11:15 +0700
Message-ID: <20260715051115.17385-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715051115.17385-1-phucduc.bui@gmail.com>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The existing comment states that the sync_input clock is only needed
when another I/O is configured to use the current I2S instance as its
input clock, and the current code does not treat its absence as an
error.
Use devm_clk_get_optional() to match the existing behaviour while still
reporting real failures via dev_err_probe(). Update the comment to
describe the optional nature of the clock rather than the previous error
handling.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/tegra/tegra210_i2s.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index ff8c72fc38c5..e7e26e917291 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -1078,13 +1078,13 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 				     "can't retrieve I2S bit clock\n");
 
 	/*
-	 * Not an error, as this clock is needed only when some other I/O
-	 * requires input clock from current I2S instance, which is
-	 * configurable from DT.
+	 * This clock is optional and is only needed when another I/O uses
+	 * the current I2S instance as its input clock, as configured in DT.
 	 */
-	i2s->clk_sync_input = devm_clk_get(dev, "sync_input");
+	i2s->clk_sync_input = devm_clk_get_optional(dev, "sync_input");
 	if (IS_ERR(i2s->clk_sync_input))
-		dev_dbg(dev, "can't retrieve I2S sync input clock\n");
+		return dev_err_probe(dev, PTR_ERR(i2s->clk_sync_input),
+				     "can't retrieve I2S sync input clock\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
-- 
2.43.0


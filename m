Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBC32253FB
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912534; cv=none; b=TVvlluA7JrDw/y35UQUIRBuHjcva15iSg4lUKSTSXoiuoyiCQolJEKW55uP0XS9GNzj8113OsCfH7TSLETLWgj2e6HxLiWujrzu/boetjVylhR6Qj1ylXtqUxX3QDm1aylvWaIlfzK7QUCglZuMj5SMZeTkKpG6sbRM82B57hwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912534; c=relaxed/simple;
	bh=P/K1i7FofzljhrSueDv/pWynCeqTvU5xHXstL0F7owk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tw5R6mBgnKqOG+26/5GzQ+3atZ8e6LFAT2KmSUdgT6kJNJQ233TipWRGBFDds4ZuIF+g1fzGNWUPKwqGYHBsX3ykZHKtqfLkgPHlSBCd+pIdlZQTDl1Ob3VRUo22Th2X2kvdo0NRtaF8iP2WzmxlfBxFBavGWmtL9PWEAyxPiOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bGp6VlD/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bGp6VlD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8cne1IA1KPb6ZTLi6iYFaT1l8FItUau4GOBy9fEXnFU=;
	b=bGp6VlD/KU/FvjGj/4RKX0xjJcdMbjVfWrZidgeTycl63dnvbPqOOELLbjx8yVgbf0mrXD
	TOsSm5l+CjdPh/n4iQpWdzVXl/t7QnQO3JscnHKotE8kM7hp42+QjJmpKmOGPQghCftdoX
	HXNi2NknKVfKlktffc6W3SSePWwByFU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-pZ3tQX1YNvqqk3-coPpcHA-1; Wed, 03 Sep 2025 11:15:30 -0400
X-MC-Unique: pZ3tQX1YNvqqk3-coPpcHA-1
X-Mimecast-MFC-AGG-ID: pZ3tQX1YNvqqk3-coPpcHA_1756912530
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70fa9206690so17767096d6.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912529; x=1757517329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cne1IA1KPb6ZTLi6iYFaT1l8FItUau4GOBy9fEXnFU=;
        b=ogVRvjxK8TA5Vs4CRrCOPZPCh/Vd5oNTVrCqL3XnZFp7aCEk5ZdHfT2ohLj6UwgD5Z
         iFuUJZ6DWsJHAifLwBAEGTaQAToHKgCCuEzy80K+CkGI+IA8iEsIc9+INWMhMyD4lH8Q
         BQZO7jyiTG6lhjRTKZoTahM/s8cTN0OF0ojQmScqwUJnc+M9Tg+WYFV+SjpMQIFRW9h7
         s82vxbseLwt3P1hzI7ORKhYSTtkQBTaTPRizUEskH+f8KdUbvZQLbD1UWkCWkrGmm43N
         tZFxOa0myNsptykFRw7sMa+IrknO7W1EyRA6repwrtUW9Xk60ET1qA5/94JG2URoXi2j
         3F7g==
X-Forwarded-Encrypted: i=1; AJvYcCVzP2TmL+pR//t42sDrJN37ml6ajrfl2RwfkRLRRfPfZhiG4PacB4uhVxAh5t1jf4tdkoGYARV3YxeUdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4iuyOZ3lZKsFnhGRZchyONOLXC2L0yUnB+Z16CmNMQvR8ukw9
	mLlP8AKF7TgkjC2rNhF6bN9DVAO+8Sm+EauCKZUq+0pH0+6IddRN9VBrubYgFDcXy4LCdss42hh
	XNdjJsvh+9zyenrm1s6TguPtgMvCyqUvVggyQZ5kaIwdJmmp3918Yotik6XNbVbiTSt4r1478wd
	7pcej+9f8d3Zkzx8YAQRgCYd2VbvnZgoBIsSpawCsecqMLyeM=
X-Gm-Gg: ASbGncsLGMCExEHMChdAk8+PzsOEC1sflfEp53cm15Cy9CRPVaxaioI0Sjln5RgshSv
	jF4HZjZJqsjXKXi3CDYgfe+3ymBDUPmMjWH1kKRwhQSMFRCKJ7kSR+xQVmTLtxh+wpbJgrIUfpJ
	XFeIooCN9x0HUkjf2X7ZtbCl5RZbyd+9SwhrGb7eWfLYHju9hn89P5EEkBVo5nct7ukvX7zH9Wv
	I2t0isicpVfsqz5qlwbOHO6rd/ANGqtIHYM27HKHZiZQTwq/XpwT9cwGiBeXN/NfIlElSCtdNvM
	RKwXYSovLfOYy+dpXk33NKGnsl8dx9B5EfsW86n/tthscJb0kbXu8dZjdDFMhcYZ1MARykcExJ4
	=
X-Received: by 2002:ad4:5bab:0:b0:714:36b2:a260 with SMTP id 6a1803df08f44-71436b2aa69mr119383976d6.0.1756912528607;
        Wed, 03 Sep 2025 08:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKzf82nm21b07pPChbmaSLNG0cWMiPFqfO23yrmL4+PQzlGJM4jozMFEYUd/hUiknVHZDi9g==
X-Received: by 2002:ad4:5bab:0:b0:714:36b2:a260 with SMTP id 6a1803df08f44-71436b2aa69mr119383076d6.0.1756912527470;
        Wed, 03 Sep 2025 08:15:27 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Sep 2025 11:15:02 -0400
Subject: [PATCH v2 1/6] clk: tegra: audio-sync: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-1-3126d321d4e4@redhat.com>
References: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
In-Reply-To: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=1671;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=P/K1i7FofzljhrSueDv/pWynCeqTvU5xHXstL0F7owk=;
 b=WIU9TP1V3lwK1E6Bzl3annZF1C3X/dJCzNEowbNKKUGh/2qhcuD2XUgjQlh59rAwf72D6j2EZ
 zPdaX3KzhjGCwHySbROqsYWV6u1zxKdS6xuPBft/N1d2s+VikDW4r19
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Link: https://lore.kernel.org/r/20250710-clk-tegra-round-rate-v1-1-e48ac3df4279@redhat.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-audio-sync.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-audio-sync.c b/drivers/clk/tegra/clk-audio-sync.c
index 2c4bb96eae16e2d4da8740d4596cdb562fd65e73..468a4403f147a2bfbff65b34df8b80a0095eed15 100644
--- a/drivers/clk/tegra/clk-audio-sync.c
+++ b/drivers/clk/tegra/clk-audio-sync.c
@@ -17,15 +17,15 @@ static unsigned long clk_sync_source_recalc_rate(struct clk_hw *hw,
 	return sync->rate;
 }
 
-static long clk_sync_source_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int clk_sync_source_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct tegra_clk_sync_source *sync = to_clk_sync_source(hw);
 
-	if (rate > sync->max_rate)
+	if (req->rate > sync->max_rate)
 		return -EINVAL;
 	else
-		return rate;
+		return 0;
 }
 
 static int clk_sync_source_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -38,7 +38,7 @@ static int clk_sync_source_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 const struct clk_ops tegra_clk_sync_source_ops = {
-	.round_rate = clk_sync_source_round_rate,
+	.determine_rate = clk_sync_source_determine_rate,
 	.set_rate = clk_sync_source_set_rate,
 	.recalc_rate = clk_sync_source_recalc_rate,
 };

-- 
2.50.1


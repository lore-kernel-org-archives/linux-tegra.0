Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D9247DEA
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912558; cv=none; b=Cd7+Ipxl9guSgNboQCGfItUZS1RAch1pnUe6cU5eKdEf3m2EmJUng9Yxbj1V+orf1Jb93lKRXEmaFUdGW7WTrSPaD1WIocqIh5jQspbiJBCGW/Gq2ja22oKLTKPePqXE0F4ydGMfOJcP1ZTsE4IZJBPUZbk8WfsmvjN6MnsgRzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912558; c=relaxed/simple;
	bh=f7zeRbtjFE6oZbaxfqDkdxVp3qdgNoSMwDXWIe1dhQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sl7HH/MNzDwE+i71SozfiqPeESCRFF34zW6vbBvNrau/PfzEbhfVSWESORSupKcRGVN25Iv4C2p1l5HOMDr0qkPcQUlyIWRyNBwEDFSNCSXNN/ofjDfU4PlCKcspuvRlt3/2aVFN1KC2wcgcAnSmjQbId2KMja6qfb37gYa9dog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FrQBKEWp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FrQBKEWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A4HCy2NL7Blg6ktZUTQG7x2ot9qLktGXqBXqd0E8mS4=;
	b=FrQBKEWpl5L5kcJvCHoYY5tEmLOEQ4x7/6C4X115Ha0wmz5X9rScSQx/5GTaNyP3yTflWi
	E+oatLGYvox4RBGikzzuwBDTsTXo1NDS08OPPBKjDadhLRaWft3Uk7W4jfs0DlqOnYIHlX
	voLcgG8BWOHs4NRtY53jr4OfRppK/pM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-oKEoyVqmMLmHI3fuVV8GnA-1; Wed, 03 Sep 2025 11:15:53 -0400
X-MC-Unique: oKEoyVqmMLmHI3fuVV8GnA-1
X-Mimecast-MFC-AGG-ID: oKEoyVqmMLmHI3fuVV8GnA_1756912553
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70edbfb260fso87149616d6.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 08:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912552; x=1757517352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4HCy2NL7Blg6ktZUTQG7x2ot9qLktGXqBXqd0E8mS4=;
        b=wDuQFp5OsvWY9CZMkm3i5PBPREvP6O9W7sPOl6va2Rr4c7+icXPHWb+SwKV0yZ62yS
         DVRnRxvCKzMUVcRyaWI+ZrW5YuI+N3hv9VkppIXPCqiGUy7X4AtoU4BruH5Kc/78BCvo
         vpmS6ZnLQKjAeqmNBf/XOkW1sVTsOTp+/M75tzftLFTkrmla7tuDtDsn35eh7Pjt0/HA
         2o4TYkjoX5cMYG8n34RFVDMYeCx30I+5SoutTKQOgKRXPJHO+AhLzOwEl0Hk+0TCQkex
         JhMRLV68cnCUWeKyf4BBDwfutbOP9ZsfVJGHPwRexdTKWpdLNbz28NADhw+mdRF9BKsk
         F28w==
X-Forwarded-Encrypted: i=1; AJvYcCXfIWb+qiNlv2qRRpZEZyAry+u8ejtd1pYLuMsc0Kyfq6i4sy2ZRXnF2uFnTXNCSgs+O99j43Zt2kSqBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1EIsMwRubTePBSac2106JeknLTZCcnqp2qHxH9zrWf1t8O3of
	BFWk6Re6j4LzV+F9UoHPEENuhUC30sT/I000W1wa0nuI3jtsQdtm/VPx57HZmji7lKisOsp8dq3
	xlXmtA5JLR4UfkKBVlR7VZUN7XaXagHr6PdDBq8BI+yIAefcI5XozTbtucCIqrGF2Fe3eluIlAo
	ADerexGwlvhfBlFJrwhxLq9EiKADmyoZZ86lITEdz/uUR7ZtI=
X-Gm-Gg: ASbGncsm94jdINnXqj0SL8zk6WSWvD+4gfvJKoRtwpElgdIAXpDx/AUdnBiGaihGI3Z
	UIkSqtTOk5mzISF36jPw5H7Z7CPzA2awFjwlqP+9tpuEu98IwkQPhd9llv/wdEUV1CThVo7J+9N
	r1CzYFm8rbcYuqMbzs/xGS0xkcPDAeOaKNSHEgRb8ItBj/dDTCFHcRTEPm360Fj+y/OLloIKxWO
	JkLP9V+cA49O5NfTQLDenvc+uEXcaKAC60XlGo4i/LwBGYh4ONFLmlB77q5h/v4zlacLvZ0Koj4
	ZEKB6Fynkp0VRRdAVPWyaTpcj7qMZ0cEfbM9xlwP5J5GG4fvpGeJVyFTkHVX5mGoPfA6lRhL+mQ
	=
X-Received: by 2002:a05:6214:4c45:b0:712:644:d9f2 with SMTP id 6a1803df08f44-7120644ecbcmr172131766d6.10.1756912552282;
        Wed, 03 Sep 2025 08:15:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlQ9BdrI0T15lHuajgK3Ofx/Mn+DHDA/1mjdjP2xlPN5vgFUBDe96IRrxXSlBhDZltKM9h5g==
X-Received: by 2002:a0c:f118:0:b0:722:5704:daf6 with SMTP id 6a1803df08f44-7225704dbc7mr42110476d6.39.1756912541147;
        Wed, 03 Sep 2025 08:15:41 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Sep 2025 11:15:07 -0400
Subject: [PATCH v2 6/6] clk: tegra: tegra210-emc: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-6-3126d321d4e4@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=2321;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=f7zeRbtjFE6oZbaxfqDkdxVp3qdgNoSMwDXWIe1dhQQ=;
 b=KqIQakTxpJPpr1rcYh3sziesySXJxjBrI6+0TTX75xgEW8kKgKvFNHcGYKnxBX9/2bRbUKoda
 ZEdPYfU2taXC6VUs1K4llMiSTTFXWFnjCoqsRS44x/u1CUt0bBPlqa0
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Link: https://lore.kernel.org/r/20250710-clk-tegra-round-rate-v1-6-e48ac3df4279@redhat.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-tegra210-emc.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210-emc.c b/drivers/clk/tegra/clk-tegra210-emc.c
index 672ca8c184d2c6e9a7f26c07d036f3359af42bc4..fbf3c894eb56e3e702f0a1f67511463dc9d98643 100644
--- a/drivers/clk/tegra/clk-tegra210-emc.c
+++ b/drivers/clk/tegra/clk-tegra210-emc.c
@@ -86,22 +86,30 @@ static unsigned long tegra210_clk_emc_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_UP(parent_rate * 2, div);
 }
 
-static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int tegra210_clk_emc_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
 	struct tegra210_clk_emc_provider *provider = emc->provider;
 	unsigned int i;
 
-	if (!provider || !provider->configs || provider->num_configs == 0)
-		return clk_hw_get_rate(hw);
+	if (!provider || !provider->configs || provider->num_configs == 0) {
+		req->rate = clk_hw_get_rate(hw);
+
+		return 0;
+	}
 
 	for (i = 0; i < provider->num_configs; i++) {
-		if (provider->configs[i].rate >= rate)
-			return provider->configs[i].rate;
+		if (provider->configs[i].rate >= req->rate) {
+			req->rate = provider->configs[i].rate;
+
+			return 0;
+		}
 	}
 
-	return provider->configs[i - 1].rate;
+	req->rate = provider->configs[i - 1].rate;
+
+	return 0;
 }
 
 static struct clk *tegra210_clk_emc_find_parent(struct tegra210_clk_emc *emc,
@@ -259,7 +267,7 @@ static int tegra210_clk_emc_set_rate(struct clk_hw *hw, unsigned long rate,
 static const struct clk_ops tegra210_clk_emc_ops = {
 	.get_parent = tegra210_clk_emc_get_parent,
 	.recalc_rate = tegra210_clk_emc_recalc_rate,
-	.round_rate = tegra210_clk_emc_round_rate,
+	.determine_rate = tegra210_clk_emc_determine_rate,
 	.set_rate = tegra210_clk_emc_set_rate,
 };
 

-- 
2.50.1


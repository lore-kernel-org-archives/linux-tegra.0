Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58AC2BE7B0
	for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183957; cv=none; b=C2ogrHRlu/yPsznXgDAvQAzcO8vDNmAOVpK5Aj97RTFkn23f0vIdMeOvxzbPCaXzfdChJpXarddZmUJN/E2CeD6Kjbz2TYa/hQhiOvBx5d4+BbA/C7dNxhQB0F7/eT9HymP9RYuv1f7NAj2HA0FAZ1ZMaMchg68NDVmdhVd03RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183957; c=relaxed/simple;
	bh=g+Rr9YJF/IJHNNqn5Ts7X6CuYQgHeDHcghY0SbxnF7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PjImkCCR14YKaenDsoAcSNQ5W7XOo9EyNskX6ITHODKvSnlJieDBgo5Fq0buqOxw+mUSV05H5KnkzG1AUgcaGchBk2aZxRczV0mY60HZJuGvT5lpzQ1vxt0WlfLDQWC6eB/R/e0Fh9P3eFOwC5uxRp5vK+yxc8FEsPcRdlxL0cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iBk9RB5B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iBk9RB5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752183954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqPFMivkkxDCOaub9wGKuuvGzsTLzlki1gmCh/1JiW4=;
	b=iBk9RB5BJVKmVFxPGnvcywR5l+0SiW1HFucy9oSo7G9+tl1Rs7Hs49911+QaqPVvY8K6dv
	0GaMPhn8yjanBoV7s3et32U5LtTRJ+9WWBLFcEJ0IQNW+vvcAuNkgrAJhdHKV6xzbwxNQ5
	dv5vU0H5DNtPvWrQdzQC2IRL9vnggEI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-LMhYhFBoNXSoAAH8e3TxOg-1; Thu, 10 Jul 2025 17:45:53 -0400
X-MC-Unique: LMhYhFBoNXSoAAH8e3TxOg-1
X-Mimecast-MFC-AGG-ID: LMhYhFBoNXSoAAH8e3TxOg_1752183950
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4139102c793so1367724b6e.1
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 14:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183950; x=1752788750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqPFMivkkxDCOaub9wGKuuvGzsTLzlki1gmCh/1JiW4=;
        b=gX3RbjryGXOdsS7jxVueU9CjQi626OJkZ3RtgYkqjnnIfQXTCMEetjVDJNGCJCWdvf
         Scq/CfmHLoyxi+2EuzZVRIJY2nzGOPotUihgK3WQKY0WjF9fSXO8IgdLtsVx8nSiNE9P
         +sALn6jwZH9BeXtRqgj/f9PWI/4lND8jDmGnyRpdH6wvs+pkEMR1HRoyYM53eKSwuc0a
         DCuB42lzBtAg4hcRnshsNxZ70zdRRtb7QbWazFO3ShmrlVuD1Lwvyzp+6VE1lfu6cWMh
         DpLIbPlrbuR2KaxOdsHVS+uPXvmsu3nGMexn0EkGgfQ8EdM4V/1jfNaZC5HsLBz9zvQP
         VIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9W4047lKUPjma2vTrZLNOmY7V4x6GgD+K14zDu96hh7Os0RjRNlqaRz77dsRvwgUeNr7aPk1XlAtJcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+d8vhdWfzVfK+lznWVW7qbOPc6m23/akp78aqEGk3id4EAjTI
	rOEwP4z7aIlFeWcodMSZ50VU75QQquvqVxovjP7tHtnH9ypXbawK7P9Mg/6reKxVx1ieGhuALaD
	MCrK91WEBYJUmJIE4+tGmUsWvBgTnbvvqtjRFiADMzI+mq4yVBYKrMCsV3DIr80U5
X-Gm-Gg: ASbGncswPQnxXW21szOXV3Kgw87V4OZYQ7C1YnTzyo9odyEyzl1CIhA65LVPI/r/r3+
	1JTwUu0OKHEmvLD6pGWCUsOimhggVtuUooSahXPAvzSFyik77SIDhiPXMgoP42cwDLgfNVtj19H
	PCfb9qn9uF42yjOvfSqR+D1S4avdIDqpLWEH21ople7jPdYskOJ0dZcDCcdIekHgTSDFkTJPZ+j
	Q45JCsZMVlW7Xrfw5pNKJ5ojWgdoSNYICcPzLHXTYtTvhD12Y14Su647ZdF0JFvKWuAcz9ymdVE
	VoUv7cq3DeFSQD7URR8qF4nUZVEfbvxFOoHcaA6weOjj
X-Received: by 2002:a05:6808:23d2:b0:40b:2d38:e8a4 with SMTP id 5614622812f47-41539d97367mr381823b6e.30.1752183950581;
        Thu, 10 Jul 2025 14:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWRtZWye+WvsiWpUjSD6HA2ojrPOsrb25EBqrMr3mmCi1XL3FXlFKuxXiCK8G3yi3fRSP7OQ==
X-Received: by 2002:a05:6808:23d2:b0:40b:2d38:e8a4 with SMTP id 5614622812f47-41539d97367mr381810b6e.30.1752183950275;
        Thu, 10 Jul 2025 14:45:50 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:8102:a87a:c1c4:9ad5:f0c:c0f7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41419baa00dsm345483b6e.22.2025.07.10.14.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:45:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:45:15 -0400
Subject: [PATCH 3/6] clk: tegra: periph: divider: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-tegra-round-rate-v1-3-e48ac3df4279@redhat.com>
References: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
In-Reply-To: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752183937; l=1186;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=g+Rr9YJF/IJHNNqn5Ts7X6CuYQgHeDHcghY0SbxnF7Y=;
 b=25yPFhayTxvRCgxM2jMj5FL+ku9ZTaEWwWbBzThJCxpVzKtij7A6jKLX8tv/Kw9S7GDoOHRRw
 6t95b8gXYloCESNIeKYKrzuVZ/JyVWi4igz3p0a1pdChn58PFeX810J
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate().

Note that this change also requires the same migration to
drivers/clk/tegra/clk-divider.c.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-periph.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 0626650a7011cc877c084fd93ba961c6fbd311cc..5b81b3c34766a8d80ff2273ea2fc08e988ee14ff 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -51,16 +51,10 @@ static int clk_periph_determine_rate(struct clk_hw *hw,
 	struct tegra_clk_periph *periph = to_clk_periph(hw);
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
-	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	rate = div_ops->round_rate(div_hw, req->rate, &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
-
-	req->rate = rate;
-	return 0;
+	return div_ops->determine_rate(div_hw, req);
 }
 
 static int clk_periph_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


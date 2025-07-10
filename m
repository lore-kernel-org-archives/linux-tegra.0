Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00BC2C08BF
	for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 21:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183962; cv=none; b=eMIQNXDxrOyzpcfoB1NeLztC1NoKyoMheEfSG//oMBXCrH0HCQW1T4nqvjX3RsNlZGR/nXbuItQOwTEYuD3qok+vSeN7f6+0+jz7v3u4cdmoHCm6ioU/9z3wuko2Ukqa+bjFyDUIfHXPQ8ySpkusBTkhjybci1Xi6o5zPNZm350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183962; c=relaxed/simple;
	bh=I1wqJdRTlHmsA0JfGk/JJDZ1BDeSSBu3qnl9x/JMS/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjxYoPv8FdX+xRQn3GvxJYoDzCcKUvIIvHI7Ao4CoVAO1bx8E+X85qieqFmn+sJkcBrm7xF9S8Y94r4fHRRGaI1jAwL6Edj0siOT4OzH75c0+KESdhm11Ox5jI4k+C6mu+a4zmH25OkOOWLzpImFech043uNX2nxxafjwHlPuho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T34/lqL2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T34/lqL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752183959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nucAiqEHmLyRkEarV6UrpWZn+zxmDdNtayNZWpsFgMk=;
	b=T34/lqL2nydEF7Zf9aB5qXT7sx3zLCQopNB4sX1018qDg94540AoGJy4jFxDlASx9LIJce
	3qwsjDJVOp2n5baQXW6NpltThPhM9AxPAX34FzSplbf3tcIBJ6KHExKQ3jYswDI+GT7VI8
	X1qqzIdUquatjtKJGdgAr28AQ91Gfgg=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-yy3XLDfqOrysEtIKeglMgw-1; Thu, 10 Jul 2025 17:45:58 -0400
X-MC-Unique: yy3XLDfqOrysEtIKeglMgw-1
X-Mimecast-MFC-AGG-ID: yy3XLDfqOrysEtIKeglMgw_1752183957
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-73b2cbafc50so680241a34.1
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 14:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183957; x=1752788757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nucAiqEHmLyRkEarV6UrpWZn+zxmDdNtayNZWpsFgMk=;
        b=jcghdhkp24Zgrqir4+snX+gH5VPlstPANENFMI+3AC5l5jnQmGS30Bid50zki3+joR
         iR7flA5BWg7PzH0ZJujKwm/tDs/wVBxPUprv5I6TwxCExEGkJ6Od4EFG4/LewQtd3Q5F
         K4YowxpLIbK8RLHUtfeqzFG87mvmh4hWi31pHTHK2Yhr4zMIN1Dup0wVlErGtPs+3kGr
         4H2QBE1jHwt84FDzWC7KPc/aLSX0Oq1ZMiGLQk17UdQFudjiM7ykkS1I9Ki9VXLffSxB
         6BaCxNdjIIHjfzwO8yIfHEq2hWIGIel1wIdKbzcw2A/WzdBhhZXCLbjPOmOmismSHPL/
         ISCA==
X-Forwarded-Encrypted: i=1; AJvYcCV2+GD6RHcE/sBs+bZ+ym5uClttl6FbsgMR6guhHmIbXzqLY4JbPrWhOjo/y/Yr0QGxtBFu55FUaABoqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwkMNn57E8/IqtTinNfsvMBrZLzSwYLzZ5wvIu5a023jaqaDY
	8it3Er3xDiHsJc5RLO9eeyAlEOUj9qoZtlqd6lpZn4AajDyzi3qZhkx7hX8Ol06Q/e3ij93B70j
	awHVH7N1QrQpnjBku9/CIhsDdy5G26abnB2SQNWPdbFEZRirwhUhilxJP7Z38Htxl
X-Gm-Gg: ASbGnctPkB7gATKKcaqjnXavhPIygv9GVzIVmnjcb0oesYBJMWmmKLLkpKM46YNpwNu
	t09D3nBtJWvzxn0mOcqBGPSFp84/b55YYDvxnoaRjxh/Z0efVCtrRSY33e3OeQAcENsTHypR0CF
	bFas2wXs+clTkXI/tfgk3Iql0PlxlYHH7YXJ6odm3TpYUCc45qLNd/AV0jlSwwrzIPJUpE4Sq5n
	Z/wPFJFvyzMsXidLH/LtFQVZPivQUtPg3O5yIJYN5wuknkY3qYG0rj9tfIFJnNxysAf2l5TFb9q
	AmBZ9eIuwYpq0qvJxPupik/dXZRvXaa9Xgzrka199tlW
X-Received: by 2002:a05:6808:2226:b0:404:f14a:1345 with SMTP id 5614622812f47-415397b8ebemr368522b6e.20.1752183957597;
        Thu, 10 Jul 2025 14:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWEP2MgO/8eqDff063pLtnLKOVnMsnlx9GHlQHKfB8kyjNWeAH1eCP83ViI1B7NZhjtnja7w==
X-Received: by 2002:a05:6808:2226:b0:404:f14a:1345 with SMTP id 5614622812f47-415397b8ebemr368506b6e.20.1752183957279;
        Thu, 10 Jul 2025 14:45:57 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:8102:a87a:c1c4:9ad5:f0c:c0f7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41419baa00dsm345483b6e.22.2025.07.10.14.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:45:56 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:45:17 -0400
Subject: [PATCH 5/6] clk: tegra: super: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-tegra-round-rate-v1-5-e48ac3df4279@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752183937; l=1155;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=I1wqJdRTlHmsA0JfGk/JJDZ1BDeSSBu3qnl9x/JMS/0=;
 b=s5APECrNqiizBVwMlalLDtRZ3SpRDdcPiKfaj0y9VcfIFUCFyQZEhBT5BFX/kdGsIxOqzrrtJ
 Hkl52GAjk2dBJ84qohh+Oz5jt6wQrPKFHVA2ds6+s9SV+v9RKvTGQDM
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate().

Note that this change also requires the same migration to
drivers/clk/tegra/clk-divider.c.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-super.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 7ec47942720c5aa43f35107369b42804f4847b97..51fb356e770eeaea9d26ef48f298dbc00e164732 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -147,17 +147,10 @@ static int clk_super_determine_rate(struct clk_hw *hw,
 {
 	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
 	struct clk_hw *div_hw = &super->frac_div.hw;
-	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	rate = super->div_ops->round_rate(div_hw, req->rate,
-					  &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
-
-	req->rate = rate;
-	return 0;
+	return super->div_ops->determine_rate(div_hw, req);
 }
 
 static unsigned long clk_super_recalc_rate(struct clk_hw *hw,

-- 
2.50.0


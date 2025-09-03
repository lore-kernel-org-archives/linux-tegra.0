Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9D23370F
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912540; cv=none; b=c4Z9tsYUhHXZjTSKmWFae5Fmn6U5eb2SUYCEu2vbkQjczyL3ag2oRV8eqSs8QcHeBhsHZii6F+/XW2X8oeaYHeJm2tYQTRu7FZ2T5knb1Vvdh8SASn9BSgJhVJDO7sgh/4iCdz9xj5S9H2JlxKI70XkDx5B+FctR44zkOPB6A6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912540; c=relaxed/simple;
	bh=AjcEhiucMili9sf/wwjT6T4E9qy5apL2Ir5PIpobHoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNizkNkp/NEFuyqNm+QX5Tr5r6+X4KMuavb8V8TE6jBn2hCIOjvJu0q6nGUaM3oWveIV+igZBrfWq3cT02hTYV44uFztBEgNXOPI2Gscby/8LL5fMV0SD8iD/CLmqtQHqOQL5VCwJax2bAcCLaAeFgUENLrYz4zUqKZS1bWx8+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GZalWOkX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GZalWOkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+0vXFzhSxSwj3v2mrFQi86NSXUL4ZDppFXq+HtAwjk=;
	b=GZalWOkXdx2onhYvbXCJTXeMw7CMHzD6giuY4IolJEailR/7GHjfQ2T9Oou7EGvoJOjLVV
	llk1t9JuzwskNFDvCBeWG1jGWOUjtWh/T1ZV2eEarGmM5pPNcGWqoH2QlVQCcx8gPdznkB
	FtkcnQPywJMu/6Nw8YQS/+ssQ2dZyO0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-1YyzHbEQNCacBZbBwiufow-1; Wed, 03 Sep 2025 11:15:35 -0400
X-MC-Unique: 1YyzHbEQNCacBZbBwiufow-1
X-Mimecast-MFC-AGG-ID: 1YyzHbEQNCacBZbBwiufow_1756912535
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70dfd87a763so76528946d6.2
        for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 08:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912534; x=1757517334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+0vXFzhSxSwj3v2mrFQi86NSXUL4ZDppFXq+HtAwjk=;
        b=YouiTQO1ff27c7yo0eRS1UK7pObk/iyk5aZUN4QIKMai/0eSCJGcTZxtXtOzD2IkCY
         bMWq4aE+XkBnvQuJufClERZQeYFuDbQydth1QKKmBGgKVG75ko/UH3FfOLGPSsOVWKfo
         sr/gY/Jj1mwTfqbqPx4p0cxudMWOLXckdTSkCRmubDE5Ny/SIUoVHh7oOLdhU5jTEYeT
         dLxATP0lWJFyHb091NxTGJ/roxeno+V23nm0EfHP+8/o++R0ag3bFxRdO/zs31r7wElF
         2lanuo6LNbyMf9golnHq8wvGJl0Yzi4N2AGUPKFcPOio34L+ABckSuy+4IQAv6k9v9jk
         wlJw==
X-Forwarded-Encrypted: i=1; AJvYcCUj9QDlfiNsJT94M7EKHpxZjPSETivQkz21U6d4iFcV65s+BZ3gnbwKHzGilTGPZ34sX/d3ypR5G5jCJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC5xmRxMK1gJwh17t+Eyp7lEkuM2NSZZ5hmRR5YoRiKvB5US/R
	NQ1qBsek+H6lipqokMLdvGNk2ef6gpxJWyWeI7Z5E5ctMzlQY4M7TAhpTDDkx9B/oCzt5F/9ifS
	BV1YizIHB5qt41XQPwOLTEwjEc8YZ+DWvbQe+oW6nAVVHHE00q+6qgI5TwLEY16l/HWsbqCpxSz
	9sIso5rJ3lwVpO1kA1Yty6BWWZS6Td+xs4duaNXajku+wNF64=
X-Gm-Gg: ASbGnctSNukWAIhoh/TGkI3Uml9dbxqMxpappzWyZ94vRiIklNiYZDyZI5LgQ9Zo5+a
	3Ec3RDG2Yb0Gj4wzDB2VbVRVaNXwWjex9t1aqRatgDApACLhURrb/bzJi/sMxN3YN7i72aZw6/N
	45l11QmOgWQnYN7mK1RMUQzjg2aAKaN9cMfFuz3cR5X1wm/aBkMV5TBgrXRiKllQ1ANRJ6xyMd4
	uLlOXbBGPLS1FW3fLZLZCe9yLfhE9R0LGjdpKFmz1wWjPABAVTb/xMAMELLb+f+c4tWEcUI5yxH
	BNsVMCXN8dWp/huZEU0gA5LinFissCBjRG2jV00GuUutYedTIWTJdbTyluwe6502FrvHoNSGUJE
	=
X-Received: by 2002:a05:6214:e43:b0:726:c288:a666 with SMTP id 6a1803df08f44-726c288aa54mr17036446d6.59.1756912533678;
        Wed, 03 Sep 2025 08:15:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3IlMKWWgNAO7Q6WOeecM/0SWSXq5cZbNHqhjh9Ns5zZcD414eMglOR+F+Y+S6eyNAlpLYGQ==
X-Received: by 2002:a05:6214:e43:b0:726:c288:a666 with SMTP id 6a1803df08f44-726c288aa54mr17035696d6.59.1756912533116;
        Wed, 03 Sep 2025 08:15:33 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Sep 2025 11:15:04 -0400
Subject: [PATCH v2 3/6] clk: tegra: periph: divider: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-3-3126d321d4e4@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=1192;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=AjcEhiucMili9sf/wwjT6T4E9qy5apL2Ir5PIpobHoI=;
 b=70I3Mq4ZlKGkt6RonBDIV0MOdusccrx3oFKMRyi6Oj3qJe6anIuKkXklg2G3L0mxPS9RSXztK
 VIj/MFE74U1B/LMA9OcxnqvYJNn8ONfhSkWtW74K+w2SQ3VpCWSv8y0
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
index fa0cd7bb8ee67801dde3c65eababe30c96a176ef..6ebeaa7cb65648e77f11f2c676aa3428bc490a73 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -51,16 +51,10 @@ static int clk_periph_determine_rate(struct clk_hw *hw,
 	struct tegra_clk_periph *periph = to_clk_periph(hw);
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
-	long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	rate = div_ops->round_rate(div_hw, req->rate, &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
-
-	req->rate = (unsigned long)rate;
-	return 0;
+	return div_ops->determine_rate(div_hw, req);
 }
 
 static int clk_periph_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.1


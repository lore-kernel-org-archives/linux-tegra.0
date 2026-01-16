Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4B736166E
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560128; cv=none; b=pIQMnzRjnK8kc/vFDztT0EVmFBJmd/OHUTNhilCN1UEEat5/0BlmpFiC01wYKEb54nTADazHlgg6OD22wSXUoQk84U+lcOY6SyO9JNOeChdl/XYrYzpRzuhYcaQQxbH8wMbCQZikDy1y+DDmpUvTxCSN59YmVDGysymPhshUlSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560128; c=relaxed/simple;
	bh=q2e+6agVTigOW71GtNKg77/ACMqS2Wt0HY6x1VxcF0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPq3/bM5mmF5IHZATEwhmVXhW+9KJz0snirp0sZZLf5n0ZXdfWTYza3pMaAKLbUJGCid0bIOKpLpyfUEmOT8eshYM/vHwSyyphblWRLatsFyOhIvVib6Kit+jYwDRWEDsTyrfs6tCwgFQJYps2PR77LFQuaV4GCUZiw27D2w7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-45c889aba0dso1104775b6e.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 02:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560121; x=1769164921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sdh9rVcZTiHjEuI7u09tr10D8l/P9Z+QisZcCSJfFr0=;
        b=aXEkKWVPCUM67v8/serqibBMnjlpklB2pjSGfK34Gn4TUVu4qAgMyH08tGGcB3llx3
         aB0WL/UhnySaq8qKl+mWt1I4LJEUD8QbeXiilaW3sf+GN18t63xOPvdOAMqMtEi4L86f
         41j3N5pu0Bpgp3NAe5KR+ZgSRdG7p2TajD+2YAiFs9ixmUbbDiJT7saXgDxGrGX9Lx7u
         Z6IZAoIL6BaqMlx36xab1dpMy6uD3E00zZKcfEsvDsXNIPOWC/ARKLSYVqA9OFU4Qn89
         Zq6GNehJfE6JPA1R1FoE02LFHb55MRDozyPLMbOXJQ2ydFY5L0Ob0No8QAuOUdTW2Kos
         iUDw==
X-Forwarded-Encrypted: i=1; AJvYcCWIb+oFxX9vp93ZKP2HObB0oQGTz+dVUNSAZ++W7hQFZfogAX6aHX1Hh6RMOX9uvcaspVvoy/MVHQri7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSdFYHvguQ/8qz35Q70l9RAMGjdJV5Nwn1gKFgL25WfZMmk6d
	RM6Qc3mCfZ1VhcbVA6Rx65Ah+RciWCPK0/e79ThPZIkOydWAwW1lUXWo
X-Gm-Gg: AY/fxX5nSffv+lKBj9zuElwMjKOjYUOqKGlu5w1BV/LCSCOXlGQqzpqwxwyH98OphP7
	LpTbZxKWN1rqw4GAUqQheCBkbawx38DSE7Uw6oNf9WT+iFV9BHm8ZXJG8kYNnbMv4ajICaARrf+
	lFbTrGMNzu3sXiQNHRdU1KsDVzdPsn5+hSktogb/Yr3K6L8kQ4K0+N7yTj+MjLnhPqA5V6lNrov
	te3eQHcKSiSCsuUxjqTruthQ4rXYEY+VLh2UaDaszWHKtQeH2+fOt5Re5x0ilxJhbF5F7rIKRIW
	ft4VWYW6cbsYKjL0HL5gI5uEfvEfxlnvLZXKkoIi1E+14Uzq4Sat0asgGMKmAImyg/xvIpSoeSE
	wfA4y9bQkOPxmTsQbirDJQxYudf1zz9aHzz28xv9tlWomrrowMUV1cjn2F2G0bDyzmsjv36erYZ
	7jDw==
X-Received: by 2002:a05:6808:f05:b0:453:ea2:36d9 with SMTP id 5614622812f47-45c9c9186bfmr997935b6e.32.1768560120730;
        Fri, 16 Jan 2026 02:42:00 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9decace9sm1146453b6e.4.2026.01.16.02.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:42:00 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 16 Jan 2026 02:41:43 -0800
Subject: [PATCH 3/6] spi: tegra210-quad: Protect curr_xfer assignment in
 tegra_qspi_setup_transfer_one
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-tegra_xfer-v1-3-02d96c790619@debian.org>
References: <20260116-tegra_xfer-v1-0-02d96c790619@debian.org>
In-Reply-To: <20260116-tegra_xfer-v1-0-02d96c790619@debian.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, 
 Vishwaroop A <va@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com, puranjay@kernel.org, 
 usamaarif642@gmail.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=leitao@debian.org;
 h=from:subject:message-id; bh=q2e+6agVTigOW71GtNKg77/ACMqS2Wt0HY6x1VxcF0g=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpahXycz1W/zp1J6VAOcPgx7qzzOH1pxMC8X/HJ
 mRg6HdQDE2JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWoV8gAKCRA1o5Of/Hh3
 bdWbEACZqEE0+NRv9hoyDWpSFrOTkr59WK9sr7/7Pozic8udHe3Mk1T2NN14LDnLngiWnlJ/2TQ
 1/lwvn4Ar+8iUy4cwC2siTNeBDweMRaq2W1yvxnglfWredWDnbvHmC6q175FFdNQQYSWR2gxt/8
 dqKhOJ1oEDCNQWRWZioQGTzhoGv5HUr5xuApTXu1N8grnic7qwwmvAiUL33mccuIO01QDelnev9
 NpmwMwNPaoL1XmqnC3noKEWijIDTVKToOwYM/1jztSuhgX5gMZfLUYAu4e9YjJA4dtdXYL6PsHV
 MN0UHbfXEoTPvZEv1KNIm+LEDdW7r8UsVd9VEcZKcunrRBS48PoXACimv3njy78uEwA8ufFXMg2
 RPX3+29m8hX9ezTcX83AOfUa/BUgje1sqkDiQ3WMgeVCTVELKreWGi0uJqrTKtOdrd2awApuGhW
 Xp34DCUjvGR/+MwJXz6QdNAuLJZ5am4s66vwdeCApOaAShXjhdYN8yOV8IjSg78Wh9cudd84zOz
 4hvCcM7aYDL7r3NkIZ+jSyv9cJfV4Xgv+vtuxxZEHWKNOqiudVwZifk+mtQMZQNv0qpspwjRS3z
 53RcIt6QpF6fhlDGWTrOvIT+jKI6Ufw30h2GpjHKmGHbFD/o+1jcz5R6mCiPNC0DcpDmzKTzEM9
 +tgshxVBI6mOFYg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

When the timeout handler processes a completed transfer and signals
completion, the transfer thread can immediately set up the next transfer
and assign curr_xfer to point to it.

If a delayed ISR from the previous transfer then runs, it checks if
(!tqspi->curr_xfer) (currently without the lock also -- to be fixed
soon) to detect stale interrupts, but this check passes because
curr_xfer now points to the new transfer. The ISR then incorrectly
processes the new transfer's context.

Protect the curr_xfer assignment with the spinlock to ensure the ISR
either sees NULL (and bails out) or sees the new value only after the
assignment is complete.

Fixes: 921fc1838fb0 ("spi: tegra210-quad: Add support for Tegra210 QSPI controller")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/spi/spi-tegra210-quad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-quad.c
index ee291b9e9e9c..15c110c00aca 100644
--- a/drivers/spi/spi-tegra210-quad.c
+++ b/drivers/spi/spi-tegra210-quad.c
@@ -839,6 +839,7 @@ static u32 tegra_qspi_setup_transfer_one(struct spi_device *spi, struct spi_tran
 	u32 command1, command2, speed = t->speed_hz;
 	u8 bits_per_word = t->bits_per_word;
 	u32 tx_tap = 0, rx_tap = 0;
+	unsigned long flags;
 	int req_mode;
 
 	if (!has_acpi_companion(tqspi->dev) && speed != tqspi->cur_speed) {
@@ -846,10 +847,12 @@ static u32 tegra_qspi_setup_transfer_one(struct spi_device *spi, struct spi_tran
 		tqspi->cur_speed = speed;
 	}
 
+	spin_lock_irqsave(&tqspi->lock, flags);
 	tqspi->cur_pos = 0;
 	tqspi->cur_rx_pos = 0;
 	tqspi->cur_tx_pos = 0;
 	tqspi->curr_xfer = t;
+	spin_unlock_irqrestore(&tqspi->lock, flags);
 
 	if (is_first_of_msg) {
 		tegra_qspi_mask_clear_irq(tqspi);

-- 
2.47.3


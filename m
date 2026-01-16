Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789A36167F
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560128; cv=none; b=SUALiNL/pV0rdJlE0AEKmLKUcOyPEPUWamTOlXc7a7rW5spt7YhOumqw2suDrFjMEvkdP1oBaJlNW8EfkWh6PXQqTgOyuIqCAanBx7HM1A4nnKP+tAf0BkV73IJxWwXRR9eDWyTASEMwoS3E8XiWLsWVfCOVW37+q050gYd3iD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560128; c=relaxed/simple;
	bh=+gM/8rmoVUIhEKxbIe7M9zBfgjnLSTWPpirV2zKTD7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQftTQeyIcF7/VIgPx7iymzXnn0CLbPKDP0KLqkPHpUUCAmZX/6jUTu/nhhERkySEArCc5wDP+/3XprpPWOH4gz026Q5S3zU22okXL0bVUzuoTy7mC5ebCnXVhT9UUZ/XWj+zf86XWO3fS0kmGBpE8vXJRVdtqYwf4QZqx3z+ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45c89d754dfso686467b6e.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 02:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560122; x=1769164922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/Q48q0IeRuhiLU39AjZe41jfSGMPYWViJGlNFlddxU=;
        b=Y95gyY6ItzMqoEGVX3e4O5cVrCOkMnlwcT94J2uJ8hsq/diTemgdGQPwrvCReAEe2T
         qfRpjkXJDCaFGArvFUebltVgLRcRNuV0xbql+j3qR1EnuIvqUqpJB5qKtq8JbwN0CXf/
         BNipnJ6/5tNUiwAlTC6DCtMHopiKlAJ9Wp/Q+jFTylSvTaYXpX2xis30zJTQVOEU+moT
         H6eYeQ/2Cn0zhx34F5pAxOiiFez+S/ugaVN/JxVvhiPRe8F3b0LoY/hJ6lrAqn/NkBtJ
         QHQpoc6l+alCfOYpDcVhgv7GxZ2Ntv/UE53X6pr9gfxc8eGdcMPCfLqf6o0HvPSqKW4I
         weCw==
X-Forwarded-Encrypted: i=1; AJvYcCWtiJbTx+DTylLiNNQCGxY7fhTqhq/D+KTn1mkBHMUzK2ye6tSFLNpOijodDhtfXnJfOuQtNlYFQUKMfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdNITCzbjyNqhJ0cSV3m1vU2RsQjyA9dgiQO3vIrBRRcM3M5U
	2HmNNTQWwlywcICavE9PGe1PWEyci73I+lb6SET+NUcPKg5YTc6wmDtU
X-Gm-Gg: AY/fxX46fkkXH9R8vru6SOVr224aLTWGNIOQGPWT5kIUmKhar+u4L55mQTItXmmLGZG
	IHjDstSxmtJqdWh7UzkPrP0PbzdeAMqMU2lFl+fuPRmu47JAYA7MXSx7P3T2i2B++uuKilYNKkZ
	Hcifbv+jXYSU5ENsuJS3RfXvcsEAHRegmq/7IM9lJiTf3nWoH1Kq3ecBfkPUPRO91/Mu+7C5bIz
	rjYff/A/C24YvK1yxc8gi1x8ZLiNuLrd73jx7juA+YunCFGPW44fe0AAF+TkcIEUsozfm3AzBUk
	ZPFEI1onhmB7REwFRXIRjXlipPqqYTsH0/juAvXuQNv+hPEANUILpo80z+60dSGkVk1krCt0aRB
	3bN8TwCSmWHuW8oNytF0yFKIvvfpyw/dAEE9wPYJJji0YZ/8wVo9I2n790qb2fJ3H6yrQY1WcN9
	gV7A==
X-Received: by 2002:a05:6808:1987:b0:450:c58d:8c3a with SMTP id 5614622812f47-45c9c197324mr1174687b6e.46.1768560122245;
        Fri, 16 Jan 2026 02:42:02 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:48::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e0086a4sm1159605b6e.12.2026.01.16.02.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:42:01 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 16 Jan 2026 02:41:44 -0800
Subject: [PATCH 4/6] spi: tegra210-quad: Protect curr_xfer in
 tegra_qspi_combined_seq_xfer
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-tegra_xfer-v1-4-02d96c790619@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=leitao@debian.org;
 h=from:subject:message-id; bh=+gM/8rmoVUIhEKxbIe7M9zBfgjnLSTWPpirV2zKTD7w=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpahXyLNJ7iq84eB82zOL5JoFiQtdRTUjOjHDHy
 fVQ9LMo6UGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWoV8gAKCRA1o5Of/Hh3
 bQ9jEACbt6+1pTgBmYLHPVxF3SfGaQoSj+VK3AqdIwMH57jLykLhqPWDjGyEiEBOoFaDuidkye6
 CZvQ8mI5XH93opWhN294Ctp+Men+sJ1Y5GlVL6/20WnfB6MDLkZO0SoUxTkY6Ty0t82DHmHdWrg
 0XdNzMDRpRt/dmfO3wvDBd7CXDNG/Mt1sno40TXqlRNOfDNc8pLTrtP2qOTPZEyN+CnHF0hxJwB
 MCmBdJN5pP4w1hdAVBDPEopagzKA1NtwVhkSMpIrxDyL+P0q89rnWzRDivcrn3c4jGVpJF34rGm
 WwJEEnLyYh4e/RJf7mM+pGxTFEHhl94Bnd9lfhViR4eNdmi51EEiaiOPd7sTtkonFk27sA3GJzO
 6QBuF4tc0a6QIKfFAXXR9u5GajuQVKeOdq5aa7yU9mDIZEoUUV2oOGVQWc9ovJtLeiVS1lb+uD2
 nX1Ypfgezo8cdZtcLNT4NOG4LprtTkipiX1kDDOcOq7r+DH0KFxb2XzKhBbObCZOVCK3q5dXOmT
 RdolAzs3DXVDFt/qQIjIXOi+DeKwQ/eWeIiXRc2M00P/TpzVEldcETbI64ZrHy1UcFYQ59z55Ws
 Mc2pPBroAgksK/IVx2S1Wl8edU++R31E1mQDFTUEL3e/EgEf78VfhYjyJdlhzKqXwORuzENsxO6
 dbisWSdjANhedMg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

The curr_xfer field is read by the IRQ handler without holding the lock
to check if a transfer is in progress. When clearing curr_xfer in the
combined sequence transfer loop, protect it with the spinlock to prevent
a race with the interrupt handler.

Protect the curr_xfer clearing at the exit path of
tegra_qspi_combined_seq_xfer() with the spinlock to prevent a race
with the interrupt handler that reads this field.

Without this protection, the IRQ handler could read a partially updated
curr_xfer value, leading to NULL pointer dereference or use-after-free.

Fixes: b4e002d8a7ce ("spi: tegra210-quad: Fix timeout handling")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/spi/spi-tegra210-quad.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-quad.c
index 15c110c00aca..669e01d3f56a 100644
--- a/drivers/spi/spi-tegra210-quad.c
+++ b/drivers/spi/spi-tegra210-quad.c
@@ -1161,6 +1161,7 @@ static int tegra_qspi_combined_seq_xfer(struct tegra_qspi *tqspi,
 	u32 address_value = 0;
 	u32 cmd_config = 0, addr_config = 0;
 	u8 cmd_value = 0, val = 0;
+	unsigned long flags;
 
 	/* Enable Combined sequence mode */
 	val = tegra_qspi_readl(tqspi, QSPI_GLOBAL_CONFIG);
@@ -1264,13 +1265,17 @@ static int tegra_qspi_combined_seq_xfer(struct tegra_qspi *tqspi,
 			tegra_qspi_transfer_end(spi);
 			spi_transfer_delay_exec(xfer);
 		}
+		spin_lock_irqsave(&tqspi->lock, flags);
 		tqspi->curr_xfer = NULL;
+		spin_unlock_irqrestore(&tqspi->lock, flags);
 		transfer_phase++;
 	}
 	ret = 0;
 
 exit:
+	spin_lock_irqsave(&tqspi->lock, flags);
 	tqspi->curr_xfer = NULL;
+	spin_unlock_irqrestore(&tqspi->lock, flags);
 	msg->status = ret;
 
 	return ret;

-- 
2.47.3


Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A94361674
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560129; cv=none; b=nLc7MPTnL2pWL9ltSBXzErxuoKZECZX8M4AJxr5PACcm5q+VPaaHW1rPpRoFGZqH4sKau1pkKbBaTFaFb8TTZHMP1VOcEUTaooxnj+KhsDbPOiy/w7rLEUeb49V5nhcn02oU7adYdq2Akh32XpoXgY6yWmY5K2mcpeT8ldfZhaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560129; c=relaxed/simple;
	bh=rXTI3sY64hoG5V6aBH3z2wkNQ6wZUnODcq5kb+6G3tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLdndsOm9xdOgya3kyq3pTrLdcv3AdFLyXN9HPJveNsEZrDw0NnROaV7ba6JSCr5RtXBI9K6LqziWhs+Kje5vrWVgo52aR6GstuBY5V0pT/wiYZ6h7Rm3+3jMltLEY858Zv5P2wuZ6P6vg7Krnf73MoQXrkhVZriU+t8c44txW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7cfca52ac2dso1205276a34.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 02:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560123; x=1769164923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0AA7Y0IuqP0pVl1HcO3QatRU7TWIdgT6ORxtlbMnz/0=;
        b=EoKOVt7Wxx96IdH62s0003GA+vPgtn1ONdtep59jdb+cHLfnMZ7WaFvZ1mRj+HOU1z
         DqWJgcMZa4F74HKiQmT0UxdNfN15W2/uO3Dhvymy9Z3EATgZxXn/reymq3P5aeN9Pkiv
         EuOx5XzWiCm+JpfowXVoYHyK1P52xt4Y8udJq/9CF6ovIB0J+f1wi1+CCCVaGcHhTvci
         7al4TnFqHwRcgnDY4iCMAMwBGDYPEz7LnQm11yIpfgTR27u+i5U8sxuj27F3sDMdu7Eo
         o3DXqIcsGtEf7ztCWq0fn+nLIjBy1FLckWsJ19qb3dtaxhuXs6fA9+rZo1WRNh/LF4uY
         W5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5w5pKqGBSXHAeMdaRPmdgEJJkfvIr0Lxp5l8zS9aGBKTigQ+ITIe9jdtvoe7c+RrkdfFUN4n3Nl2CEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXHybUM5I9GetpIBHrmguvjvc8e3YAEegwM4DhD5Ib4711Z97C
	PJnDvd0q/D7rTf1/kno2qw0IX4UnsdudupgWA036vHLa9+HVMTz3tl2u
X-Gm-Gg: AY/fxX4LOl1dPVvb9B1H/lg2U0dT9zlrKbADuWcIUoB6Cb5utvJjsSMBohFbpZ1Hwaa
	3edJ3wjotzcaDqfZ4ucZSVCS0pm3zdsnm1/2+pmiNpZUNcaYEoSoLU194LG9SHXcwMywylKBw/T
	n5vC09nQancfnL8ZlVGOb7Ct9f8UKBk7aLjzkT8WUhhUMC4wk8X7araV69cTAuMJ73cLqoOdTkl
	RSWJ70jl79Ty0Hvex/y4HXBkAw/y41S/fI8G8iSWhnW0nkx+c5vsy6x6tYxxT15kzd08IFvoqQ/
	MAtYsr5TYC2Y43o5NFzgTQQeeSQUJRzUj3e8w0Pc0cB62D4MXnV5osDw6t5mpRWzsI0cuL6knwi
	IYrGNBjVrioPt8qRM8P58QE44ukxKQSu5/96vs8NBb8hsHI5CyjqPmQ3zB3huDs3L43gYgYzUaA
	==
X-Received: by 2002:a05:6830:82e4:b0:7cf:d0b4:bab7 with SMTP id 46e09a7af769-7cfdee8f50emr1640254a34.34.1768560123395;
        Fri, 16 Jan 2026 02:42:03 -0800 (PST)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf0d9142sm1480880a34.1.2026.01.16.02.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:42:02 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 16 Jan 2026 02:41:45 -0800
Subject: [PATCH 5/6] spi: tegra210-quad: Protect curr_xfer clearing in
 tegra_qspi_non_combined_seq_xfer
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-tegra_xfer-v1-5-02d96c790619@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208; i=leitao@debian.org;
 h=from:subject:message-id; bh=rXTI3sY64hoG5V6aBH3z2wkNQ6wZUnODcq5kb+6G3tU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpahXyKDqDLy9UiFdHIdAnuTY95cnWgrnwOfWdb
 X+yE3bypBGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWoV8gAKCRA1o5Of/Hh3
 bfe4EACtv6gkekdzoWC0uBpx8BTg11Qj2SxS+lMOa/KXjIBBZrx9Vq4YfUrFK0WRGupFU9VAA+6
 E3rQLJ14PsLpEjBxO1imfKO4yNi6A10oCPKAmL9Svk5VgvPx3KbMcuc9dg8iPCW8aJjdg0rMj9b
 sEyWXfoa1kIfUGqpSQ5ZyVbZ7qTl8ZBCOL8WRumWVda+QCYWQph8iFVVRoknhyejv1nx/KNbLua
 yWAef/c6s8JdwA49o5TsD66LhOwDCTAw3B1zu0pgPbwJGd3BcY0DSsikVFs1UyyLl2jASseYPN6
 A4VK8cpfci1rSIuXS7V57N0PRhcv4Jno8K06oZP59OqbFHCD+Q7lkGwBP+ojf+R46fmJChCywdZ
 pLCYs64ioYh3CDNl6usNLABSMxF4U2x6ut4JX0zUECdzRowk4hB5ibbBSgzixZHXHcY5l1g2/Xj
 waIXTFR6d20JspOHFu8qWBt93haW9vac8wrgm22s5oey13Wlb3k2a1LNZpWSuMo36Jzc7owoHSg
 mleEkZW4yi3BWXat43Ys/gUixMlmPmsHBMTX25hPruCOWl4Fd9aXBHyhjLEfrZ+MxePO/+FN6jN
 bjaBDCoEwdwUi8S01QE2iqtv01QNIEMpBQ4BVpNwRFvakn4jjhASR/8Dh1fX+pOAOiSNhTKJTZ7
 9J0z3FoDNW9SH2w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

Protect the curr_xfer clearing in tegra_qspi_non_combined_seq_xfer()
with the spinlock to prevent a race with the interrupt handler that
reads this field to check if a transfer is in progress.

Fixes: b4e002d8a7ce ("spi: tegra210-quad: Fix timeout handling")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/spi/spi-tegra210-quad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-quad.c
index 669e01d3f56a..79aeb80aa4a7 100644
--- a/drivers/spi/spi-tegra210-quad.c
+++ b/drivers/spi/spi-tegra210-quad.c
@@ -1288,6 +1288,7 @@ static int tegra_qspi_non_combined_seq_xfer(struct tegra_qspi *tqspi,
 	struct spi_transfer *transfer;
 	bool is_first_msg = true;
 	int ret = 0, val = 0;
+	unsigned long flags;
 
 	msg->status = 0;
 	msg->actual_length = 0;
@@ -1368,7 +1369,9 @@ static int tegra_qspi_non_combined_seq_xfer(struct tegra_qspi *tqspi,
 		msg->actual_length += xfer->len + dummy_bytes;
 
 complete_xfer:
+		spin_lock_irqsave(&tqspi->lock, flags);
 		tqspi->curr_xfer = NULL;
+		spin_unlock_irqrestore(&tqspi->lock, flags);
 
 		if (ret < 0) {
 			tegra_qspi_transfer_end(spi);

-- 
2.47.3


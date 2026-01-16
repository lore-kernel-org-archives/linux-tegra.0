Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88520361DB0
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560129; cv=none; b=I9Om83Ksmpc3FC5CSvf65UEyq8rDpY3Q/Bun7lGLE7v/ESgYnDgnATXZRbr/lpFtva3AZcezPlilYdry1JGyFMB6w+g6mm0wb/X0BgdkbSIKcEp8GC8/R7Vy6D+rUnBkkf4O3PNtBo8Ayq4hRT0g9CSEpFFoRxm1xJeNC0nCd1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560129; c=relaxed/simple;
	bh=A/vGZruJ9X8gRAZcaLKj0oeYi4fgmnrSS69XwprVzOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8z5HimWeBFLoBTUB7Ll+d7W24hfNWDzkewxhVg0IwWa8mC0o2zd7aUMQBAKtmiJgJr9jXaXtqj57jvGv32+2FdCCi1ic4XSya6zJkhJ08QioXrDXB4MnKx828NlvU1jmKLTCufcCZKeich0RTbLdEC/l6zNUnY2FonNDeI1DCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45c70afbeebso1111982b6e.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 02:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560124; x=1769164924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0ntyY9ECmhz223U3egy0DvK+OimABjT6thpgO5HCR4=;
        b=FU2MVDQTZMa1CGrbOKvqUJxmrKLrlaZrwQzoHDcmUEP2LVl2hzAcXVACU6LRNaY4UE
         4dCcwi5zG7WT+BTunWD22E7YoEQFIIVZB5ebMuJp9pCRP7sQqPoynxZaNkBEb0NY5JI3
         oAz9tIsLz96zDFqoQ2HFagg/EODGO8m7ELKyETDmkV905wFUbky8KBEb2BaRYR3/Ye6c
         Ev12qT5ATjDfteouSjqF2dRZVo/y47yjggoKbrA90bTOWSI+Y9G7y1kHf7Al6zUxXtCy
         Zm0gUkMTlOQnyE/3IuOCVUvGu//axviPi+btrHDC9BwFwDlMgC1fFjE3g+dhI73Py2TY
         0dcA==
X-Forwarded-Encrypted: i=1; AJvYcCVUJRjPKoBmRqn96r6NhqB1aj8/KMFSkt79L6ZEF/mOEVAAv12fj3GilfesqiV1p6L9PjItblogEKTpVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHi+dXOqZ/oPPou5JGfjo0KK5zxSo1BW2drHBSbLeeIlhj/8dk
	5YsmRqF4VHs0JRPeKFwaPDqb9Qb90MFF2ppUKxV6rRag6pqZXL6zGPfQ
X-Gm-Gg: AY/fxX7zVDbpRlcjeTcxDQqPHwDk1wiAuy/8qIWbAiCSs1loZra6jYPcY1GJOkDkZgc
	Mvx56ljsyAvqCB3SuPJwrXmdwPELJpnxvoT4LglqggcrDZPKj/jBsgweKVbHtRgA1Ne5YEIDxqE
	nRdBO3FpkPiyUFcPkVInW+Pl2GHYFF8PDwIeFyMU3zI/p4d5qpK9hjmRV5HoMGqOIZOlKXUfgPe
	fetZGwoCIvJ4wG6Bmphk3Ed4DyHqXhKCzuqCh3e4Gah1LYL/fIj6qJfKTeaGDzwCA+sDWVGY3qv
	tr9WkM9TaBgpUsymrTBkZHohxYULU9wsfZCNI6hQoz75wFLWFTJQ63XZtJjwST17EwOJgIbYGVH
	R7yoFIjE56qB3JMwV0jUqdD3RmSXqjUyt6uVNtsJepojB3Gzz3WCzWLJV55rUc9jntuc9KEIntN
	KoNg==
X-Received: by 2002:a05:6808:1207:b0:453:f85:79e9 with SMTP id 5614622812f47-45c9bf56a2emr1380611b6e.18.1768560124429;
        Fri, 16 Jan 2026 02:42:04 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:72::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9dec3567sm1108687b6e.1.2026.01.16.02.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:42:04 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 16 Jan 2026 02:41:46 -0800
Subject: [PATCH 6/6] spi: tegra210-quad: Protect curr_xfer check in IRQ
 handler
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-tegra_xfer-v1-6-02d96c790619@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3608; i=leitao@debian.org;
 h=from:subject:message-id; bh=A/vGZruJ9X8gRAZcaLKj0oeYi4fgmnrSS69XwprVzOU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpahXy8Cu2O+/SM4/4A32xveAysDh33iq6q4kwS
 2LvH2qMizmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWoV8gAKCRA1o5Of/Hh3
 bRNrEACoJkv+kyHRIYdt3hZZpxrLMv8tCkPIuF8cR1aAAU4UvBY+550/SB+LOrQ8kPLADZ02uv7
 aRyoTCZmpEE69NjveIRwuVDB46mMstFtVP94Q55R2ty/qzyzKl/Ylhm4aFvZssC0cvi8o/YkEl9
 WUTogIAP75n19IwTygHb19ds2Gdq6lexyUu9yJaPh7w1H8f3ebpP8m2jFx/3j2Ie3i4IEF2DQjf
 CuPjBdARvDOnNXU4WttRpY3Ky/q0Vn7evNiTJA7UmqyQK9PydSvawmOsURORl2mMvE2Ri7l9bxM
 336ynw93PsjjoS5dlqvxO8+D4vzTPl33nND2hJ5N7YXloI9oIphyCf69QWI8q0H3kv4zco3LaKr
 x9lOs+CaaZ/i7qxhm2rB4cBfk3RmySnLKxzEJmyACSMsAW5lYM8RnAvTK4nzYoImj+gcQscbVvm
 wtWh24Fk01M+NuvklOoPKIHUS+U2nxKVfvSBxZZQFJAxupLL3nV/cP7aLVl0OUeA1KPo4sIJ+0D
 CyKU/L9N5k6hbXPwNzv5+GT5ItHesBRgv7MRyMm8Ijx4ulCexft1fw1dW4u+RomA3pxnyRn+DT/
 +K6OReXiibMtFfR/07cRc7wNYMXTOR/zY3BW5BERV9Ij8UvX0TdOfVB9szHCOA+aszoF66XcLQR
 Q2dgibsWSj4+cXw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

Now that all other accesses to curr_xfer are done under the lock,
protect the curr_xfer NULL check in tegra_qspi_isr_thread() with the
spinlock. Without this protection, the following race can occur:

  CPU0 (ISR thread)              CPU1 (timeout path)
  ----------------               -------------------
  if (!tqspi->curr_xfer)
    // sees non-NULL
                                 spin_lock()
                                 tqspi->curr_xfer = NULL
                                 spin_unlock()
  handle_*_xfer()
    spin_lock()
    t = tqspi->curr_xfer  // NULL!
    ... t->len ...        // NULL dereference!

With this patch, all curr_xfer accesses are now properly synchronized.

Although all accesses to curr_xfer are done under the lock, in
tegra_qspi_isr_thread() it checks for NULL, releases the lock and
reacquires it later in handle_cpu_based_xfer()/handle_dma_based_xfer().
There is a potential for an update in between, which could cause a NULL
pointer dereference.

To handle this, add a NULL check inside the handlers after acquiring
the lock. This ensures that if the timeout path has already cleared
curr_xfer, the handler will safely return without dereferencing the
NULL pointer.

Fixes: b4e002d8a7ce ("spi: tegra210-quad: Fix timeout handling")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/spi/spi-tegra210-quad.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-quad.c
index 79aeb80aa4a7..c0443c986dd9 100644
--- a/drivers/spi/spi-tegra210-quad.c
+++ b/drivers/spi/spi-tegra210-quad.c
@@ -1457,6 +1457,11 @@ static irqreturn_t handle_cpu_based_xfer(struct tegra_qspi *tqspi)
 	spin_lock_irqsave(&tqspi->lock, flags);
 	t = tqspi->curr_xfer;
 
+	if (!t) {
+		spin_unlock_irqrestore(&tqspi->lock, flags);
+		return IRQ_HANDLED;
+	}
+
 	if (tqspi->tx_status ||  tqspi->rx_status) {
 		tegra_qspi_handle_error(tqspi);
 		complete(&tqspi->xfer_completion);
@@ -1527,6 +1532,11 @@ static irqreturn_t handle_dma_based_xfer(struct tegra_qspi *tqspi)
 	spin_lock_irqsave(&tqspi->lock, flags);
 	t = tqspi->curr_xfer;
 
+	if (!t) {
+		spin_unlock_irqrestore(&tqspi->lock, flags);
+		return IRQ_HANDLED;
+	}
+
 	if (num_errors) {
 		tegra_qspi_dma_unmap_xfer(tqspi, t);
 		tegra_qspi_handle_error(tqspi);
@@ -1565,6 +1575,7 @@ static irqreturn_t handle_dma_based_xfer(struct tegra_qspi *tqspi)
 static irqreturn_t tegra_qspi_isr_thread(int irq, void *context_data)
 {
 	struct tegra_qspi *tqspi = context_data;
+	unsigned long flags;
 	u32 status;
 
 	/*
@@ -1582,7 +1593,9 @@ static irqreturn_t tegra_qspi_isr_thread(int irq, void *context_data)
 	 * If no transfer is in progress, check if this was a real interrupt
 	 * that the timeout handler already processed, or a spurious one.
 	 */
+	spin_lock_irqsave(&tqspi->lock, flags);
 	if (!tqspi->curr_xfer) {
+		spin_unlock_irqrestore(&tqspi->lock, flags);
 		/* Spurious interrupt - transfer not ready */
 		if (!(status & QSPI_RDY))
 			return IRQ_NONE;
@@ -1599,7 +1612,12 @@ static irqreturn_t tegra_qspi_isr_thread(int irq, void *context_data)
 		tqspi->rx_status = tqspi->status_reg & (QSPI_RX_FIFO_OVF | QSPI_RX_FIFO_UNF);
 
 	tegra_qspi_mask_clear_irq(tqspi);
+	spin_unlock_irqrestore(&tqspi->lock, flags);
 
+	/*
+	 *  TODO: Keep tqspi->lock held for both handle functions below to avoid
+	 *  releasing and reacquiring the lock between calls.
+	 */
 	if (!tqspi->is_curr_dma_xfer)
 		return handle_cpu_based_xfer(tqspi);
 

-- 
2.47.3


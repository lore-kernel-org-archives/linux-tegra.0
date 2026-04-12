Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D75E37F8A2
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027168; cv=none; b=N0b7PKK/MC9g+G6XflqnvUT3gHXvsHcEnrWn4Y2J4cFhGDyxpwZln42/KeeKTyQ6f5g6ZzwiyUiNjpamzAtp2gXlF36WrIzIE+vmYSyP7RUQYap0PlWHfl0Y5yqwDZsmzQ1VnF5/6PJ+jAEo3mfzzDbg0De5RU5HATMfgnEUKd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027168; c=relaxed/simple;
	bh=PT3xs71fHd+54WioIwbDh1RrwxMQVhrEdhvCl0wP16c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nG+Gze9TvqlsHBcTfJcRBHXDLh+qDEpDEDphZIq8dXFvrPVmbUiyIb42IcH4VP6Xj8PwH4U/eNdnLNvk7Bic90hRB8df4hP3ZQOI6DnifJwqQZOsn9C3JaLGZNLVagM8Az9ecZQyyWvjtrpXmmOiUADQQZQJF0tPkBRoHA8m50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTQhSVU/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTQhSVU/"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso4997203a12.0
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027166; x=1776631966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmfBAQ0D3Sa5sjeFp529b93qLEW05p6njf5APTbVpD8=;
        b=sTQhSVU/IH83hnoGF0DodvRW+6ZsHGHWekDo0X1WpRCJYtf3Kht5EUpJL/2DLA3n6U
         u50zP2rwJAPsnkz5kpguCeyHHj4BF4XIp6U5qN1VdXK0IjJLIViOAZb6o2SHVZuztwvM
         A8IJ7QY/cy8U4uFV+sx3GJKum/oBmASwBaZqglNiF/WfluOS2ChjhDShVNVWLVgrux85
         3kE6sQjHQ19ocgX49fCf0ra0bUJKz+sgn0nm+SMP8BwW8V5tfQTx70QwHs1+f760zrug
         Y/Mv3Gr2My4K7X9B7seD72QCr03tNJPEeTPzwJqfenGiwD0iIz/0GWgMKpbL7HSy9/1Z
         EcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027166; x=1776631966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmfBAQ0D3Sa5sjeFp529b93qLEW05p6njf5APTbVpD8=;
        b=KfsIvhkTcn5x9veavy2Kx+J+BInqXEb7FrjRggj0EjfZ4J9DIKZqAXbtobYuOQtq5B
         gfwfcKy6yXT4T/jmtXr9MbPP4b/s/Ukl1H7WoMgjCugeUmCyGQxqv59S0j/vFcJW6ai+
         pvHrn6QhBJrj4zucFSklER9Wp00Wgln0wSxihTv9Oeym9Z5rWUp5DOfzgJLmOy3nWhxf
         7Na8bfqnwFFtZJtTw/qoefR9V08G3fOzjf42A1MObBID0b0Ai9rgM0ftHg1+2oOgqkp9
         xKur0Ugj32B8es8jOMAaOhOQbItdkeFEP0MW3mJ3Hno6xR7JlAmA97nqPWaA3zgZ58Q+
         zIAA==
X-Gm-Message-State: AOJu0YxTw9qICrAZcHuKunOCTFSRfswFFvgXzD3PbFL+uyPGcfkCibxC
	xpjlvGvkEa3e6YiuS3QnBlLPnxuAB2voHIq2RThs+dFFZ3xYUrGmqJ4gnZkG2Q+Bk7o=
X-Gm-Gg: AeBDieuH1RujeC+LlmxwZCvAfGkv1z5rOwpEEzd3d0Vhyn3eTLLmrbKWaFQ5qz/C6S9
	NUlNfC93RANI8VTvcG3orADH3IyVL9tB3Jo1lzLfpbixcZV0gVJRGYaj9jAQVtZgWKJ3Sy2ZqdF
	a4n+jSwAWlPr3Wc+ByTY2E55U4mljtaUwsSFU0jW8J2hT6vD6VVpvR/COKwAd5+dKGC2CgODNWp
	a8O22rSusIfDC5ykBix3jCor73awf2blqhM7TMLI63cvDPUXVnuEMk4M0g4DejOU9Kg1kTrGFlJ
	RTrhIYHZnVG7EgSz7QARqZ7aiQpQ51LSwnP+xFrhxtz1BO+5fxoqD55KXG4EOPIjAAkgvzToS+7
	7MHhOHE/38dcVeXJNV2D61chx2qOXpCvzaTXC2kYuvA7XsYjrzuzyOIcOes+kMdHYj62bQDvSQ0
	2tlZZhHv6mU2R5dBMJvbdtqTwL3UtH/eke5bSRRmI8sjrRsGfCKao7cGdAGdDKDT+ld36FWgpmu
	Xx3md80wL5RE3uktvbtCm2o37r0cRJzI5jmsUFtCtyJ6Ls9oiGjUc2/03Pr0GLzgU91XlAgaPEH
	z/QL2WhLJfC39Pxf
X-Received: by 2002:a17:907:1b22:b0:b97:fec5:eced with SMTP id a640c23a62f3a-b9d45b64482mr763764166b.0.1776027165602;
        Sun, 12 Apr 2026 13:52:45 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd78f6sm263126266b.26.2026.04.12.13.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:44 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 3/5] staging: nvec: fix use-after-free in nvec_rx_completed()
Date: Sun, 12 Apr 2026 22:51:16 +0200
Message-ID: <20260412205117.387125-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvec_rx_completed(), when an incomplete RX transfer is detected,
nvec_msg_free() is called to return the message back to the pool by
clearing its 'used' atomic flag. Immediately after this, the code
accesses nvec->rx->data[0] to check the message type.

Since nvec_msg_free() marks the pool slot as available via atomic_set(),
any concurrent or subsequent call to nvec_msg_alloc() could claim that
same slot and overwrite its data[] array. Reading nvec->rx->data[0] after
freeing the message is therefore a use-after-free.

Fix this by saving the message type byte before calling nvec_msg_free(),
then using the saved value for the battery quirk check.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/nvec/nvec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 952c5a849a56..75877038847f 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -498,11 +498,14 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
 			(uint)nvec_msg_size(nvec->rx),
 			(uint)nvec->rx->pos);
 
+		/* Save before freeing to avoid use-after-free */
+		unsigned char msg_type = nvec->rx->data[0];
+
 		nvec_msg_free(nvec, nvec->rx);
 		nvec->state = 0;
 
 		/* Battery quirk - Often incomplete, and likes to crash */
-		if (nvec->rx->data[0] == NVEC_BAT)
+		if (msg_type == NVEC_BAT)
 			complete(&nvec->ec_transfer);
 
 		return;
-- 
2.53.0


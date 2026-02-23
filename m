Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0B29E113
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857067; cv=none; b=QGU1EVbkeDwj9HVhq4frRQWmnr45GtmFR3VFdxnyCAZBemo4ZIFEMwdBQItwOUuUESV0cx6leDM4Vry3h3hMUibL4kECG0YL/ViSKtnRrrx9c6D6zuYqkQVySD/Uv1oc+acry8oQQ4CLdwDCAcAB97XsdyW31j2gQPt/wSsRkqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857067; c=relaxed/simple;
	bh=jUrP7110BWfdloZ3xp4KmzT4buLG+ogvO8ingw6MefU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMc952JIyzSSReSMHDQbhMnBa2yOuZf73Bn+iPj6j/Okxjyr3v9FzNfNRHpTFNukcRkGKwF6LnmuitWVDqXG0CXT80kRrW8wjIN0A8WEMXuBqLDfJUtbjhUWD+fJzXHCbxfkqozKmhyb6bY3lF1R2gWZnEMwCcSv0OSAY9DjqfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bc8FCtQP; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bc8FCtQP"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c6e734ba92bso2138510a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 06:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771857065; x=1772461865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tewb8NzmWsDI5uhYbFk/DkoKdu/IJv57YUJy8Fupdsg=;
        b=Bc8FCtQPO4zKt+KXif71l+lNFpknvp0O7lMZqM5z2ubq46qYlxAA9cA//k3gBJSSUl
         ASOUlUUrqS9kyG5pB3OLvk8TUs1R4evlpipYi9hS2SpP3Y/gbFrexCamG4LJZvxgHMqx
         y2nC6i9XztIkltB5jSBLEZpSvhC3ZCVQTdaRgcVPcMaYYGIJgLBFcgjg4O3IM5qQG3Zs
         2NEgKrrdfshHtYFRDL05hmYLv+cHz5iPqnPW3PGEOMUuUNL9l3o7+ZtfsDQTvOg69Ar6
         8xKazB1D54G4MlG+Tmbn/WxZjgk0sAWvjALSD+mwC9RS3n1wjmAq9GHhkQIaP4l98d48
         bpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857065; x=1772461865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tewb8NzmWsDI5uhYbFk/DkoKdu/IJv57YUJy8Fupdsg=;
        b=FUsSDp5Oj+LAen5l5ScoKcvvCcjJZAZwoHYvdTbXjmldaJf+2eRqHtFyE779iqj0+7
         sCJo1N3u54aayH3NMQ8ciEXmdnTKKWUrfZmScqnJmCzeER1dukz3r0RKL+Nc+hNXOGN6
         BJpqd9JRAjrZFoZWpPSPusx+sMQ+O+nGGE4hYhVV6bQOblAXAuXucVoR6/C4wP/6bt1b
         6cz+RGA9zBYmaNciBPV8ryJs3i/oBeEqCbmyQLS/wRgZY2OxmEG602OGr3m3PluPR4ZE
         ldi0g/SuiyvGXPoj7cQhku8IGNiJERrGs4urxI/rSctvq2dtvBeyOTV/+O2La1inkfxZ
         XIoA==
X-Forwarded-Encrypted: i=1; AJvYcCXzpBpC9ZF5HxhqeVldNSlot4HAbhal2MdIAHgrmfGOSLor41+raoSDb4sQHHrCTwOhglIX02bP9sxTGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1HnPF1ywTteGqTtsELWEiNYpVzvnzrepqP9hv5PfwMWcsEqfO
	C+kRb9XqplcR83vsNa039Nkh0c807K53/MGd01ws+lsQuKRphYeeV4ywsbJjhw==
X-Gm-Gg: ATEYQzwXRKoTiNtOSgQckZKQsVK/vaGqT8PmbbF4zFt2KFb6Dd0fP8kI0YRBA24IEZM
	lrds4MOl4aCRTNbiTptkG6M+oWiiC0V8T9hRD2yHF+McRZHBrF/tIVA7utSsyq/7KIltwjHexXe
	14Jk9aQ5ETJugu2GGwIPdbyuVfOtP1OsUyJPiTCTnAapWuqN9KqT+Q6keOdhX3+x/vz+uBpzeSb
	8BS2KI77gA5b6/7xbKvHX0DpHQhjhKQ5/N+V7i+Cz/FEra1RA9AgdDC0aVLsdetEbptvudyrVqJ
	YkCFG990CGze4OnCC48dB2vwvYQiL4xETFuB364Cecdp3y7WLZpWtRrmBKCmHLyPHvin5qJeuPZ
	S4BLplTnNeNTx/CTOW1gnwbDwT5dV5AhLztnkNYGa/hi0d30kmE+kMRU0W5x3yUrYO9CUe3BWVa
	x6KvFN3Hs6VU9mAjBkBSeVB7gyACvXu1/OgrFqR2u3ykfr9fbsKGAcufVjBQ==
X-Received: by 2002:a17:90b:58e7:b0:356:ab60:e90e with SMTP id 98e67ed59e1d1-358ae8ce4acmr6891608a91.25.1771857065176;
        Mon, 23 Feb 2026 06:31:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.230.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358af93b9d1sm6784146a91.15.2026.02.23.06.31.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Feb 2026 06:31:04 -0800 (PST)
From: yykkibbb <psykibaek@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yykkibbb <psykibaek@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec_interrupt()
Date: Mon, 23 Feb 2026 23:31:01 +0900
Message-ID: <20260223143101.76552-1-psykibaek@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multi-line block comment to use the preferred kernel comment style
with leading asterisks on each line and a trailing */ on a separate
line, as reported by checkpatch.pl.

Signed-off-by: yykkibbb <psykibaek@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..62013019a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.50.1 (Apple Git-155)


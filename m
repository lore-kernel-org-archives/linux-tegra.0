Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B3C23FC41
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 01:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674019; cv=none; b=pgOJ/DLv7K9IeywQW90qAH6LSwVQI0AfqgA5u2Hl4BhT5zYMSOECgp/xc3DUQQQIiDaMDwgWftr158g8pZNWidsgv4szvpeqcovBpb1Ob9peiGWYiLnEuLrYKzFaozMoPJ9U1OtEH9lNzffpn0kcEJG62la/TEnNV2BkNPmClHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674019; c=relaxed/simple;
	bh=1TqjbORC6Dklu7zL874Mp7JvmxhvcMGvI0XddLcTyxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/e4Jk2fnCXYqQSYNS8n3dMtTgK+rLeNJlTLphSKvuWV+zRAO3Fu3i9izvb2kjs1Vyy/ZVsUZxCM9UZMtyqCRVMGCqXZzq6PatMlVlxuns8b1hi4bKdxY6u2eqAVqSG329dGFRaE7Rh5/UBfosImjBKEz2Kg+P813QU9Fed8OnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoMBlErf; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoMBlErf"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so4159477a91.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 17:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772674016; x=1773278816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0wJi+8bmpcTQpXdP/x7saXAm3oiZNf896cQPPZ5gK0=;
        b=HoMBlErfQFi2RwialuyemlIctoskI7/HJfsrApjokLxEgx4+cQmFMw+0T8J6cy2J9j
         5Y0ji4Gmxv7OqL5YVnsa3zisLG5wvnO00LU7AvHj54QDpL95dx4jfI8A1oHfeuzV7XKQ
         fsS6Glh8zTJ7ASGu3M1MgIKYhai3xrA9CTQD0vNSkjhtCvkd+Fr1CIZeCMc2mx5KMvej
         2/EDbVwvksZNBMW2WONE4ooidWn2qoD/xA3NUEV8PfeT7/dkIiCRotygfQI6jMaafZVe
         3joLig3zOWXGQn1AVU0bW+1qxlwHrayEKFsdn14+K5xWCdJrCALwa/yQUkz63/YZ3ai4
         iwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772674016; x=1773278816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0wJi+8bmpcTQpXdP/x7saXAm3oiZNf896cQPPZ5gK0=;
        b=itlp9gqnPdyi5jkfckpHGambLoEa7jpe8qm1BwaxIMVZM2o/WHorQrGfzLjX0lckJX
         rFHpZOJPjLA6ZAfWCQKYxTHNBH8SXZri9njFRkQeDfkLF9hvVcNkUpFRa7HLIlSX7QId
         UxJEu8/zjxAxyIXqKpggvAchrX+a3f9DywMvOHS0YT5hnoC5xVB8QuQK2O0TeEuDa5IS
         Hp/C1Aa/x8kGDv2/VV74EhfqTVtk5JUNIJD21wDKlCmkSBMGZ8W9pkK5zU7c9LI1aPZ1
         xmt3aBdn/gwZjaSnC3fiyvvKWrrm873+4CsQrDgiL4M6zvr1+ia4K+H4M05uy6FifzNH
         nhng==
X-Forwarded-Encrypted: i=1; AJvYcCUZIVqqsLfkpvpJM7aW8nRR6V6NNuDxuNenDyOxyBRLaZUAeu0KlBijoG/ZDqaX0TIySQWXhKO5QTk/sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJM1Y8tAg9n0lxZcrYZ6NeCHZhBY2cJJ33+25j5603jT4AxZE
	EiRgVbkrX8Y7JKpsV3zUetvF1jYwXAuuMh9xA2y5jWuJQ3kVtQozno/CjEOW/KbMa7A=
X-Gm-Gg: ATEYQzw3xxYv+x0fT7eRSOQ/VrukRUZgKkCVqM09WX0sCyc7vYB+MC+KCxWz4SJYM+6
	vh60VIzGoI+Sr1t5ZGUo39aYk++jlfpP8zcYlNZt8JQ+FG3/BQ8aXK8gc8VBq83JQPulJFzMsCn
	4MM/GtaK9A+Tbxk3K4PqWfo/7n94N1JnTZOgr3sROEf3EEb0u+vPXgLebQVPHdPmDZ/9/P9An/G
	0vl/NKgNizHZqfJU13RVRN9mhV9/nXwEQz8OlsNziInYkVelAMjj5Q3U98IF9BDRPhHVDACk6bf
	pUkFLq3/rXh5c7fyReD/yQ1TnIFhIi5DEVN0Fxmkzj/63ZS/YBu0EmOVeE1cnwEeQMN8hgFZHc/
	yWwUzC4YoklZfM08Kw+19BUhKqTccC4m+lJQz/1JcYwXu1mSf4fDBSaxwrP4MxGrdxJ0RJEqPKK
	ZlUPXN/Tb/Wx5kRWXOGjGInwdijBzoDlb85yvukCtYX5jy9zkLYCSkYGhTclPp8DxdWCDcGjh8I
	LrghS59xOyq5Dkz
X-Received: by 2002:a17:90b:3b8b:b0:354:56fc:b721 with SMTP id 98e67ed59e1d1-359a69c8d2bmr3265892a91.8.1772674016375;
        Wed, 04 Mar 2026 17:26:56 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d6ec1esm160681a91.13.2026.03.04.17.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 17:26:55 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	marvin24@gmx.de,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: nvec: fix multi-line comment
Date: Wed,  4 Mar 2026 17:26:26 -0800
Message-ID: <20260305012626.56403-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multi-line comment style flagged by checkpatch.pl.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..62013019a25b 100644
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
2.53.0


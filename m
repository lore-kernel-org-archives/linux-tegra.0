Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12FF280309
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629628; cv=none; b=bv1Z0lNxHU8WfbHlkmcsrmCuS3bRFAO7jieM4EszVp4XCehNSmoVQvnZ8xMgIdNFIAdju3pKSACaHIt9EhnlviYJf/lcQaKRmTav+iuxwaDOsP5fMhJJyXnFQSH6jFh6RSYaB7yEvqYO0wqcIxC/0Yy09xxqdSQp32VR1Lsz+hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629628; c=relaxed/simple;
	bh=bYkO9U+EL70YDlYdv6pIN/HU7GaGpGH0iyCHgs50/ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvyghwM8QVhw7Mc/GCLB2VZzJGMbpVWqgjLVZWLodvMYxpxZikFXf++EZu9A6/3ust/xx6FoZivZeFGhLv4Rxd24UT1KlHajIlUffU60XWqY54RcoIkT6UIKeqtXdnhWkHgJ4nkirlxFNl0ZO5n0isvlFh7SKgY14iow+Nd63e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUToN/QF; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUToN/QF"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-660be63279bso2021538a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 05:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772629624; x=1773234424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyx8Xzv1t2SnP4YfSFaS/MZkEnXhxOyrUrq/E4v4jPY=;
        b=QUToN/QFzkOKqRNNItmG57z9xGlkkmRFeB0NIhtXVL89YECKSrwzZ3NT2hw2g6J5sL
         pCKq3A4jv6z+u6qEawGfulg7NKAa8mZnuE27IjtFWWw58lcicQjmr/aHZImfRll4Uat5
         KZfW1kMSt+Bmf6WAGzNKun1Mq4BDKWCYlMWml9fp6xqmBPrd90Ut7qNzOsZqiGX1uc7y
         W9wZj3xKcdExp/d5wzWuVvIXUVoaOGImiXTqTeYn21xJcFzPO4fiIbk0nmVhupQzHuoM
         v2gp/1eoGowa5y9He9MRZEqrO7nZFDOhgTYn4o+qkeSQ305WrwGFP/XXK6RqHRFcxYSO
         EZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629624; x=1773234424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyx8Xzv1t2SnP4YfSFaS/MZkEnXhxOyrUrq/E4v4jPY=;
        b=XUdD1YTv7BF5xw/z84PyQXAG6re4tyV4fnYvNIt4PrLwzTQBT/rex4Tqsm6B643Dj4
         7G1BKdY/gKiG9Tc5g5vSarpBECQuRLQ75Ty6ewGkdgvfiZZsSAGNHdJ9nwc+ZOCQrnNs
         +UskhKcNqQ9TbbJp6Gi92oqizGhUOtZUjh21pl+tyO38s5SIWxD5OkUHiis21wTFL/aN
         G86Zc3if2eei//BLv7YAxXrcuuOlStYcm711JRWroqYW7XWraBcXTywNSPj/MCV26DqW
         7I8h/do90wI9BThXq4Yh9gT+elf9FWchd3v41XaqLhJkqUW3fBZxPBqEXJnjrk/eslN6
         hYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/oZw9QIB9Af88X7Edeh8gK+PkpeXpTV8AK/dcbiDVstW9LVp46ppFNhm7TlDHub14qTOitM1Ttb1+EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnB4FJ+SJSYqc38vm0TcV0ugNEkxfOlRmrYyUv6udzIsDGmmM/
	q7JgV2o6v8l3k1FvHtRkyJPEZqCmNx4xMNeH3yfUrr75/jJyNpXdyXwCC9BdbYL5p1VGIg==
X-Gm-Gg: ATEYQzyPf9o0X4xB5m3yKLZSzAs+EQlghhRnN7HbL8yK8KBNwTby4LoqZ7MPAEgXm5g
	d1edv6hJbRn/VaoDJp55D5qFJwvwHTKE9a10p71afV6IFzzpDhjH0hPNmmq2F1IfkURr5GA6W7k
	nSaNbTHxcBQRWxtCiumbSr5tcxtq038mgVPdURXFxdWvnoH6fhDbJqMqj23ELiPS5IXQO4e2PNg
	p1KlFNZaaAw1Zvxyw76xdM0NLHuK9k3jPM2ds8gmP5vfa+QWogPG6c1nc5MFsB47/a+7BP3m1Pa
	sZbIX2Wv/51sjIAAl3ffgLreMtyLeY8pyUeectAZw7ewWf8uU9RBXoqXE4AAs7ZJjwP5l4nLXDM
	fX9YVP/msHeaDlhnp8atPotgL1d5WtQXCMkKDGG8OSn5aN1bln7mlbh6wqpXy/rmFDdpiVQiBml
	3UGiLvPfv9xnYo0PeYqnw22A9ZppPkPZR3900SopVfpnfApHI0T8J7oT4UGxz/fZzVZSYIfB4eH
	wRrOBfVmNifalfVuNP0MYWhu1Fn6yoT5rxFqrYDsmu1AsBwskRdeYPyxfBLcR4JAeANDVrk/Esy
	x3s7RSF8JVIUgFq3
X-Received: by 2002:a17:906:6a15:b0:b8e:380:5669 with SMTP id a640c23a62f3a-b93d449be64mr330933666b.32.1772629623958;
        Wed, 04 Mar 2026 05:07:03 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13593sm738598366b.3.2026.03.04.05.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:02 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec.c
Date: Wed,  4 Mar 2026 14:07:01 +0100
Message-ID: <20260304130701.37332-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..0e655f79e 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0


Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB96926059D
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 01:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772415632; cv=none; b=pNkt1MRONTAWwhAskETMGZ7CvJeN5inE5+fU55p1ByzC3MzONF5GI8NnBiuAgCpDwFQiAQK0o/xW6T92EA4bMzLJpOO9ApNsp2I6R9EA8EhWwczpfLNNw/nRLNkrZsqwn+FkLiwrGB0lxDGMPxKJOUEfXzxdSxjsE48xLZoBsTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772415632; c=relaxed/simple;
	bh=hNvj2yEzCce56qoFy0W7uNGb06SsP1dL/bz98LdIJLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDG0AXLrnlYFFbw3gmmDOCWqL6UuQUOM2SuTIXoS78IEbgvzO9S0+KmKlmw6h/m7aO35BHNI93bqXYsl42IJxKJa8DFQalXCQ6CfzG6LM4LsqBN+nG8Wa/4xfXCk/QYHN06vcselUzvXhIL+bAMRGPRgLEBLQ8Evn49nhZu70R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUDoGrrf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUDoGrrf"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-827390e8a3cso2486338b3a.0
        for <linux-tegra@vger.kernel.org>; Sun, 01 Mar 2026 17:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772415631; x=1773020431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dvrkUmWHzhfCud6PY8kab8MNaXmWzLWwzkb0HLaVbo=;
        b=bUDoGrrfoUYcV1CvBRUAKHlX7W0DMVRgbJ7GCFj8NP9WsDMdT9RderxARQXKhFn5nj
         owjKRpN5/3zMAnWAIvClRL5BGl5SjiCYp2htUwd7NKHfts3hmdJ05LrX8Ao2Is4RcKBf
         GrrYVR96hjn9Nj21aNUKEeluowLplsuv7ai+IzVFNYRyR4SvhM0N65vpRwaiH2c9bJ5E
         VkxV+3Ach8fMD3M5TJOjPgzycIJMy2rP/SUCUIjf0eitVY60CGmscU6bLSsrhB5v5iyJ
         Vw0itkiR67LnTpUk/BKsHXLpNOFfh3Bd98rUb2t2pVidTrrC+UBpLBWkXhxEJRaMoOR/
         B0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772415631; x=1773020431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dvrkUmWHzhfCud6PY8kab8MNaXmWzLWwzkb0HLaVbo=;
        b=N6ATjT74+pbqApdZwxqhxcwD2LR7RTaLKtNrp/bK0Z4+L1Nl47+rRo9izTLb9hbYox
         pkPMxL5nFoCWtAmrH9wwIoF5BzYu8PO7lP7kehbREMdSddb9JSbdln2rPq+5w//gyLIf
         4Ml3kuT+B6N+WyJ1/sZWLhvJLOUj05meWBqSsr5V0yIsOIT9zgATapHUwlBvM9NJ15Nt
         RZFIeq+jyOxCU9SJh8ZQX3EPwJFca6I1n+t5+3mxs9zu77zGTuLFapxJEnGCxyAVY4OX
         YjJXo0jbhQucKs8xGbSY08M5uIW0GPUT+rCX0sIPZtYqO+LC9lCx0dswGNzRaqI257Us
         5tVg==
X-Forwarded-Encrypted: i=1; AJvYcCXPuKv8h+7Z8m8QeRImaavs9GgbhpYl5UbdZoy9cT2ZNWc7yNZvzyJGUxgApzcVuh2OfaBlpA4LhseSsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPM7YzXx3PHlPY9iuOQ1jLnVIceApfQjVYVt+rPFLEJnSRDnxJ
	2sgHhWunXFfZr9y6kXvqVOlxmFjKmggxQ1ljasMN8u5dMAu5SNWpTvZi
X-Gm-Gg: ATEYQzwz/PTyJhcacB99RKLX0WJItS+jVREjeQx5dvwjZI22Jy4yOpDflV7GghPeKgk
	GyYqa97Dq2lGxkNp+Q/y3CckMqY7xXwnCmZQjdQQ8YBOKe588FViyOEC2Wq0nitZczsjqcLJz8I
	qADdMBSnIYjHJ0HbzaGf0UJMhe51uc1rH0ApLOGIX3oi9WfNHx2YpJB4V5Q+U1Q4qhitDK1uHyx
	R1an6Ipi4O7/yBFFpW/W33Uuat0d+RG7XbWwMi+BuvaZjsC1S1RU2hBxXpigVUNxILqHuxpcVDU
	u1B/cBVFHljC6IJfXkyL8uPcDMrumHNpFjInoFBa4s2ylWv2PXCi1JgQWhYSlx6UVt0EeVm5tTM
	mBjTshVu7RbNDp+BdNyYB++yQcroRyJXe6IZ5mAC+l5z2U+2wC5VFhOV8gnpP7VeW4ZBrnmqAD/
	ImhVL5f2DI0kdZwrWPa6HOqFH5Sr0=
X-Received: by 2002:a05:6a00:2296:b0:827:300e:f617 with SMTP id d2e1a72fcca58-8274dade073mr10934507b3a.7.1772415630868;
        Sun, 01 Mar 2026 17:40:30 -0800 (PST)
Received: from linux-dev.. ([104.28.157.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a029b13sm11773236b3a.50.2026.03.01.17.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 17:40:30 -0800 (PST)
From: Afkari Zergaw <afkarizergaw12@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Afkari Zergaw <afkarizergaw12@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style
Date: Mon,  2 Mar 2026 01:40:15 +0000
Message-ID: <20260302014015.3853-1-afkarizergaw12@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert a block comment in nvec.c to follow the kernel block
comment style where subsequent lines start with '*'.

Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..0e655f79ea4a 100644
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


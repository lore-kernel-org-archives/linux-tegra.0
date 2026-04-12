Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95118C008
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776009041; cv=none; b=Sozzq06QEH7qzny5uRRN0cJu2YQVsigtAw1xxgPi4gwaNpz2aTmD91tN09vFtqAnAKZTTwCNIkyq7nLseJua3u3AelwrFsRMAXdKoaaW0viqTSbKYkNO/GQKBlhfZ8QUBd4Xp/NErlx2Y5Ek3HwJE9xiAT5OzH2xFXJ6hEaA+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776009041; c=relaxed/simple;
	bh=lwhat2bSQv6XJb0gxi3qwiTzBQ65AmGJ8xWTcMNNrUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XFjCmWfraW5rYle1y+e5JIwIuG1D6ItTw+v6yxFzP1xnuMAKIUTdxkyMQvwZ/1bxGAmTXd11vkDr+BcA7HNPAh/BYpzO8krvVETUKA0SIaNhzIvxQR34SBDqYIvFtHBtkC1U/fPFwRC16fZVmTfrOGJ6nWGWi99CUE48g9ugPSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiOmlDqt; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiOmlDqt"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2d868d014a5so362088eec.1
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776009039; x=1776613839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SHDvV1CNmZJ3zUchoWzB/rMv8sKx+dY5re1OzoQ2tMA=;
        b=jiOmlDqtHfNEMgtxMZl57yN7oVgbbPCq7CaWJ8SIxqzI86Pzt1dNBqSfb7np0MdsMk
         qkzqvx+mFIEPLE3J3RJ8xC2PCZZxRvV1n9I1R7yRljqsywiTPzFh+NUiHu2xTpl0d/fN
         4D0jVNYMJyfsgMMfZlPKFgAkH0UPUwfKT40EtiUMqA/oYClUaHH1+Ryk64vPN59EuUL4
         m7uIxbH2AzDK8yvIBVwBqaG6c51ZEjTXKE73kAsrRvWY3ghpLYqjvbmVesPXXn4Y20IV
         GPqrk87GFLtCKof/DPUpGGwdn8aDlRIWxRtCiX9oiIli6wEiYwBB5wD7uZjt07WydMD8
         TKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776009039; x=1776613839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHDvV1CNmZJ3zUchoWzB/rMv8sKx+dY5re1OzoQ2tMA=;
        b=s7nopU9gJVqbDlrTBgAzY3YQbemEw1YT2VqdTPivKGrkxEaFQ1ylqIn+vqg0Y7lWOK
         ws0VgPCmD36PloouYRkSWP2wUVkvVYuKjduvsCVfnUZC3Pb0pZZ4GQGjjMiZOUyb7BXh
         xA6sCvxzvmvyZrDuo77vYRkRlqMg+uUvLUIqBYjwChwS1jwMoZ8s0on9dXUaG0NL1ytP
         qVLyw3OF53RG7ksvbiqOTxfade+n//BIfDmgsn6/8Cs9R0l/p6SkJ5sCuEmSW3TqrDlO
         E8N2YlcsrACPCGwMwbi36bDXez9p9KaDWPZoraA47AFIAhL2qyFxZppH8f5uxS+lUe09
         YgAw==
X-Forwarded-Encrypted: i=1; AFNElJ/hO7ZOSQQ3PmGHNY9ti5teWlTjKfWjAun0lUmci3+qWoga47m8phooI0hIglJ6EN9h5eUlmwsW1i/C/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG+Vxkrcw5Xld47ztPbLyDNBxYac0UQdUoRcaZj8j3PFJDcCwH
	qisC0a+z+Wwyi3P1RLvo6/L8ycYf0yUNaGqv9OSx4lXA4P/QXKGvrWrJp7fN6I5VkAM=
X-Gm-Gg: AeBDiet9wRbmKIxN1+mAZOdL6puYU0/QjpSRgvPG6+JqL1s0r53uyzrjj7BE4Cnj03o
	ibI7vIG4Vrm347+COi7B5DkvtSiDWdMNPjqNBRhr7zBkxzwHeDYebiNO8hpqnIf8m1FYIUW5YFd
	XX1GkCkrEHLsKCuB6W0q/3rvIlKmpjLrQHQFVoS6LW1uhCaKp5TUJNI+d6rQXhGsoVJxBdsUngE
	hCGH3qnFeLIKJPZmdhbK2WibwGs38bymEP3kqq5X3WfP6Q7CErPVNXXqMklSo6/egeLiSIAhNAZ
	iReJtdlDPSvvlstqwXzk6gtJoE81EVR6XFjqvC1OXQCgAt7t1GXqBkkYjmqe/Mihf8wF6UH7H+2
	wlAEqkyEidTqUw0xm7818EzQ6S3dfWCUeCiIEPOD/UWdoz/UCw2sX3TrKKrF476f+SQHdQ5+jys
	nkY+TSgr/qZiGQ8auSFR0DFySdwrj/Bhebmjbzk5SryuQA059oN3aNKqY=
X-Received: by 2002:a05:7301:4b12:b0:2d6:526c:55cf with SMTP id 5a478bee46e88-2d6526c5a9emr3259901eec.9.1776009038931;
        Sun, 12 Apr 2026 08:50:38 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2c09sm15403781eec.18.2026.04.12.08.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 08:50:38 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: vi: validate format index before bitmap_set
Date: Sun, 12 Apr 2026 15:48:43 +0000
Message-Id: <20260412154843.29056-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_idx_by_code() returns -1 when no matching format
is found. vi_tpg_fmts_bitmap_init() used the returned index directly
in bitmap_set(), which may lead to an out-of-bounds access when the
format is not present.

This can occur when TPG is enabled on SoCs whose video_formats[]
table does not include the requested media bus formats.

Validate the index before calling bitmap_set().

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9c0b38585d63..dd8911640d98 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1020,12 +1020,14 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+	if (index >= 0)
+		bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
 					     0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+	if (index >= 0)
+		bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 }
 
 static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
-- 
2.34.1


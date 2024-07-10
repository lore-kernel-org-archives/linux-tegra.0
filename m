Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862BE8120F
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jul 2024 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720645319; cv=none; b=nT08QqQzOUJsUSUJyDyEameUrv56LYo4hlYbcr89FAViowUVlGf74F06TcmNo8ywJA+VNwtP9ugk0tzS5LlgC7Kjf810ujnkq9AArQpE2WfcQs02WAnICVPNm9IQIYnIQ+Pru01hLPmHV9/z0a0JKLRWBHBxqElxEZR+RH9Vyqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720645319; c=relaxed/simple;
	bh=uJjXrGcMu8RjpDfGGmOQVnAvn8BDTyPZX6ZiQktuOuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wqg923x5GcrRA+JCU6ZKQcSAnHGtUY8Nts1dZzXyUiB9dyPtd7RqVfuJkN3GbzpgMSBXN7nqV3GyfGjU8R5LiM4yuVn4Ks+RlO6eLdebJfcWFpIBcM5Xn7meNg/C3I26NObf48V9/NNYzZtUpAyflhRUCGT9mGYSDkZ1tLtLjOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=DiaSjFal; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="DiaSjFal"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eeb2d60efbso2055011fa.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jul 2024 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720645316; x=1721250116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfPD6oQM4WTY/ZUL1ljka0zg8gHP6mHHiU2gRkoeXcY=;
        b=DiaSjFalN/F50wahFAXbNwCw3+mnaxE7zBhHQEp5D125IWb4rYLvFrziRs3/zMCwZe
         4c68ZuJ7cG/yAuuLQz9RDo9P+cb3k+ZKcFI1e5UBBlYWMDcmxPjLwu4fljqbmZ049/Sv
         g84Tiqv2IWV/Uazx8R7Fhwkr6bD+Yhn3eQUWrJvWJiIZ6gB1h4noQUP6JQWU+81kQ7I5
         LRtx3yr7FhvefY2Z1aezoNbFWQe5sDvvezJubf0Swbbqc7Nw/d0m3hJUhhrm7EFpplsS
         +Qtw5EziPq0PydbsXNRq4NsRIvDA2drtZuUZgLXZa+uVtmNpT9UHCbzPY50ZPZIvUHj/
         +7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720645316; x=1721250116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfPD6oQM4WTY/ZUL1ljka0zg8gHP6mHHiU2gRkoeXcY=;
        b=CjEZHoBVOJBIjUT/7bKjY7aZ3mP8fXu9m0BO9Jy0yr6jNOliqF5DWWRfs4NJkTKn0+
         JPFQ8bR81IECpiY81nhdL7dIqsa1pPHjfefQAO06z6AzsPNjPwe+84q+zEHXNsWXMKcF
         WnF+7drUHc0MDW/D0mAnEBsetqexneBOMC3eJNaN4L8jhrnFvDU9IGJOy4y4K0XXi42F
         HvkdvH60CKsBmOC4kqOZQBna9XZbifyOhtx8RVY/eAhnM5bmoqh5OWQAvObOICvDHFcE
         K7CH/Mihv3hNwhicZumrV/LkK19yRj8hzvJxq0pm+KFbXCTM4rsYvUMhZ7rSLMkJ7OQU
         xR3w==
X-Forwarded-Encrypted: i=1; AJvYcCVMXbsrF+ioRiaWZpWOHCDpdNp4jNuOeEYUDGUHqWAiMAolb1XXywTh7I+gaIUru+PD9K22MM683aG6IP2dPioTxeyk8WVOtzb03fw=
X-Gm-Message-State: AOJu0YyvLL22M874OYfBGHigj9aV78hQrbU+oikM1Vk+hXTnJUTJV515
	R987cVoxNABeCgs4gqv23eT/HjW3v8G+Xcb2LRZH9jOeV39bXHYv0JgZmNQN3jY=
X-Google-Smtp-Source: AGHT+IGvQA+P7LFh+KIoLHnBwWndid7fZ5r4y7e3S09VhX9Fpm8r0gitrY3HYtpl80Rj2AdHvdq33Q==
X-Received: by 2002:a2e:8081:0:b0:2ee:4e67:85ec with SMTP id 38308e7fff4ca-2eeb30bc9d4mr43078141fa.5.1720645315622;
        Wed, 10 Jul 2024 14:01:55 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de. [82.135.80.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f5a27sm92480685e9.23.2024.07.10.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 14:01:55 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drm/tegra: hub: Use fn parameter directly to fix Coccinelle warning
Date: Wed, 10 Jul 2024 23:00:35 +0200
Message-ID: <20240710210034.796032-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function parameter out can be used directly instead of assigning it
to a temporary u64 variable first.

Remove the local variable tmp2 and use the parameter out directly as the
divisor in do_div() to remove the following Coccinelle/coccicheck
warning reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/gpu/drm/tegra/hub.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index f21e57e8599e..e0c2019a591b 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -521,12 +521,11 @@ static void tegra_shared_plane_atomic_disable(struct drm_plane *plane,
 
 static inline u32 compute_phase_incr(fixed20_12 in, unsigned int out)
 {
-	u64 tmp, tmp1, tmp2;
+	u64 tmp, tmp1;
 
 	tmp = (u64)dfixed_trunc(in);
-	tmp2 = (u64)out;
-	tmp1 = (tmp << NFB) + (tmp2 >> 1);
-	do_div(tmp1, tmp2);
+	tmp1 = (tmp << NFB) + ((u64)out >> 1);
+	do_div(tmp1, out);
 
 	return lower_32_bits(tmp1);
 }
-- 
2.45.2


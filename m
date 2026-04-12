Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A654830276A
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775995619; cv=none; b=q5TnTjyGsZCkJ6SF+xqcupaH0twtAehqtmkXlWrlg/PlBePJ6rRjAtixv+BmLlO5uPC9q1hu4o/DVf1Oed3AH1YN0ZYfQmzee7FKWHZpW14aqEmYoF3NUDWMtgxG30sTIxaHKPTpFFDoIqzxGNNDgZRX2+UqCFg29trySrYhW7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775995619; c=relaxed/simple;
	bh=oHSFf7/X2Ol8/Td4EihiLGhPeRmAfpxGq7jBu/AYfoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BwCrQUvRFvTs9rBYxDweaRk52SfIOgW+3BCmkrugdQV582W5TKygpavWB33piuWkFGbQraRIGpu6tzIZ+H8jSfI1Ow25RtH/qJSjN+NGMoOTjzfThpBffsLHDpL2GrLCH8fHj0bNQQ0oQfVMtN3jjqwT26FeqXV1LRJ3N/eykT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZX77l/4z; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZX77l/4z"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35f9ab079bdso185301a91.2
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 05:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775995618; x=1776600418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=96a3K+dWsyVQ0u2hcswt9wA9QXsiax09F0/1rMk4SCI=;
        b=ZX77l/4zvP3c3+vlwmo1IT3/BF21r8ab31mOtD/4q54D3KC/NDCPjGTT/108Hg4HIN
         M3OQM4Wk/wYp3AXLgdbzOgLTEer70HiN9Wa3VpoZ8u3vVl3UvUrmGtQmVysHPs7Eovil
         NcMbcBQvP/eu0FuUgEFonjVWcdhx3T5/ZUgir2g5MYesjcxtS3iaHsDnuegzEeNQLf9B
         P+1iIDuHRIn8fknTr0/TBGb/bkXLv9mwotLGbJGvKf+YPbHecIavYiFyV9e8HQQyljy6
         eI9oJ8vMDUu0eOIU2m1WG9qTlmdJGYyVMhxiHTrt2dkoSEckkd5OzG/lhtjqqf68MpFZ
         rQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775995618; x=1776600418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96a3K+dWsyVQ0u2hcswt9wA9QXsiax09F0/1rMk4SCI=;
        b=TVF/d6dPIxflbCdcz4P2LfWAYPRccDH9+h5ymo5BVx/56l6ERFWu2bcnhIUkfMK6X4
         457SE5PGac7aYuMb62jErWUlMtym930/gOeKCIsangXGBYh0pqVwosPJW8KFNSiObz9U
         qfGnJVYhp2zDjL+scHvh6OtMMQ41CPk3h/g+ACZjafTxMeEy3WLGDQxJ4f6jl6B3CC3C
         t8gb+YTbMJ3FmZouuS/HbDtrmU7bG31tdce148re6mpswS8gEhOi8owegCZdEVZqqodu
         Y5+rHbGlvOC2H0BktFJ4q9kbhChVnptUCn4xoB30XCnVoPJ6ItMVaVuXf6n9pJAVrnq7
         J66A==
X-Forwarded-Encrypted: i=1; AFNElJ/ACqOhSOqPIZsjq7ONgMQzl/JMmG23GSjtbk0zHlGSRSdTqSV/7qXgF+fXaiDBb+5DlNg9g/zz7twNpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzDtRBBn9T+7TXnWnDFWhqGiEJ2bF0h9O9LCuYAHy4qZ/DNElu
	ayuxZbAV1+HLFToIO4KnFEssF1sVjgoj0KDsuaqUS0gsUkbb8/0z7F12wOZL5cc1Xr0=
X-Gm-Gg: AeBDievPSQM/t0Nw3QCHBisOzKYZk6yHSK0SB6Rqituyai1eOL+9fjr4x7n5Gp6MZwL
	hzuKWvDOBMs+rkrMoM++26wfBUvm3ACJiCBCf5SoZDhBTYCkg2xVG/7k4Zm2/P3BUnH6nGCsbfK
	biFJCtVNmzdv98hiWjF4lct/gw/d8AYkwAveBbeDD4tfYIhCDhw1PanGP7ItdCe7MYR/stLBjWh
	e1Q0Sm5WloVkY36IAYhXdJ6k5B5DUUL7TJMv+0uCTVY7dBqAURXnkuLb4+WNgNJnO4POiO2/Vg0
	adMEkxIJQKcD6c53kVWBq6XxfTd49hAYcPGn9mZWDJSkoFdZFLWq8ZUNPSG9PlFL+HWxnXeULMJ
	TOOrLUJSIptJlnTq5K/hoXwnfzbXWyRUkuLVE3k0mN0kuAndgS3hWddwwq2JUsyeaGkWAiovEAF
	ghKcLUx+SCJnxt0h8=
X-Received: by 2002:a17:90a:ec85:b0:35d:a542:2dc5 with SMTP id 98e67ed59e1d1-35e4254116emr9347519a91.2.1775995618057;
        Sun, 12 Apr 2026 05:06:58 -0700 (PDT)
Received: from lgs.. ([199.182.234.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fb617725esm144261a91.1.2026.04.12.05.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 05:06:57 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mark Zhang <markz@nvidia.com>,
	Sean Paul <seanpaul@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] gpu: host1x: Fix device reference leak in host1x_device_parse_dt() error path
Date: Sun, 12 Apr 2026 20:06:43 +0800
Message-ID: <20260412120644.2449624-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After device_initialize(), the embedded struct device in struct
host1x_device should be released through the device core with
put_device().

In host1x_device_add(), if host1x_device_parse_dt() fails, the current
error path frees the object directly with kfree(device). That bypasses
the normal device lifetime handling and leaks the reference held on the
embedded struct device.

Fix this by using put_device() in the host1x_device_parse_dt() failure
path.

Fixes: f4c5cf88fbd50 ("gpu: host1x: Provide a proper struct bus_type")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/host1x/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 723a80895cd4..f97567e6ae87 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -452,7 +452,7 @@ static int host1x_device_add(struct host1x *host1x,
 
 	err = host1x_device_parse_dt(device, driver);
 	if (err < 0) {
-		kfree(device);
+		put_device(&device->dev);
 		return err;
 	}
 
-- 
2.43.0


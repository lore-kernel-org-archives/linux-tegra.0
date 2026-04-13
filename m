Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798E13CB2F1
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089764; cv=none; b=dIsBJd+jiqy7hOk4fkVVMay+S1HUNvjVnlaV9ACVXV7qUtn86oshMzcbHZrz5GFSJcEV5oeeHP2Yzp4wBcLD6+ciRy7PFTnZ0WRkIJJna5tPsaylsI2tcjNzJYgSaDO28VNlRXwT7lPGAtUJ6dy7lFgQPne6zFP5bcMJumhX9UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089764; c=relaxed/simple;
	bh=joQClY02gPxW9Rgcbp7cpGeoX2QQLsorYSTJB70FVCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAP4XfxvzAednXr4RPm06n9zIe0ihVVkZ+ZH/nDdVPWvsi4H5nNzGvD4bQfUdCwPcWmV1Vf/679QZAc3sKKHlIoflyJYSuV/2pOun/YSkeesNC+hV4eyCTgMBBWohw9l4U4zLcxKpo9gYzxNKJk3pIpDIGUwYUnsKwAopfgRr4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpE4uFcS; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpE4uFcS"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-824c9da9928so3120382b3a.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776089763; x=1776694563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0zbRRSwXZ7Pwh3Wo3GiTsNe9+S5y60LaaG4gtv9gLI=;
        b=fpE4uFcSQ93uZqwt9purUfTlAbpVDNmiEnXLWomjMdpAtKiwmdEnPGKGIySxODYzkT
         1Z4t77ZKgTQzVXtnHRltKGDIvI+tN5bF3ZKaVbFxAhUAk1P+xJB7wQDC8vUdpf4gGufQ
         q8V/kVCO3U5VuDXh2r1Z57iGrJfNH+NvBTCRbbdOJeq9uScF8oF+q4DrqRbNLY0bBtXt
         I56XHKbj8lnJqPCTbYaYngSDu3sWW1U8IPmgdcFI299x/F9I0qSCEALcVUEHBgmHfKeX
         smJZ2xAyA19R16/wf7zkyPjJn4L/Z4ohuN863Z88SGkLY5z7JRspXc3Xjz7O9iWdQZeq
         ma7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089763; x=1776694563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0zbRRSwXZ7Pwh3Wo3GiTsNe9+S5y60LaaG4gtv9gLI=;
        b=K1sb/pEj4ONiFZGaXok/yuAwA8UWjbE9XHtHvbFbONJ3y6671x76sGMDizra7TidYQ
         Jxf/zP7jYC277V/1DcLUJmuFkzAZSNZ5xRQb47ERdBerdpNSlBsR9sQCY7mK2fHk/fJK
         uhRpm11hXHgrCoDfXQ3/va+ojgJDOhbm0QscKVJngBoCFgs1l1HPw3HyQXDDeGJj/7m4
         cSR4EfhRX4spSn4VLIinPyPCRJTcZrjeojc2T5ZLsq7j6OVsxMeiUSVtyCJGHCWhgcVe
         +7iVCJhnp2q5Ef24S7dy5n5HmJCRGKPBj3JGY3LwVv7w2/6+KxvUO6aWXEzNVEGgDitu
         4WBQ==
X-Forwarded-Encrypted: i=1; AFNElJ88RTw6PteNSl5gQ9wDjRcE+0dPnMFJhl0dOo7k+1YWpRm2KA55vy1X1mcPgtbKHMzfLcH/u48K04nzOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZuGNvK2806qlz/dKVkHPLC/pLfB+x48nxyu+m0X1gT49PmDGE
	UtpUSfyGupTf7krqyHD8xyV8JYiS/fOymLM8yy68fuOmJuj44WeDSWXZ
X-Gm-Gg: AeBDieswB56j0Cb+NKQv8RRMd9vk4kQM9Szzi2lWP7k+qK1Ilkjv+o8PCu8DdGz6C/h
	bhWdX7N4zSC+sGi5WIQrC+2jEEa4pO+0a6tcDauRr/MDGtbQc4bR6hHwsKTeeO0AKlpeKouWas3
	8RfRL1uKnDtxWrprCXGkusHw5yhydicIeuKViZImuUi9PNXTFqW8qC+atvjq4tjYLKIiSJZwpAB
	3C5ipibhTMDdM+gq1cnLvigswq1HI93O79oGkJDvf+7pkAMvDgWtIojqQXdkc/ocVsadTKJWlt9
	jx1mknZUddqiIWA766lgd0idGGNSxyk3pfEUhfT1uUeag+DsOwG02NMgbPK4BpYChyOcPuhHfNU
	ieW3kkjkcjDvtXc2wE2iCspSkREUzehO2Tn0DNH2Skm1aGvmwpYtTOaMiA+b4EPJs8EdwE/TOeO
	VgZtVAnnDGGAFNkOA4i7C0Pf4bJZFzjfg=
X-Received: by 2002:a05:6a00:170c:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82f0c21d396mr13302565b3a.25.1776089762689;
        Mon, 13 Apr 2026 07:16:02 -0700 (PDT)
Received: from lgs.. ([2409:893d:1188:142d:6c67:74e8:5200:1f39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b17fcsm11396301b3a.33.2026.04.13.07.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:16:02 -0700 (PDT)
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
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] gpu: host1x: Fix device reference leak in host1x_device_parse_dt() error path
Date: Mon, 13 Apr 2026 22:15:26 +0800
Message-ID: <20260413141526.2961841-1-lgs201920130244@gmail.com>
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

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fix this by using put_device() in the host1x_device_parse_dt() failure
path.

Fixes: f4c5cf88fbd50 ("gpu: host1x: Provide a proper struct bus_type")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - note that the issue was identified by my static analysis tool
  - and confirmed by manual review

v2:
  - add Cc: stable@vger.kernel.org

 drivers/gpu/host1x/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 63fe037c3b65..e3ac85848aec 100644
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


Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC137881C
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775996805; cv=none; b=YRIV3jvIOVl7vruhwlk3exV0JHFd6PfzOasIEUWtNFbFBa0tpNjd8+PtyHQ/ZnI6A26QEjIBlxk5sQdIs0/xCA3V6LpCC+NnelKyxfodD1HX3fItbmm1tfrEa71ihWsGBhkfSGogXW+Km3OuDa5POuGojU21Ttm7ogQj4DnEUb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775996805; c=relaxed/simple;
	bh=5PH6HgTFfPOB4nkrcwcyggoXwvHL/fdGKGMj2V4rxX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gMik8aXLuKfhJ1PZzcTZT5TCAcDwSQQzDKuIIQFI0O9xwm4vGIZxYw0n8gElPzwNwZyztWWkVExTaZ+gPpeZy1okKT48Y89Pv9IK2OIpwONrL+431hu2RWrUNMm+25vD1LTTPmGBgrTQYXPOKZ2jaXolhoAe2hhnahZkcAW9PcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJFAeGyX; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJFAeGyX"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c648bc907ebso2496951a12.3
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775996803; x=1776601603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LE6huvR6spyj6pXFbXVnPFFoN9AhuKNeTxygPGeaug=;
        b=EJFAeGyXF0Ln65yiUZakpPVMHgMpUdVJLp/ZKH22pjF79EBqMGgh6roZLzq242V24B
         YqolMT0w3BBe4fhAh5+O4bF1Cq72JG5DmCnsUuTXAfHxaJdjx3KOWaGqkXWcSkzMXTdy
         mUdw1OMWBGMCJ3f8vnAk9smtl9EzIk03XhwEy0qwSkzFaNygQhfj1uV71gGUk1SuwIig
         C+DHZWJk92Rl4nT+HWV0kOHwp4i7iD1W0YSoLcJogdpEHprxOnywGXzOCJseIe9wppUW
         Q1MToGvUUD/TpVbvpYS6Id15ix7LwuuCFnYNzep64XmKGbYfq4PzZmp4mTnxjBXG3ChJ
         m+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775996803; x=1776601603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LE6huvR6spyj6pXFbXVnPFFoN9AhuKNeTxygPGeaug=;
        b=aki++Az2ndS9agGWCPeIMtQuooO5IqQFaj20HZX/z+RJOD1j8HtMT129NJnqQmh6Ez
         qhcr45HdSfqC+oZTdmZgV1Qadi+3v2kxNNgQbDqt1qrdAXWNtiyIBKvaYeExVu9y2ku7
         MZ2r11EyQBMzBNMNt8f6uW2UpGje5iodi4SEUrwdOEnSmFDg+YupPTGAhuDgGOLBSZx9
         kjkpI0GdpfBNSmPX6hjyV88K+4XspgYpBnhlZ+fX+Nrmi0Z2+iIiaQkEwNRyXFhUIhb4
         g6oTRIwiUGJ+G6Q0sNsTdNEl6ZbZhIlM8sFoEuVHyUFBb96dsvL8790ZZwFfwKDnFkcE
         +moA==
X-Forwarded-Encrypted: i=1; AJvYcCWE53k4+j3zwvCRK+m5oGSGTCYCWrxHElu1/T3Nw2aKMt6/Rgy72jDO5goknOPRtk55iZuCaWVn2LzG9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVDbnanYSl+e/LgMcizLloJGOE0yn55s/TuDWZ6imTFia4A9L3
	dfYi62FajdCJ8Z3PEJMQpsVf/zOBKWhyMl5eeg49WiUxpJflhFT/YNAO
X-Gm-Gg: AeBDieu16ROubP1LJqEzT9Wh6G/CMx1iIfXtSbQYWxchS79KiS7pqPOX3cjRwx3QBPG
	X0jW3JkbE+o4MAz3ZO/oRpoiFvIY/feWPAynuAux81/bSwtlJkPcIVUgcKrhzLEpUJltI07LXnv
	n3KZCfjpFo9xix5Psl2uNeXaLDFPEBSN7iUoInVDWSf+DppcWuwgc7dPh9VNmNz9aOLYK56xlEl
	h2v/AlqzeIhmDnEKoRSkuiYGt/zyqNkT41TjOLzsr/7Q7uzSLJKeROLlhTHcHZsJP2OUNI7QjML
	+QVy41249FW8J619m4LAedX6HHFv0JoBTMg9xrIGC5/38lgOFFZ11ZkvQj2qi7l8LiwZsCtxRm6
	JvPQp4iMrm7Cz9Q51D9h7TZn/ZAXtDr/NLL4cDjFBDIGrRlyq5E24FVtv4/VS2OpsnguOinNID4
	2jhqO5jtlxG9vxDA==
X-Received: by 2002:a05:6a20:1592:b0:39b:e789:7d20 with SMTP id adf61e73a8af0-39fe3ff14c3mr10951914637.44.1775996803341;
        Sun, 12 Apr 2026 05:26:43 -0700 (PDT)
Received: from lgs.. ([101.32.189.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc462sm7633431a12.8.2026.04.12.05.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 05:26:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sean Paul <seanpaul@chromium.org>,
	Mark Zhang <markz@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] gpu: host1x: Fix device reference leak in host1x_device_parse_dt() error path
Date: Sun, 12 Apr 2026 20:26:33 +0800
Message-ID: <20260412122633.2487800-1-lgs201920130244@gmail.com>
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
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - add Cc: stable@vger.kernel.org

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


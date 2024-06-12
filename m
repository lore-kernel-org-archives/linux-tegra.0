Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16B12CDA8
	for <linux-tegra@vger.kernel.org>; Wed, 12 Jun 2024 22:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718231093; cv=none; b=UmEx4G7UiqVTJpdb2ujUuVdJxUswuMKDXHA+7Pb6JkI/aq7bT0vdYERE8XsVDdKAgi0yeaNQ3poqjDgMfiYz1qJ2ZP107omhWzpk6Uc+ab4jwJGjw8oDrtIDvVZHLWvFVCeMRjqxnJR6KukdlK1Sw7IbVcwosP+mdhZhLPtmvlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718231093; c=relaxed/simple;
	bh=t3yv9e1EzMXtPY6KnpScajrOJgyZidM/cqL/We5XO9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbO+PlNYm16TNvLOY/AV9COgMVeyEGLXDIJ0nFYcY+BUNzvnRqY+A1h6L4Xy/Bjg743Rn2Uibl0iBD+BrMENhfvYzUpdR+EXgFJ+8Q37V0HuqCAZsliKHLsrWVrxvEU8ButUyzXOxF9R/Vx/+tTA5T1iON9amjLjeSai/WxaXBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dP8qkp8L; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dP8qkp8L"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f44b594deeso3822025ad.2
        for <linux-tegra@vger.kernel.org>; Wed, 12 Jun 2024 15:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718231092; x=1718835892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpmQn9g7cRN67S7SSaIwDQvRoODph3OOMStNp4IKliA=;
        b=dP8qkp8Lg+k1/d/wQ+63ftRNYeBDI742xoAoNOkKSXgBoCNZwuqLk53ZeuwlGJZcC0
         FQDIeJ9qBrZU80fkWx1sghO6+QYEkKyRe0ZJC3In/r/sp1hHKsocsqzF1jR2+I0aMsY1
         SUq2rwVbxT5xYl18m99gcxyNbZDd1lgBRAq14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718231092; x=1718835892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpmQn9g7cRN67S7SSaIwDQvRoODph3OOMStNp4IKliA=;
        b=eIygrv8KzPamxW5PebGM0FI/ctJHaYqoxywNdMHQ6TDmYOrgLBr3zjeHHvzclzOzpo
         fTmdIn3v9W6NVwUVjLbEZTk0jvnPWUHDJXxmvar/VmEH958eol5c4Odd19fJnR2heTK/
         7bDW9tfRT5yyOQNxYVRuqYEnI50dCofVRoQGanmy3rDNeMovcyb+/sZBed/PCeRO2l33
         hmduv1uTNj0HlZ0HagAtds02s8nnCX/eKJHQg0QjkmuAacAczpiZtpB9FLolSm+DrCnp
         wzEmiftVlnSpE7Jdw/xPt694DPJ6Wnm4QAzSKkz0aJQ5h3540ZGtvvYB3ykQ/Ly6eBbr
         LNLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUJkx9f9jBKuA85YeacelOhFPzU/3XvF/TRL5tx63gbq2185St81E6nbE+N5ZHqat4P2VHn/DMHR2bvJT1u8mfdwm8h2rvdcI3H/4=
X-Gm-Message-State: AOJu0YzYLTLzpD5+hpVr5mH8WrQthsxw8xfDuUiKgxczYzuMfsN6tM/T
	PqRYugh+/s8v0T06K+Pvhx/EVi0PWNb/UdJLrBILd/LV267KEBMLme07bfEetA==
X-Google-Smtp-Source: AGHT+IEw5ujOqNAyOIoLP8KuspnMOnAtd7Hh5dDQKTX8TBm9/CzqJoj2TsY6aejmqFawCaR9pN4o7w==
X-Received: by 2002:a17:902:e750:b0:1f7:2a95:f2f8 with SMTP id d9443c01a7336-1f83b55e32cmr41999395ad.14.1718231091823;
        Wed, 12 Jun 2024 15:24:51 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2816:6a42:9074:18cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f30acda9sm87914105ad.198.2024.06.12.15.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 15:24:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/8] drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
Date: Wed, 12 Jun 2024 15:23:43 -0700
Message-ID: <20240612152336.v2.3.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240612222435.3188234-1-dianders@chromium.org>
References: <20240612222435.3188234-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

 drivers/gpu/drm/tegra/drm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 03d1c76aec2d..d9f0728c3afd 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1330,6 +1330,11 @@ static int host1x_drm_remove(struct host1x_device *dev)
 	return 0;
 }
 
+static void host1x_drm_shutdown(struct host1x_device *dev)
+{
+	drm_atomic_helper_shutdown(dev_get_drvdata(&dev->dev));
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int host1x_drm_suspend(struct device *dev)
 {
@@ -1398,6 +1403,7 @@ static struct host1x_driver host1x_drm_driver = {
 	},
 	.probe = host1x_drm_probe,
 	.remove = host1x_drm_remove,
+	.shutdown = host1x_drm_shutdown,
 	.subdevs = host1x_drm_subdevs,
 };
 
-- 
2.45.2.505.gda0bf45e8d-goog


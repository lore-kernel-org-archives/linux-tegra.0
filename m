Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F562F3C26
	for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779009315; cv=none; b=or5SoJNGbRTs0eB4gwbkqWt60L/PgBTE3kqT4Md6P6utmG2zi3Vr4x2XOU7woEXPWdR7YCS/rJz+x/oRfkrCbD6rrzaYikZJ75eHCUqDW3jpA01hdO9+HXbOjCjprLhIqln3Qj6bP3x0AOZNlpdOF1UDCRMSliBhNmo5MOBNcI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779009315; c=relaxed/simple;
	bh=PB1CYBgtuICXGpFOifwOOxdvuLuw5VwYDkwQQ7M00Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XiLXP8griPVXJWZ8c+Mu8A5Q+ZCkYC1it9KX8oUGryhN1PLq8rh18jF1E42pmAWDXIbaJvv+Y0iUk8UAg5+WXWTBPZjjeILxCqQlal76ysDcNgAp0DPxxkun5l0XHbuShYvvYw1TjmsqSdkzlmQjoqUxeH7AWHJKU5avm5uwzcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhPMfUPm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhPMfUPm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso7952465e9.2
        for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779009312; x=1779614112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0jmEAFXkvGaEuEol7IecG4O5py6NDPChMnuva5JHJCI=;
        b=PhPMfUPmMyu9dvLQ9x5ngbeSnwDV75X6wdVSB4WIWUM1F6CRT89OtRwKo+2nNJ9rsg
         KS0m8lFePS6CCCe6GtdPPUkmrsRq/gR1GDVguitPoHBexM3CsVpjU4vZFV3sh7LQksm7
         cpKqq9GRCm2ZDu0Vm7LK/wNjF/Wk3+HEYCVn5h/TsoUtJFxKrokZlS6gzatYsD3hqDKE
         QTUWgU/7rRGtzehlpY+80xelqFJYfxQP6VnW7L7bl+BFemu2vLISKnNcRRMXEFW0JxCh
         GKz/eo/b+82pSVnjOnGBL9L59cvgwNcH4mthT5ybKsjocQiSy/srnVYcL185F+394Cw7
         CrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779009312; x=1779614112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jmEAFXkvGaEuEol7IecG4O5py6NDPChMnuva5JHJCI=;
        b=Jy/aiU0F0YrwV+n0h0RAJmYkDE+1kYxxvZ1koEa/rUHVfEvkAoVeNjz7zweM8kk/U/
         vGzslwSB0icg5mZfWRJTFIMlb/g2uP7AmdgosXB4DCI4FSHUf83xkCJHDv4cyrlWb2rs
         L2sJbDsuyMGJTriTZyBjZqPhZOBGqE73I11VWKnYoeZUNQHSBIi5F77N22OHcIxI4bQ0
         Kd7SkfBMsrcbuQK5ZSII0sFYL25egN76rsRQhRY+AstSArm4BB9UGeIMZSe0pJOv91ru
         YJ2wYfSYIUT8XvIXvORDcAlcu8yd6UxL/zM7/W1t33MGjXzlYG14DiF3jlwieEd8cp/W
         tP4w==
X-Forwarded-Encrypted: i=1; AFNElJ8sGKuG2yfmy8jKeWr0uCn/DfGdZiext6uQkBRoSCmYJpERukAcr6Eev5PJmvnNH6LUpWafkGAsaukr6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIz3ZuUNBLsl3IItjP+3CN5/QEj7eRZFo2CI2GoLp8AgQaum2t
	FzXwTFJd6QGRbRhX2SQOA9R8/IQg9bTknJHp+60J/eZeD8xV6jYexILB
X-Gm-Gg: Acq92OEIr6rep05UPgV3y2wF+pzdput7OVG0byPnhvTtzPJvLn3U11sofLLsy6zORL5
	euP2CDXRnEnoNxnFki5qjWNK4jhhLDCmj5KkwBDVlXExqYTnySmkBceY2rK8V621FnECdYYfmaJ
	WLUYGLHv+bkXAMPWgOu+IcIUeunJleImf+P4uk92FRmVEjryv1SGrw1Wms/Camg27LFvLBLrywn
	VAEvcnHLBEQ9IzJHZEdPxHdQb0Vmlp1oEiQrJFyczk3bGn3XWW4t3wsTa3rrhOcI4dySu2Xm3jA
	6FYxAOkzHlNW1WlpVOnH0ObSygRBm1atTF2XXe7pqHiTENeCFuXppKo70X2C75dYMJiTmap3i6I
	/wrIPpLB2i7pQIyLnLPS6EDMWT05F2836ocCm0JaclMVqqgK6WXcE5pbdhGc5iNVK3e0WQK5BIx
	eHCTywqTesZuS5
X-Received: by 2002:a05:600c:4ed0:b0:490:778:4fec with SMTP id 5b1f17b1804b1-49007785052mr21015875e9.33.1779009312286;
        Sun, 17 May 2026 02:15:12 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm29560235f8f.22.2026.05.17.02.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 02:15:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ion Agorria <ion@agorria.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/tegra: gr2d/gr3d: Move pm_runtime_enable to gr*d_probe
Date: Sun, 17 May 2026 12:14:48 +0300
Message-ID: <20260517091450.46728-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gr*d_remove() has pm_runtime_disable, this indicates it should be
paired with pm_runtime_enable in the probe instead of being inside
gr*d_runtime_resume().

---
Changes in v3:
- pm_runtime_enable moved before host1x_client_register

Changes in v2:
- remove pm from gr2d_exit along with pm from gr2d_runtime_resume
- move register map initialize before host1x_client_register
---

Ion Agorria (1):
  drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove

Svyatoslav Ryhel (1):
  drm/tegra: gr2d/gr3d: Initialize address register map before HOST1X
    client is registered

 drivers/gpu/drm/tegra/gr2d.c | 19 +++++++++----------
 drivers/gpu/drm/tegra/gr3d.c | 19 +++++++++----------
 2 files changed, 18 insertions(+), 20 deletions(-)

-- 
2.51.0


Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC48397E9D
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276761; cv=none; b=AFjysNs/dXQ8NmFiTuFXRh2rVb/UyzMfocR+Ljh1MKQOfXDjHVMMVz9yheU+BcYLViS7PdU5IUhDlthHE/RUjWhFsctixIRBhmnzLys4RBR6ikaAAH89rurKQgix/jAapdmEOWxaDQo+MDADZVc1vT/o6jh5K3kV6JGyy4Eyw7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276761; c=relaxed/simple;
	bh=vaQBnSj+USdsWGGLHc7b19lPknCYSlB6+8xOYj/pZM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOtwpk8RYMZrexvMM3vmKS6Vv5jLFspjdlKBZOUDVYB1O5xNydqkbOKLHbVpSPVggr/bHWLZjCIK+6JCBjTK0bm0sfiyWIK3vejDlrMAGv1h+5BuMfvnrsSFq5/rARjSe+VfySOAgaCf9JVmMysDfmdKeJ7sDZp/rk4eAAZbFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7ZY84i1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7ZY84i1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d73352cf2so8307365f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777276758; x=1777881558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbqtPYwCKpsoZO65V2/Zjei16diYD3VChr6pC5XBI0Q=;
        b=Q7ZY84i1vtWwAZqu7OV6XfNy2YwHqxk4CUJwnlcCV9fFejpeTmzo6cGUYLoNyfDxjS
         iJWjfwA5pf8NXYFKsWilZ4z+OlXkSutSua15Agq2R9IiUY+9M6KTEJHiGVdTJow24wyU
         63CZPw6Mq8J8dgxr8Dk2ybxMbe78WwDYJaOmhisKyY6InSuMFvtu55qBY8eS569LLNcC
         RR6Fz5DzhXMhn2nVwTHFSQUIFyC+TELClsoIHQga/zcNOJhKS9+ZdzemchTlQJD3+gk9
         7ovw9DeF7lStkylg2WMALFWPLlbpym682lzMNca+nuFCLEpXc1IjaxD4csi9fYMEg+13
         UP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777276758; x=1777881558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QbqtPYwCKpsoZO65V2/Zjei16diYD3VChr6pC5XBI0Q=;
        b=tKSVhRBh2UN0cYpw1jBD2tZ6ut0n1TXYoRwUFlrHVkLN3i2Xhu3rTyA1/eFkuX0sWA
         c0B9RNcLIC3JHinlEteUDADX4uiwULYBNgo+xlebYlnV3KArDn1ZWhXJf1y/IWhcBjOw
         r1V9MFQePHZOtV07tuMSEKVFlJAImj0/ajhfeX6qlZUp3rEHOpz90nOM+cdoGp0UL2ZU
         P5O0OMNyzLSi5/7LhLEIcmnXgBxoQ1ONjbv7kw2cEOQIaHb2krGvxWrblwsYW7k3cPfN
         K4MRwERln7kSUuhafIYaBtd2/ieuX7Eo1ky4/lpgsRGHm2kWCapW1lLN16WqD7mpeF33
         jEvA==
X-Forwarded-Encrypted: i=1; AFNElJ9TYO9WwO10ljiQjMUjPefmyrpqxCdWM9yx9zqF9lA7cns11YFKjGX5yw0ciUnaovdv9wRoYTMcDYz+LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwv3z1hMueTPOSj6NhjXRZsMM11WL/toeZWeGnTvrG+zBeIYP9
	tNyVLrI5VlNvg/QUSBPQmOidAe42wBwW4GDj6xONAPWf7kW6kVwNWoyO
X-Gm-Gg: AeBDieuA6z+vT9tEdWcfKWDsdWN1NkM0qGVvhDn/M08q2mAS/MeljpyM3U9otYbqlvp
	MQWnkJg+ze/ometcyCLo3XwZTDalLp0cUbuW2CBuZsUHkz1Fu8OsEjoL9q+wJTPhEM9PVRZO9kz
	iLUdCnjWjgrEiiLPb5m05jw7exS+tOrt4Ly+98PnlLiVclEI7WK9wNUVDH91lgU33hl3B2mWzfS
	WmkumwlCwFLWSK9wVaT/ct1+6QA3weGn4SdYKc/hX429arFne6ugithhGg8FN6Pm/kdJn+u+xd3
	3mL2iHswYRIPS5zkP/p5Ypid8q5wTTvjykSIZXgm+AKb7i2jmimHGuJ9m58boFRN9uUarXZQ+Jh
	FSvf8VI7zSHbPqvWyifmMsb7EBWaNA9iS8psXwgud+f1BX8dFxXI5NB37K9IvBBD1rBcAfj0G1u
	jOLT0bmziS3KrqT+Tp8TBaJuE=
X-Received: by 2002:a05:6000:24ca:b0:43e:a70d:7632 with SMTP id ffacd0b85a97d-43fe3e0b463mr65931197f8f.25.1777276758054;
        Mon, 27 Apr 2026 00:59:18 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm79918386f8f.2.2026.04.27.00.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:59:17 -0700 (PDT)
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
Subject: [PATCH v1 1/1] drm/tegra: gr2d/gr3d: Move pm_runtime_enable to gr*d_probe
Date: Mon, 27 Apr 2026 10:58:56 +0300
Message-ID: <20260427075856.85208-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427075856.85208-1-clamor95@gmail.com>
References: <20260427075856.85208-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ion Agorria <ion@agorria.com>

The gr*d_remove() has pm_runtime_disable, this indicates it should be
paired with pm_runtime_enable in the probe instead of being inside
gr*d_runtime_resume().

Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 8 ++++----
 drivers/gpu/drm/tegra/gr3d.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 21f4dd0fa6af..71f092d59d65 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -286,6 +286,10 @@ static int gr2d_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
 		set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
 
+	pm_runtime_enable(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+
 	return 0;
 }
 
@@ -367,10 +371,6 @@ static int __maybe_unused gr2d_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
-	pm_runtime_enable(dev);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_autosuspend_delay(dev, 500);
-
 	return 0;
 
 disable_clk:
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 42e9656ab80c..33e88ca4d4c5 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -517,6 +517,10 @@ static int gr3d_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
 		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
 
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+
 	return 0;
 }
 
@@ -578,10 +582,6 @@ static int __maybe_unused gr3d_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
-	pm_runtime_enable(dev);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_autosuspend_delay(dev, 500);
-
 	return 0;
 
 disable_clk:
-- 
2.51.0


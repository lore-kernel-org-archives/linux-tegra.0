Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ADD3A2550
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485568; cv=none; b=eQHa2b0xYB2MXf1A5VUrRK+DxLgMIlfuNRV2RIM7kWyJroLtHtkIpL6EXEyFio/Ub9XwRIcxn/FVfh5s5AaWTCTO39EJk6kYGvlEpE2JwQGP8znAfMfO5WsTU/QkMlx61OLRmunN7RNvRG+PkDFH6dqSY1h5UqJHny8jaZ0wqv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485568; c=relaxed/simple;
	bh=BfCGLduhY9yG7QLq78Hh4dR6ZPzK4zm1QeyS8EzRSxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sl+IHnEIv0wES8ZYu0atbpvHQqe2vJlPDEwHzWUl/SC+Q6LydmubMJ7AvaSVrWzdRGGzUzQN0BjFFPIfp+k/4Ym0hR7BXLLOmcXoddb2ScGAs4hJeYUax8Wd2dnfWG1J8f6ui4TR3c9D2fOiOVDya2AKeJ5UpD6cVnIFnLyB9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aO3hKW45; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aO3hKW45"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a865d1547aso4592652e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485559; x=1779090359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/vo+yztL0AmH8P24goXzbtezovr3DoQGmWB3EtlnhE=;
        b=aO3hKW45Fn84MTLwS5chnFAYR97siQkzudd+X3vXRyqRwUH+B9e4Ce1/bl4I8UURrM
         p7E+qc7dKC4jCiBjOQ8NMz+VB5ZOEydbC5AZ3wgE41EIQCXe3i8MFisA3szAjb0KgAiV
         YMAx93Obi3/ieseDmSS0e5cwEJaI5/qqvkpg7C4RVKnzMwEphBqdv28g5huqG55vj1vq
         B0dLlENy3MYDW+RHJef74W0YRvzCccqudT+PKQxE2XHEKsmZmNETqKqu8sq+HGxMtkDB
         5sGPfPp1QmTL7cUGkfCIXPI4VYfm7JNJnrnyyuycSRln3kkoc15tikWp668OY35IQ9Uz
         D1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485559; x=1779090359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4/vo+yztL0AmH8P24goXzbtezovr3DoQGmWB3EtlnhE=;
        b=mZn66GX3ZRKRmpWK+w7+scAR6Y0pO02q8jOcX9CaIdMonXOUy1cXBf39m+OVjvOt88
         hlGtwaRXXUOVSFUUYg7z9ufHqSZ6HGGaSNExU/w6ZcCJ/A8s6EcopIkEvyz7WerNDxkr
         NlfaKi8pLYxDM1fuBWviiuIc5cRn9sduil/w3lYVNjAaO9cdBsyCWeJyT2PtbzqXUAp7
         3vDghDYYAdI0RD82+l1hGUFmTqoCPoPKR620i0259WJdwu6aawFXumLpjxgm97OGc9f9
         p5eKGFDqagnvNsheiIO79otjLir4qqGQc/PmA2W8XbJn4ypN6vLJtLITbdoeaiicRcEj
         KhlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HgfuNcdNY9V1SYkDO7YRfCj8OVVSqw8+fr0gpA0sMhQHMbRduztV72/P5KbIT1dM0gvAO1KGFh+/yvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9UDoyO9C9C35JOteQ6oc76m4DCn4nryNkseo8YB20ZuTa/EtB
	yd7alE9FD9fr9ct3Gd3cLn/4yR/SNuYgGvfPHMhVEeWmZdIx0WMxulnB
X-Gm-Gg: Acq92OGzSiABsn56Gi1xrzPb+uCpnVFmucBRqsUqMoiTePE5UqcvYt4lEB/6u79sfWm
	jxueYqXWPN4d3Oo1MYYQ/zeX9bLk1PBzJFJ9Ke7qFTfxC0Iy5Eq77OF8MnhgbHlb02zNflkNaV2
	G/my7cCYqZNVyMesZlwQmMZLSMBTQJsUr9mWSk9Fc2UXvq2uzb0+AkdeujPGg4sAfo9f6EkgL9W
	4xJvEbeqz+4Ueifi2fADaWjKAiffj44hMjz2mJ8Z/8s9yuZGioV734BbTaN7BZ0eGBwdh0EqZ7J
	H0dHAuzYwh6/Pgl3eN05ns51tSzA7IdnpJu1JpLdL3drFxq0HVVZVTmwVmc/9Z4MurYic9nqNTI
	/RbIRFuq2HJkTqj5687UaXx33VnEW0fRahZj1GrpuTBFsWjH0IDoAm8kIie9R+1bdLDtR5pRK8G
	NMRFbwe38N4V9m
X-Received: by 2002:a05:6512:114f:b0:5a8:6cd7:3203 with SMTP id 2adb3069b0e04-5a899b90511mr5387467e87.3.1778485558513;
        Mon, 11 May 2026 00:45:58 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a952705asm2404394e87.32.2026.05.11.00.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:45:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2 RESEND] drm/tegra: dsi: re-add clear enable register if DSI was powered by bootloader
Date: Mon, 11 May 2026 10:45:37 +0300
Message-ID: <20260511074538.24563-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074538.24563-1-clamor95@gmail.com>
References: <20260511074538.24563-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Original commit b22fd0b9639e ("drm/tegra: dsi: Clear enable register if
powered by bootloader") was added to address the issue of DSI being in an
unknown state after the bootloader, ensuring correct panel configuration.
This worked fairly well under the assumption that the bootloader had set
up DSI; however, in cases where it did not, the device would hang because
a DSI read was called before the DSI hardware was ready.

Removing this workaround results in the issue described in the original
fix: the panel initialization sequence fails and the panel gets stuck in
an undefined state. This is especially noticeable with command mode panels

In order to properly address this issue, the original workaround is
restored and placed after the DSI hardware is prepared for R/W operations.
This fixes behavior for both cases: where DSI is set by the bootloader and
where DSI is untouched.

I have tested this change on Tegra20 (Motorola Atrix 4G),
Tegra114 (NVIDIA Tegra Note 7 and ASUS Transformer Pad TF701T), and
Tegra124 (Xiaomi Mi Pad) with U-Boot, using both bootloader-initialized
DSI and untouched DSI.

Fixes: b22fd0b9639e ("drm/tegra: dsi: Clear enable register if powered by bootloader")
Fixes: 660b299bed2a ("Revert "drm/tegra: dsi: Clear enable register if powered by bootloader"")
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index fbab10bc5c41..e7fdd8c7ac12 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -936,6 +936,15 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
+	/* If the bootloader enabled DSI it needs to be disabled
+	 * in order for the panel initialization commands to be
+	 * properly sent.
+	 */
+	value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
+
+	if (value & DSI_POWER_CONTROL_ENABLE)
+		tegra_dsi_disable(dsi);
+
 	state = tegra_dsi_get_state(dsi);
 
 	tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
-- 
2.51.0


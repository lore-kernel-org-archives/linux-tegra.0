Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E13093DF
	for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779009316; cv=none; b=gcqoTn97vfcTAcMGNNEwOiliv3xCIXMU2gHPpxV91KEXLp18u94z/ZsMWTJWyNKvpVw4+mW5kYpnOUS9iRQP3ABQfV1dLO6+6pZ8RjVS2h9IrUo4b+nS0dGmay59PKRpTXoVaNcRz7mRsQi936EJoNnBX+ulnD3tbulilDTlnmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779009316; c=relaxed/simple;
	bh=Gitw1P0LSmMPXPFhHzWFWU6P4rMn1EG2FuqNjSvyhwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbGPmU3VCGNV4ECqq1KTzwT1+xpDoI5ERWrQi7XjbgRgJQ6ucRF5ZT6Os7JNTSbLOE2B/KVf0SpF7lp0M8b09vfsFjCmbJ7KlUuz5ZxvzfVOg4zRaBqALtUog8nFPNP66bewH9h36vZlFo2hmg2rbm90tT5fIaZQ/yjJF/6OjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG7w5aHk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG7w5aHk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ae6a0e523so511601f8f.1
        for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779009313; x=1779614113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GuFtyrSu06bTVmesqPXmePmrs3EAUNX6oaNcPtvvmc=;
        b=aG7w5aHkGuImB0pkmnvRRaNtKh2I85nt/tblW+JDH8mus6D7eOkAY3f7DaHEQTp2ZU
         N4XQ9BpWPWPd7z0P0YtgLMmLJAkb2X/8kKcEEfIJZEKWWLnZ9U/+FWQCrfIbQNtkfJjU
         nVBHKX+ijuk2ZomH1KyY+01JLml+w0zLc6i+9V8v495NbpFqFE1aXXRqAeLu6Rv460aX
         JUY2ko0uhSN9Rpb9QfaxzScs4SDtjrn25GiP9WGVmGA7gNmBmxn9Cu8FlSVGaqkerBr2
         eEXHsiDR0CJwvb9BEk2S1PshlQgKAa0yP4DZMSYRMbSUfDHD+5q4IHK0qc15woT/ehav
         ucgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779009313; x=1779614113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1GuFtyrSu06bTVmesqPXmePmrs3EAUNX6oaNcPtvvmc=;
        b=hTNL2fagIgR+mXZCidekx3uF6R2mRNVzJug4cGPjBvpfYxAfavgZq0ISR37wTvuE8M
         QzO/CVeHob1b/FVyCzq/3uXT08Pf2MAxRgCYbwmETZPTFprZWxcaWOIdm172cwi+9Iff
         ubWcn/Mmr12v/f2dNTGuxWUeXMm5ogzRLaRhq0hrKmfH/o4uFLHhWZDtCqWXZVmX3ooR
         KTVnwlCKEKeqqzz4CHEvTg3kslQaQUDCjhKT068GWZP5hExNQQ67v/Zas8keKmUCAaw/
         i+Pl6F8Q4E+fyIYBwJCTRHaP1YWhpjwx1i+1B0RHPno2TK1aNjiOxF+pKVS0mN23l6Fb
         BvlA==
X-Forwarded-Encrypted: i=1; AFNElJ8bP1AWiUDD5jfVPc8BRjv1kBPnJIcoDoV4doLfJySf/BjWhwsfVemlYMM6CrK+ffQtgLAHymorByuyww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlDqNWpzLa07cVlo0CYUZQvY11cdoXAPDhV1GcxG6lcwynhL7h
	+hDXwy3zkOyv1bsfgIATjNyBEOiOe6twHuWJMbZxdMpTxjjdx1lquBre
X-Gm-Gg: Acq92OFDYiI6h74MB12k3uxcyU+8/HYmsWLKJvIkREnFPXciMTD7uYP47N9pwz6bboZ
	SwrfjJM+MZiZBfCUH3bwOWqxQEk3qHwzJ3AhiYnpYBk1Xsbs88t9B8pkNS8v6l0KOUYpjX2KwfQ
	hWjOtfvGa4pDUSdDLj4cwY0ane0pVNHWaAqmCtfnTBI4L56bQH9abbMpHPYIDhr/HyAYF3a8JLT
	dtkoEl1Iu/u71InCCwMNIvsXxDGGcZtaN2PpM/diYKestZUQLhcGHSQapEjLYGpzd24ZD4l3d7/
	vNkvNnS914VKKlIcaa8Zlv340OXoG1+MEtCifObh6N0uUrczDxlFC6li9FIE+8Ct2a1EHwiTzGz
	SohnFu0oDeQ2RCuRBsBzwgL8MlN4fmH38/X8gouM5fiHNrn+Lgdseq3gPsqGD7sPZo/lTlpgG8x
	o+udq6HT247b2jA0pTl+v0dknSKmKj9AmatQ==
X-Received: by 2002:a05:6000:4010:b0:43f:df1b:9e07 with SMTP id ffacd0b85a97d-45e5c5a5580mr15716198f8f.42.1779009313403;
        Sun, 17 May 2026 02:15:13 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm29560235f8f.22.2026.05.17.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 02:15:12 -0700 (PDT)
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
Subject: [PATCH v3 1/2] drm/tegra: gr2d/gr3d: Initialize address register map before HOST1X client is registered
Date: Sun, 17 May 2026 12:14:49 +0300
Message-ID: <20260517091450.46728-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260517091450.46728-1-clamor95@gmail.com>
References: <20260517091450.46728-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The host1x_client_register() function is called just prior to register map
initialization loop, making the device available to userspace. This may
result in userspace attempting to submits a job before the register map is
initialized. Address this by moving register initialization before host1x
client registration.

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 8 ++++----
 drivers/gpu/drm/tegra/gr3d.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 21f4dd0fa6af..e4148b034af7 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -276,16 +276,16 @@ static int gr2d_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	/* initialize address register map */
+	for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
+		set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
+
 	err = host1x_client_register(&gr2d->client.base);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
 		return err;
 	}
 
-	/* initialize address register map */
-	for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
-		set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 42e9656ab80c..47b0c6c56bfd 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -506,6 +506,10 @@ static int gr3d_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	/* initialize address register map */
+	for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
+		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
+
 	err = host1x_client_register(&gr3d->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
@@ -513,10 +517,6 @@ static int gr3d_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	/* initialize address register map */
-	for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
-		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
-
 	return 0;
 }
 
-- 
2.51.0


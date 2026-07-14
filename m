Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B393D3112C1
	for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035298; cv=none; b=GSwIK+38eF/ApqjQFTDM5M22tRswm85nNh0shIrBke6mCj/RGibu/F/ipUsblvTD2bzvLpFkJC83ftTFPy060hcQR9iDspctKSlIeeSnlpeOuK9Aiw+U9Nj31u7FgzF/ifJxwcXgJSsDq8uHJ4gPyCnoOgw7VNrGVvWbBF33Nvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035298; c=relaxed/simple;
	bh=N3Wt39r+betV+ag1LhGjcHS/hzSO1IAUGjKuO+ynb34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FkN0BwP+23TxwtgEaHPpuPbcnioAFMR4H6mAfpYZ9t6T9r/Tm90jmXYXk+W+krHUZO48A2PTp8+YO+YhGyO2IFHu5vFKhR5/032ESa4tibHAyfbTpqOU6UK+xv4uqrl7WtlUq+0RYdiJIZlzOTJFBQGpPu1xsQt+ePv4BY9Khw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bm6nld/2; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bm6nld/2"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8efec2c28f8so6743406d6.2
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2026 06:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035295; x=1784640095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ljyj9DkB5xbAZqgYsTFaAqTNeOS834qmzh1t0MU7eq0=;
        b=bm6nld/26gyRfH7vYrhfZr4gOS4/rRdkFVdISMk0wQ9VjgkjTjDGOCoQ/IstKcraLe
         9DsgvpSbaHRxS5uYR1zgyXTcUrVcXdp9U86i/nVHy4U0sGH0xqQr7cynCaxumpbElF5v
         iQIQzDHlLvh1+R5cIatpXsll+yFbA83GZBdov+nqOx4xe8vMIzAXFA1bYTeYblTKGYl6
         YqJyEDheXsf0FzE8luwyR/DWOoxo/K3vhTqZaIhtgNXSOBrKPoMAKqgC8YB8/Q622bEW
         nIEmXnR725VtJUQWzER+c8vtuKjJMfcIrdDO8J9ZI7I+xJNowCKx3R//n+eQDMW25qFv
         mgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035295; x=1784640095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ljyj9DkB5xbAZqgYsTFaAqTNeOS834qmzh1t0MU7eq0=;
        b=avxZEoBfs1BXBGYGKqLinGfeHVANO8FjrQHpnwufBaYRMSH7D0CVOQoHwDuUnd4MKI
         6TYV6F8jo3x2oiyEsg5MfidMOlMksZ/bTruOaYRsbmmH8cQ5S6IPnS8rfPbXTeUP/Nqw
         7mR9cu6AbRo7jy94JurE5EI26JtOiXl16rA5OtT8W2xWuTozMbi9yhNYvQ42s628SUgK
         zJzGrs+bo89vqhSx0mevoHqkFy1ujF2dTsn2fZhRga4Iptiu9N4EbxRJiq4zH3YKz3n1
         GxSJqmYVGHUOg0urJT5Xt1P4J1e2/ajq9nNCg1n35YrhSSun7MwoPHF1PuF75L+6KwZU
         8Kdw==
X-Forwarded-Encrypted: i=1; AHgh+RqbN5ZehidfVTF3nZF46z20ahvqNFVumakwmz5Nj6HDnXC3E2jfOvJwFaVExRMQfAg+f3IUEf53yXTSwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfooJvUXzDblyamKS1KDRLtTm7mkC/vkE8ZgkaSs9jd0tgdH/L
	fDkZUE8ZB9NpLzVLTItPD4oM5x98Fmcd7+vR+ar2kTczasbn8Iimz3OI
X-Gm-Gg: AfdE7cmUmrJAZLMJBQ0mZUGce/8AVV8N6BaV+SXLs26ewUaVS2bSm913Aiupslq7tlc
	ZyQqSo2XLpeL++kwdztx40TgMgGpRPpvDsqHMHnvzOF24hbFti2/eb84jjscgmU3NJ330icoMlg
	TqSKB5pITFMwu8TIwtjgouqW2zAZcPZjJ5Ssp4Qd2DU+92lZaeYxoGvxWY6u6RHlSBXgCusUTtv
	AxeV4ItLRCYIG+lE5YtqQD2Ma3KT/2n8uJHT0/6LEFDDzs8hXz7v9crC/QJEBLQvLSnAjrp5NXi
	q4hyi4t02BEx5+lOgM54Nac/v6I6cJF7tH96QyGOvzYlkgGGhLU7lxdi2RrWg5cSdw3/Pn3WYfg
	p0OahPN64J+oj75YtF9U7IwqtrffANrjyMwGyKcpShvWJz9Ub+32um3AiLdj+EtnglK7sNGM=
X-Received: by 2002:a05:6214:27c3:b0:8fd:6de3:dd8b with SMTP id 6a1803df08f44-90402b67f93mr150157116d6.65.1784035295372;
        Tue, 14 Jul 2026 06:21:35 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9063df4319asm66297986d6.38.2026.07.14.06.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:21:34 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] drm/tegra: Finalize GEM object on initialization failure
Date: Tue, 14 Jul 2026 21:19:22 +0800
Message-ID: <20260714131923.1575860-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_bo_alloc_object() allocates bo and passes its embedded GEM object
to drm_gem_object_init().

drm_gem_object_init() initializes the GEM private state before creating
the shmem backing file. If the file creation fails, it returns an error
with the reservation object and GPUVA mutex still initialized.

The current error path directly frees bo, bypassing the matching GEM
private-object cleanup. Finalize the partially initialized GEM object
with drm_gem_private_object_fini() before freeing bo.

This issue was found by a static analysis tool I am developing.

Fixes: c28d4a317fef ("drm/tegra: gem: Extract tegra_bo_alloc_object()")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/tegra/gem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 436394e04812..eb513cb7521c 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -314,8 +314,10 @@ static struct tegra_bo *tegra_bo_alloc_object(struct drm_device *drm,
 	size = round_up(size, PAGE_SIZE);
 
 	err = drm_gem_object_init(drm, &bo->gem, size);
-	if (err < 0)
+	if (err < 0) {
+		drm_gem_private_object_fini(&bo->gem);
 		goto free;
+	}
 
 	err = drm_gem_create_mmap_offset(&bo->gem);
 	if (err < 0)
-- 
2.43.0


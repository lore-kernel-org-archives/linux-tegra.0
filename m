Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851EB158DAA;
	Fri, 31 May 2024 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163782; cv=none; b=SuCPU6td+kAIQWEjMaR0Wfb6Vq/n8cuIhfD9BgEt7Sls0U4FzczP5h+DqGdvs4lB4v/7kNVWf1cCnF7QCPn5arDMw01Iwht5tqjTBzJj9K3kVR5OT4lAh/0V+hd4uFlK4I+jXgyyzJUbKa3E0p7Rb2bdoLGqZnphqcTSUs1mKdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163782; c=relaxed/simple;
	bh=odG9faOj1NE6GDGmaMCFbX+GE/x2/iqXe2OcJS1AFrM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D+w88eqKAq6SZXPPfBNjI631aoFTug5fQNThkQB926yWbUOVw9DjWQ1nl1m5g/BaiNWQjrT1YQfid6fZDh4WYC56H7RLbPO/bWGtPoBVvlN/sPkzfAc/5aHNLaES8xvx9WFjWvIKfoP+rrPTsIfH6rLQjQjhMB2V8i30JW4LyGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCtgUhiP; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCtgUhiP"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7024d560b32so310166b3a.1;
        Fri, 31 May 2024 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163781; x=1717768581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f88cGD1FnhKDUsKAgEZDQuP7J2A9CwKyo3RmWwbI5bQ=;
        b=ZCtgUhiPGRNRbLVDOppU9BFL1ars60PP2l0ErpHqHTrZtsIVy74YuZWGEgbStd7TRy
         rEUlYBf21rtpNUNNoU9D7v3gwOLbPR5eFjz6X8xB4rS88DUgJ0HTvwCSnmDRy5O5Pe+b
         sNSKCVTFzHYeU1hcP7VLSlG6FZTewsjnzYBPt0x2AaL0Sl68frrdCSrz0pU/mfBu/+hU
         O1Pu0JqqgUFLi1wvhPkZJJX+BiI0uMVUu9XodIrAm17HweOJFG2MVGYQiDYUqB8btrZi
         e96MXuXRDBNBaP2i0X+SNCRC3vitzdE4fnWtCKOWLwp5xa2QnG4aPSK+UF1zV8QG/Dib
         qlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163781; x=1717768581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f88cGD1FnhKDUsKAgEZDQuP7J2A9CwKyo3RmWwbI5bQ=;
        b=ftouwPKJBn8TquE5wUV47iNB+nTJ/xuLRS2eVXKcryUQyliBgBeT/8WgYsCcByd3lt
         +xF3u6qEMjD5jxKcp6GaXONKlWD+NU5/b33XcuU1f5F8VjmaQnJ//zbQOpxnVZSlC2Fd
         QwEhzMbCgC7CiaBmdL71ej8TROr1HrfW9BRpp/IR1ouECILE5f7YLKlBofqfaOAwPw8d
         fn52ogP4oOZsx7IcivZDoRJ0DCBzWCxmtJQ1OiAdH3K9Xs3WQI4GppsDWWzDwKbkrq/N
         VHnsMZhDSI8qgskFsRBGA3aLKGO7aa9aR6iXK58u1ds2p2mjq4v4WbG94wDVQCZg/RZO
         CHyw==
X-Forwarded-Encrypted: i=1; AJvYcCWsiW38jlNDE8gwUkr16A+YrPMYF3rb2SU4p72Ne6G5SXN9yxK55Yz+Auh8CkLWmkVkldYD9FLcIAw5RvufdldfX9UZ85Rf5pGbfiwPWTc/R2oJtjJNR0k6GEPFSmdirFogJfmoVUvuQJs=
X-Gm-Message-State: AOJu0Yz7cYErDZpJ/Da6BZb36g7APz/a7vXW41iRL6tGcpTudfABCdaK
	c7yYilRDNEejjuTFJ42p54j7RfKw9YJPh54T3Si5+PiK9A4rsE7h
X-Google-Smtp-Source: AGHT+IH0YvPVxX9fRnTayrr8VgcSelULPtfRp4cHSupfP06wOlbiydiTaJIbBywey0DS9wr+x4JdqQ==
X-Received: by 2002:a05:6a00:8a11:b0:702:496d:d8b5 with SMTP id d2e1a72fcca58-702496dda20mr2357058b3a.6.1717163780807;
        Fri, 31 May 2024 06:56:20 -0700 (PDT)
Received: from lhy-a01-ubuntu22.. ([106.39.42.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423cdda4sm1398882b3a.32.2024.05.31.06.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:56:20 -0700 (PDT)
From: Huai-Yuan Liu <qq810974084@gmail.com>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Huai-Yuan Liu <qq810974084@gmail.com>
Subject: [PATCH] drm/tegra: fix a possible null pointer dereference
Date: Fri, 31 May 2024 21:56:08 +0800
Message-Id: <20240531135608.194168-1-qq810974084@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In malidp_tegra_crtc_reset, new memory is allocated with kzalloc, but 
no check is performed. Before calling __drm_atomic_helper_crtc_reset, 
mw_state should be checked to prevent possible null pointer dereferene.

Fixes: b7e0b04ae450 ("drm/tegra: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index be61c9d1a4f0..7648e129c212 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1388,7 +1388,8 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
 	if (crtc->state)
 		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
 
-	__drm_atomic_helper_crtc_reset(crtc, &state->base);
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
 static struct drm_crtc_state *
-- 
2.34.1


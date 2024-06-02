Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC903207;
	Sun,  2 Jun 2024 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717317986; cv=none; b=syG2l2vjqNVdJT68iVzlrKiCjvJj5gl+GvSmF+xx4MwvIWjOnfmlHWBGD67wTKd0/i26+4DD2jurNwp3CJD2Kr3fJgJEFaoMddNIc28z/zN6+E+o73VH7koZJJ8rsG+I4EUNghKHfRiLetc9l14Lk1MGgkl/6d6WBH6idXZcUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717317986; c=relaxed/simple;
	bh=M9OoV4npu3Dnivv/rLY2zwxANqupb8d/T3cQUBqyDNY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OELfmCx54LujXHy3CCK94z0pKoeeBNI1EaL8PBCsz3t8zLPesN/Fj/BXSRIfTqBg3npS+5QRKsqYCegYJ7gAGL6mPa2U2/pyupwRaOkncGJwUt+OFWg96efzkXhus7ZTwXnDrpBqfFFkOA+K77YV9eZH/wBNN3Z4jjT9DzxH9bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7nY9xR0; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7nY9xR0"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-1f44b441b08so26332775ad.0;
        Sun, 02 Jun 2024 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717317985; x=1717922785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JftoCKvTUzwdjKYhGR/l+pUm3JyDm2uIElHiFV8nCTA=;
        b=E7nY9xR0becU9QWvV/IOp6mRVJH4mJ404+wqiBa0Uv6abl4zTvwOjlOzQUNtykEzrJ
         +u+tf1QMbr2+dwwDZilUetEA9A/KYT7xgX2u1S+H80oQFbkf7e6UoBw6aU21icd5XDti
         Y52LomViWo7VL4n+hLREwCVnGV73059Dd7QUgo7jsSPEFhWQ0i1mzQjWO/sQmf+mHBOJ
         ZuidmFBz38sDb7YxdHgwN+Q1zPi1LCJuKQdElAUwM18abSgJu8Axc1wNR8+6t1hpH3sZ
         kzly6MvUzU2NqrXmPb5Pb7E8L7Dvc1DdZHmgUAjvJANNO6fT4OcIu31I2Hzc6dF0vAYw
         3slQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717317985; x=1717922785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JftoCKvTUzwdjKYhGR/l+pUm3JyDm2uIElHiFV8nCTA=;
        b=f4W7IsPC2OpY4ttG7eGYDXylYrbX3DNQpogyyE1dwcZLmBzgpsKQ0wBqan8vM6iw/b
         mQNWVj6h16GUPmr29tDlxuImlMEv/ok4L+ZjpEH8apO4IV9msYgdisfZVqclthSXYVwj
         PWjquFHEEt4+H85lIIGCzf9QsQjsHBufMifNbC1YKu1feAlkKzxE5uCMFJyxZ0ZzeUkH
         S3MuibREcUqcS6g4OHqTJqe4eSSAv2/H00wKh6CO1c5TAJXCSIAVTUBwzxDM4RoccnFM
         nBVFrxBkzcqnOL8RNKj3Z1rroUzz8sXr29MvJJTRfzGUC4xVsIdvDecWc7VUcoX3dX2z
         ccpA==
X-Forwarded-Encrypted: i=1; AJvYcCVbpEpyuMyO3RJcIELy8PP2sKQRx3sjf/lBNjf39BtOU3qrH9f7DMUgpwaWP6UyAkUs/JS0bHKPZzriO+xmIJGnkUbDAgWuk0vVqFxZqaMd3HhEpJsI8Q2S/n2Vql84EM8NBZ51iyMBpfo=
X-Gm-Message-State: AOJu0YzpdZO3PHsPM7qm262mjjHsGSJ/3fJ0mbe9VBrgpVrOTZP/NKqn
	+e3+SW3uJLBi8kEMMRfOOvqQ+xajylWDr5xO5aLR7fQXMZ3naEsx
X-Google-Smtp-Source: AGHT+IFx5gcwjM6LFwHA6DeHkWhVqb0rbu9a+X2fWXnd8f5joE6EHDG2CGbHWkQklP8vSAWTqNrsEg==
X-Received: by 2002:a17:902:f805:b0:1f4:6c83:23d3 with SMTP id d9443c01a7336-1f6370bcd33mr55691915ad.52.1717317984654;
        Sun, 02 Jun 2024 01:46:24 -0700 (PDT)
Received: from lhy-a01-ubuntu22.. ([106.39.42.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323eb1fdsm44248015ad.204.2024.06.02.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 01:46:24 -0700 (PDT)
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
Subject: [PATCH V2] drm/tegra: fix a possible null pointer dereference
Date: Sun,  2 Jun 2024 16:46:13 +0800
Message-Id: <20240602084613.220931-1-qq810974084@gmail.com>
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
mw_state should be checked to prevent possible null pointer dereference.

Fixes: b7e0b04ae450 ("drm/tegra: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
---
V2:
* In patch V2, we call __drm_atomic_helper_crtc_reset(crtc, NULL) when
state is null.
  Thanks to Thierry Reding for helpful suggestion.
---
 drivers/gpu/drm/tegra/dc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index be61c9d1a4f0..afa7c269c29a 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1388,7 +1388,10 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
 	if (crtc->state)
 		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
 
-	__drm_atomic_helper_crtc_reset(crtc, &state->base);
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
+	else
+		__drm_atomic_helper_crtc_reset(crtc, NULL);
 }
 
 static struct drm_crtc_state *
-- 
2.34.1


Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2401F3749E8
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978940; cv=none; b=UN1NHGYJwXEQPggxm6h2HlLKYR0nULFyDqZRflib1+emEag6MYzsnkGA6qVfhUZBRlOAt/7ulvDg77KamkLs9pikywh6i0toMXy1t2FDJ8bBsAqQv2eOmiotTq7olLH4jR2/KW9g0vLEqqhTclE7IRO/ZYpc2U6aF1UdoKLpYr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978940; c=relaxed/simple;
	bh=SMcDrXDqlMLMSWItZhzONWpiQQwJGuLMdSYPsacLrYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LuAl9+ZGYz3p8O1M+zfw8FRgv/So3KDM2xMbM88ULIpQ64BekAEil/AeSKvpfeF2t+I+rZvHj47UHTBDhkpQDIIRXd/hiAyI/DgBPLaXRftGG91bBCIiypNcyNCbA4ToUZT3dTIvNHquSHnTE9JBltHFZ1TRtibOL5RLdC92t7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoJoQddb; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoJoQddb"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469d249c4so2375831b3a.2
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 01:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978938; x=1790583738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oroj33Lk2vXbfhyXWgQGSCksQ6cUFJmkYowA5JxOAlU=;
        b=RoJoQddb4uchlqXHykM7A5DA0hHgsTQxd6w3ppr/vHUbNXoFw6RvEFmU0xDeDW28wB
         R0+7U/fNHLOeWkyEtHKArLnGGGD6TJ3Tu/7O673l97T3gbpCM9aYp/TqUA56qHb9zoWH
         8mHTJFHqhsTgf84LMxdaZR5vFEW+Y+a5GGMufMx+/130kZ2JO8ASA3SV0+1FhbnWrVcT
         Yf/fs+zlxwPQNDKqveOLoz3urLEpj5LyUkQX3PIF6YDhNDsMlLegNhNhJtHDi563cDPn
         E3affXEMOWeUfNQBX/zfXJnoo/G2MdoevDdY89a0wzLy12rHaDOEIx6aC7s1lgWGd57S
         VDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978938; x=1790583738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oroj33Lk2vXbfhyXWgQGSCksQ6cUFJmkYowA5JxOAlU=;
        b=wJ6lyMEKQh4+mu/51CwwtIF/Ky9YlNzm6E/hajky9JeUzDLIYSS6pNXjw/DFZHd2OD
         l8PmZefDjG6qLrUOAyArEtmFFoz5QSdB04rToCkUQ86Ea5dNoTnHNl51Qi7VrTfAIypN
         IDpraJ3+zLjh/1YVEZjOVKqXSkJYTMauT78ZBPLOI+2Tt0nqqmcH2I/uvey/H6mXIsWp
         obbanllBiO7eyWtLl71GGxH148n2dWau7GZTK8CEmDNBN82HOPs08lIFccbO62cb0ql0
         zOoj/qTth2sTUkYaxGmpyKj6/HMcdNXc6v98VvvWduQglwb24Za6mCVJiDSKHWKt527v
         yqZg==
X-Forwarded-Encrypted: i=1; AKwUvBz415lvheNFkXaSGOuoV/RacYVI1RvxygJ3rYNtScjyez+fbxsXTtpA3KHJwHV2J9KE7OlP5FHifTV5Bg==@vger.kernel.org
X-Gm-Message-State: AFuF++mVNa/QPNoH6pdkDMCUKhvZpMj1UA7b0FSubnagLNnWNphQObar
	58DI/4+bqYsnCLJ3+km4yszKZnuTS8fEIajLea2M0y+qqo4XFSo2oecC
X-Gm-Gg: AYBFou0TElCF+hZfmufbRFpIyvqYqIb68P6JBDUnIdKYe+IJWMhA6fZ/Z1Olo0s3UQ4
	3ojhUjWEjRxoGWet02ZxcnCCr1vavdPmaMwwXz1w4rMVT0kbV54eJ41VDA+gQgYDrxHwn3TODuK
	A3uAmmYKL6dTm9CJ1zvDA9quWqQRU/vU4mgWRaU4pedlQ4QdZIipM4w2LQ8hR6CrN81LRhEOKcu
	8B+BCId4pr2nBTT5BP1x0DDbqRvV93Z5v33mkEYsQ4Yk21CPnULfUBnflSbq/FMwFNUC7p9IKC8
	9rYX0mvDAixrjVBr++nech1/kmfV/fVu/jOdDtzIh1YuNv59CbM+G+8HtplkN2shcDPkcoTzsRZ
	nRfPxHm+EKceSJOn/nHcGrsOpD2q33Ns3OHRsM1IICKymQAejEUSDbCzHLCmj5fBRNatsvQ6mFc
	Ayu35F8e8Xavz0qj+YepAHqiPKavip/lMPVxvdnhd2KmRM24iT6HqGn2CvtexUv20uNg==
X-Received: by 2002:a05:6a00:893:b0:871:9e1b:8a75 with SMTP id d2e1a72fcca58-874dd7f8ab2mr13461980b3a.20.1789978938500;
        Mon, 21 Sep 2026 01:22:18 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa104197sm2861748b3a.45.2026.09.21.01.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:22:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ulf Hansson <ulfh@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] gpu: host1x: fix runtime PM reference leak on remove
Date: Mon, 21 Sep 2026 16:22:06 +0800
Message-ID: <20260921082206.234421-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

host1x_probe() calls pm_runtime_resume_and_get() and intentionally keeps
the runtime PM usage reference for the lifetime of the driver because
host1x is not yet ready for dynamic runtime PM.

The probe error path drops this reference with
pm_runtime_put_sync_suspend(), but the remove path only calls
pm_runtime_force_suspend().

pm_runtime_force_suspend() disables runtime PM and invokes the runtime
suspend callback when necessary, but it does not decrement the runtime
PM usage counter. As a result, the reference acquired by
pm_runtime_resume_and_get() remains held after the driver is unbound.
Repeated bind and unbind cycles can therefore leave the runtime PM
usage counter increasingly unbalanced.

Drop the usage reference with pm_runtime_put_sync_suspend() before
forcing the device into suspend during removal.

This issue was found by manual code inspection.

Fixes: 6b6776e2ab8a ("gpu: host1x: Add initial runtime PM and OPP support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Replace pm_runtime_force_suspend() with pm_runtime_disable() after
    dropping the runtime PM usage reference, as suggested by Mikko Perttunen.

 drivers/gpu/host1x/dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d2c64728f804..123143b2836b 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -729,7 +729,8 @@ static void host1x_remove(struct platform_device *pdev)
 	host1x_unregister(host);
 	host1x_debug_deinit(host);
 
-	pm_runtime_force_suspend(&pdev->dev);
+	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
-- 
2.43.0


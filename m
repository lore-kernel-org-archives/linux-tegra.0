Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C62B3CCA19
	for <linux-tegra@vger.kernel.org>; Sat,  8 Aug 2026 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786198119; cv=none; b=o9dvIMobiGjr52mEUeajUp35ngOK4L5hrxLe9xxBTOjE52OcZdqJunlK8m5prvOXNVDggZ9W9MQ3OaRu+0fADtnY8MWHpI6y8ZBOOI/OMwHPR6+rpYcCq831Cuo9grDF/gqMqnPMO5qKKeJeGocgMgky7bexFd/qbJ8AUOsZ2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786198119; c=relaxed/simple;
	bh=fnNxW1I/REbahCjJ9LTDaUeOX4f0/4BYz879y6yEeJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ty3Rt4eSKP+KwHTSSdpZgsHDTGdegoZYPcFgSBbNJcz4TNwO5PYoGLqlSuUZqdmQ1fmZLWqKB5kWK0g4wm3H7CxzFgroJXqiUeOOdqcTcdYjW3j0TIB4oaP4xP9CcHmcoxUg31DY1UvjfXObP+6k/B0pTwKz83EY7ma0wvDFUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PP2tP0os; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PP2tP0os"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so321484a12.2
        for <linux-tegra@vger.kernel.org>; Sat, 08 Aug 2026 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786198117; x=1786802917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xpXkiS1syNfL3SE9V9W6WDFdug7+uucLTLZ+bvyu9mM=;
        b=PP2tP0osAWHg1ag4stjurym51701d5kPHDlwXNgArFtpkZ07MfO/kCppfUcvgzL1Ae
         5yBu5iIovzXoeBbHKutror5qMQm88Xb9DbuVSBiynj40fVEMmntDlVU3iTA/m5FKOO3e
         NRBDF5pEwLikz75NutOl37yX04cZI8K/ieItIoVoAJWCTbpOrYtotEzVP6Zkt+LZit4K
         H2D3sn1JL4ae3+/OXh9vWOidJpmD+VLnKS22Zp9RMydubKIjKxu9lheXsj/P0O9sy0s0
         KRvksiaELcgDtJB7Q8mKrB3qQl59/cs97b3U2YN/Nj4whISejpX29S6bcPUoKEvoB4jy
         l+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786198117; x=1786802917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpXkiS1syNfL3SE9V9W6WDFdug7+uucLTLZ+bvyu9mM=;
        b=dXi57GWwSUEMwhid4opzD7I9dpmKnhjItpjrWL2BVepX/KABrfB2l2rS1woHm5CNYt
         HDJVIUbMMmbitTx/vz8w/aDYrjJvHREJpjibwyypdLUtPillhWFZXqC1ueGnw6z9grCi
         kkgDzDdfVU3fvkuPS/aDyhGVlY8yw5CEr4ZwZUAS2YZcqY0CZb3mzR6NX5B3DdqGeeSc
         u+mhPHiLSwxaQp6q4e1nyrHlMnormfWGKB1f99cymjQDDDL0Qmvy4iGlAESM5z6aXrka
         Ab/IJW5HlEz2U1wz77MQGyQEAPwEggIg9dXc74IKU5mc7D/lRhXne7DRy0TYQvWb6hcp
         m7Hg==
X-Forwarded-Encrypted: i=1; AHgh+RpMIuxzNuJBg+WtzyJk20bZujjeYqhUn1a0VH2qhjTtP4MYOP0PnB4JsZHFFC6j67NCW+4fmsShh89B1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNhhH0X174uCmbm9uOvgc1zuHDC7nR0dNcKTnrSEsH3ftVMTPQ
	mqzlSZCrMn3uR5cQ94mfG38fZbNxJiZekI5UTo5mifKpDT36damX0Svr
X-Gm-Gg: AR+sD11wJCNtK/jnq8qIvrwZaK/Ab/mLJLHVkjwIzY+379tF5xDkqkhgHl4WE7w1gKh
	oZyFiIEa/U/uswRkHjLxC9mTpBpVL3Nm+ZJfw3TKYZsuUIUBL3ZWxXFZ5W6JS4wTQC+LgAByC6P
	2fjvdhIT5wtDFb4cF7lEUKnZEsJIvZCH1MnAbEhPZ0WMkiDr8nt/0d8elwE7hCsz9SzWfwJrt2s
	z9+CG1SKmleucZAEZyYe/9PQE9QktbY81yOJX9ikqO9uYuWC0FGP2QWQ4HGIuze8bNMbIR7gMZ3
	+u5ydu6BlHMlWnwh3h6rwjAcySV8cysX6zTlo2PyQHJGHN9vvycBIWQ2nUagz/xVgt+SX5TBZvm
	mRWoAJZwMEO2GAVb/jPJbRwfQ4826pBhV4v2iLi3eEZTJGchG7O4Vt3Ydpye2+Sgmw/1tr4h3jo
	WwmYn22CGBMICIN3DPPPwJ+VmAF0nO2X4CZdm1vmqUyu0=
X-Received: by 2002:a05:6a21:7007:b0:3b4:870e:6f44 with SMTP id adf61e73a8af0-3cb85ffca47mr41360296637.35.1786198117342;
        Sat, 08 Aug 2026 07:08:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af992sm1913171a12.14.2026.08.08.07.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:08:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/tegra: gr2d: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 22:06:22 +0800
Message-ID: <20260808140622.2887873-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gr2d_probe() calls pm_runtime_use_autosuspend(), but gr2d_remove()
does not call the matching pm_runtime_dont_use_autosuspend() during
teardown.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() call to the driver
remove path.

This issue was found by manual code inspection.

Fixes: ace01e2af387 ("drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 892e3450b281..95e8a14a9648 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -296,6 +296,7 @@ static void gr2d_remove(struct platform_device *pdev)
 {
 	struct gr2d *gr2d = platform_get_drvdata(pdev);
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	host1x_client_unregister(&gr2d->client.base);
 }
-- 
2.43.0


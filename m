Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C322F2DCF57
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776014686; cv=none; b=ifsQLmJsf/I/JE6E9teJUz0934YIlx7mwv9RRAjK/9qYNOMm/hvknXk/Fa14hNEXVrJJ/8H1+Efc0sobloJsjCUcFnxTGpVuINc6w34AnYJBTwXLAOBJPwi2JvgEVMb8oP2HDDx7r8zV5xFPKPmxWv2dFU4sCDrkEhvFqUwlcYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776014686; c=relaxed/simple;
	bh=LnP9ZkhnHG1MxUGh8a2gUL2fys5g5ptWYukCv+33FPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f5zbhSl/eSChli6Yi3tf4yQtGnpIxmrVsVfhIK4YT+Y/P4Jr5fNit6HCEDlUXatZwzrw6npSGXgT2q1uP38pjWOrmezg4SIRRQ5ALrLOOJPCoWFadeW/Tjc+khePJtBsdMYq3m8MapC6UyLnHj/A1wjwAjeLEzmXhd0wwMwsHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XswwVaKB; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XswwVaKB"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3825383eec.1
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776014685; x=1776619485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqDxjqHmcb6xKt99g2eKfC+2hdNdKPlT4sR9OKTs9UI=;
        b=XswwVaKBF5ikLN8U177gdxeyf2cBRToDzgzNNvzCdkJMIdncP8ba3xJAdvLmLSVmYY
         eyViX+1iC9YwTe4pEsC+t5Ud5FlQz2NS1l+/O9MSHV1vGqsBfWHXN8dQJc+fxc24k4xR
         y4O4q3pO9SD8rSwsVU7Aw2jPZdZEZVZHnVCVNGLSB8jWWSo3csMZDqiT+DMikF6vEYAc
         DvjsbEFveussxqL0KPqEbySI/wpw0jAcE+fwNmPmoNiktCpY0VIKU4ZXdmDpEZrhg+xs
         H6n4REOXqhcJFj8Ga1YQ7LCvIQzPngLEBC2tcQgyugmPM8t5CouPf2du+6ucsmeCbCTo
         2mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776014685; x=1776619485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqDxjqHmcb6xKt99g2eKfC+2hdNdKPlT4sR9OKTs9UI=;
        b=Ekry5Qhqp6zH8mjbT1ktB06Kf/94NrFBpnGpEm2ZFHwLNHBdiBqrivSKUA+70/YglB
         Q9KdzS1P8S0cfxrIjPbQYh7xzldR4fZAkuGUHxxHvQHeVvg8HViqY5jb92EhshMxsQZu
         QWvcI+92O7Gd/hkfFlMjGfzLFZQZLmYQp5CndmyYWsreZyr/LSgFWtTvb4Ok6T1gGxPo
         AtvXcgApzsLpnDZBgmqU+fmTap+9WSfNIeSpTBgc+AkH7QMeIpYmSv/WK+6uNxiMG2XL
         IK1AbPta7B96w5/6aq827fpgJy+VVAN1A3tqrmZKrHBqc5n86C+CGYTFX/vpfOi/mH7J
         LAFw==
X-Forwarded-Encrypted: i=1; AFNElJ/bbaW2FDMm3d50/c6qhABmfLvke6MHYei6GqjgnsNHAuq4Gsq61FYLmr8T3X4yNhu3VcYCHsHJRobXlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBzAyBUYFH9iExkyCtK7dVnuu6gVb4gHBWWxQ3r+0Lrfz/51Jj
	2+cD+ZZZH5hVacxChncqAp5FsGFyeoFz+DICzZvP8wLxF0dq658mCGlw
X-Gm-Gg: AeBDieulqzvlMiNb4AyCven013ZnwHKLfc/q6t6HvOMmkuoQVkqsNOhGGE9LYi11Rx1
	FOSidAkmbXKyVpQVYwKzxEfzV60e/xWw2eUZZOM7UiatKIuY+xrRi0cwT0UAkU/lROFgA8zS45O
	joK9o9QE8emNsLZNKcUHcIDbn4za3PYSvDLMuZauSsP0GEKCZTSCtr/WOc/c+5MAnivHpX/sA6G
	5nbG2KR58nE9ug3ixria5OeYAiUPXywYvT396J9y0ILvfPeR20Z6Vyu8fo2yu43ukSrF6HkUXe8
	f9iATf4g/nP6ntDq+UVhT/mE9vJfkHYNvpJoYJwhslHp/knj1DmS3+8eZPGyTQox8Kom1vV2UcR
	8zqDMKEK3MEVVGTQwiKKXtK/N+8D73h8+FzEHf0CRx7LZmBHWKv0FvkpKDTnNK5H1ZUDrvwRv4m
	g1uqgLAd3vULjJtGUe4Z2xVOKvAMql1pVQAvsI0hTiW8+5XGlZ/02ssWc=
X-Received: by 2002:a05:7300:dc88:b0:2d8:c484:6b6c with SMTP id 5a478bee46e88-2d8c4846f3cmr799968eec.25.1776014684774;
        Sun, 12 Apr 2026 10:24:44 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm5618864eec.19.2026.04.12.10.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:24:44 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: tegra210: remove redundant NULL check in dequeue_buf_done
Date: Sun, 12 Apr 2026 17:24:16 +0000
Message-Id: <20260412172416.33052-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

list_first_entry() does not returns NULL when the list is known to be
non-empty. The NULL check before list_del_init() is therefore
redundant.

Remove the unnecessary check.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..a6606768fa03 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -362,8 +362,7 @@ dequeue_buf_done(struct tegra_vi_channel *chan)
 
 	buf = list_first_entry(&chan->done,
 			       struct tegra_channel_buffer, queue);
-	if (buf)
-		list_del_init(&buf->queue);
+	list_del_init(&buf->queue);
 	spin_unlock(&chan->done_lock);
 
 	return buf;
-- 
2.34.1


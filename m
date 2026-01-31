Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D3238C1A
	for <linux-tegra@vger.kernel.org>; Sat, 31 Jan 2026 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769863172; cv=none; b=PLDqVvRCUoeaOBwfXomKJynOCMJGyd6S3UrlR9Hn2y8lG78/0RVO9ToEL3XqITwnbThwr5o/oHL+MeZRkDYQkYswx65utMKiYsdHry11qfHvuD+Mb6LVeoyWwY0XWy8Poh7dHSyn9qqimjc7rbmqJIrB2yV+DQeQM/QV6MGviQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769863172; c=relaxed/simple;
	bh=DhOzUYBvhP21RBha4U7veeSKA3yJdSy2oL/KOuibxEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0Pt0w3DUkR6Cqi5kaPv02h4qO7fAIBioFMC93CeLDoX+imrVtK+pqK9mXewBeNT3cscxsC7kFPkEkasBiSfOnpJMydixdzqVyRZY8Rdr/FOHzyC/3+uA+uqSmeVZuhRGCZCdIHcJjJP9pnrswxveAf/D4yAQ8QZQGKcqQhyrs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKJUABQo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKJUABQo"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fbc305882so1916457f8f.0
        for <linux-tegra@vger.kernel.org>; Sat, 31 Jan 2026 04:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769863169; x=1770467969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yC113ZlUkaXlTWmnQ1ckRTZJaeNcM82A2CvH4lSBOmM=;
        b=fKJUABQo6BxtMqZeoHYtBBz6xz0h5akvutH5Ydu7aBj6+DxzVfcV+WmIOTW8L9YMU1
         L39LZjTLVPria5RZC02M76JlZ6JOlDM0qA8UIXmwQd1GcsEQWfV8m1nV+tHx432LEe0F
         O6yGMzCC6VInKVgbARI7eXaMYwuykkGITMpqIB9m98AAdy2Q0Zppn4jx+TyYhTOIbV1Y
         qQYBJuPak1xUhNVdj1H4YTrbY1cmt8Q1aerOBWj4bbDE2+sBI+n5Vj4M1NjD1E9uTFgz
         qGue5GgbXJgOdcUbK/VyMjnB8Ph67ER5DyoDMCbR6OoTElBlScvIiOG7eqUZbBYpRdD2
         C8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769863169; x=1770467969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yC113ZlUkaXlTWmnQ1ckRTZJaeNcM82A2CvH4lSBOmM=;
        b=XSVBhWGJd2+zxk3bDjJQ02w37fGNjNu+WvjxykZQrbmzUqBzSyef2idl3CWKT5zDLx
         r3Tbn00PwboCVgU5yRmrDo7MDMdt3UpEM1UjgEViCF5ZogIHoXM4qk/6hhQ6U0gThpMr
         IpIIMAYsGqCH0epAATeeA3xbrJL9eUwtFvnZg7tnDwrrY+ifOIKg6EOyNWP09AnNCVmr
         WTAECbVxVTFJsZcM6mxqtpV/SCIMtmT70n23ZXD7TPV86dphWSOdfUg4RZHTMRSWmLk1
         mN+Rr66QsWlYReFf49TeD+0sF3bji3WykRY5EaTprf6ubLBCIPuiYpDvuNlx9bG5jRXT
         wxcw==
X-Forwarded-Encrypted: i=1; AJvYcCWn730wR6uDMiC3Uh/dCc8zmRR5RZoOSW8viP9LypfSqz1+ORM5W20+tv3L7r0aiusz8RfS9LvxZ+E3Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQj1SiEYEgDK7aI7AeXA2gZNkEZBl5tyadqyzErRK5oZnQrLBU
	WVIio7iu/ErAyA8+3NBiLo2bD/AxzPEisAkk6A3iUATPoJkcZ1e2/Py4
X-Gm-Gg: AZuq6aKxohPNXZyyyMWiSnmvOtOmeg8M2rQRuJmYh14T4VxP+wtc6O9Y7tZHR2KidXQ
	xrHGVsjClayrKylnpwbNxZ+GU5h04Rf3tqyWgVhnrPvYY+qAEoiXgr40FZKJHDZ07RyrsXsM7p/
	MJoKIrxCkoZX6csOj+CoiOkcPmYK0SGgu2/uPgT3qfmTbY+8hxvnN3kuVxv9F4cue8QQDsQCmri
	qep3RLsHuUvwa0mWwD3+FWL9b2TbabaRLYGWb4wnoJld6DsZIe4Baqimw6aw9q+vbJJAzWbDySM
	H6GBS3OuwNZQpTjnpXP8yUKiwW49NA9y9DUSzD5qzf+oL6q0NvkZBjGagVZvUkqRTJ1ckyrjwLL
	xbyE7mLqpxAZyxv8r2OhopUi5FrKzmsD7of9eAgjxAyiQzka0SNflAm7lgRaQczsqVXqpPj6EKR
	XwMJ4J2o+EpWn9bepvVNm9UrFLRg==
X-Received: by 2002:a05:6000:2dc9:b0:435:9d70:f2a2 with SMTP id ffacd0b85a97d-435f3a880edmr9047652f8f.25.1769863169259;
        Sat, 31 Jan 2026 04:39:29 -0800 (PST)
Received: from localhost.localdomain ([196.235.54.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e474csm28819509f8f.2.2026.01.31.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 04:39:28 -0800 (PST)
From: Salah Triki <salah.triki@gmail.com>
To: JC Kuo <jckuo@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] phy: tegra: xusb: fix wrong cleanup function in tegra_xusb_pad_init()
Date: Sat, 31 Jan 2026 13:39:17 +0100
Message-ID: <20260131123917.258229-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `tegra_xusb_pad_init()`, the code currently calls `device_unregister()`
if `dev_set_name()` or `device_add()` fails. This is technically incorrect.

`device_unregister()` is a combination of `device_del()` and `put_device()`
Calling `device_del()` is only valid if the device has been successfully
added to the system via `device_add()`. If `device_add()` fails or has not
been called yet, we must only use `put_device()` to drop the reference
count initialized by `device_initialize()`.

Fix this by calling `put_device()` instead of `device_unregister()` in the
error path.

Fixes: 53d2a715c2403 ("phy: Add Tegra XUSB pad controller support")

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index c89df95aa6ca..2db5586401e5 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -180,7 +180,7 @@ int tegra_xusb_pad_init(struct tegra_xusb_pad *pad,
 	return 0;
 
 unregister:
-	device_unregister(&pad->dev);
+	put_device(&pad->dev);
 	return err;
 }
 
-- 
2.43.0


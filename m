Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4AA200110
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695713; cv=none; b=iRigVG+kb34E8pAKgUJUU85RV34EZ7eu1BVHrUD1quwAe0/ULraoTb6nd0Rgp/omayA0dVptuPZEgZAP5GC8xnZrQRjooBKafwJY/l8ezjRJYJ3fLTNejl8SErNaou25bXWCqFIoL73MpmkmFVadpKgwNlhDufUTQdboYAK9KWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695713; c=relaxed/simple;
	bh=FJE/EQ9TA3ouqfr1NNxRs9ZTfKeUIT++5v9OKtGST8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BO474JYuObNbrhIBy5lqle26O//mBFKoNnd3UiyLdepGjCHnxBcaSC6BRaEX82bOTsGJiyLOOyLEWdBLzdMRYhcqwAq2seA2fO+Nzvud4sHvPXHhdrwTO2QS6SPwoViQA5cEXv9LsbiGcPQa/ZF/NvZq/LnZDKCT1ZulLCKBq1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSmi7G0x; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSmi7G0x"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so8826851fa.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 08:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783695710; x=1784300510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUKQVag9IzE4H7QHQpL9vh5Ulz0DkhvqjWN5WTc39J4=;
        b=YSmi7G0xTi1MSUPYfD3cMFkOKYTyMGyHO0NDV44JvmM6UG7bhVG3Xwe8berE5gh2Mp
         nKuBDfY4OGIz+2yQjbhFtf2zu9Zvla85HdhOrkw3sxfl+I/ye9rbuYw9VpwfUoTlp7nJ
         imEik2G0Dh/eGRaNzTZCjJ3V7gJ5QRcAZvHavyvOCFjSbB702/7e+K58+iVG2dQK35Wi
         nN7M6dtaHBd+aQeQo3XTvluffikPA8okZuInIIRqMsRtf0/JSmRWL9HaMM/wpVIkAsSj
         t3qsQ6kH2Nut+E30FhC8c0X7I10woeB8L25OIGvd5x/oN8HTRTUtiVd6vtA2GwyxpUL2
         Eepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783695710; x=1784300510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUKQVag9IzE4H7QHQpL9vh5Ulz0DkhvqjWN5WTc39J4=;
        b=H+0+T33eMHdc8Yi88SWlv3O0TQzwefo0OVtv0dnGhpNTuFpcx1vxioRacxBfVNF7FX
         HCnGlaC3AEfnzDLa8JiwE8NgdJwcBi+ISXr2coK/GUjbWGIhn3mZMmIXaRhAtz/b0MGT
         EzAnxl7MJgdC+KAxEmg1YLKQbkIAXR2Dhp5U0lpg8J8OvSqhui0G6Hz21N+NA1aMBiLb
         Gm8ox6CUPdOVanTXm7HGkd+m4nrCqB5agQrru32fYtydOw3MFM51K947DSymBrQWDC+U
         tBLJbbtcF8h6YJDgvqSLEMlVX7qdA160h8+SdpDVegbJcYc/hpdEM/Zd7aALOyfIVrDZ
         qAWA==
X-Forwarded-Encrypted: i=1; AHgh+RqQxya8FoFF5wu1LxyLWFO2GxzigimXjikrP6/uLsygyDxHEs0YTjl/NdOBQnl7DMnQ460JptzfZDEhFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyImLhu7K4LG/mvBJpyJ4OiKX4QjY1IZ4yA5+4n4wggYDGTe/hR
	usKwj7l4kpZxNUYr6lAX/d7BIB29pyv3kJ0xhEKDZH92S6Ebym6bDtG4
X-Gm-Gg: AfdE7cmcEzVBlIWOZj/DaeCm0/5Z0GKjI2sFI9L3cSc0aVxcsfzlSnswd7TIqzgKDfz
	u5mZtHscj79Y7bGmrKPCS/TCFMQ7qyEH7RSz9YpjQUKIHgKUFop7zkxSzfBKjOlGUfV2Fd2jcOI
	SyJMgm/0/xQ9waARUUIltiGIThPdO4PTNyAX1eAqKEPKmPdN4IvEBWd9pKoiyHCHD0/5jG8q1tN
	8o2xJ3vz2nDw3DnOA4RHiwm84pOuZ38OjpbCtyaxvjoBRHWFZ2rIqIylnpS2LlWeh1Dg24RTorS
	Nxp34eUKvPnd3TzYCuMZiu9hrHBR7pWBSkjOjUhYnTVfPSqGUo9TSd2CQLCbZQniLAnpq7Y1oTK
	O7fnXnKy1kdftxxQwDITz6tyBJs6GVUA6ATES33gukyPaTrjYcvd+yjqk+vtunB/fyNlfWPPSYS
	D9UM07ShZUzQgGuzieX7Uz/ukyjGfoqMZMcEyiDdsnafsqn5urYOYgxkfD6F9G372ccn0AkGLHc
	Gtle0s=
X-Received: by 2002:a2e:a912:0:b0:39a:eb5a:d790 with SMTP id 38308e7fff4ca-39c7995f790mr21390521fa.35.1783695709661;
        Fri, 10 Jul 2026 08:01:49 -0700 (PDT)
Received: from debian.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b8564bsm11054021fa.20.2026.07.10.08.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 08:01:49 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] staging: nvec: nvec_power: use GFP_KERNEL in probe()
Date: Fri, 10 Jul 2026 18:01:13 +0300
Message-ID: <20260710150113.3041-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvec_power_probe() calls devm_kzalloc() with GFP_NOWAIT, which
disables direct reclaim and is meant for atomic context. probe()
runs in normal process context and may sleep, so this needlessly
risks a spurious -ENOMEM under memory pressure instead of just
waiting for reclaim like every other probe() allocation does.

nvec.c's own tegra_nvec_probe() already uses GFP_KERNEL for the
identical pattern, confirming this is an oversight, not intentional.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fde..c514d51a9 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -377,7 +377,7 @@ static int nvec_power_probe(struct platform_device *pdev)
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
 	struct power_supply_config psy_cfg = {};
 
-	power = devm_kzalloc(&pdev->dev, sizeof(struct nvec_power), GFP_NOWAIT);
+	power = devm_kzalloc(&pdev->dev, sizeof(struct nvec_power), GFP_KERNEL);
 	if (!power)
 		return -ENOMEM;
 
-- 
2.47.3


Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955B737C907
	for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2026 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776341375; cv=none; b=hH63m3UG3Kn7Ra2+DqGD9ab0HuQNLxhGbUtaSPJc/4x9IqOgOBKcqd8q80qlTsb4KrcFCZ/I13aRXe5b2Fu+QN5W9cV1pIrWxWYC80STza57Sd0QFWCZz6O9bV5NnxdYHWy2quneKcCVUx0rXPKAN2GCBMQcqqGSwXDLmYYYY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776341375; c=relaxed/simple;
	bh=knUH34kPAdl0Glqyp0IYrLw7Xc3rugSSyGH/rGCenqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Kgj8ZjoQaUs1L/B5TpzmeueLeK1eMwskk1zoIMxW2+J4zWmp40X2NtlFFmjjA8NkLN65IRMjCbhW74XnKR+8rQ4XwEtE66mavq5B6tNfe92Iv4gyEaXVNRHhGWJex2+Nr044EVmNdF/dx/U67mtBJUWiO7lg0QqarzwI5gTVA7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cplZMRIY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cplZMRIY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c79662668bbso261539a12.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2026 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776341373; x=1776946173; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8l44xHaLOx+xTMPQRoRD77brBCTj78T5PJ1Dys9zxMU=;
        b=cplZMRIYnZWgs5WYg4ul6/69W6whZand3yF8bYY8pa28BQoXh4e8RacslSjzMlZTH9
         uawGXarkqfJ+ql/L19r1b3GXQQySryFHlKR9++AzBHKTur/vf3Hi1ctr1ABfvr9Ak21r
         xNAaGz/cHhbi6+9gJplvuseVMNTWX1nSCUHIJ5T/DLVSfUsDTRXV6bfXxK+i6BXHcR7r
         JTUrsJ/U+Z2MtoSWPe0g4ASkoayUqcHBygC+m7yc93gYklmhsf0al0RbOi/4O2JY4pkA
         7DrQh5zit//f5u1keH1ZzedtGghwPMbfIE8Iyrv/8IDReNG73fvsb106MiEu4h7xBWkp
         K77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776341373; x=1776946173;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8l44xHaLOx+xTMPQRoRD77brBCTj78T5PJ1Dys9zxMU=;
        b=sItDE3KC4fcDDhinV9+QWC68BK7o3Ra/PlWaHgpTIhwTQhH+9qUTriCchIpd339U6A
         bZ0Ms0rtSGduQReDit8KP5DVGvi30QIhKp9ycec+mzMHvJIaAr2cDIqMVMr+s8zxwOCl
         A6GMJEHzVcSH+NJYqtB0Xx59D6zgw2h3382tmpA1GZngBQX+RgugUq5CfCStfXv3YmWi
         iPlZlfy5L2orU+W5PEG79gp7n6sVuYc0ufx6vnUdMPRf84gqSBkTQOvyH4OBEH9N9aqE
         2X9+lVOvNr8xHsb7UERLVvZXKtr4wwGdzb7kLqwl9Uzi0uowMj8xMOLCx5nEB2BUVOLI
         6V3g==
X-Forwarded-Encrypted: i=1; AFNElJ9runM0pXJUK03R0Kid1IfOFLuKaDg9D8DKdjdfVmvLIQsD7rImbkOM4hFto4mCScqX3NkxxVvOqqXkGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7h7W/mPKhXSyiDjPf0S9zvsF8H0EyEkl75vMut532YFDmBzb+
	2E32ixayqqYd900Sybol478fPq3YnDCqNk69yqpu60otCHHGU+fsiMxs
X-Gm-Gg: AeBDieu3A0uUzDgLWJ3bwII45k0YuJv1XtPGatmQ/GzKc6E3yG1C/aZwc5s3uW8rMze
	zFAvAjbKT/51hVmzozg5g5LH91M7Jof6YI7vR5/NxxksO9xFOS8KG/tMKV7GJjHOyKnvj/ffvqR
	TbLkTTuNrncZxn7YoUZlu5HBNAhKz8l33r69vlmzlmeuQuP3mHY4UHcEsEaIWYm5yWhhyMct7cE
	VFTke05dMeSDSMjylKocnGGnNslWAvT/5nkOupFQm/pXNMyAnr/7RYzVcVrqwAn28KGLSlhjiSx
	MkuQTREbcCTw20ZFXqY0r466xnRa1KXF6YN+F156Mt2+JWlbY9kn6hUE3z7GhdbDBJ0GXbmVPkC
	LRZr7op6K9CbtDAIBI76+yNrzE4gkno3eHoOhubo++AfxB66gnuowosGSP2njyOqqI80YOINq4z
	NXp/QqlLUx01cTSK9LTkiqohkkNenCAN0gwkiBX+LS9xVRJSz6q8lqDy50Okmm5eIP8JmXDL3Vg
	6qWygn2P3BZiEVvadcsRyCCyzfaDS4=
X-Received: by 2002:a05:6300:6b08:b0:3a0:129a:973f with SMTP id adf61e73a8af0-3a0129a9ae6mr15918942637.52.1776341372798;
        Thu, 16 Apr 2026 05:09:32 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581d6341sm4245089a12.30.2026.04.16.05.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:09:32 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 16 Apr 2026 20:09:29 +0800
Subject: [PATCH] gpu: host1x: mipi: Fix device_node reference leak in
 tegra_mipi_request()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-mipi-v1-1-9c027175abdf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHjR4GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3dzMgkxdi5S0JOPkZDMT81QTJaDSgqLUtMwKsDHRsbW1ALbbWvN
 WAAAA
X-Change-ID: 20260416-mipi-8dfb3cc647e4
To: Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776341371; l=1103;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=knUH34kPAdl0Glqyp0IYrLw7Xc3rugSSyGH/rGCenqQ=;
 b=ufNI0wiXlc4OTOmmF0jxOLfRsiv8Bi35YYGkHIae5wkX/CW+StNB3w6KThINmGtHYzUbUOplE
 oltVs94d89BCzlnacTuP+TWPLL1gsEx0ZPZM0QE7qiWj8nQ0EB6728V
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

In tegra_mipi_request(), when provider.np is not equal with args.np, it
returns without calling of_node_put(args.np), causing a reference leak.

Convert to use the existing goto out pattern to ensure proper cleanup.

Fixes: 767598d447aa ("gpu: host1x: mipi: Update tegra_mipi_request() to be node based")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/gpu/host1x/mipi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 01513b775d89..988681423981 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -114,8 +114,10 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 	if (err < 0)
 		return ERR_PTR(err);
 
-	if (provider.np != args.np)
-		return ERR_PTR(-ENODEV);
+	if (provider.np != args.np) {
+		err = -ENODEV;
+		goto out;
+	}
 
 	mipidev = kzalloc_obj(*mipidev);
 	if (!mipidev) {

---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-mipi-8dfb3cc647e4

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


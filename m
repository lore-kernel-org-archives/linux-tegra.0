Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3956729D27D
	for <linux-tegra@vger.kernel.org>; Sun,  6 Sep 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700600; cv=none; b=Gm0zGgOkKNZYPVUj3GxAQdPTAISk8F0PfhvqoTV4stgsyO5ALcgBUIAv1y5wBZo+F08dxFmhvJPuYjZMs3D2jl7RWQFP3g3IgRnvDNhMvYSmx7XbEjNze0PIdpeh+Go5cde7EGHw+wi6yxsz0NlRqjzW3gFk5oyqosT3rReUJIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700600; c=relaxed/simple;
	bh=E/IRwFRn51f4v9NPGY7W25i+STprd8eEIq1SkiAi3xA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhEliPlRwfhPdauCaSZWyGLwzPOaZTp9XVu/WQC74rh06y2O0H/MK4qTxlmP7GieAd8B9wGMcLd2xECjDWYAH27ZL7Q4dFYJbgBCM9m50nGiXIJPhM14xuOs4nPKpyaXE1GhFLiRyl/i/itxGYx1rGI9hwd73iCx6OqjeyQFvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfdgjYIz; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfdgjYIz"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-862815e2683so1304913b3a.2
        for <linux-tegra@vger.kernel.org>; Sun, 06 Sep 2026 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788700597; x=1789305397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKCDTYeop/ZfF12Fo5a4rL8gHC3JidNUko0dh/DrcS0=;
        b=kfdgjYIzepVmbKEjCMVJUqtiTANOktWdiU6cfLp9wrudthxSjFxExz0lImGF2bBS/F
         7IAVMXPzJTlJCiuTOEe0r9d1dSeygSVBKVOUfq8prD00yTb6R/vynTfiUxlz7GI4CCf/
         3ekdab3swLjqatLAC6QM0dFMPx2qnh95JgfGjoR1JOFsrLPBljtpyagQXVFfctHMg74U
         OIIkV0nZrI4lamFyANsjiOq5ZMuCgHmINv0wnFBrtJ6JCCGJMqLUeIwwyVxCbmc9DA4G
         iBmmb3SymN6Z3m3Tbo69cfogzPoqbU/hRh3VsJEt50ihhipoinSscDDDdX9ccnqVlIjw
         ajFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788700597; x=1789305397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKCDTYeop/ZfF12Fo5a4rL8gHC3JidNUko0dh/DrcS0=;
        b=JXL30x0fE8eUwwBR+I0OQY/Axl8kENyHnTsVtoZGk/wMjMPxsT1npfhwCQtQ2XX4mm
         1FaqnJcj+otxvm+yue6AFcoGjIUX7wYw5TFdC+F8vAqc/MuH7pTWRqN1toiizn885MMU
         XGpihvB8M3dp4se1sQYpkc2l6hepVgh9ghO9tXVbfPxnb8SpEsqCQegwG6BmoeqrFAMR
         cxnbKdp5rYXcSq/XGLKkt5pD405EMAhYYIAYn61Rr2cZPnFZ/dO/4oeIescRxoCKQEZD
         1oIaEIq614o8k4Xt3ZOxW1m1RJkpoJYrA5EQpFoZ9T7L19sNm2UXj7PTSvvmNBAklxmh
         xz5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcJUT3OF0gs5pjoSD30sc0Q7T+d66nRTcLvRyOf5+9nKNa0obtyFkd15pW5w6Tp1Knlt8mx4f2htrkhg==@vger.kernel.org
X-Gm-Message-State: AFuF++mp8FMhwC/DXnEcpJiAeuWJ0KS+ljflfZ5m6r4J8BgaES22ZtsJ
	Cn3FYdh9zeULBtSFmMTFHiYgkXQmCJQfxhwagANqdVChSkrdDWjz8KVO
X-Gm-Gg: AYBFou3QXxb2mRav4SB8+kZcwzXRQPbxY+wwVOHI2pPkf3Wze/thZk/8GBdXXyznf/e
	ADoS8EUluogGOeZfoBSOCIUDVpf2hq9rvgNj2YA0MToOZhfrrG9qlEbrfjjrm4C0pIMeK0JWnQj
	Mw1OIGXDOwnuMEaYkk4rx7bvTsrdl7jFDcHbr531oUZjMnP+JUU11Z/18EmxW9LPDbPaJ48+VV1
	QnAzqAwX3PzEsR5VdFxzIeEqTgSSplUhPKTf9+oQZcs3xqFdSzTLcEcKW0XNMftjLe7jYhKKONJ
	w4dxatkC7EJXIrcXQ0yKrjTEgb4U8YLf4TaglPXZXh26uGbb+cMI/kSStfHp+KAJEnmf9pgtd5R
	zWJpLUSOAUzBzHkOpDj/eM6wT5sgwA3sX4MVtMe38pEtxmNIp+nC11MkElIblHEhrK2aOuiT1Pv
	VGsOanx3IRRWIG+KB+Z2+kFVa1akYRgoVYu5vas6HxAEg8RAJDVrNTVRZ2Ci0P12a3r1H+IUd40
	vqqbWyZx9s/rmgJa+lbCJRK3UTGE8IKxDNPPDo=
X-Received: by 2002:a05:6a00:4145:b0:857:7384:b5f6 with SMTP id d2e1a72fcca58-8616908212emr25491708b3a.18.1788700597408;
        Sun, 06 Sep 2026 06:16:37 -0700 (PDT)
Received: from DESKTOP-PKFJL56.localdomain (36-234-53-90.dynamic-ip.hinet.net. [36.234.53.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153728c37sm3292257b3a.46.2026.09.06.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:16:36 -0700 (PDT)
From: Hank Yang <s950343@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Hank Yang <s950343@gmail.com>
Subject: [PATCH] staging: nvec: fix race between power-off callback and driver removal
Date: Sun,  6 Sep 2026 21:15:29 +0800
Message-ID: <20260906131529.11422-1-s950343@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_nvec_remove() checks pm_power_off against nvec_power_off and
then clears it in two separate steps:

	if (pm_power_off == nvec_power_off)
		pm_power_off = NULL;

If a shutdown is triggered between the check and the clear, the
system's power-off path can call nvec_power_off() while
tegra_nvec_remove() is concurrently tearing down the device (freeing
resources via mfd_remove_devices(), cancel_work_sync(), etc.),
leading to a use-after-free on nvec_power_handle.

Use cmpxchg() to make the check-and-clear atomic, closing this race
window.

Compile-tested (ARM, tegra_defconfig) only; I don't have access to
Tegra Paz00 hardware to test this at runtime.

Assisted-by: Claude:claude-sonnet-5

Signed-off-by: Hank Yang <s950343@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 41cbdfdc1da6..b9ebfdf46002 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -906,8 +906,7 @@ static void tegra_nvec_remove(struct platform_device *pdev)
 	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
 	cancel_work_sync(&nvec->rx_work);
 	cancel_work_sync(&nvec->tx_work);
-	if (pm_power_off == nvec_power_off)
-		pm_power_off = NULL;
+	cmpxchg(&pm_power_off, nvec_power_off, NULL);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.43.0


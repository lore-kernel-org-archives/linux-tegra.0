Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D8734753B
	for <linux-tegra@vger.kernel.org>; Fri, 20 Mar 2026 06:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989126; cv=none; b=ZVvCPzdksJMaekPsi1m0D4YciE3yD2faR7c4mcge8UKQPc1BKo+Os1qO4Tiygeilu0qDKmlBDMu/IxXEcTtajrBmIx1g1CkxD31TEqVivfqqeWhk3qvJTUE4z/qCTGnbw7gk8i3rN7UEuJ311RnIi1h9r4EbcXfoxxOA1m6zhv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989126; c=relaxed/simple;
	bh=zyiKjaWecA0IHCJ7hc/oC4qrrG+LBbEEHcW1bYT+nt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EZ26HsKjl4Ho90wKlXkQNwNgIy4BuoA9wu6kq5FZt2FuLBca9MqsH8l8S4fdWKAVY48uE1jy6IybYjEqs/pzWE/jep8FE1LVSlFXEpeAgdivT11Cc5v+zswNp5JPFJbuAlrGXgcDDAojo+ZStawzmz4ggr/PeiKDS3zBmY2ol2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=earBRlNC; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="earBRlNC"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79860421382so13664617b3.0
        for <linux-tegra@vger.kernel.org>; Thu, 19 Mar 2026 23:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773989122; x=1774593922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0iPAxzcv1Xpu4OocZn/titjlzEhToR3/eHqStKc3wk=;
        b=earBRlNC7Ox5c3BMl01dcZzIQgMDDXGvOIi67GELuHWczd6zAKVTQ9q2hVlhitHADG
         PwE0TYMILzPwOMq5Pn6EcfQnyIzQ3djBBdeSDJd/bgtqqki6rf7JlRlTj1djZeDd75pj
         PFxU85kSpA+RnPvmZ6HIU7FblP0qAAlOYnx3CJhnFR06Z5+Ssw0b/JiWzcz6iV/Rd88C
         w3VpUtcs8fsAXEKaNiYO+hzWQ4iZ85RP/+gsun9iFmCFSW6pqho880ZpZPNX+glfW2mi
         Kyh3dF9BMI9/zz2m3quTOTzCd9TpLx9sXUWIote1BHbnl6SaY6c3hi40u0hqIRQClaTF
         32mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773989122; x=1774593922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0iPAxzcv1Xpu4OocZn/titjlzEhToR3/eHqStKc3wk=;
        b=QGuhuSwVl8E01cw/yqQ9tyzXcI9OuqPy0w95DIgg4UUxvZ1Ej/Pk0CqDtE4sYge5QZ
         6oxz4ZOnwywUPw5wMuu8ilyY3X9/qZ1222oqtPbyVK3DWBy5ABq2y02p9HJ+zPQz00QL
         8Cmr8M6rdQTYaPXZnx1j+s3POlYzr7IwNIJa5BRJdn2LNOwABbrzGIY9/aH5R4tUVWDJ
         vSDcx5vggPb3KmGi26SkG65sQt7Ns6BgCFPrnx+hV3wtFu7rUNrvT2s08u8JNLs80T+7
         fOuIQmwMximLUYvBITkrW5WA98dPd85969cKOq1PUjFc2zXWSXoS/2DCpNlBCmRhhQrd
         W7oQ==
X-Gm-Message-State: AOJu0Yx6dziuNy6EbE9C3fVcm6NH9qfabLYfcp3SoiknjldwZL7AejX6
	+GltGqt6C4TXoF0Zlm5Pt/uQskmY25i312zTo7N56VWfybta2I/QbAEH2l7b5HBT
X-Gm-Gg: ATEYQzxhCx+GO9COSiOny51uJ8djgxJlHihYwyXq5W8cN711vmD+DCObYpaxm3MjSXd
	XFGRpP6XyJLL1FvGVK3FInYw0/nq3RFdpnVjAS3gAOSot6qia0JcdB0Kx6q7xQ+pyW0ycdY3NjB
	VAtH+1ccYO63s9YZDVSLYGrzVcJwpa+O29TRdopaEkmBPGg5I79hiez1vFFNyJfyPCYYWY9W4l1
	WKw7ghzZ3WhROx6gGn+fvAhD0CXaQazEBtnsGxE136DM3As8oRXPAUs5N79BH42HCEzv18tnypT
	kBgqvezdQxXiSF2op2dyCpP1GmcYMsyJfPAHbUpEHwjLXK3fKcKl8aV2ABtOoltaS75Obe04Pi+
	4IBc0DEOYoUPtCtlqxS5EhNOP8GRl9BM5y+VIoHZZFwi9PoZR3q8IGnaLyghMNrqB3TxMzuVmqE
	V6ZnZvGscBWAjOl3VSj+PwL3av7Nx4I5rLWLXy3idsHJVPPQM5Ikn3cuQ=
X-Received: by 2002:a05:690c:698b:b0:798:3efa:602d with SMTP id 00721157ae682-79a90ba07e7mr20467597b3.33.1773989122400;
        Thu, 19 Mar 2026 23:45:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9057ff43sm10534187b3.39.2026.03.19.23.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 23:45:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] firmware/tegra: add COMPILE_TEST
Date: Thu, 19 Mar 2026 23:45:02 -0700
Message-ID: <20260320064503.57620-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For this driver specifically, there's no arch specific stuff needed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/firmware/tegra/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index 91f2320c0d0f..ae21f460807d 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -3,7 +3,7 @@ menu "Tegra firmware driver"
 
 config TEGRA_IVC
 	bool "Tegra IVC protocol" if COMPILE_TEST
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA || COMPILE_TEST
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
 	  (Inter Processor Communication) framework on Tegra. It maintains the
@@ -13,7 +13,7 @@ config TEGRA_IVC
 
 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
-	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
+	depends on (ARCH_TEGRA && TEGRA_HSP_MBOX) || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN
 	select TEGRA_IVC
 	help
-- 
2.53.0


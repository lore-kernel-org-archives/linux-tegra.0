Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2041C693
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708077773; cv=none; b=lbO4ahavvwKu4jxvg3APNYGBPfs779aBZHQax0SLuHtijloWeKW3ORq8HhhbNSaLrHBp2SptGzuc6z7V2V3XARel3p9kMaltBtmVfSQsA7lfgdp0RYtmZbMwoUdmGQdW2qwVjFH534I7zpSP/53XCDcgNl+NceSElq1F4kxzUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708077773; c=relaxed/simple;
	bh=PfZaHvaNciBjd4737MaVop5Wjf3EHxv4Q2MFqrAms3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dEmeVrR4MUWXdN6P4ybZyH1uJxh7yHRxab/4TN3yqarA57tihMW1NVJ2WZRnJt4HOQx+zLUKRDERKgYHba95ucgdINbgmO3dvMp9YihNLJ9FPyA50r0YAbwBvwXrhmaMMyBkXYgD5zdPB99UrETmCKfojhz8/SRYEQNpcT5D1H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2+fPeFO; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2+fPeFO"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d1080cb9easo24948711fa.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708077769; x=1708682569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KjJA0dUGwV7yzk9KaZCCMMy0mKxnRKrDBQqDJ0UjQBE=;
        b=m2+fPeFOSLrPQglV5ONY9RF80vzAxX4xGLmkUaUCaNB+IgIrc2qZEIesKuK24TMJfV
         hxUWrjZP20NaoG3H8iqJtRhmFxQxgUOD/9Arc6hHTpT7wpsfWJ+SVHesk8ChMKSsjkiR
         q8sRXBJMFp8vrZtyB+6OisIB/R90lRUHysCiwU8Ai1h7Jaxs1wTg3rJIJKw6/wH+VTw9
         bSCofUOXA8ltNks7pNUY8Pl3XM4GeF+2rVdhPHEuN1RWCodL1Iy7FaLoeX67Rc9k0rXz
         mTyYsLJy70z+f4qkVBx6nTMLGfg1KMUpYO3CPCAxnTkWdQCa1NAQ4p+nQcXqctkqzthK
         QWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708077769; x=1708682569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjJA0dUGwV7yzk9KaZCCMMy0mKxnRKrDBQqDJ0UjQBE=;
        b=oraX5b3kyCeg+k8b6NbS+lGpN4CLqvDB1Er8OAc8R7a4v3vkFDAm009qMBV6Jum16v
         ZARV/pUbvu6dhceiVxwu7BDj2jkxG2NL1nHM/OZoUmpK5Xigj6VOhsoEpRteFI+wR1WS
         4DcTAL7L/Nk3wbQc0xIX7puGPoW0rBBFkw+ibVPsL5q04qFiVXwT8iw9XEQyzKma7Hkl
         xk0VqC2FkljVN5kFe8zN9vzaUBdj4fArc+HmcMbvw5xN/joA+uq98i+Ddy7iqaqqpFfo
         g2HuANBRxdjBVVT6mcOvg+16IWxE6qnHg8Osxq57jdWkltaDX9HmZGWv7DGpyCHZNO/w
         QrMg==
X-Gm-Message-State: AOJu0YxZRCITsoOpS6rHYS14nDHiEig+EZ3jM0O5XrGjWL1dkZAyEAhW
	3yedBDfX5uI4rxBRJ4qa1jtZeHajQdH7MsXzpfWwBog6PG3XxbkZMpGzIT65
X-Google-Smtp-Source: AGHT+IFu7eM8aFcedfQc+G0VVz5is5cSLRNwysE68EfCMDu8dsfoAdJY1JXx7Ou2+m+Jz072N9UOTw==
X-Received: by 2002:a2e:a686:0:b0:2cd:706a:8ec8 with SMTP id q6-20020a2ea686000000b002cd706a8ec8mr2965747lje.10.1708077768592;
        Fri, 16 Feb 2024 02:02:48 -0800 (PST)
Received: from morpheus.home.roving-it.com.com (8.c.1.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::1c8])
        by smtp.googlemail.com with ESMTPSA id bu13-20020a056000078d00b0033b4796641asm1808213wrb.22.2024.02.16.02.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 02:02:48 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH 1/2] bus: tegra-aconnect: Update dependency to ARCH_TEGRA
Date: Fri, 16 Feb 2024 10:02:37 +0000
Message-ID: <20240216100246.568473-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the architecture dependency to be the generic Tegra
because the driver works on the four latest Tegra generations
not just Tegra210, if you build a kernel with a specific
ARCH_TEGRA_xxx_SOC option that excludes Tegra210 you don't get
this driver.

Fixes: 46a88534afb59 ("bus: Add support for Tegra ACONNECT")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>
---

v2: fix spelling of option
v3: Update T210 -> Tegra210
    use "and later" rather than all current devices

 drivers/bus/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e6742998f372c..d5e7fa9173a16 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -186,11 +186,12 @@ config SUNXI_RSB
 
 config TEGRA_ACONNECT
 	tristate "Tegra ACONNECT Bus Driver"
-	depends on ARCH_TEGRA_210_SOC
+	depends on ARCH_TEGRA
 	depends on OF && PM
 	help
 	  Driver for the Tegra ACONNECT bus which is used to interface with
-	  the devices inside the Audio Processing Engine (APE) for Tegra210.
+	  the devices inside the Audio Processing Engine (APE) for
+	  Tegra210 and later.
 
 config TEGRA_GMI
 	tristate "Tegra Generic Memory Interface bus driver"
-- 
2.43.1


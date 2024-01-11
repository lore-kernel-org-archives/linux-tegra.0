Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB74CE01
	for <linux-tegra@vger.kernel.org>; Thu, 11 Jan 2024 19:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY1AK+LQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e62979fa2so5165405e9.2
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jan 2024 11:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704999812; x=1705604612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vUrw0ExL9lNfNhCUQeWmwzxITjzyqirm+7KGYKNnfqc=;
        b=FY1AK+LQtZBcAFWVvqQN/PrHL4MYvtzIsY4VElzsXqf0GkIk2kMIcWqWGAGCOCCfos
         I/luFc8QmkvidZymxjkB9oKIDXteeFQluEqL8x7og7sCEeFyptrPXgLNZQbBoRYxCqjK
         rQP/9cwFoudq9Iqr9jmmqOUuSXHl2WlqopvMZRe530FoyqSPJdKE5nuhkS/ipiA7S4d7
         GLIN52yb+QdDOLsOT18WuRSOoy8ax3BGyKcDooFrgJv538+dJXVzGnnrLwtN/yWFblNW
         nuI6rRct5MmNpIG+pWNW7yEZ+UHJiFPMCxTrsRxJksDXGLdMqDpkcrCAo2udU1J49LIr
         Jb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704999812; x=1705604612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUrw0ExL9lNfNhCUQeWmwzxITjzyqirm+7KGYKNnfqc=;
        b=KnoszZFhkp9Iv5D0I/TnF1dMNxOvuALQOFESUvmsnAudQXoh+mfIvpQRB+VoO+Wd5H
         fktx0TSXPBSHIrLNgm+Ef3ayiJoMIQErtht8GEhF0Y7DwnLtY++wC9NLo+9w6BrjtduV
         +QCMpINxSKOdy0NT0Q6ekLr/zRZM6TJiaW3FNbsH4b58wolNha/u7Z7RuBDd+XsPGyqe
         Sl1s2NKyKWHPedSgoEf5cm+DvhOg5N3VbNkouwcbYb2begf3x71BoHvK0FqpewoYXpIW
         Wrz6Xy67TFV2T0g71VOhVIS++EkTVB3GQOyGCBWgpfSAIsjEXFGLIAKxEGWLCCxAodE5
         K0HA==
X-Gm-Message-State: AOJu0Yz52ExrFhCfK6wJY8SA1SdE4Db4uXVva/naozpcRdB0Mg1XGOYW
	bC/nt3ArhzggGdM9e5DJ1VUScH7CfKA=
X-Google-Smtp-Source: AGHT+IEU6p1GcO3xx4NJ2CtcaI3EQngohdrrHJ4buRSpbzCGVrGdUMT4xTGGa+GoJDCSZ4CjsafENQ==
X-Received: by 2002:a05:600c:444a:b0:40e:44b0:914b with SMTP id v10-20020a05600c444a00b0040e44b0914bmr155288wmn.95.1704999811501;
        Thu, 11 Jan 2024 11:03:31 -0800 (PST)
Received: from morpheus.home.roving-it.com (2.1.9.e.d.3.3.1.6.1.e.d.5.3.a.e.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:ea35:de16:133d:e912])
        by smtp.googlemail.com with ESMTPSA id z5-20020a5d4c85000000b003367ff4aadasm1875698wrs.31.2024.01.11.11.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 11:03:31 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH] bus: tegra-aconnect: Update dependency to ARCH_TEGRA
Date: Thu, 11 Jan 2024 19:03:25 +0000
Message-ID: <20240111190327.198794-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the architecture dependency to be the generic Tegra
because the driver works on the four latest Tegra generations
not just T210, if you build a kernel with a specific
ARCH_TEGRA_xxx_SOC optioon that excludes 210 you don't get
this driver.

Fixes: 46a88534afb59 ("bus: Add support for Tegra ACONNECT")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>
---
 drivers/bus/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e6742998f372c..b003dad62d596 100644
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
+	  Tegra210/Tegra186/Tegra194/Tegra234.
 
 config TEGRA_GMI
 	tristate "Tegra Generic Memory Interface bus driver"
-- 
2.43.0


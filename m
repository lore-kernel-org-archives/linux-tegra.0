Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36C02BDC0A;
	Tue,  8 Jul 2025 08:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963314; cv=none; b=Og7TLRNCI1keMl4bUaMhQaf75TCcPtSjqZLjjTHXBODCYgiPKJ4ShSdxrzKicAa9xOFPLTClgRY39Jzx/AvzcXK8nq0NWvRXkUP7oF3I/FG7MK+KGkOF51+xGg3fKmDmuUkkJP85Kv2oGvHgUJNmEKgyX7aLoPja1KjYWpKB8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963314; c=relaxed/simple;
	bh=MZk7Vnnr6ov3WEk0f8LuzqJF9X3WQZ4Que2PEJuj+ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQZHzGi4Mx+Vjpa3YiTd0bflYbjPabmQwbk0NW75FnZzJUKnFzS+tcK9SzEFiKJGYVi/bAvdvbTLNnXPTvlPXCl5JSbotnnHcNxCK85a3R8Bey7F9N0MuSDIO93SPw54S489NpS0r7lLIry8dn2vK+n4nCehUGnKwB4kR/W/Icc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJXcMEH8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJXcMEH8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453647147c6so38168045e9.2;
        Tue, 08 Jul 2025 01:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963311; x=1752568111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LLhAPy7Ghblj+iKtj5iTpzCPso9B2g0bt1tZli2WU0=;
        b=SJXcMEH8pYU6LQTKnGgJMByClxrnFdhr8ym2vdLehUBB0EOHuadSuVMcZziZLPTvOD
         f2FDzwdOzGvVRCt5VL/rz4ydbl7Eroesq+138TqQtPMZUoKqD3ejrZwznCQ02xmo+Q7L
         FUrbftUVmLHHi5+A1i5dc1e9zgCDwSFR4qpHT2bGysGrpRMNZl1XVGeK+f8xNnv6Fpbj
         jsTA6ksbZsjG9zJmt7OLF5i9hsUZCNOXcPg6OIqZV9dcJpqpsXTzDewGJvfBrSvaTefn
         QPXUx3PPb/Ipzr2FobmzFI2IsTK4FwmgZod/j9uwKNfVHEFaTq8/M7hd/iQ+r9wLYJXt
         hMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963311; x=1752568111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LLhAPy7Ghblj+iKtj5iTpzCPso9B2g0bt1tZli2WU0=;
        b=bJGyFhv802jmwNytCGms/+CAIyA2nvOS6IwLTAmLI+pfmbSWk551e4ycWOVj33jsrF
         tpn+aRkQwm0qSSJ/FJ+/Ve6jKE2Kk9HluOIqSiUSZpU1kDxnDLzHchDND5BVzR1rQ9Yy
         XnBSaTItgZmKIcEidB03TfoC2mRXucd/yzwG0GATGPW1gN5SQbVu52u1c0Pee7Exq3UZ
         nH6yiYMWtYX4BOb4Epeb6kOo8AgxeMSdqQn8ITwVadwUeGzuTiZ1UsMIt9XiPAfpYqdg
         SLwiIlpDiKxZksiLzQmQnxQIrmRvYAJWOBY5FKN4fMq10BP4dpsLfNvPnLXh5bxKFgPx
         H9pg==
X-Forwarded-Encrypted: i=1; AJvYcCU+48jRLrCrBofiDUDkNuLik5YgVT382qrvzrdDw+3ppyU0yL7aRmT/mzE1a6CDs+mcsUljL+E10Qtv@vger.kernel.org, AJvYcCUluZozJkgIExUGw01/Wj45qIaMzh6ZqxT/vUmKchD38n3y4o6l8D7Nk54wsZIU+J8rt5NYpN3pjcPLZ6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZuLgVAyA6JHmOo+KstjRceIMkShqMxkMk39J/F4qyR4VahIhi
	n4dUnfr9ZZ3nd0/Nw9H5IuUjP4cj4cznUtXliYs7G1WngbZ1gJGqespd
X-Gm-Gg: ASbGnctznFTAAnjB9c6WsUf7OlvLwAJA/ho7dsYqfROpEj5ODq/IsjOmCAEH6baHlwo
	RHzbO+yKZuGRXMCAsj1bdRRVf9oiDJum9pfBGIJeaRoHExYZXn22162Ro7tQtKNszAzMLxg0Fhq
	cPXDw2HF6xUcIcEodT+sBpjtmhn+WZz67hmOEW1yv+qssN55RD7+R+aFqp1pU1FG5Iv+A41N8qZ
	Y7tTt72oWL3rhoMfpvR0l8ReYie+wbfqApwEez9rwF8uR+pyZYnedPPHoA9+9oUWsoYC5YA4jwW
	EkZWBpuwPoKenXFGTFBr5bowPVdRrcA1qs8Q+ntFU4LY525IHnN/YmbnmaQ14cSI7e9hj+wYz0Z
	hnKOTU6tCK5lynrmUQ5M1Ng+IIO9hcwD3FFxd2/1sZPRmP8d6yWQuMw==
X-Google-Smtp-Source: AGHT+IHsG5bw/pBz6eaAWGeZj02Dv5we6LevnW+89zASDG10jYaRM7fq8/KA3dUlltDsd0/UFjrNHw==
X-Received: by 2002:a05:600c:c055:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-454cdb340bcmr9487975e9.19.1751963310869;
        Tue, 08 Jul 2025 01:28:30 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b471b97339sm12478583f8f.64.2025.07.08.01.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:29 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/5] arm64: defconfig: Enable Tegra HSP and BPMP
Date: Tue,  8 Jul 2025 10:28:14 +0200
Message-ID: <20250708082814.1491230-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708082814.1491230-1-thierry.reding@gmail.com>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Selecting the IVC, HSP and BPMP drivers via Kconfig is problematic
because it can create conflicting configurations. Instead, enable them
in the default configuration.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 drivers/soc/tegra/Kconfig    | 9 ---------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 739b19302865..2cf2886a1940 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -267,6 +267,7 @@ CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
 CONFIG_EXYNOS_ACPM_PROTOCOL=m
+CONFIG_TEGRA_BPMP=y
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1456,6 +1457,7 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
 CONFIG_QCOM_CPUCP_MBOX=m
+CONFIG_TEGRA_HSP_MBOX=y
 CONFIG_QCOM_IPCC=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index bc532cbe32e7..9392c2c43cc8 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -97,9 +97,6 @@ config ARCH_TEGRA_186_SOC
 	bool "NVIDIA Tegra186 SoC"
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
-	select TEGRA_BPMP
-	select TEGRA_HSP_MBOX
-	select TEGRA_IVC
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegar186 SoC. The Tegra186 features a
@@ -114,9 +111,6 @@ config ARCH_TEGRA_194_SOC
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA194
-	select TEGRA_BPMP
-	select TEGRA_HSP_MBOX
-	select TEGRA_IVC
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegra194 SoC.
@@ -126,9 +120,6 @@ config ARCH_TEGRA_234_SOC
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA234
-	select TEGRA_BPMP
-	select TEGRA_HSP_MBOX
-	select TEGRA_IVC
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegra234 SoC.
-- 
2.50.0


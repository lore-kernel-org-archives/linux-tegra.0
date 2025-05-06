Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA6283C8C;
	Tue,  6 May 2025 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538312; cv=none; b=OnFdS7ysq8iFfeQgZS+uhYDbnagT5sj8bjTY/iLNPxUqpMR4ahfFHDMMs98q/GlwgSbsVLSJG8Wb2jWEcBv6ED4fbZXhlfki5/43q/GNCLWkKe7orUXtDTYHtT8Hp5eE00IhFYxhjo4ZGZzjP1WGNbx3F43/U8A7M0+bo6w8zk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538312; c=relaxed/simple;
	bh=LcOrty6LZ00HbBgJR6bvjHHeEuAq6Ky5k+ijm7bEDVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ncmqu7yt722BZKuqnqjnQZisy4JPDdjwmB+W/K6211fKhdacwi+Slmroyq+FlDdrUbfwfpFsSnO1Qc9LeFQLonjeudVKy968mhpnZ1zhB5tN5Hzf9+8q5UnzKN6/zOJqB9r5jREdy7YEsZMRhCyKyrKL0cJU27WhR7SgVXh58ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfZHZUL9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfZHZUL9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so49093055e9.3;
        Tue, 06 May 2025 06:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538309; x=1747143109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Slorj42xucBLgcEgCTYJT1nDW78UozPuVsLaHl9+ais=;
        b=jfZHZUL9x5mreS24FJ/Pyt99/MXUwBd5C2mSR21YcjruMX8UyQTsny+LwPTj/uPTPF
         MwBxGhYfWoQTROjG1LOYCfSNe5BaGXkcH52w7Zq1cmfROA+vsRzv2NPViefcgyIE3Yw4
         vMrpMvvjRvJqk+FAqdcZQcQAtSFVL07+RNHic7yPTG2moirKyPErnN9Vv0J0irHXFnfH
         hD4cUEtpMdIalkxhJQ6uUd9uLgkMMVcruqTjeiTNevxDYfqTiT0EqFZXKh7+ghKe/pW2
         vlMtIEa188cLv2jiHINdWRd8HO8etUDuUiIXmJzsdgAy+U+TtYcjCufHGfrbybqEOKNb
         iIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538309; x=1747143109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Slorj42xucBLgcEgCTYJT1nDW78UozPuVsLaHl9+ais=;
        b=eW/JdGCpV/ulL1CWjeXgAIjYL96JyxbIGpxTzuQh+iiKZxm5jVRE+wDLBJlhVlD+uv
         LC6ktoiARJWWx3b+McxN9NyHT/1D3dhXZ4Wt0aOVBD4t1zpYcMgz6uhlm0pNfZkaSpI+
         Ia+ejkH05/PmtOH6UfiT/21V1ONt3kuJGbWcKASkBDaqQxl0PN7pKyw/Nwcz0dfnl/0h
         8FTwITJvqwiTarxwFxlwcHa6TflH2jbk4OtK7olefWXzgzCx/R3BgvIAnQQ0I2ksMBjE
         MxCXThu+si4OpN71DXzyb4BFWSWNZY6+MF4MMU6OoINHCjMpeHEli+tDBOdBYFircY1I
         vXog==
X-Forwarded-Encrypted: i=1; AJvYcCVy9kdVVhoGzeiqRjHch1XCHPAnyh0TTJflZcXJA0i0MzYV0KPB5SJv8WcRbbkkMZIwyTB4v3s5uyQN@vger.kernel.org, AJvYcCXc2ZFFe1E6Cskvwoh0wzki3K88qlWP8odGY0Aa6dut0QvLB1l3k0U3VBfiz2YB06KfrkQL35lQPUZvocE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEwbdQ/7kCUonJDCMJLPPqNbvi/CtoidnuZk2d72+ASAEJzpe
	KQMN1EbiUjddD+o0YWDfMT0V6sF/YrRxFOp9Nrzib8DWnOP/qWbHhrgqQg==
X-Gm-Gg: ASbGnctfSO313aJSiIdfAzm5NIhLoH+ppkYVu989VAS3hdZE91q/jUP0pdaU2me5i34
	UBgJ5ShdPzR+fQ+TWIIuPNTFZczPyJeuqbb7RMsDEQ8XJGZGtvi1MH+M8yRcrrwIU8vnl6703ZR
	oi+nrYW3jPnfmdPqsncqzsZKb0ljdpMSmneXwJVqDNubxWP1U/VHhSA+kw5b/SBDU3EtRggoWYw
	BBcHQzuihqqFiQ8og/33iwscLIdGEihd871zaDGUTQwsnLX8+Mf5WLrEJ+09ZmKrZsoX/wL9tza
	hv0aOchghlHTxzdXCyKZk+twrtSumn0YWhCqD9CiDP66tI7U0QqiBuJH6gPSS1EKljU6YMBf2UL
	rfIybhTD604BmLfMBjd2jpoSoL4SB/yKz
X-Google-Smtp-Source: AGHT+IEqtAFghQueMw8z+GZ68EaGQYCbkFFmcLlBWgpzWkkb1FBjdt56CDfJkVu9rAJJoM/2Z/ekWg==
X-Received: by 2002:a05:600c:1d8d:b0:440:66a4:8d1a with SMTP id 5b1f17b1804b1-441c48aa302mr102353625e9.7.1746538309306;
        Tue, 06 May 2025 06:31:49 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2af4546sm218375415e9.22.2025.05.06.06.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/11] arm64: defconfig: Enable Tegra HSP and BPMP
Date: Tue,  6 May 2025 15:31:18 +0200
Message-ID: <20250506133118.1011777-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
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
index 98ad22833282..85582019be04 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -266,6 +266,7 @@ CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
 CONFIG_EXYNOS_ACPM_PROTOCOL=m
+CONFIG_TEGRA_BPMP=y
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1431,6 +1432,7 @@ CONFIG_PLATFORM_MHU=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
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
2.49.0


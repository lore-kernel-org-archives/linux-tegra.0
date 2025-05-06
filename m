Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80962836A7;
	Tue,  6 May 2025 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538301; cv=none; b=O7DBJuRjKlfrS8X/yWKo0PLd8ckAhwGEEpRO5Eb9kwIYVJE66fTWVnNRkP7RvtBcJPQXP6BrDjQ/Z1pASpDz5sfGx9E4BjwLmZ+A/jrGJj2VjQ1+vwXeTWV/CMmci34ubirx5rfvaCykIOaq9rjoWdFruCKaNkbxDkg8/u+Jm2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538301; c=relaxed/simple;
	bh=BmsEujtb+mnQvmI8dKJ/pp5T5G6i1vN+8+iHcViWXWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViY67Hi9nkyEGUsF+LoD386K701WVklmOVjOr2dmA5T9ZeY1zqWmDhptt4j3qM8AdtHooEtZoDgjhGMhXe3MZzB5lVPjXOc2sNV112xhSnPfIXqLJWVcVU7hjLapH/XxtE8G3hTicMSRKtpJ0qcmm3WuxCVFC828Im7uQAr25fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNiLRFP8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNiLRFP8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so36653495e9.2;
        Tue, 06 May 2025 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538298; x=1747143098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FZuKI1wVxkt28jthn6Qr6eV84wewBB6ZEVTh0IZ8cg=;
        b=VNiLRFP8L2ISIuDxNzXuE05gGOU5K321gsETRkApV/je9V94Sj/5xs3wu1rUqqD32w
         FfLwrHxYWPzJGleKgHEgNRYmQBh1551oVNrRbTHWKJ2EwKYVDMBobu7/JfXckdnseLVY
         w611YA+6jEj7jF4Y4aTkzUZ+573OsOi6eswU+bwCCqDjnMQLHwEP4Bynr2VLBgBbx1Pc
         jZ6nDq5ZlzzbqvhPss7TmPFL7oRrKZkFXnmG4OBv18Euma0sHAEvbQ144rdPLsep7RPf
         Aw6v60J2GCbRf2jv6V0AewRsce5+EhDQQR1POO73EaI4/07iLaRDz9c7/cDmlM9xN7CT
         7pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538298; x=1747143098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FZuKI1wVxkt28jthn6Qr6eV84wewBB6ZEVTh0IZ8cg=;
        b=n+vIMmcvFPhKj0iSJD5OQdKxGE7uZZkKB1EVGb4X2VvRxc2dPdhcBW7Szotrxstsku
         Z4PK9wFYqoFXp1+TMl67hTitBi2W3ZWXGvQXBqoGdj56CAIPEOELeby4XPqOTd2A+1vO
         vdB+2q994XXsE/3geoJ+ZqXonzxVbJcH9bEGO47btEZBomAqwObSTyK/9Ubcgt4ZyT0H
         7yCzjxap9VcTeboYCPccdDN11+SHfvnkEINvTY7OZPkvlIGyiXTMVTsUaB8Tk1kvWaxl
         8qR7Qfb1hQxZwlYQIJdTR0uMYjXMVz9YSRwuYRDuViWTLzRUUj9iCt4VAMIxyLrnohgI
         iF5A==
X-Forwarded-Encrypted: i=1; AJvYcCUMHduox5d5x0qfYJvjFcU/o1OOnXla/hyHEzZ1p2EK56GvoeReHzFejnyKoDqaqWoLnspE6/UMZ0jf@vger.kernel.org, AJvYcCVKIi1LkSBHztcP+cy6d/bZ0ICQantdeHj0969IskM8KwwDtEfvctLVHFuF0gn100Ib2NYFrcDTBypVqAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkwdx3izBcE/x4UX3UfH3m7rWl5slS/pwO2EtyMbyYMN7VYcxi
	SVCqzji0mTAe27CGrMVPKWIyGyrPh3bRh63xp7o5oFIBvOOVyuYR
X-Gm-Gg: ASbGncuV3XLG8JvwXOrDMJN8MOKm9Wze5MvcMtIiPFZ8PL6n9ougAURm6eAijYyGGgK
	rQ2TY0KyYCIrXmE7Xde0cQGhvkmVc6PYSHkj6IMzJBCpCUjdvKJV4ge0lfaUQKsRzcOY6OAMakC
	PFLsRGe2UEW+mMl7J2rA7zykmpCyoYeUgRhWi+QoNfcIDAzgvI+2sqTSAtra1KSr3fpb7JybeEa
	gJDSpWiXLGiaT1JSyP/kVGEE5MemqIIci/oJ0vPG7AnIlM9dQv2kRPlwbB9uCc0fia2nbrbDZGH
	KngNa7gS1oqRnjnnplHY62NLEahKPaMNEetVlkj7Z0zRIsNPvNjtQ8PKfWsFo91kIKBwe3Ir3sN
	BZuEd1cbk4CMm2788ZVgS/CJREljzn0ZT
X-Google-Smtp-Source: AGHT+IFBCHEB0L0uiyTayzXbwMp0FPK0RJ1uHO4LY7M2FNE9zoE++cRfDFHGOUfb3EfkMWqDNRTRAg==
X-Received: by 2002:a05:6000:4310:b0:39c:1257:cd40 with SMTP id ffacd0b85a97d-3a09fddfc6bmr7593427f8f.58.1746538297951;
        Tue, 06 May 2025 06:31:37 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0c3dsm14127537f8f.12.2025.05.06.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:36 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/11] soc/tegra: Enable support for Tegra264
Date: Tue,  6 May 2025 15:31:13 +0200
Message-ID: <20250506133118.1011777-7-thierry.reding@gmail.com>
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

Tegra264 is the successor to Tegra234, with various improvements and new
hardware.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 33512558af9f..bc532cbe32e7 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -138,6 +138,14 @@ config ARCH_TEGRA_241_SOC
 	help
 	  Enable support for the NVIDIA Tegra241 SoC.
 
+config ARCH_TEGRA_264_SOC
+	bool "NVIDIA Tegra264 SoC"
+	depends on !CPU_BIG_ENDIAN
+	select MAILBOX
+	select SOC_TEGRA_PMC
+	help
+	  Enable support for the NVIDIA Tegra264 SoC.
+
 endif
 endif
 
-- 
2.49.0


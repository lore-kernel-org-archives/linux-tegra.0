Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FD034EEF6
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142912; cv=none; b=bzfgMYsAXFXnNjmhW8HUEAlHX+WkQ1JvZSftbwDreaiCSuCMFoXlo6IoKJXIuAtB9GWe7f1ILzE0CsZp3EHHToGUXLKyAsgDc+Sue8bEGh1eLOQQCZfCSDDmb9GA9ZV8Tf5PGYJyrP2V5YhqHminG6ygAR0ChZCXHLgq4bnKJfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142912; c=relaxed/simple;
	bh=r7b9miz+zGlUHxIqeITYi2Gi+cySbUCD1AnY1/8Oj/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKbuztci5ALcUsjwGiBhoGW0CtR39oDCTlUl6dwkLW/efPlaQ2GFiFxyOdeRhaRQ5/RksADaPoXvAJXrm5lDxC7qdWa/oH+VrGI4764jkZVaESWpShMxCRj4f3+xvYCeV5otoqKTg5q/vmvtVfqw/QbHOp6LSPucLudYLXr0sKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2hL1pfD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2hL1pfD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so4495156f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142907; x=1761747707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=c2hL1pfDXaQ7BMjEDgI+CWfh1L/rZ+C1/hq8BbB/F5WSf1qIKQoA77SV7hC+sVTuQl
         IJSZCBqQbU8EmkcXQPdAcZFloz0X2sSKAxrkpiDdY360s/7SfKGywmNkZhVI/zYii9SQ
         BV/DfoaXlrOtZS1R9LadVGp8hjA1eDj+BZqzmoixM/zFS3Ir9fow8gvQmZKvB77s9Cja
         82D5L9fwEo7c7Law/gDpzKzx+EgUtNbjlqHR896YMWjsvYWx/o5nvUNGDP0GSgl8+ZE8
         31xNtKXkJX2O4X3epyG63+VG+UHAmkKSRNhS9ttio+e3d1c70PRYCzDJk0GnHWlTVFun
         +eCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142907; x=1761747707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=TjFt1Zi+iBM3/nN0vSYBQGuclikiqS5R5n4lqfJf32mE5RGdR23Uu6oO6HBaqUILgM
         g63pyE8zgSCw1DwQMk7Dd6bOqNXlZu3BuldXag4vdEhaPyniH9R7+mnfiCpEL8Bp/dyx
         yewJ7NOgEGo/9sVs5kHl7mRVs5GUUjSB/l19TyJaQRq2VR5qHB8LCd/w9qncydDvQ4VM
         vBp0XowbRypedS3XQMCh6SDhzsZwnfxiK3FDCVwlSlKD2wvh+WEQmHTeMK5mGuT8qIEn
         eIojewc3UeFFfe3QmcposSNLF979mEUBIn1KkjZoabTaqFZDGnRkk4h/UZVvYRp0A+iB
         ReoA==
X-Forwarded-Encrypted: i=1; AJvYcCWqBRv3cD3IWcQKx1Wm7agi/0x6gVrfwfXHI0UoL1oo5JOo2wAzqomM+F8hBgW8M6PNYxJtb8eoOYHVLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZncmrF3A7+pH+yE8LeYlxxyAey//EVPHqvyL0DBAoNX7j/kbR
	paJKHhJBZAurhoz+GoSJtD6/5bkHrWJkdVKGFZHxpG6d/yxQQPNPykn1
X-Gm-Gg: ASbGnctTf2BmagPld4m9j2yx7QN4rH/3eczVm2FogmcboJ3+xIYpBVCKDjsXASENxY2
	P2i/Q0oSwjjk3mAe9IrkJMHnE1lj1Wrk7ouC6j98nb6dkLDMpeAgwlDPBYFFFi3ndQjMtxJxVpX
	7DJbSyUpDkdYoe5XTJPhitaTA6vxe8qUE5FbRJyOxgd/20HD2amBvu0N5K7mnbEhkHaG+59NXN5
	k1MdhE15/Z13g/xCwPI6tTRoGD8Zs8PKc0ySZb+qCE9HXzoCToTL9es0K+sHsGGE+I6a164ydi0
	O2o3tU3T9Poz+uN5tLIef1eqbmSXNABl4G6yOp66qDl8S49OGczsCq2pnoXKYopyjERq9jc37q4
	cZEfJPkXVYNyqQbGOqfVZy/mKJLc3AAEig5ggS+2tyYg9NpJ5CvOR9/dF1M9fiGra4I0=
X-Google-Smtp-Source: AGHT+IFuKTY+6VlzlctM2Ho4Y6ooXPbr1OkVqVQk/ddAnkBtDFDjaUEYC7CuSZMpeeIzVLphs/KiOA==
X-Received: by 2002:a05:6000:1a8a:b0:428:3f7c:bcf8 with SMTP id ffacd0b85a97d-4283f7cbeefmr11118870f8f.29.1761142906649;
        Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Wed, 22 Oct 2025 17:20:41 +0300
Message-ID: <20251022142051.70400-14-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

avdd-dsi-csi-supply belongs in CSI node, not VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 584461f3a619..4a64fe510f03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -20,10 +20,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_dsi_csi>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ec0e84cb83ef..f1d2606d9808 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -64,10 +64,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_sys_1v2>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_sys_1v2>;
 			};
 		};
 
-- 
2.48.1


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45673C0A1A
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128742; cv=none; b=r83jTCAd6kqXC8xw8YJ6YJwSnVnAD3Eiu/x5p8fqjBJiJXU8jtk5Pdd+htXpAA2pAnzzeXwS+Uc8e7xOkgnt14hktVUmeNxd8OcxQCxoBGD9PE/YpamtTd3cUuf70XbKykInftIWKXKt2wZi5AvcW6tDDBhGdV9nMphlFQkGT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128742; c=relaxed/simple;
	bh=3MD4BSaEiNQZKARuhDvrcFucO1MvazbLvmRPiKQJgFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxa00KXpK4LL0rMubwjzR0tgelGyGae3ovz2TKAJ7ahmRbpYLpyYSxLcPkYf9DkNpCGOTlnSM93vCUXnsKTdsKruWR0kv4u5gJMyz9qiqRAILX2ntO7hxzV6bgaAT0WoYMI9wbzUtiOYxOzew6ZjGzGfLwk0q6mNhWwYnpf0RwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtR/SdK8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtR/SdK8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a169d33ef6so5264295e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128736; x=1791733536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KRV3JoJ0uG0GcrMZQfb8S9vdxRD0/aDEvY1h+kt+gE=;
        b=PtR/SdK8edAKi9mDw9kz6xTMXQ8Kt4UsoUsiuKiUY3J0+B9IM3YS4VM68QVHUmm5Ba
         zvxIxQxqxGNMaQk1kC1qYkpz9oWdNayEdqBpFzlI3AUHTZeSI1baD2xcWIwSq5j9Uy6+
         1+jT+ZcEfydz5nFuxwZ4YsVc7h4o9z5Zg6pxrkwOCszP6qzG5vYnLl31pJZhROy06I7P
         NJEnqQMVrOy3y10mWN0MohhszsCYHSwJWirfoyLOV2BUagxIMvi1E3zotpTW1qWPX4aY
         obf5XhqSzlop5KT8Z58CHdZsMBoAjAyTg3haKbXjpCxZxQEo0sZFViu1E0t2bW2jZO+c
         fCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128736; x=1791733536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KRV3JoJ0uG0GcrMZQfb8S9vdxRD0/aDEvY1h+kt+gE=;
        b=D1lTWy12w2kuD/ej5hV2o0nR1fBFZElLwRzadTavXr/HmozgZyPw2CcYUeoKaapHpG
         6eNEBol1dhiMEnppteCJk70tSML9T2IHSlgFEzVE6nvoGpl6ownPCsBZAGRvJi6Z+lrs
         Zq5PaZOAs3F5l5x13fnFLA7xjSrtf6OhYcS/JMFENEw0yAhsVvKuScLRQc8O2VDLGY1L
         PW/tqbRj9mhT/9UVocABFzS6g8Rb1PjLfG3HJHEANyZVRUkPzzUKPESexeOiGDTUfnRY
         cOkQ44wM0a2tyuRyqMEL2SahITe6AwCHqV2kmfeKWJBopvxGm9D0eraH6RE/4Ecj/DDj
         ky3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVmUr76GKWvfV9uisuycy7/5m3cl8ANujFRVCIkeZ7nTUXqkrVPmLXtUewf5RPnY3d8S8xOgdZam9ZKg==@vger.kernel.org
X-Gm-Message-State: AFuF++kOobjDmC8dc9iP7utIDBEVQjsyw/zoxHVJ7fHID2uyl4SfCSKG
	P6xky4QTFX4M/vNSwbJWKGO8gSikYU03A4KnkFEwVuTBy+8QAPEant6z
X-Gm-Gg: AYBFou2HOr1eXuX1ZW0QYGR2xOtVf+wgLcLdlfUz+ud+LZpdVSMP+i/wT0VVkqt3WgH
	2EE5gkE08O8PX/X9zCFLgWQT7qkRLQ+0o+3NIztYF6Y/U1SRWjjqi3A7ovnN0+7aa7BA3mm9jsk
	3saDMayi1fHTPukVe65XUY7N3B1KSp/fU8hrMccQKCD/SuLDmFBvqMI28oc0IYIh35Dv592Mg2Y
	4HBUkx4wXUTWLssmNbumrnY7bxoSurNxv3IWjdEF3ggXEBz4IToTfY+jQS23opLd4KprxG+W2mT
	773MMY5VcfBeFfkonUGu0sgq+ngkyCrroIOkzLH76RdSg7oUzKAD7/oitdILBP1H109ZLT3A0AO
	kpf0sHOAK49b2E5ADIaxP83IaTEaOe+kEhv/VcspwZ+qkzzaYcP4Ap6SyvbG1srPCLPa1JLxk/B
	37cS+1lDH8/SoZUKa51EZ34pZHq4knWocsVBJE/MmnxRaD4KnHRrEQl3tm+AVTuSM277CcYjLWH
	0V6Qfnv0P1oCP20i8c=
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a0274565e1mr160503765e9.0.1791128736181;
        Sun, 04 Oct 2026 08:45:36 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
Date: Sun,  4 Oct 2026 18:44:49 +0300
Message-ID: <20261004154456.145362-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinctrl-names and pinctrl-0 are defined in the common device tree,
having them in the individual trees is redundant. Remove them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 3 ---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index 6b30e17459ac9..f888987ce1340 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -25,9 +25,6 @@ ports {
 	};
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* WLAN SDIO pinmux */
 			host-wlan-wake {
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 896639599c126..bb20197bcdfff 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -8,9 +8,6 @@ / {
 	compatible = "lg,p895", "nvidia,tegra30";
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* GNSS UART-B pinmux */
 			uartb-cts-rxd {
-- 
2.53.0


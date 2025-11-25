Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE3323416
	for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072398; cv=none; b=k/+/97WoizHX47zZkpzlogdTQDCcM02FWpKDVMNij4rnnjeu4629lR2OnO5KYRLGDAog0Q1WWAhTme3fSSrKLCrCQvyLME0+eZ6sYyiVYMi9AnmjLnLPq233xb6+IR2NLOVymfznz7AIvaMFloO3j4YyauFfAcghKw4eVhUD5Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072398; c=relaxed/simple;
	bh=YadarWm8iXVMTc3kvOXTZJwKC0IolLXgB3hQl9V7qZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XocVkdROMapXn/DSpNU1773AaIbgbFAksmx63oMGT5zCDq2Wv82ADH0axvIcTGaR9ASQnfGRxpJ8zvxHgWccJzweWQnlBaicJesoZhmeK8GAsICz7o8SJfzakhVIV23DO41eAMVKeIY70H5QpZskrgwTI/P/vIEWWRoHhoVlD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGLz//ba; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGLz//ba"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5958187fa55so4166424e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 04:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072394; x=1764677194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQWD0QKdZ0TkCEqYFYnGsqgX6XSV5QR52vBKePlFe20=;
        b=RGLz//baihWAjD5nCVgsMTRIlPsz7FlyFz1LidxQXKjMnKJ4XLI7nZblQO4b+W83xl
         B7VVFQy5IMHRgrPkf7qAoP0/Rk/piTDtoOmA07h9Dtk5rQ+ReS6ipC0aWTMY/42jVn3p
         JF8T1Qdi3ED9C5ofQ2ktByJFLjWnStELGOtwZ+8B/6sXVYRy7Opc7XBhyzTmg5iVsz9m
         CD4kQQ2qqhvk1AI1iX759I8SeGp9dSh1S0WYR0WJCVVBIdAsVmLRFVVCfelVubtsz+Ij
         3zDXDNrVa9rDvJGvM/ROWPm9MSkUESuU/w4wO+z13R9MO5EFpDDy8IqZ2hShiiQDct6R
         1sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072394; x=1764677194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yQWD0QKdZ0TkCEqYFYnGsqgX6XSV5QR52vBKePlFe20=;
        b=FXsrLe5X2q/XxGM8OxM7ZaLg9p+GIuqJ7kD9ZOnup6zbxvAMh7+c9f2CYHCyCNb+60
         gy8kt+L+flxxFxySgNfJmWlys3yrQimwMaAToo2EqSltZ66WFuY6RQZvrXTXGfjNwE8p
         C25viqKzYYCA38nuPMhX1a0+E2N5IjATEvo6+T5jMLneNOM5SKWRjTN/4nqHLo/Rr9WY
         SK8DPVF5ziAV69NhKprHyh8Xb8ynEEcVEs+4mEJ0ZIfPSjUq6uwyartafG5SQ1FhnfVX
         F263BdAdbOYFJyvTISaQggfJ9vUuxlGMdKGcAsvoOcgyl6D8C1qjhGr1Ut60N1Y01NdK
         d4Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVNI3dH68W6o1uxYpGvzCduItfcSCsscRY0732dWEWan2BQcC1Gz9EaO5sI49dQLbUgJDNg+IabUN+e9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6QaAAEoOfUCCuqqTvlyd3xB0rdB4jXoNngvwnTtXfkVZKuj/n
	THP8h44cp1ii8Zu/lO4JUa54oh11XW14DT/z6kJnjEcVROgWR9NkU1yd
X-Gm-Gg: ASbGncupK041xpSpTyNYcnVXKbeUCDMVzUi22FWrgHq3Sb11ljsrhHhXW3hAqKNH7XM
	InmHKC0YcrF8qWzrrKLcTlKNY/PMzpp5AtfkQENU4gujEMkZJNl70bjGyhUU8hyUyOenxEhOKmC
	HX6FqJofrAiTLatOHZseRb6LvQTxu8HG8uC2eAHvw6oq3k9/HMTkcaAASFoTOx36iDv5zmauhPf
	FnMzySI+euc/fFR1vhB7hSsPWRG/DiGShnQyNelffLXgGm9CndR+7Fcw1a6xi2tg8HC/uae5d+n
	qVBuXKAMHbe1s6T09V6iVESuBdAaalBDzKTTzpu3p4um2jRLxho3DYX8Nl6zRREsQN4nVLkZ5m9
	z9Z0yccU62RjK0YGs/oUiF7TcjpNd25mEcFNSzMR3yfFZWCNvpOW3gXDitKm96LSQpnufa9w5u1
	Y=
X-Google-Smtp-Source: AGHT+IFhS9KE1wuZQzl8w9HsDmWL1weqKWL9f1LhqVtawTbvw8WoVOvtMYz13PNxZKJZHBsKo2LqMw==
X-Received: by 2002:a05:6512:118a:b0:595:82ed:ff28 with SMTP id 2adb3069b0e04-596b5062a6cmr1017970e87.32.1764072394159;
        Tue, 25 Nov 2025 04:06:34 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 12/12] ARM: tegra: add DC interconnections for Tegra114
Date: Tue, 25 Nov 2025 14:05:59 +0200
Message-ID: <20251125120559.158860-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125120559.158860-1-clamor95@gmail.com>
References: <20251125120559.158860-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DC interconnections to Tegra114 device tree to reflect connections
between MC, EMC and DC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 6221423b81d1..732f8b5b4eed 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -125,6 +125,17 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA114_MC_DISPLAY0A &emc>,
+					<&mc TEGRA114_MC_DISPLAY0B &emc>,
+					<&mc TEGRA114_MC_DISPLAY1B &emc>,
+					<&mc TEGRA114_MC_DISPLAY0C &emc>,
+					<&mc TEGRA114_MC_DISPLAYHC &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -144,6 +155,17 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA114_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA114_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA114_MC_DISPLAY1BB &emc>,
+					<&mc TEGRA114_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA114_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
-- 
2.51.0


Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D1392819
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273427; cv=none; b=gXEinfFoJyIl5E8/Vwy9DDkwoOE6nohlCD8wZkEy0mBgKh0asoe+IJHI2Yu0viWPuODlVqLeOa3oRSq2PlfDzodvdfOKa7ZXlZt+7BLpUdNZ1iMQ7vGXoIYik/Q2YSsK+H6AtsXPJUn7nIZ5kB2cd0tPwXAcsPaIRRq71TAS5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273427; c=relaxed/simple;
	bh=83bu0e2hUCx0MiN45S3ruSGlLf0W0sVvbitldUzcJRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FUN9B66R9Tt/LX+NgySKfz+toyE0i9YThxQDkrDDUINE5b5oP9m2/n7ikigohb8mvN6ULSdLzarj8gjFAtfNe+b1gi2K4IpN76+kAg6wdV6jLpRZdeZJAp4IRPqXntRs88xbgvIi0Hyem0fFdOPtu1MesECDSqu2my9uwYw15Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mapzlhba; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mapzlhba"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso8420688f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 00:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777273424; x=1777878224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiCb3qX1nnHHHaqbj7n6PWSc1bwd0jpS7OTapvME0fc=;
        b=MapzlhbaTlNeFXfTKmFjK8ctVTaOM201dZLg1NvYTw5lj7xVRf8Vij+Kg1eGd+Fk3q
         +P9jZf1mJDBJFekBa7jVeyY7zP6186Hj1zQEslebsgMj5bYZHsx//voezPQx+HqWIfu1
         OMoRHjdTSvZKsyEUOOqY5aYKQsE2cOvxut1jrJDtMFNQGMb7sPivM+C0gN9v+5Dm/hDw
         XQxU7LC7A+AolzN7x9V/kBf4uknfK/K1cSe3wbHQ6NJDbIGipOaVFHrL0lCTKdC3PI0O
         P6FTL4ChOhWuy+1LXYMRfae4l6XBvHwthH1EgjQz/HsOx4PC7S/PhPe3usuzqa+hozDn
         zkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273424; x=1777878224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qiCb3qX1nnHHHaqbj7n6PWSc1bwd0jpS7OTapvME0fc=;
        b=UJ1wpffLImVO9SoKxFgJXPNXwLbkQRnoviUpTGKWG7/fPQpXX9k8NJi6Q7NfkHWrZH
         gH6RRLBFEZfH1Fkhw1TjzcFLZajwAnzkiJzEOuYhLN7jQx/kOH/3eFuSqgDLiWups2/+
         9QwpJJdD5vOULjgSeSgmiSsf7LGTTHKdtFJc9vHl3d4lZuAlhMSNiIw92AFwIxlM27EE
         cqZO67HIjblZveo+Jy8Gb100ex/rBJVkx/wFW0H2qXi0kJZWs+yoi2d8y2pghyYsBH1s
         LWoCF5vNglRKGTtoLCYCJK75fWCrEw78MvYuVJQ7M3gMDCUZw9JdFzWqfL4+rB00OSql
         Yhvg==
X-Forwarded-Encrypted: i=1; AFNElJ9UPxNFT/XuvcqJjZ9Zrnv7njyZjoCBAkxpdkX9DkfPKGAndOWkqju+PGhY1bJgvt/BUO8PsFq1gv1NBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdyrKxNpww6SRV/Pl7oKp24poEORRsnUUlC51WzZBYFMb8awjQ
	hknIg9Zt1PVcWmHScHewom+TyD4QWyE+wVxDpEkSifH9xdHQy+GXdmGx
X-Gm-Gg: AeBDieuhueVnyLxoMerG+WZULWBluro41OODP7suBBW3MtGakI5U+2abOpCR5qIcDYf
	f/BahDgNf8KurnzJEG68qhVh3AtlYwN7IX/msX63qAYgnpkPstIf4D7GtBSiQm25l+hlid8bF6g
	PF8edMkqY5yN87yp0CpPsyTQUnHQsnYLk74TQO7Ff9AhXT492zAFHOMlozQmYxSG6NBCgkfxdnO
	M807JFQD9N0Kbp7LVwIDhs+S5K2Prog8bUUWYwM+LrAvNkRfr5qlgz/3kz0t4wfuIt6zRGVvE2K
	tUcFPPbUQZKhIHyTrm3ngRHzrQIgVowQyqwcGfOHcxmhO3BdKYyQxhguKbYO6hU90bBxKthAfqJ
	pOfqp5apRAzxQSYxb4GKB0ePd2yTzZKd4AAOJQaTjFWdR4fZdf/CqFSAmk4+7ZQVwPINh4ODCVG
	GEevi4+JrmmS+xlrJx3Bz6bN4=
X-Received: by 2002:a05:6000:2c0c:b0:43f:e22e:e8da with SMTP id ffacd0b85a97d-43fe3dc5b0bmr63597483f8f.5.1777273424009;
        Mon, 27 Apr 2026 00:03:44 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm84245734f8f.24.2026.04.27.00.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:03:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 6/7] ARM: tegra: Add DC interconnections for Tegra114
Date: Mon, 27 Apr 2026 10:03:11 +0300
Message-ID: <20260427070312.81679-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427070312.81679-1-clamor95@gmail.com>
References: <20260427070312.81679-1-clamor95@gmail.com>
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 6c2b79b35938..f46406b06a07 100644
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


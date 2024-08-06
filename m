Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5150A1BE240;
	Tue,  6 Aug 2024 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947974; cv=none; b=RFW9jxNP0DJ/02pozRoyAKsqJWhLiEt+1TkhK2oemKrqBb/8b2F+J+Kf2pq7Zih8Bwra5VHeNKmACADr3JPpOiyjLmJ24vYb2QihR8uTOlnxOTErsGSZV5cy/S9Z0cki2lsOJqg6a3kOnDBAbPYwDVDObnMll9KnqSBO//wKUt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947974; c=relaxed/simple;
	bh=0wQxFFuOHJS5SuVrwR+CDWjhwqd1+l63jsJ/6JYArGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ECyS13lCwy2iGIjCrfK4HlJYZUCGcDUtqulSaIOLOHYbkaeLLY1/Ony+lBlkFQuCmJu7yk0waHsFoJFVIWsyu+hweIeX0YjRQqf/2lDPKti/1V95fm4d/WZKg2yut8Xtf3XUeMfG8ALi2M589MJsHEMKs5XAmea1Pf7/wo6qeNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dd5tf1CM; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dd5tf1CM"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso1054011a12.1;
        Tue, 06 Aug 2024 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947971; x=1723552771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUcRome6aifEsersTpCMpduNSVFoSqdbAweLO2yUsUs=;
        b=Dd5tf1CMGGfXfOtMEApcLbCFJBwogYjuKyWjLa7bZ9P0b2kT1W0UD5IQ0/Dz6KSQsu
         U9wNUMuQ/3CfW+7ZlC3PC/Z61P9yJUHjs1AHqL5uaEcwSZ42FL6zNPEr6qvRzfMzUhWA
         gAg/r5H72ubH40uCWl/EEPwiicR2BMj0ciLB2wc20qKDBGF13dU8F0cEblOYUT2Nerby
         jNZEFCpMnI0FE+3SFhAY5gQI0iOHLhScKqRPhKJLP1wTYwEN/SYoZTN6xCg7oOKS3cIt
         ofk9jex6qzyF1Vxg2zn++XAHCOe7tCcVy5bUFNp/ftYrlWfwE6RQkmxuvprkUR8UHrfs
         ZwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947971; x=1723552771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUcRome6aifEsersTpCMpduNSVFoSqdbAweLO2yUsUs=;
        b=PK+1oNBJdUtzUqyVwznRD3oou3Yff82G4+7Kovng/oG9aAc2/+3gvl1SYkO+hcs/2b
         lRFBw9rYKoQlUSpqVncNOzrE6nJlXu3Cm7JP7LljRKb//NQMcPCxprJRZbxmcMvAj98d
         QgEl81e4SIDZwkxB4pdQKBkjJcL5cPKY81QE0FrTinvvBsJedi/8vnThxrvPlzTbO5/U
         bSgigFSwV8L2jG9ubV0Oqx+awudHNO8KbZyvRrFTJ+kbdJHYCm3/mIHtax+bqk73Sho7
         k8mdbT3+HLk2bdABgbPzy3QiR179ZkWg4VLq7ExqJGHm/wB/ckU4AtivWW+lRdliOqU3
         YyYA==
X-Forwarded-Encrypted: i=1; AJvYcCVIZvI4senuN336oSI41Mtjabo9qo/Mm7sZw4fmW8qczcj+i7GTWlpIh8FY3cwlzAnJVwQHytDTataayDgdJHJv2drOzFbRrsiteYhb3gbSH//uIdNgfF4disVT/4NDf8ChLqCPkN2BF5o=
X-Gm-Message-State: AOJu0Yy19I2STIZnDkcdoYxUeByKnWILsUPtp4hjsbZAz5akaXtixQcg
	/D9l3zjU2AnYhoNvVNopuh+4I1eSkfuNGekDA9esemc/Y44fpIDJ
X-Google-Smtp-Source: AGHT+IHUfDO98znob4YgjsON51fycXcVTW5rurkotGdX1ipBhR9feQzTETdQoiur69HOCCOestlL1w==
X-Received: by 2002:a17:907:1c10:b0:a7a:a06b:eecf with SMTP id a640c23a62f3a-a7dc4dc1869mr1239022066b.3.1722947971392;
        Tue, 06 Aug 2024 05:39:31 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:31 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/11] ARM: nvidia: tf701t: bind VDE device
Date: Tue,  6 Aug 2024 15:38:57 +0300
Message-ID: <20240806123906.161218-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806123906.161218-1-clamor95@gmail.com>
References: <20240806123906.161218-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Video Decoder Engine node to ASUS TF701T device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 00708c3c3ed9..c646be32389a 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -87,6 +87,12 @@ panel_secondary: panel@0 {
 		};
 	};
 
+	vde@6001a000 {
+		assigned-clocks = <&tegra_car TEGRA114_CLK_VDE>;
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>;
+		assigned-clock-rates = <408000000>;
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
-- 
2.43.0


Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DA2FD7A3
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600548; cv=none; b=WaQt2tWaztpr7593S4RdOFxqXKXwWbKPf9elUwE3M3ZY4d5SkNH9B0kjihd4IgfKI7zVmmXecU0Q9WBGGbuDPmU/OhE37jiylc271VIAy/IrzWy3SOB/irFiVgYHiy4jNsM4gzQS2AGE3CpbW3Xet4ZR1OXXG1/6yFTAzbeDpZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600548; c=relaxed/simple;
	bh=ze79z0cIlNbaKQa0MA4ljsXZPan0FmaR8mcmgo52yBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CMkUzc4gJlVvxzXSfgZGtzyGKWz3F4zzg/W7iEmBD/J1X6lzmypGXFgigI07ezLzW0sE5lFs9dfj9107i0g5TaqBlq3YwoPvZ546/Cn9uD1ublZ9HqIcrfXgRBzIhNIL1W34Os77E6yR2jYq7OpEcWRvIIqF5N7YNUqsYktd9Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVrVt1w/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVrVt1w/"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3737d0920e6so4180581fa.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 00:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760600545; x=1761205345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWYu3otYisP3loE3ZY8+Cvk4qkPP9PP2d80k16BNDdo=;
        b=OVrVt1w/jVJWAbag+iuzqOadfBK33RiogSzzPZtfvmMdO703SDl3gGwxOswYDNzJ6k
         bHvz18OtmM1An1owpnDPDsiEJDLwT5RGg9JJOT19I5ckH6T1vZvoNUzQ2hA8929Y0h2K
         Ey3TLLEhQZ+0rxp4lb1XVJJBfPTDmOdTx4RxzbXpH2fQAIOblZha+wxsPfdUdCWJ0g75
         CEKZYoYL5k2ARLmgcDglOlyEFpoS1fIiRvohl+89i+Y25xns24lUUdp+P6aSS0ZqReBK
         nEwFes+7TVGHQniKaxgTWwdnN28bpiVADI5/uMTNvr0dJHtm9QYTONrAhigxBxNqXVgI
         sA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600545; x=1761205345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWYu3otYisP3loE3ZY8+Cvk4qkPP9PP2d80k16BNDdo=;
        b=aIkloahSzL/lV0RVEXrK5HsHng78eILeLUwvEb3AHvhheGN6BZ5OaJDt+6o2LlMj9n
         dczdaf+tdu3Zw7465xxzY+tgyD7DXB399o1CkcBy8hsviAa4qMCD44BEpMhmEBmEVl6n
         wTfgaeF5NMu/LTVl66XPftV79YRU4z9Wii8WOUqB+uxSlDTsY9zViW+uioKJh7r7arTv
         h5bQburUNxEi9iXoku+b1avnHBzUguNFx7pH/JEHiImSqODYthIfhwCdET1ZZwh2V01L
         Ad1FRQXGBj5dXCgMGfePvVNq5e2k+f8yFOiHyem8nQVSvcH3jlT203eRxMzQYFMpSHXV
         rWKg==
X-Forwarded-Encrypted: i=1; AJvYcCULgQJIu1bQqsL6GdUlurV/hTyMF9N4HIe1IVv0KomJD3vx1XQJuzU9ukD7hYhZCAJl94PD89CxLDc/gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTki4UCbEoDhNRhLTCoXm5KJ1g/fMpfh6mReA9mbFQPm4RuVa5
	6S//qi6fEpQDGdYFb235u93gZri7DGh0l3XB1Te6Ikbm8QnR4O979GZx
X-Gm-Gg: ASbGnct8iYNTlvfHH9LBwfpO3NbPoLojWKXUSk6Mu5fo8UBRtY2Kr6aJqwsN8gP7Ptb
	YWbI0hUSwNklnMGZJEO5WWKagLga1AcnRy9lCT3oLP2gnsfXQYLbbaTA9ECg71089Q07kBVY1aM
	0VsfnP1OLqxmbLTF69tmgrQ6NcAKqH31r47t9pT/Eu31Chpvf4qzuDC0x6aJv7/ryv12QcG/ZSZ
	TyG9ze6lO++HgM/0O7cru50/vLHeWfURihnl4NqhxldK+8mcKcAHwonSJ7eBHIySrzT7pY8ZMg3
	OR+49BuyMqWvjGa8mdDy8TOaEhmXCFidxzzLbQ0IELPjACL//+tHQM4miCkZuawOp/y9Abgm9u4
	YKpKsuzw3TxZyWh4t6mz4ym7QTkRFG1WpXg2AJ8FXZEQcbT3UTQpra1EBIrD0cN06mXzvdQwzZb
	b/yA==
X-Google-Smtp-Source: AGHT+IGVgf6/RN8IUHFNYJOZvU23WBLAQhmiwYE6OkYEXsUUlwsCRkSsEJa3T4KsUiG0urBQytUN8w==
X-Received: by 2002:a2e:a98a:0:b0:35f:a210:2a35 with SMTP id 38308e7fff4ca-37609cf7f62mr88037521fa.7.1760600544458;
        Thu, 16 Oct 2025 00:42:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea14d46sm53226121fa.34.2025.10.16.00.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:42:24 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4 RESEND] arm64: tegra210: drop redundant clock and reset names from TSEC node
Date: Thu, 16 Oct 2025 10:41:52 +0300
Message-ID: <20251016074152.8759-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251016074152.8759-1-clamor95@gmail.com>
References: <20251016074152.8759-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clock and reset names are not needed if node contains only one clocks and
one reset.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 942e3a0f81ed..cbe54c4e5da8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -183,9 +183,7 @@ tsec@54100000 {
 			reg = <0x0 0x54100000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA210_CLK_TSEC>;
-			clock-names = "tsec";
 			resets = <&tegra_car 83>;
-			reset-names = "tsec";
 			status = "disabled";
 		};
 
-- 
2.48.1


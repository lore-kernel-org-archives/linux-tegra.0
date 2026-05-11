Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6943A8759
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485775; cv=none; b=Tpkny+fFkNIZV8GBD0oIy90l6cJyX80/eB4GEHrNWYloCDZuxfQylsAYcuj4mRKIwKZA5/TxQ/kCnVXDhUU0Kd/4WEDb59U6jAa32tiUfxoaHev8ZdzGBW3x63w4P4/VllZ9jDolyWTTmHQ8oMTuFq9c/5rBSThu0POfsLs46vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485775; c=relaxed/simple;
	bh=PKFdbLOtezmddcHtLj3hd26ATJxGdOHkO0A6JXK5y1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUB5jRqy0AXMqZxxl/oD76eQRX/PXLEOtD7VFZdtwOVDZNRnMmMH0liMwY+H4H4Ki1jjxoqD09qajVN3JCtXrXERORUvtLbtHW194Gmeut3hQE3/vQsIiQzdknVPJNVxbOnHSF76hvgNmJvJuamI1oKVLkrfXmBuPar7/410iio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1muvo8S; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1muvo8S"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso686551e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485759; x=1779090559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B403X2O1b8FGNNeGhrK0Mv2epOELGQnn1++DaG9H56c=;
        b=e1muvo8Slq/kR6z4gGStjHgCUHJX9kUIVl1C/UtK3/Yk+iWHXbKOmntyZfRjndxR8k
         enn4L7lzqqxibN0jq/insFVuwTU8OkyenOMxLGzGScyRDA1aZnTvEu9FULfkgbIFoKg8
         jy0ZTODEIkWMi9C8nRhl7SX9xZx0NJO1PNW8GeZSs/sqcvlELsFUGkxCdPx2O0xl3YKo
         l6q8xH0Ah/zgsXMTMmKE2hj8vFOYAY+/He4+JcstkAKnvnz7OYotzD0cRFJm95WPIozF
         4q1SIt0VSaaF3qR160Q0Wpa1LGbyRmq94DAiIyKDE0KFvgTaTxs9qX0JsHUAXaGSifAn
         LBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485759; x=1779090559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B403X2O1b8FGNNeGhrK0Mv2epOELGQnn1++DaG9H56c=;
        b=InY6wEGNd12uB9XcEcYeiJyQ/ynH5Jig0ga2vZ4P34uUZoEpJvCuOoYCdke6OHQqjb
         wt8Ps4qRVp+eiINkSiEzTaDB1l7CH1cJof513jEqKFlvVP9klIkzzusER8Xnuf5IwXgQ
         a30sMZtA549qoOmk8aqDTvGdnmuMAHP87XwYUz3L2V1mRCFgOhokBAnJ8l7oZsGZxlK3
         pTOUY5AE9Dnq+7o2XUWjBoezwCM3CXbx9s7m9uUaXjA5GgHjvqp5exETPMIzOzcQ1309
         Qk7SeNBJsDZ3tWF10DC0gNXCOqltPbXMzGdedG9U06gP6/J1MMIiSa9fEgmFCBU0ckH7
         FMow==
X-Forwarded-Encrypted: i=1; AFNElJ/TMnhOzr2gNpgZUDjAd60Y4zCv6yD+a8yJSDrEUClUv9UfQw62pEJYVminQcg/ucajUPwaG9PYyLyooA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLzRmjpH0Re5baSWD5pqUSAVWc9j2rew6DAzBoABbThNGy2i0/
	NaL3/w2DBdS/tkc0sYqkj2iRZDCsL4cHL80igfoYnc4PcWMAxmHD1gsE
X-Gm-Gg: Acq92OGFZitvx+tR7l34dbpPdbhg1AKnenoxfE9Epf4tHVzqOQZitwWTlE2dy1VVykh
	c/4dM7v36bU8b7Y4ZX9DxGdosXbPcItQo1x1/Loyo4OFi7CulUP9d0hpV07R4WogVo7FWrLdC+F
	L/d1/W6uG+gzIkh9aNggN4qDR3jQV5G8dy0fWj3i/zvn+uWRRXMijAakKCETb+BkbjY1z91HteG
	5i1F9NFRw+mURnwIXX20HCmWqo472zLA7c/YR2zB8mGzBroE6zjhLzKjc0YcznRIN4AVRHp1BM0
	IeEKncUwSOBSzGiLY2KBM1WpuTy5QfL+bu3Xe7NOAPO/0YQnizUuxpKbXgEpSMLkHzRhW/8HskK
	on20mtA/b03zKoSq0IP1Z8Y0+uMAQ3UyLJfK5M/I1+T6Xo5IqBBOGGicMOyg1+3Lvbg48w3NwYh
	FszrIpREDe+XDTI1KFBHS5z9I=
X-Received: by 2002:a05:6512:401f:b0:5a2:843f:5800 with SMTP id 2adb3069b0e04-5a887cde847mr7386529e87.23.1778485758654;
        Mon, 11 May 2026 00:49:18 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/9 RESEND] ARM: tegra: lg-x3: Set PMIC's RTC address
Date: Mon, 11 May 2026 10:48:52 +0300
Message-ID: <20260511074859.24930-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LG X3 devices have the PMIC's RTC module located at a non-standard
address. Set the correct address.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index d2a5904cebed..60e8a19aa70e 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1297,7 +1297,8 @@ pwr_i2c: i2c@7000d000 {
 
 		pmic: max77663@1c {
 			compatible = "maxim,max77663";
-			reg = <0x1c>;
+			reg = <0x1c>, <0x48>;
+			reg-names = "pmic", "rtc";
 
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
-- 
2.51.0


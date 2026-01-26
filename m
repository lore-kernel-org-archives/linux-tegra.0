Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8036D1A7
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454951; cv=none; b=spZgRwdjVtg/hI89ntUfu1s3a4LplKGZ4w82asSgGVW3qsuChvZKy62rl0UlJ0/RdFLimjobgN5XjdGmp5BiQcUW+GokDdg5lrZvDnE363Cp36vCyXje16tBQsoqyA0eAx1ODCMFa8Q/LeezUKYl09FZz+szoLVnC+sjbKDQps8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454951; c=relaxed/simple;
	bh=VJS7tKi4W2dCRDnFqQGBe73LZKmaMcajj+4bVj7gZPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+GjRTh/GYeFa5dv5XpmzLtx302IbBn2B8zSovmeHmaWlmbXHYsVnX3J9yJPRQe55wAbxX7M75Dtods5WouflCYYbNJOaEq2SPg+hgB3OCivicsEcV4cQEftHR1M9JIbiEgW7iZ48ayvz+z1Z4VCj+xMGqMDHZGY3KFyZfTxJXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTmoyt0m; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTmoyt0m"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so37457585e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454948; x=1770059748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW/vKp7i5enJJG2aIk5G1BDDlAi5srul9SKR0E7oEGI=;
        b=VTmoyt0mNgEov0A1vaMX308R5EG2nre+aWXU/ojE3I33Uf9LCYnh8xv+wSP4ZyNDSM
         QSlpnPjS3seu4k23k1bx27yJWuFfhid4mi5W1AkHtc7FDRzA6LL525Fdm4xCzjITUj1S
         y3BfhmOvPfGM7GFTVoX4hnVfcIqTVR/HzuHPchPmkRtj5gx1N+hBbza8diwCWg7i+Ld3
         y/YirVOtXr/lL/HoATzjCXayFdygmZK3e1BntM58TwIAM0QBOyHRVJAkv/MI9178S9tP
         6RPE9RGJO4s6UHDYPFZNxi4xKX53O8qcLtA5hDkdKm/YeMdvbemoz02MUwAilSeadSno
         E4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454948; x=1770059748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hW/vKp7i5enJJG2aIk5G1BDDlAi5srul9SKR0E7oEGI=;
        b=BjRSMSFpOpcA267TIw8julnG3AYroNTub4W52hrt8OlsG+bGMXzjp+7DoHlGQnEnFx
         9SgJ1ANZ66etJ46yc/p9khp8SA/afu4GjP7QMrYIVylAU1CCYbMnLZdVIYOwZ6FGeF6v
         74pMRiZ51otGzBUuE+Ft2VVnykop0qI/SP+jHN1s0A3HORRHEXUsi4zSFhg9Fw6QpooY
         10fjxGrr3fz8PHZ1PloV/0ZMMBp7cWl6pSAohnegJe0EkW1KDfxBh+Uz0QnjNybJ3a9W
         dscfN0D3fHy70EXbvsS07vpmiPOya7utGn+IKDCvShUZcQd1sQpsSOpikYPaI0YzGff7
         M5HA==
X-Forwarded-Encrypted: i=1; AJvYcCUnIlkRxwx1Sdh7Lz10IIU+d2xFIy7CKe2TQCxtEMEEFNSf/ufd8NYqehgtvf0RUIWGWgxuD230khaW7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZo+SDQVqi+z9pCk5pfqurfWHR2CRA0Pn6m1RiPp7g13KoVDYw
	qBFwjWLQ/EpVNGJXf0PN/Vlsh+1sTps5U+gd3hf+hc+tOuXSm1EBcIrR
X-Gm-Gg: AZuq6aIYJ654ZR8vPsaSp7qGeR96kYC038o6a2kk7Jdz6Ncu4J6jPegQP2iWhPzGBZK
	RD8hewesGgbAaAvOG3r+M5nGDpWlX2XPUAkc7keRWpImd5uejk40mW+eH0lrBWP75c9JOATBb1x
	Izh1ugzTR4uqHoLW/Ulj0Ufx0+nBCDTjWqhQP9AscXIvNF6CNlwcn4XSFSy96MWya8nQPuIdEjK
	G+K3QuRNDIkEfFIuWScS2DupKUiVABXPcoCCNiwk9VN6K2C0GpSJ0hODC2axYyfilZ0hhhMwQkW
	ZivFNnavqZKgTmH+HcNaUzEWHGHosdLqFTBSUsOEoKhIehoIvm/Q6QnSMvJwDdmISxtnTyK6mkU
	W5MeiywIikvcmFRyP6S87s/cc5lLaZu1nBd24srNGNPYy5DmMmcoQLgDchge1C9uSFBAIxvR6le
	PL
X-Received: by 2002:a05:600c:19d2:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-4805cf5f67emr80180905e9.22.1769454948026;
        Mon, 26 Jan 2026 11:15:48 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02d0dsm30958219f8f.4.2026.01.26.11.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:15:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] ARM: tegra: Add ACTMON node to Tegra114 device tree
Date: Mon, 26 Jan 2026 21:15:32 +0200
Message-ID: <20260126191536.78829-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126191536.78829-1-clamor95@gmail.com>
References: <20260126191536.78829-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for ACTMON on Tegra114. This is used to monitor activity from
different components. Based on the collected statistics, the rate at which
the external memory needs to be clocked can be derived.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 02d2c40dd79a..ef0618e9eec1 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -312,6 +312,18 @@ ahb: ahb@6000c000 {
 		reg = <0x6000c000 0x150>;
 	};
 
+	actmon: actmon@6000c800 {
+		compatible = "nvidia,tegra114-actmon";
+		reg = <0x6000c800 0x400>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_ACTMON>,
+			 <&tegra_car TEGRA114_CLK_EMC>;
+		clock-names = "actmon", "emc";
+		resets = <&tegra_car TEGRA114_CLK_ACTMON>;
+		reset-names = "actmon";
+		#cooling-cells = <2>;
+	};
+
 	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra114-gpio", "nvidia,tegra30-gpio";
 		reg = <0x6000d000 0x1000>;
-- 
2.51.0


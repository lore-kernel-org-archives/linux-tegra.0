Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD47F26F465;
	Wed, 26 Feb 2025 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567400; cv=none; b=O6p7CzLEE3I5ULk3CwRNEu8ANOKT4PRn/k3KPio/t3OZpBvK00qpjAo7p9Ziqo6mtjQz20F3DS1ecfzHjd4OpieuyoXU36FKclkn4i7tque4zwp9600i42FnUDKK/XTa+vbRhZ9Bm5h5NmvvCf0zoU2Zuu+Ema/UaENEmgiaUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567400; c=relaxed/simple;
	bh=gXfEDFzH2yg/xdoPSye7mRhvuYC/zfRXRNvgFdmYVKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vag0awu36POFtt6tqRM/bwcWLsZ2/UE3467y3RVYdPsXnmKFzQtqfEfj+eajZh2i5raXijgiBptHJKXaMWz8xH39L/k6ou8+26Hm9SjPeRykrGoqI9BJZu7CqH6cQSfa781eMF73S7G0NEq12IPIV+Y0FZCJyWDVzZApppCNAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRDbIVd0; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRDbIVd0"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abb7520028bso896305466b.3;
        Wed, 26 Feb 2025 02:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740567397; x=1741172197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teLVO07keaSMySlhCYbKxzXch11YTOvCvybQWXMyrH0=;
        b=nRDbIVd0738VxaMqQaaHH2aGk5ZCUS1+xz4czFbDwXkMMMXtnS/HKV1uSh1FHy2nZU
         ccnUxTip853l6YeVBFo3+7MTZYAGj0SkEOW7cGO/ONfqAqj07naSQJRpsstbEstzNBuU
         3kLKveAQTV938B1ZMs8gKpTChxejwaqR4yndpVI/GT5Hg7nHfBQRwqQ+QjW0svtVqkue
         juPKej+Ug+TBJKfQ2YF/zAhIo07wKaEOoE2uIKkhSoVdPV3PRzy+L4fIRZBxsAkp36ZN
         KfQ5oSdDer32OXsnYCcOsWlQ5VBvdkIjeSwOmuv3eSn7M/TM0TPEgZroLmtQRZqgTrrX
         k7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740567397; x=1741172197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teLVO07keaSMySlhCYbKxzXch11YTOvCvybQWXMyrH0=;
        b=w/O/RFuMR2i7zKZeCa9okO4hs5BufOlH/0qDwNEJRnOu+bsnrdLNmH5/99HL7A+Ig3
         IQe9dmzI/lVgVn9uvdby920RScwGxBNYkHT8ODpRUg7x9c5gfI88L2dafqA7jrjIUwbr
         oUWRB1CZLOZAxXKRaTtoKlbr2BfpwtLkXRQQNEZGPCPOTm/LZOmdQrpZ5sJStu1oGkSJ
         YcBL/xDVb9iiQYlrw7lNy4c5H+Iz4rfMrQvkhBG4Ju8hVdZDOd2OBx89vbYtz4xCBoBs
         W359uK4T27cZ3D+a6ZoqGDUAHizUqbVxeClwxUt5mY90Q/xG69oUI0aGpqA6W/Rm+82b
         ZOTA==
X-Forwarded-Encrypted: i=1; AJvYcCUWQcxqynIzP01cYdUZ4RJE1l0V8dqGkREMJdpSbkTsi95ZOxVygI+VSOzKQMK+nOMTjGDmzW+LPZoV3ZI=@vger.kernel.org, AJvYcCVrZVG59p7wl9kr8w8RvNOER7SnroWo9s3M65hOG1MqHc3AeEQkKAPn8iEUxxIcDWlm5RyEkkhgOs5uxHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPK/3DQN+Bli9UO0fO1dg2A+AaCwYyF9feBkvBfWvbAia9qdnB
	XpvVgmST09GOQJgmWyObm/TD5NNnSf8biuOWfgffGOfEQ6VkyyX4
X-Gm-Gg: ASbGncs0LiXRN3Tt8s5s4tsAFx3g+qxOlUz9NHtL0qwUMAUHwrpp7iKN5Vfrvg8AZ06
	uT/P6pGimFm6UVwYaOvTJsVxKcoRC2iHAseKBXvNndpWf/LMJlvGD226CRCyRe0pGg9JO+KRd45
	YH3jFPmRbjZYUwK7i8e/hXMRdZfLo4cYg0wSLS68AOO33LmSCQihyOZeb7Xkx+9+tKX4e4HOVDW
	iWl8MFkF3vHB/vMbHoyXIIiNL0BvWifqoEPOPQR/HQVkGtjmXsu7f7xrQX+VNADufyk/HCPkYCB
	SHxk/W64XryaQy+cvGaExoz8zGB7mK/qO2of
X-Google-Smtp-Source: AGHT+IHhfWa9TaOCXiM/6yV0P64HDrLoIyk2Z56gp4Rqc9AASEIIUWC6AxK0ol55GQULD/3B1as6XA==
X-Received: by 2002:a17:907:cf86:b0:ab7:ec8b:c642 with SMTP id a640c23a62f3a-abeeecf6f79mr327539666b.5.1740567396925;
        Wed, 26 Feb 2025 02:56:36 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205e53fsm299771266b.159.2025.02.26.02.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:56:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/6] ARM: tegra114: add ARM PMU node
Date: Wed, 26 Feb 2025 12:56:12 +0200
Message-ID: <20250226105615.61087-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226105615.61087-1-clamor95@gmail.com>
References: <20250226105615.61087-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ARM PMU node for Tegra 4 like it is done for Tegra 3 and Tegra K1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 62d4a2bbde0e..9021c6698ee5 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -870,31 +870,40 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <1>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <2>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <3>;
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a15-pmu";
+		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts =
-- 
2.43.0


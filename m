Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BAB1C5793;
	Tue,  6 Aug 2024 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947976; cv=none; b=hqRiu34C3lpRk2UtVHC7IdBdYNxTYVSP99JxDYt/4nXRsRJECvePyQaWvYCwaMJpSOSh3bT42rLU3b6hJQ6wNrg0fzg8SbXEkAROgzWE/b9G5qAm3Ss4DtL/foPtdxNuVgbzE4XbVDOnxiZNdIntfwsNZDXtKBQTmHaV5bCdtoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947976; c=relaxed/simple;
	bh=Jpzj51yz5usTDHPZWVpgUIrdf/EZfTyBpuorPIY9YuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBHRfW+O9lnqrs0eX+EgN0blFd97SFvF9cY1z5dS6x1+VBNqD2k//6tt687LckHDmS8x6NBsHfpZvHGPy8TcEjcEcqn4K4tkMOXvF9JXDhydfmItGsq+JFI5m2ltamjnAM7Tw+zXgYnd/Jy/yEExQnLDsgFF+2PT6kryN8TXkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjrhEJVR; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjrhEJVR"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ba482282d3so697419a12.2;
        Tue, 06 Aug 2024 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947973; x=1723552773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2O9aZ6PV6TDSOYrSRute1tRml7QkrF+EQxLPji1ELw=;
        b=JjrhEJVRhkpT8aJGlyZuu8VBqTFz5XGBd972S0mclvBM2BLgZhhJM+RQLe2VlDdv8w
         M939ae+dtAR13UNyfsoMfKYOVK7BX2AhmTjmR9eShh8h6a/9PEHbzxPj1T8RFNe4C5Ct
         ehlZjJF28U3CUpddEfm31NSm6sW124RH/A6AYjADoxQNimgE4bKfEnbhK9hM2/9eEjAw
         q74jPpxogGRtWq0qj7G2NU7I2+1NEm8JS+KXqubKfuc2Hgng3sTqJrvmv/VS0FU258gO
         tI8kWWo/F0A52EeJhrdtnIp86n9rH2hQrLdTAHdiVjwIysllTj4jBG0JNnnTrRDEDFyH
         s22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947973; x=1723552773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2O9aZ6PV6TDSOYrSRute1tRml7QkrF+EQxLPji1ELw=;
        b=caZEfZtpZh4AmaAx0LhX8zp6noS4bhTih4emt2pbzJeG/O3oPtWgUGSvlggCWl6xI+
         AT+7xm4J/pbzuDrpfNfjBYEe1cEfEEE31Sx4YMbytD9PAoW2CAETTo0sH4Wgl+b6AacA
         rK9/3X1+qvxYmxuySGXJ2iVWTfFTCFyDZkT8OcGX5mQ/weodl7cw1LTslqfOjoiLZ0zo
         lTKkYlh6XRred7N5t7chQ12Wlbr61mE/p71tk4MVMW19+4DEVXhYHGj8adsLho6/wUSl
         n8m5sf3x1DfsKTC7zcp0b+c3ZSdbUZNSDXf4GWvLvELhHXvzJ28YGwepHswV460lyGMK
         xExw==
X-Forwarded-Encrypted: i=1; AJvYcCVTUrJauSvVB6vxw0ALiBS8ues/f7FkCZ2Q1005av4KEz+8o2emYgqpS8wUMq2ryVKl0P9I0vcKXVe8yIYTEUr4jIO2Uy1+Mxii3smHf5dt5ys8n/IxnYjHXA3jVYt7pIc5WJgQ/cWjjhM=
X-Gm-Message-State: AOJu0Yz+KWK6ZqpWQvVbV5UZSxTBzO4FNz7/0IYSgPj9V4unJVMdhiee
	j2MouHr7/YChOTblnK+N2omYa3Asii+VIheZivZQoYbPQgiNw381
X-Google-Smtp-Source: AGHT+IEaWeCNyI5s9cV4x6PVmlxT8Nb8dazObGBd36iwmpj5+8JpRDGtyRVkMpp9NdCIxlRz0gq7Eg==
X-Received: by 2002:a17:907:7e9b:b0:a7a:8378:625e with SMTP id a640c23a62f3a-a7dc4fa1673mr998655266b.26.1722947973340;
        Tue, 06 Aug 2024 05:39:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:33 -0700 (PDT)
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
Subject: [PATCH v1 04/11] ARM: nvidia: tf701t: add HDMI bindings
Date: Tue,  6 Aug 2024 15:38:59 +0300
Message-ID: <20240806123906.161218-5-clamor95@gmail.com>
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

Add HDMI nodes to ASUS TF701T device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 03ea6cc8079a..fe1772250a85 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -57,6 +57,20 @@ trustzone@bfe00000 {
 	};
 
 	host1x@50000000 {
+		hdmi@54280000 {
+			status = "okay";
+
+			hdmi-supply = <&hdmi_5v0_sys>;
+			pll-supply = <&avdd_hdmi_pll>;
+			vdd-supply = <&avdd_hdmi>;
+
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
+		};
+
 		dsi@54300000 {
 			status = "okay";
 
@@ -1174,8 +1188,9 @@ light-sensor@1c {
 		};
 	};
 
-	i2c@7000c700 {
-		/* HDMI DDC */
+	hdmi_ddc: i2c@7000c700 {
+		status = "okay";
+		clock-frequency = <10000>;
 	};
 
 	i2c@7000d000 {
@@ -1531,6 +1546,20 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	gpio-hall-sensor {
 		compatible = "gpio-keys";
 
-- 
2.43.0


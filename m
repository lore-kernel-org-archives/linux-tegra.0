Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7011C460D;
	Tue,  6 Aug 2024 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947978; cv=none; b=ESDTEsJoyIuWTTqHPnl4weBOjf5mlXkbnkEmOyfKgIMIge7/kHqyYBSqQQnNLFgoAFW3awGmzlXAtwwGf6jptHiGP3uAtvdVmsr1BQaVfzwUpPNX0I2JVnuudE6UcgLfO8Po9wEniBGvTSr7bNiXkpsYavViVyY8HZXguX64TPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947978; c=relaxed/simple;
	bh=Zcbi0nIJ+umAnUb1Ra8FigFnrajqKjzCp72bfgQf8mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abmaVuSkD9XEOxTPK1v9UPoapAk2KlNIqR+Aj8gkjcSPKAOZYX9SukVsWsSR8ZtkrZl/ORi91629LoN/qiXNYuNBcp52aSz5njbiFkDuWXh6F5V8Fl0+0TV2hTSF/VfGnpn4j2iTBUMTzSG1K8/xW6iT/GgDoYn0AVE4uzicRrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VttPuYUJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VttPuYUJ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f025bc147so810846e87.3;
        Tue, 06 Aug 2024 05:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947975; x=1723552775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITfI4jVkvm4/v3IzU0lMsBXpIjJLblRR2dk//rRqDt4=;
        b=VttPuYUJnpJm+geK1GvX3qTrx1Qm2OmLqz7KM/iFLCJrzb4qFtyzNdCdZnx9ljM788
         dt5L67GvLYRep754zWNjBjM726etMxL45riApHSFAHqFjZOlZDWkmG1g8yRVNmwZr62G
         1Ub7jFh7CnQDQEMjLlTAheHXayE3/47o2sBOJFuMDESS6PG1AXCRSjG906AQ6QJwG59m
         JWTH9kHFze49dma1LrJT16o9kkpN0jVnxUwZvmmg3RekEemH7V8CpBUrb7ddyqQ2dHUN
         SX5a9M48c7ntXLQwc1sYhEA9oGgcrOZf0rVpml1FcHLm9TD9w1IYfDhXUb6E/brLQ+sj
         G4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947975; x=1723552775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITfI4jVkvm4/v3IzU0lMsBXpIjJLblRR2dk//rRqDt4=;
        b=NgKH4kEtnlGpPlSkhbS+lY5OhBExY43/2+Bwer8pkUQzs2fL9/UiXnjmcMdWU1KFv/
         rh84mY1//R5t2YXOscB1QcQvZpuk3+ftjPyeklaO4239wyLW+pLzr2CrrIYKeHsJo2j/
         mbCx4f3BLwBEjQznwLwD3hzIBp6BgEY7HkoxnlCnMJ90lqjUKKng9RB/l8WAIzjX+Mri
         epMPZzFmM+5ehiqbmGU5D843FY3RsIdQ5zfCFj7oxYmhKrsvOwDdvob/gadHjfvoyg/U
         5DZYv6Dux995ceYUH79sxpNo+eYkm50wpnjca7O2aMe9UkS/HxAkrE0PjPPQwgl/6ZWK
         ngWA==
X-Forwarded-Encrypted: i=1; AJvYcCX+V11vqgobGd0+m1fOAfTNOy5WLp6JWnC0958PFZVnrnqfUOv/XaofReJNkC9447mujd71GsJGE2OKdM9k63qbv5eaTL3wna2NwNVLVUvY/zLilHk9yPtap6k+vHM2JsAtYm0C8JVqeIQ=
X-Gm-Message-State: AOJu0YxpLnB+SH3OEq19ydw7VIqXaW3ZsA+Dn+ICI/esmRwbd1R6rdGK
	fZwAGiiP8+UqTYGo4w1UDN2R0JdEfB/3nhC5pmm+W8Eu9vcCSBeV
X-Google-Smtp-Source: AGHT+IFPIUM9ofkEyhmIuuO6yT6wavzL4NGm/tG2p9G49gvfb6znTJZLpC25PWrDyygfvnwGG9cawg==
X-Received: by 2002:ac2:4c48:0:b0:52e:be49:9d32 with SMTP id 2adb3069b0e04-530bb39613fmr10210259e87.47.1722947974433;
        Tue, 06 Aug 2024 05:39:34 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:34 -0700 (PDT)
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
Subject: [PATCH v1 05/11] ARM: nvidia: tf701t: add Bluetooth node
Date: Tue,  6 Aug 2024 15:39:00 +0300
Message-ID: <20240806123906.161218-6-clamor95@gmail.com>
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

Add serial node along with bluetooth node to ASUS TF701T device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index fe1772250a85..00c3325878b9 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1111,7 +1111,33 @@ serial@70006040 {
 	};
 
 	serial@70006200 {
-		/* Bluetooth */
+		compatible = "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
+		nvidia,adjust-baud-rates = <0 9600 100>,
+					   <9600 115200 200>,
+					   <1000000 4000000 136>;
+
+		bluetooth {
+			compatible = "brcm,bcm4334-bt";
+			max-speed = <4000000>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+			clock-names = "txco";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "host-wakeup";
+
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(EE, 1) GPIO_ACTIVE_HIGH>;
+			shutdown-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTIVE_LOW>;
+
+			vbat-supply = <&vdd_3v3_com>;
+			vddio-supply = <&vdd_1v8_vio>;
+		};
 	};
 
 	serial@70006300 {
-- 
2.43.0


Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F1262FF5;
	Wed,  9 Jul 2025 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752102860; cv=none; b=mBfaweG6oTaPSi5Ce7iiutrpjUcqrJ7VeX4l9AVOZMEGNZkYRQgZDy2ykRrTHnP1Py2bIGz3IGl+zJ7P1g03gOkl1Sdccn3amh8Xq/uJ/lBNy6VV8FbiDTcyEM3ZrYV1YazxDVJNEpIlDx+8tWyKOJGM2hhiDHiz6p65GdXLnDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752102860; c=relaxed/simple;
	bh=X2fgg6h32LE2Ndw7beV5Kgj7O9S9zqmzVzvy7B30Rvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9NtnnTzHAbaARuymsWQjW7r3BOdc7e+7OUMdMCq6msq5F0e9QmlnA2nB3ibtoPbrEzWS7xznKTn9zAg8OqufEd05UwE+d5Y4Bm7LjOO+vbaT7O5wtXFZv9T74fYo3lXGjfby4mfZccwA3eB0AO/GS/a/gdQWbMqzcF548QSmOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxCrws7p; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxCrws7p"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cfb79177so1869675e9.0;
        Wed, 09 Jul 2025 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752102855; x=1752707655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRh4g0QaY86Th/WId3M8eIlyv7sqo1XzF9a5KT2kIAA=;
        b=FxCrws7pyZ6IOiHFh0duOXozfx93oOD3TfMv8SuyYpH0hI01fNOcJz2O9ZTmlGTytm
         mKGwkIllzW1teW4M4eVAUydydWIySehp5om2Ct6rFteEzXc4KAx8ggAfqoZc5oQYOaAy
         CEJnTipN3zWC9+QrTfu8qYOdhUTiEO11sZ2nuFh+O2ZqhTmPXaMRLy3XNmjEokHbItIe
         FqvG82NxYFJfgi/PzapOeJAckfFydf1yN9SdLBAzArpqiNzc/G04lveJ3fictzBBALsB
         Xnt3qwrDRNJPSTjhxRI5gqHU8xMUShWwqqM8wMK0kppx2KgbYZlU8RgsveAWdETGi5dN
         DLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102855; x=1752707655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRh4g0QaY86Th/WId3M8eIlyv7sqo1XzF9a5KT2kIAA=;
        b=btJBKX37RVu/Xg13oS13t8FUwpg6MxTDwPPADUFO2sVGnZHO+qtHNj3CU5+P/fNvY8
         G+mGm5++93ZUB0xiHxvFxA0IZVRiDOcDJ2L5pUF5yVHq6TBZKqseSHZMbtA54x11jYH5
         cVh8SiVkW7WjjqeFv1BFI6VVOtREhyYyUfhcjc6JdIUri57f1jYz9h+9tJiQZgoz1xSt
         T9eGO9105JWphenSySAkb6wmtV07e5uXS83z7VN4djgBeIvgskjvyhYW0lwMf0q9CbE+
         jvVD1/Cx/RMaSYUfS9ybuC9BxQJpRxVYl7WzoKCBAYQ0H3eFWIKj1HurVFk93XFbNENR
         CASw==
X-Forwarded-Encrypted: i=1; AJvYcCWZvhCWz8yH3qfHScFviTo/8LB14TnLGjacSx8gqYnwNOm7btij0kemyQGy3kSbLXg72u9Lx1HoIwSl@vger.kernel.org
X-Gm-Message-State: AOJu0YxWJ9OVR/VFaXNqf/WD3FHfHOIoWD8j0zp04aEQIVTsairkpZ4e
	wZV+rUzKNO0b9i333h9MNKuVUvm+wIL1ZvU58/FS2+ImZT5+aTbWfwJ7UmC8yg==
X-Gm-Gg: ASbGncviNv9l/9r1UEFlHyQjsd/flPefFDioiWh+FcpXMzpUeqhZVqq+R2n62AuRcEb
	5N9442/xz1DR2mXKwO9Kk/ulW/97cUtLbZNdvAye1MoWD/j7EDwpxz8b6CfSVAQea/ZpI2Dmufb
	Wz8K0dZi3FkBJzmv4VeWUDxFZoJxkncWDfEn77s6sKObFd8hnCHjffPFXLkoLIqu02Qp/1CSKF1
	Gze+3OdeqUNfyA6IDvlc7ssbCDlX4M855PmwW07kUeE9GNLGHh+4+z4lEwALKpBnJQpRu+TzrIQ
	/oDJ5iCEu0+Z3zgPr9/HX1WUpRMQI82L5hmHHdkxIVS6wUJd4/yz0mUjQDn+pFMMxJs6p/7EtNK
	Qnl2wZDc0DcJt1BUmg0VbTDY8i1/Dbf2XYHieBHPDwk7PWrr0UMHjiQ==
X-Google-Smtp-Source: AGHT+IEXy/xUSngXlbtshIlGqlOa2wRaPb/LCFqe2vjJDzVQGHHQvsHe4iqDOU2Hgyiv6s5/U9O54g==
X-Received: by 2002:a05:6000:21c7:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b5e7881163mr1212345f8f.7.1752102855041;
        Wed, 09 Jul 2025 16:14:15 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd241210sm2048755e9.0.2025.07.09.16.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 16:14:14 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: tegra: Add memory controller on Tegra264
Date: Thu, 10 Jul 2025 01:14:00 +0200
Message-ID: <20250709231401.3767130-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709231401.3767130-1-thierry.reding@gmail.com>
References: <20250709231401.3767130-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 0c9e4809b310..62c87a387b14 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/clock/nvidia,tegra264.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
+#include <dt-bindings/memory/nvidia,tegra264.h>
 #include <dt-bindings/reset/nvidia,tegra264.h>
 
 / {
@@ -196,6 +197,58 @@ smmu2: iommu@6000000 {
 			dma-coherent;
 		};
 
+		mc: memory-controller@8020000 {
+			compatible = "nvidia,tegra264-mc";
+			reg = <0x00 0x8020000 0x0 0x20000>, /* MC broadcast */
+			      <0x00 0x8040000 0x0 0x20000>, /* MC  0 */
+			      <0x00 0x8060000 0x0 0x20000>, /* MC  1 */
+			      <0x00 0x8080000 0x0 0x20000>, /* MC  2 */
+			      <0x00 0x80a0000 0x0 0x20000>, /* MC  3 */
+			      <0x00 0x80c0000 0x0 0x20000>, /* MC  4 */
+			      <0x00 0x80e0000 0x0 0x20000>, /* MC  5 */
+			      <0x00 0x8100000 0x0 0x20000>, /* MC  6 */
+			      <0x00 0x8120000 0x0 0x20000>, /* MC  7 */
+			      <0x00 0x8140000 0x0 0x20000>, /* MC  8 */
+			      <0x00 0x8160000 0x0 0x20000>, /* MC  9 */
+			      <0x00 0x8180000 0x0 0x20000>, /* MC 10 */
+			      <0x00 0x81a0000 0x0 0x20000>, /* MC 11 */
+			      <0x00 0x81c0000 0x0 0x20000>, /* MC 12 */
+			      <0x00 0x81e0000 0x0 0x20000>, /* MC 13 */
+			      <0x00 0x8200000 0x0 0x20000>, /* MC 14 */
+			      <0x00 0x8220000 0x0 0x20000>; /* MC 15 */
+			reg-names = "broadcast", "ch0", "ch1", "ch2", "ch3",
+				    "ch4", "ch5", "ch6", "ch7", "ch8", "ch9",
+				    "ch10", "ch11", "ch12", "ch13", "ch14",
+				    "ch15";
+			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			#interconnect-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			/* limit the DMA range for memory clients to [39:0] */
+			dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
+
+			emc: external-memory-controller@8800000 {
+				compatible = "nvidia,tegra264-emc";
+				reg = <0x00 0x8800000 0x0 0x20000>,
+				      <0x00 0x8890000 0x0 0x20000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&bpmp TEGRA264_CLK_EMC>;
+				clock-names = "emc";
+
+				#interconnect-cells = <0>;
+				nvidia,bpmp = <&bpmp>;
+			};
+		};
+
 		smmu0: iommu@a000000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x00 0xa000000 0x0 0x200000>;
-- 
2.50.0


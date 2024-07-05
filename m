Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FB914AD23
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jul 2024 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173132; cv=none; b=iOaPoaSgVOtSIR743+H85gdIC/so+xb2QUem6ltETcIbZ57csomCFkCZUPF6QW58aGS3kVZiptrWxX0BAJ35QZ6yQRUMTpvNsuLGt+dr/CeRljyCioTPIhr1mHBGLcTze+OozKLceCBJhK37Nv6QRjcfsT1v3IwE4app4spYDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173132; c=relaxed/simple;
	bh=EE6uH3S8yooWjBbe3+z5cTSmhQC7QX5UA8UWn288lQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omc1DVSnQ3BJiLvS4VVJE+0fHA8TxOfa+jIoYPi6/z7wgT3cU3AOJ038SeWVVlpO9z3DmLwRmB4sAM5U4vq/iCQ3CbwnjmdrK6CdGyHQksMJJfnupwboJiLbvc6Zl/fWqM6um1I53bAkb0LcpMqkWSydPVwhdEPyrmWSCTFT6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rS8jx3Mr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rS8jx3Mr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so12754525e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2024 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173129; x=1720777929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ghab2GKTO4iG/9N3I+TNPBlHHzMyAOX4RVxv6IIXy8k=;
        b=rS8jx3Mr3ER6FiOx1Nc8T4Tm8VYoDupDWOZsXx/MfnWXQNdBFBMvOs5P6bvs5nz0Wt
         dz0DXkEGIGQor9v8Dcxs+U74lXLdd3O5rxyfiX6/K0ynBpLUBPLgZUjSdo8kWks1ofqA
         MEaWpy3XNGcDJp2ddA7SvJSg6gxf7WyZbOxhdi8syDC6H0svyprUAfuTg/bCux/TUJ4V
         Z2yHhdDtVtKgWotQhdGN75Gd4fyKPx3plvflSdx4T+5jAwRGVUK4c7cjNAi4nM2adRDD
         589Ov3h1zpfqadb10pYaOU7mPRnuJUC98EZbC0RUQZFJb197CXUX7CJ/wQvNuyrqxaMA
         Rb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173129; x=1720777929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ghab2GKTO4iG/9N3I+TNPBlHHzMyAOX4RVxv6IIXy8k=;
        b=Qb/6wODdRwbT7gs4ySanKDhZFeknVMAmmrI6vhw+D39R7crpv3CqpMSxr+tv/b6FqS
         QtN248L8FZMPieAeo4v9sQ9du95MMKFly0Ed16BoanYSgqO3n60VHG1FSx3u/u3hS9wV
         jV3IJzqRA2Jlv8EVEp2pI1sMPftMx9X5P0u4+ZrRn76529h9btb9yCuft5fIYIAWJ+5b
         i9sASXv8lHiGHURvRsTAWS/e+THzI2Bs3tq0f4MevKEk7VFL+V7UDCGc3i2J8VP834QW
         SmGDQLur06ruBdGGi8X6D0Wr8ftpGZfIR1NqNIPuTwvBYAtMt8A060YtwoWybLx7sxnN
         i9lw==
X-Forwarded-Encrypted: i=1; AJvYcCUZL6x4LQUGl+pj109qC1qwra2oNbwhpBUYIZYsBjj8iYjOgwSZsBUx+sdBke8Wh1lGPVXBK40mLwEcEbtXufke6aq1gnZTrSd3mFw=
X-Gm-Message-State: AOJu0Yycc0agweFBloRkuyc8qjxZW27fw/+03fFL0e9nCPCWl3oF6WZo
	4w3ipFxZ3yXtoUFCY53bVnyh10jJqdIGSXr3robKLw30t964Nq14ouJPeZ8WSKg=
X-Google-Smtp-Source: AGHT+IE77ma2axxS7rLu+M9xLG6/UwCBbROAMMPTCHGq3ZddU86XnrD92GQDQqINuNvkwWFdRJTeVQ==
X-Received: by 2002:a05:600c:b43:b0:424:a659:c169 with SMTP id 5b1f17b1804b1-4264a3dedd4mr36112265e9.24.1720173128994;
        Fri, 05 Jul 2024 02:52:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:27 +0200
Subject: [PATCH RESEND 08/22] dt-bindings: thermal: nvidia,tegra30-tsensor:
 reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-8-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EE6uH3S8yooWjBbe3+z5cTSmhQC7QX5UA8UWn288lQQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Iqd0ph0CUxcUs3PavTyLzOqTzqJvcdDYmVI
 xV0u6SX2A2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKgAKCRDBN2bmhouD
 1yBvD/9984PhWBMPV7QZqKhGV74x0JxB9WqUhV9r20PgsjaVgxSFnDGL7vJURSZVChE68EfgotW
 e8Ds5bHK3sPvyMXGka0eR6bN/2ofZ/K1k2TNKzu5MSqXIiH6q09J/0ZNqTeSL2iCj/yxNJuv5ks
 kPCAvVtdJgZl5pJh7DjsV4D+olOP2/bTiPU+i221P1+jJv99Qp5EX2ARu7JOIdn64vgkC90cHk9
 3kpF5u/PFB1v9hgJlqqZ/0CGUbg1AnjWnRTHAQw4DwlADG6HEFXqNWs1lyxQonEq+eSOPSxWirY
 2zgz/c3Q/s5jQTe2Y5zUthIweqFV3PZazTmAqYupWbTA3BAUy2Dbav9Usv7b/af2srFLraPJHwo
 Yl37jqf94DcICjgA2GEBM2HMQO/6OG4B+jxmAmyhp/Wu5f4R2WRcDHcqpye8BM4q/fiZJsQMZ9b
 5l4kbYSvoMe+KDLf/vjmvbv1fMsaT+WLBTCY4Ca+L5YYXa95dmHNO70ZZzYZZGTYd7uQad/5sP+
 BxnUEBAAiShjPGx/BzeTqMptlVmMSAv6Sk7No484Ay3DvbRnfnVonp0y+TaQrJC2x3qNsvuQTnd
 9HXsS4VgpSZ7zYubV+ms+is9qumXHtqpl6yiLcn22+L7/b/+pZPWaE/l6emYxwyOgrY+72xloOr
 N/C7nljDb+Oo7lw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index a35da257b070..972d608ddf95 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -27,6 +27,8 @@ description: |
 
   TSENSOR has two channels which monitor two different spots of the SoC.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra30-tsensor
@@ -56,9 +58,8 @@ required:
   - clocks
   - resets
   - interrupts
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


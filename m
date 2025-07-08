Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9A2D94B8;
	Tue,  8 Jul 2025 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971981; cv=none; b=jZStCgqzEPWafx+wL60exjVW4JfqxA1PFWhF+N0YArYotRnYh7Bkehwfdb7/6k1TwSq052kW9zNflakLpLH60WX5Sx69g2FNvDNoUMK5KAo8/JCcEE2N+AdDS2jLr0wtLyj/wSsvAduuk+bo3e+9eWwiCO4ZNC2g7iG09nvl5po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971981; c=relaxed/simple;
	bh=wFL4tHSGiOOJzXA+bjTWPDFzM+ODfFvpq9CN5R0HKxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+djiNppxY/OpXlO3Tt4gGHnF52wrW7ox3RaOt5tADTv/OwJw3ujysoLhh1w1ohwPIb9H/+4u3cD24uhrVrM2wo9/gsnp3zIFoFOglWXs2oh3T+aPIlFw4zB9zKq5NVscxYi2uE61dTWqv0JZDrCdvMJ8QE1HuQAIXF1sKSvEkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fqsb5OHs; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fqsb5OHs"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso3151373f8f.1;
        Tue, 08 Jul 2025 03:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751971978; x=1752576778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6BwtkGrMGqdXkBGmjPybywm4Smjd9tEeGYA2g+BXUg=;
        b=Fqsb5OHsOwA2VtaLDBkJ7UpB5pReAbdiW8z4CxLgwQkUFcJSH+SyUZGCWnWtLjGYEA
         VqG05LbLeTKH0hcBEwXAyi9Bc8erMmfxA14MMX4aQufDQWYKiWjUypnAA6zPcX8v1/Dc
         NZMBKeAb7UGfEMcavGRsD4GNQ3TDTGY7i7NOKDG57IHk7l40QnVoA5KnmpfFcN6/Z/hD
         3s36zqbJryIcLCFvD6FlqVzTRPnuQ9/zXLIVCm8jJvq86zHlcqQIZlGPYfiEgNNeo8SC
         j01tMnscS8HHpcwg5MyPZeeI+GOiEY7QvpTGGivTCsRS7Hj1huyXAT0oZjR98G+3L+YX
         2aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971978; x=1752576778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6BwtkGrMGqdXkBGmjPybywm4Smjd9tEeGYA2g+BXUg=;
        b=EeQLg/2thip0vIXUbeuI0HYWKv5LVES0RVYU/5L/nD/KHl46WJ23n5fKd0QvWW/sdC
         ZdTjvgbK8614933gnTLH+yEpHtfqE81pGAqrVh1Bu0kMJRK1ENWUWCaw7WcuQrhZgnvt
         A0+A1E2MXR9ZG8Rf15361+/3H3TlH/7kpKaPpaPtkLH3vHxsqxExiGSCQVFWxYCM8qMz
         /ebueB+CjJgpKzUKBS63UZmdwz3qUgw72PuYrGwuic9LkxvbuYBbdYb4nTb7LB0NTrxA
         +13NgihX4F//3MNAmskmQD0OntEaXs+zbp9zSnos2yCHgQlyKEP71x150Xi3Rle7f5jx
         3xQw==
X-Forwarded-Encrypted: i=1; AJvYcCVXFO7/aEv1hnnSwFTnVEOQoEfmn1inh2cipen3JfeaqejnCX7kQbwxVKq+a4KDn85Qorm1uzlsjHFWHEut@vger.kernel.org, AJvYcCVg2Ukx8XQLUTz9i5zj+Otv0GTjavml/nzHvzlACBa+izgAYTquwUW9F0XGE8AGdP6n1de+D4G0gSpx@vger.kernel.org, AJvYcCWi45fyY3CEasfXAtNdz8+r9eKUioj/V3uJoEe3jlFEMkXFYgEot94WK76bvTV12mJ+tkbkTXja2rU6m3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR+Jm4DilFpWY+9th2957ai2EyBsG5rCGx9PwBXfCwBb7ipJ6C
	VzqIH6fH+AfdhdKZAAar5p2Sat/VlRz8c9AIqqkdsnaxZy/Hp/MFOwYP
X-Gm-Gg: ASbGncuQEwksknehwFx/8fBJY7wb0sRf7SC05pC2WnkrWByRaKd5DpSw48HhRDKRBEV
	wJ2Oih6I1Cmz67x+9z8Pl/OeOoc0SqKBLNVwsqS0jY9xstwAz9CiL6AbQrw0Vev5UMDRlRqIxI/
	VdKimIQY2AZxbv3oWIBbNCPq677CyaXI2rfx91H2MYxrVuscet4X8J223XPG3kisJot3z5o2wXZ
	A1KbW1yMznhZqbkkK7tPyu+DkBMh60jIoDCBC7+XC0Yj9WPpSDCz6deDx60RJqit1OK3RsgXvM5
	gkcy3+sc5yWbXHQj6AKjeRFA4EEuqCItKGu9zp/1V3+EW7kFDa+DSmCohcJbC+qZ6M86hDxqO4k
	Nbd0bUnJyftvbzo+llHK9wyEoFtcQYPgQ4dGs/ZRBOxvDzZ7RC/r9hA==
X-Google-Smtp-Source: AGHT+IGqH7r7zZU79aaAI3o+F1K83fqEdV726V+vc7XIXVdHUbZ9t0iNGGEs77zpBL4KOGjWdxdEOw==
X-Received: by 2002:a5d:6f13:0:b0:3b3:9cc4:4bc0 with SMTP id ffacd0b85a97d-3b4970315f0mr12440440f8f.32.1751971977864;
        Tue, 08 Jul 2025 03:52:57 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47030ba54sm12527859f8f.8.2025.07.08.03.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:52:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: memory: tegra: Add Tegra264 stream IDs
Date: Tue,  8 Jul 2025 12:52:44 +0200
Message-ID: <20250708105245.1516143-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708105245.1516143-1-thierry.reding@gmail.com>
References: <20250708105245.1516143-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Add the stream IDs for various hardware blocks found on Tegra264. These
are allocated as blocks of 256 IDs and each block can be subdivided for
additional fine-grained isolation if needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/memory/nvidia,tegra264.h | 50 ++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/dt-bindings/memory/nvidia,tegra264.h b/include/dt-bindings/memory/nvidia,tegra264.h
index d6cb0c9698f2..521405c01f84 100644
--- a/include/dt-bindings/memory/nvidia,tegra264.h
+++ b/include/dt-bindings/memory/nvidia,tegra264.h
@@ -4,6 +4,56 @@
 #ifndef DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H
 #define DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H
 
+#define TEGRA264_SID(x) ((x) << 8)
+
+/*
+ * SMMU stream IDs
+ */
+
+#define TEGRA264_SID_AON       TEGRA264_SID(0x01)
+#define TEGRA264_SID_APE       TEGRA264_SID(0x02)
+#define TEGRA264_SID_ETR       TEGRA264_SID(0x03)
+#define TEGRA264_SID_BPMP      TEGRA264_SID(0x04)
+#define TEGRA264_SID_DCE       TEGRA264_SID(0x05)
+#define TEGRA264_SID_EQOS      TEGRA264_SID(0x06)
+#define TEGRA264_SID_GPCDMA    TEGRA264_SID(0x08)
+#define TEGRA264_SID_DISP      TEGRA264_SID(0x09)
+#define TEGRA264_SID_HDA       TEGRA264_SID(0x0a)
+#define TEGRA264_SID_HOST1X    TEGRA264_SID(0x0b)
+#define TEGRA264_SID_ISP0      TEGRA264_SID(0x0c)
+#define TEGRA264_SID_ISP1      TEGRA264_SID(0x0d)
+#define TEGRA264_SID_PMA0      TEGRA264_SID(0x0e)
+#define TEGRA264_SID_FSI0      TEGRA264_SID(0x0f)
+#define TEGRA264_SID_FSI1      TEGRA264_SID(0x10)
+#define TEGRA264_SID_PVA       TEGRA264_SID(0x11)
+#define TEGRA264_SID_SDMMC0    TEGRA264_SID(0x12)
+#define TEGRA264_SID_MGBE0     TEGRA264_SID(0x13)
+#define TEGRA264_SID_MGBE1     TEGRA264_SID(0x14)
+#define TEGRA264_SID_MGBE2     TEGRA264_SID(0x15)
+#define TEGRA264_SID_MGBE3     TEGRA264_SID(0x16)
+#define TEGRA264_SID_MSSSEQ    TEGRA264_SID(0x17)
+#define TEGRA264_SID_SE        TEGRA264_SID(0x18)
+#define TEGRA264_SID_SEU1      TEGRA264_SID(0x19)
+#define TEGRA264_SID_SEU2      TEGRA264_SID(0x1a)
+#define TEGRA264_SID_SEU3      TEGRA264_SID(0x1b)
+#define TEGRA264_SID_PSC       TEGRA264_SID(0x1c)
+#define TEGRA264_SID_OESP      TEGRA264_SID(0x23)
+#define TEGRA264_SID_SB        TEGRA264_SID(0x24)
+#define TEGRA264_SID_XSPI0     TEGRA264_SID(0x25)
+#define TEGRA264_SID_TSEC      TEGRA264_SID(0x29)
+#define TEGRA264_SID_UFS       TEGRA264_SID(0x2a)
+#define TEGRA264_SID_RCE       TEGRA264_SID(0x2b)
+#define TEGRA264_SID_RCE1      TEGRA264_SID(0x2c)
+#define TEGRA264_SID_VI        TEGRA264_SID(0x2e)
+#define TEGRA264_SID_VI1       TEGRA264_SID(0x2f)
+#define TEGRA264_SID_VIC       TEGRA264_SID(0x30)
+#define TEGRA264_SID_XUSB_DEV  TEGRA264_SID(0x32)
+#define TEGRA264_SID_XUSB_DEV1 TEGRA264_SID(0x33)
+#define TEGRA264_SID_XUSB_DEV2 TEGRA264_SID(0x34)
+#define TEGRA264_SID_XUSB_DEV3 TEGRA264_SID(0x35)
+#define TEGRA264_SID_XUSB_DEV4 TEGRA264_SID(0x36)
+#define TEGRA264_SID_XUSB_DEV5 TEGRA264_SID(0x37)
+
 /*
  * memory client IDs
  */
-- 
2.50.0


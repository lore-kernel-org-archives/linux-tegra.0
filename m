Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF731E3DFD;
	Wed,  7 May 2025 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628690; cv=none; b=Il5QmC6+lylHlAVw+3vYcG4IFUi4ripmkc0OOKqlUeFqbnu3FAGNl9xsfKDUtHct2fzfzy8Gd3it4CgvqlB/eLF28fMSEp1s9h2LBGDwgA7xsonBybfkn7yTHo5TCAmBc1CTRX2pxWtw2W+kUPbD8AiWSamYBylrb9BpGITiU2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628690; c=relaxed/simple;
	bh=b1jLNK452SfrDvBHZh5dqmBy2ykT8VbBYO0vPGLp97Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCsg48KuVlZbdW821AC4H2dr6t3QjdiJ0YcbOC3auodm1Euojzasz+UHGp5Hha0a6lXMEdlvB1lCTNl8B15G2lnv8jckYA1AYmCbtYXdWCAvtSV5C4dbimuQAlmVQjI210JNuhgj6uOGlAUqrdauzYmfApeKvFWy1E1xbNS5Ta8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aImunuL7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aImunuL7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0618746bso50980955e9.2;
        Wed, 07 May 2025 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628687; x=1747233487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjFwt71XLbSFir8nIV6cLqcB1nciUy6zuBB6Ol7LIHg=;
        b=aImunuL7xUQihD1+W3/Ng/gZ5mZQT9YHDPoxyaaQrVOIIedFeSTntRW1lenLFzeHAu
         t8eeLZdCbntAl4b8tRlNfQI5aXxIRMAhOdzCHn47pBQfKw4093xeQeFwDHTQEgRTpxKc
         DE6NnYKX7+JcRwSexNdNpYqkQXfaCmgiKCBIomWBfmtXSxX2yzxHcdkJljWM1DD/2NLF
         hjIu3rM/Ya89Ti/ySoofq0vUDkwgF73ZILz79/1jTeYx2fDki8TFrFKiGFGOqHjhqqZE
         4HEBy62OFCzdwXOyT8QH+8z4reaL8CjKA/vRRM4vQAfdnsp3Cs8U4/GjwjJPTK19vvbP
         PCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628687; x=1747233487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjFwt71XLbSFir8nIV6cLqcB1nciUy6zuBB6Ol7LIHg=;
        b=TptBvGcikpvEfueVVcEyD85siYjCbFyoF9AlfJ0lyiiv4BKusmxCV+9BIe1Y2kIVgT
         7X35GPS19KdYChRY4JBr14xtEiJow/4d/Wqf8sWsnE+m53PDH57nQW1G4z02DfVy6FF5
         /KvFjuCAm/ZDVvuN2GpC3kGHbpQvqpu7RO7VDCZobPihFYY8c3jtvBQq0YXHef3wn356
         zAbc990hW+WKHsRNFHiEwJ9gZHSfPP+M1zs68j7Bvj1BJfPtC6WLrqqO1DStGs7JCEBh
         CQRh8pk5kffxsykwfevp9+8ilabbm9HcmNiivNg9Nw76ICdGm9/9npyPQmGnx1Wq122s
         Jizg==
X-Forwarded-Encrypted: i=1; AJvYcCUO6pBrsIi2Q4Fp633DrCPEaSVQaE4BXnWP6V4W/1VxMuBSvZDaY/kQldS2hGZwL+7uYtr2UbOKEERp@vger.kernel.org, AJvYcCWgnN9cgdMenyxJCP6vYfBiZmH7DPxiKKTLCLySqaFxXrjGzCY7IFce7lB8kdRwmBzq5iTP7aInZoS+qMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgFZZGBuKgQIfqKNmLsrs1aDFt0I+Z6MjTlbmpyfXgtMHdW/Ww
	YKMIEp0ScogRBRSGpJAShm7nN0ADBFqPv9aEk/6uD/pzCZhY1TYM
X-Gm-Gg: ASbGncupcGqJo6gkGYR6sTTh+Q94jk3Y5mz42S7ti2r4a7ScS18WVvjfRP+pAovpkLY
	BypIGTn53e5g7AfMhaK1xUHnvuqxW2SEcOQuHwYY8ob7abzhQyDIfGQQrWCigRnf8cKrPx3Tl22
	d77hLxrcvoi+3Kjz9V2eLJ3vokmNXkoI+PldGRGjV5ZlHX0PmpMQ3XXW2F8XC2DZHqF96fpfbt1
	2qhALn/dzlXqt+PS+itt0agBw4Kc8aZJMNP8XDQ++NRF4SD+/Ypye6GTRf/C04P86mQnH9inUyB
	vpPB3dv68QdehedczserJxxQiVlxXxe3Nnw76xCDPKS/GOT6xP9Uqkc8ar5fKvt+1oxeKSFgG76
	k8OwWJvqpt5umY3xe28LWk5XJL609RFMB
X-Google-Smtp-Source: AGHT+IFSNMzG9TQOyYx7zHevoRWOErXed6Aebl+K/3wan41dPjMy8p8lGW1mWA10mofq2/gvKTe7qA==
X-Received: by 2002:a05:600c:83c6:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-441d44c806bmr30189935e9.19.1746628686430;
        Wed, 07 May 2025 07:38:06 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd3285f9sm3215215e9.8.2025.05.07.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/8] dt-bindings: dma: Add Tegra264 compatible string
Date: Wed,  7 May 2025 16:37:55 +0200
Message-ID: <20250507143802.1230919-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Document the compatible string used for the GPCDMA controller on
Tegra264.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml b/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml
index a790e5687844..0dabe9bbb219 100644
--- a/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml
@@ -24,6 +24,7 @@ properties:
       - const: nvidia,tegra186-gpcdma
       - items:
           - enum:
+              - nvidia,tegra264-gpcdma
               - nvidia,tegra234-gpcdma
               - nvidia,tegra194-gpcdma
           - const: nvidia,tegra186-gpcdma
-- 
2.49.0


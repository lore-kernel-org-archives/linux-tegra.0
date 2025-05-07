Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E3928935A;
	Wed,  7 May 2025 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628692; cv=none; b=MRZTwuk0BUi60hfkL3VhyBzhGwaN4HY719su2zIUuHHpA8/wQdtD6MrEU0KBx9RBDgoBBgYEjeBQLP9OY2QAPrWFKUie4yaJc2SK6D4nGTVCkS7mVJskILJF5NMmLGNaPYNOGzoMBWZ/HXx6oCYPwkcSwI0CbSlL1VpWLnE/RlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628692; c=relaxed/simple;
	bh=hiS5rO3ulvtBCp5y44B4oOhQpBCdRhL3vwCdQK8IplY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9NFDISw9p11TegKhHgtTk36iBOE6Qjrs4YHZxhQz9/PK8AXPNeqsNLevKcxtLeuBcy8AUsJtHZzyk+Gt3J3t3qHyX2KJAW3e72Qxvrbn8n3PE0lvLhXrtoTZZ29ON2uevRvkgAOy34wamC9cAOid2BffTmxXERn0AadwpRdcPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHoYtvi1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHoYtvi1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0b135d18eso985567f8f.2;
        Wed, 07 May 2025 07:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628688; x=1747233488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9NQ5htm6TjGvw5gpgQ2pW82RG+dj+JM6DZdm8OVPgY=;
        b=FHoYtvi1ruR+sMm5QkUzkYkOAxWE3kBFnp86/g2IilxAOIFRNB4+5+t0BlwRrfvUai
         MD8fr7FnMMz/ETYiTzQR+Xs52JxneK/wSTkPzO3uEJceGPWU6mAJvZ61Frr7tOoPp+IW
         IiGUV9stpWl77/G2tmYBN8oo4ogkJo3NmN2VVpFapiYPAy5WGOE1tOLdnGcMBnaSlKlE
         lhOoPLAmDhlKgWTOtvCGvHOtEow6BGys6xNLIKQtJUKE5rYpqG82WEPiRREO1WMm9DpH
         ybPyEJIrKy/8RvX5+gwsqSLXwIXgHFPhyk09Jle5NAYaay10FB6g1CaqAcBIuCM2WOCA
         YcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628688; x=1747233488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9NQ5htm6TjGvw5gpgQ2pW82RG+dj+JM6DZdm8OVPgY=;
        b=PDrd6Uf0+YpUXnF2TsWZxJbL17ulw4v0kpsPyeVXinsp5bwK89J/AnRNUNhiFvaS0U
         5zu+A1Fn9aibYj/W6cTCwaySnH1JeOdFcz/etAQD+V5wWfuEfD7LK/MSkc0wmJDdCm5P
         4xlLm3RUJ0XojdhHi6DMKTLPWKg6VRoqpZlAiA/M2DgDjGX78WmuXDIETUPvBZVhEV/T
         51kqaZoHHIunjdT1VT9HSNzCLn0hMXqJxrbe2gvKJ8hK0c/frZmKg4sxuoz6oju4zVDM
         u7Aivq7X15D9XgK67P5PrPP6ZFI3grap23kSl4pZekTsx8L9p9xurddr00WeMqCLDVCu
         k6ag==
X-Forwarded-Encrypted: i=1; AJvYcCUxH6IIahwYkmj+uYtSbCnOnSoLfvHeGbjj7Ue9yAowA9ztDLGA3auW/k+brpUNT+GhChSiHCQJNUZR@vger.kernel.org, AJvYcCXY0MieQNbzNJbo8BQSz2LwnEbDGWPWfFuUC54+oeln8gNaXRfub/DpmDToPJpeOX0e12fIw2D91JIaLO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQiTwu972qk4jvGwwCVRnwihBQHFcR/K7gtvifRuwCWTsOsqAt
	HJ2HxON0Ygpi6uPLRORdE0+p5006k7/3cXmKKKLhpXVlGYLzQ3i9
X-Gm-Gg: ASbGncuBi3QZYGd5jIBzXfCcxP4fK0xqXlI+svnaDvDfmhcirtq0inKdmvgP0IPLJI2
	Aw0o45NKBqnCLdXGCFxXfhXQYsyIwpNmEvtNgxn0xfoiZ5CpW1zs2p1dHRgx/B5VlWE6tKCaV4T
	zSK288JznmXr7KUmR25iV++mAFmFSwAJ0phpXzWmrn8B51L2X0wlGgv/zjgyp4UAxz9nRxi2G+2
	JOtXIwKkxZ3jbFlVPBHgo43iUBD6nKaf858nhk/1TUQUr2Y6Gr8EJytCmnutnwHJlfEJppxsx0k
	soXY4bHKwHyqGNlUaNQp/eUEhV7NS3Pm0mmd0rwLlm4S2BJbOX2zfxWKX8T3i8W3bVjYFuVaW2f
	1MStcOJ+/iggFnt+955oCPcxYqbqqrA3P
X-Google-Smtp-Source: AGHT+IGEPioJ9LKl2XwGoKUoShBQOdIJsWwwGwPpqoWfZEMwSOLznYljMTyla4CsgxGuyB4sn9Pz0g==
X-Received: by 2002:a05:6000:2911:b0:3a0:7a7c:2648 with SMTP id ffacd0b85a97d-3a0b4a18a7fmr3305755f8f.27.1746628688558;
        Wed, 07 May 2025 07:38:08 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd3aeb79sm2915195e9.27.2025.05.07.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/8] dt-bindings: rtc: tegra: Document Tegra264 RTC
Date: Wed,  7 May 2025 16:37:56 +0200
Message-ID: <20250507143802.1230919-3-thierry.reding@gmail.com>
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

Add the compatible string for the RTC block found on the Tegra264 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
index 17d6280e5515..a86e926ae3d1 100644
--- a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
@@ -28,6 +28,7 @@ properties:
               - nvidia,tegra186-rtc
               - nvidia,tegra194-rtc
               - nvidia,tegra234-rtc
+              - nvidia,tegra264-rtc
           - const: nvidia,tegra20-rtc
 
   reg:
-- 
2.49.0


Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA71E3DFD;
	Wed,  7 May 2025 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628694; cv=none; b=tcoJvasjSDjImvvYLZ/ajjAjoe7pLs2rJl2p8n2CUoDXxkJl6xvO5A4GXPdP9Ud14IBC5zceuIj0gCkQSYLjBBfSAxAmK65UKJ04gU65NU7LEDdKTGEcN1MglgasjmjmhGGtm6Regze+9W0ICC5oIIE9rcWJHmvXMiBOG+tXbdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628694; c=relaxed/simple;
	bh=/fp06PMp6ZFvmDn1L8UfTulqpwkRJu4cq9zCpZsKtXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jx7TlSu20v7e4450dauLDWF/c+PUQ1A3uHxam5S/i4kXCK9wAPgbIicVwFcemF5eNuyV+5NTOFM24XHGxKpLmX2dKvjYY66guBdeZR+TyhjRA4/Sxaa4liHxNxHUxiH4fwJdbGXCHqrgmpXzddO6OZJa+9WmXoichG/owP8Yxtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuGcSpFx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuGcSpFx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4747875f8f.0;
        Wed, 07 May 2025 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628690; x=1747233490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gzfb6HckY9UdtJPRmS+pKyEgA39e1sxVd+XOM9U62U=;
        b=NuGcSpFxgWk2mz93DClXAYmPAxTuU536teSi/6ueK9LdswqT4Q4x0OtEBgXaroWDga
         UUlRFdY+OK6JQjFl5yGcMv2FLftNt/eHmNJJg9s09BXWWyQQGdCbRcCzVRZ9CjninUmI
         ZfmyFZEEnOfOssBwM3gMPy2ezJKDxyOzjZG2m/lesLFmg7/u4NTg1zGB+fMOpqHl4Pj3
         DI8ME/kfve2yO4m7CmM96TntyM+yr2gZa2+8NPx7Orel0q4SwRPV6l1xKOhqK790ICDj
         W3TMGT3MLxOepOhNe7v0xVXd/Ig3FgOhKZW/hZAJK7x7yZuwtR6ycn/HR5lhAXoSnG6S
         yidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628690; x=1747233490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gzfb6HckY9UdtJPRmS+pKyEgA39e1sxVd+XOM9U62U=;
        b=PxE7Ypdw16GIlah+Zpu/2w3ST0F0n7T1HX8d6ep/K1hur6S3WMdkF2607ubKhr5NK9
         +kIAP6/3yXTRlONNQ9HDKcyW0Sw0pGAl1U1rwb0T07Tb2ldxIZY9GhhUJrshbbaIoQcm
         bn6kc/7FxiX3owN5Gfo/NVqpQ6FnUgp8/OcrDcT8AMc4wMEnAZHiB54JIR6uaRuEVZmX
         Kq0WwCoMjAYIxiXhy97Mz0f7cnnozLSYcssimXa3ebdxfH6eh3KsEC2iN2LUXGCZ53AA
         xBPhAbPuE7j38+NGD9VaX0qWDLP4btFgy8sPUE0O5IrWN6XZsa8igxtIlfrtsZUAiOeO
         27rw==
X-Forwarded-Encrypted: i=1; AJvYcCWidhFT517XySidYk0ki/G6CnJRX+jdfmJ+nFUr7YgGPPl2YQMeQUENAXjcX9GWYtS9WHJe7YQ7QW5u@vger.kernel.org, AJvYcCXO+3gna4O2W5LuRujzQUj7Mzh1gZFKvfDqw/8ihXdaLl4yGtRCdAsCNTjQ3C2d1vjBoNNM/g/6L/v7gJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/u7Ph2JLE7eeg8bPq9GupJGIrudQ5UgjYnl4lbz0BKTAqH58C
	2ntQsw57J81dk9TQdEBCtY4rAvcSdedxHFISR+KvDfEFhBKLILtO
X-Gm-Gg: ASbGnctn0WcSxWOT3+BI9G84XUPbG+XGJ256XKicR26Ea9Jt6nY6tjouy0kGbW7m11G
	4nx29tIqOQR6Kjl9gNITMS1Zn4B1xOVJmjVFNHEXYfNPoOa8zbmOSSt2W/gts5B0Ao5EizNnOVv
	h+YaFvMC8QPrxzN2CgmxSAqm9EH/yp30u6xyrOuyzEwO3M2eDNkxS7YGtpoJQfstqBCMDDbr7Of
	lSV3G67T3zGXHPuFuLK7SDGhtc19oe6Ya2kQ+S/5qi2UaHSkmjQJu+lQ8TgbFBIiP2Jo63scyRF
	jK7Vxo56scuDAuvm6A6EdCXyZukWspmkTkQemetDomehZOUJgo8Vgiru5qSTHcqo5zSBLD+sacS
	MZcGAknKWRI09dOrqh6fOMMCqhMwze5v5
X-Google-Smtp-Source: AGHT+IHGIVl6XYUEA7AWDEFbYtJkO5/zuXOHWGsE7GNB3B414dUBW633ES48dG8Ps6rJLbFr3W+SEA==
X-Received: by 2002:a5d:5988:0:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a0b49a7f45mr2923886f8f.13.1746628690510;
        Wed, 07 May 2025 07:38:10 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b840737bsm431253f8f.67.2025.05.07.07.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/8] dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
Date: Wed,  7 May 2025 16:37:57 +0200
Message-ID: <20250507143802.1230919-4-thierry.reding@gmail.com>
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

This is an engineering reference platform for the Tegra264 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 65e0ff1fdf1e..cdf5a730d8a9 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -245,5 +245,10 @@ properties:
           - const: nvidia,p3768-0000+p3767-0005
           - const: nvidia,p3767-0005
           - const: nvidia,tegra234
+      - description: NVIDIA P3971-0089+P3834-0008 Engineering Reference Platform
+        items:
+          - const: nvidia,p3971-0089+p3834-0008
+          - const: nvidia,p3834-0008
+          - const: nvidia,tegra264
 
 additionalProperties: true
-- 
2.49.0


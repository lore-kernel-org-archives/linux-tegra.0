Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C416283128;
	Tue,  6 May 2025 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538295; cv=none; b=gvYcOC33/gZzSHsitc+BBAJ7srlr8pM8vnqrxT2FsF9TLN4RgiaYSjunPxXyB0LYOaG8Yp4wdqmvDwvPOvAEWx6dKDy3wjLfNeL0VwKw6dzJmV2cG/7PBNfEUDIu93Rx+ZW6Wb90eu/LF3wmNP2Jjt7dERcjPsTQK5HGC4wKrZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538295; c=relaxed/simple;
	bh=vOelN2G2QfAQNi/IUigjYLHX/tGz1EVvA35NInG3s5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YP+VEzEsWzjZNLjoLuF1aFJlfj2DBoWtWH0Pe0XmwAi1e06EegKxRXmRZtyYRewTQa3fjtmV8gT7bxtbRBXEiF7xtP0mUl6z6UZP09UlGnNKkj4oLv/B8OvxTBk2rwwmwK9myouY8H924G7t4tQHCbHPm82DK2SK01ntrrXpJy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLw2yQ7H; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLw2yQ7H"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso25243215e9.0;
        Tue, 06 May 2025 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538291; x=1747143091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3zXV3HirDfRP3PUl3pFBh1c941K94R2FUpG7ljIx/I=;
        b=YLw2yQ7HBXasyjNNhKg/IUG5j1cznmvL9M5uFV6jpROJyIKYO4gSC2I/EO4SMqC79n
         SQ0HAe30sGI0qLw+QLAtCEAoY+V8jhZIxi+MhzAYA1HGN+xvnvWTYKdAL7yq1AdaqKTP
         z21KbGtUPpaHT4BObzg6NxXujjkAPQk2GMm3Qdbx3zTwoudLPPMVD3liwqmfCjUXKRn3
         scBVBMHf7Bi30ECWWxRsCPnXolXj87tl0oatrJIqH3fhXNo8IUaZtR3+ENzkx2MDG6ac
         YIBTIvcb8BVRzKn/U4yxWbdxgP6acRvAxc1yjWoPK+n7qGKOeEpLibEMgwtg5B5qSCjX
         j3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538291; x=1747143091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3zXV3HirDfRP3PUl3pFBh1c941K94R2FUpG7ljIx/I=;
        b=hKSKIB3dCIFIZ9TRYxd0J+3ZnJcx4gNNizbzLHZPSdtwF8oHaqf/Cf4XtfeqRX7FVR
         QlW08nDsSwHk2Z9nVN29tXNj3Ci2vjAAEP6HEQn0iSHWaef+EtgIN0eWFsqIovqJYuZJ
         BW0f+C/tERHIHS0v3ry0IuW+eBfC1fISozyHzxtcB918kOLjz/yvwILmfKVGkQ1bLsnm
         HW5CVql/fBAfQtlYcahgG1trcSqzzmwEDb/Xj0pC19A86nNNWgHwfCyhoJ52EgHEUuXD
         NrRd358e2k8DeQnDr+T5YZb5FdCgQFGEAEMpMvSMj+GE5EIzsv+rliUYvE3bGpK0KMN5
         qEqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkvdC/b2w3eBpMli4A/mcr77MBa+QET60owav9NKjiVoJ3yIRwhzQInXwX9iqeJpbbhVcjQj81ux54@vger.kernel.org, AJvYcCXHXqzTDGICwkcJYg1GFyubO8Z+gntZBASyLo2qysxWTNfmHKNLyaqqP6DyWMcR+SI0SC92jLVFFPbdVGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1dhZfTK5+ov/d7IRqVcaXIxbkm+/kBp6GGQ3W+2n8/d8AwARM
	z4cIa0CsAnPYxIwEtprpsOjiAHA3Sj++fWLfdctMeDokhD1lxh6i
X-Gm-Gg: ASbGncvTnrdhHiaVa0fMbjlVm0rrCBdAZfe9Dsj5CL+kfTWAGNL2vg5f08aIpsYsSvz
	4bzODqz/knoi83W6cg/eTPVA/n1a1ODq9lJRH5gXWxUw3PLB8u0zZM5ztuO/BqkbQupNBRmKMht
	BdI7ykpPZWeHd84QXDK+bWQXjlNmZRFat0W/vyCQ0sdJx0O5q4m5xMsVFJry9w2K5N2B/nTWZBh
	EglhHDI52ziGLrcCq7nYLSpspocr3FuVVamuX11gW3xLufRZbg4G4hWFX8h9zCkYax7uqytaUcN
	Xh9CCCfDJTDV6EaNbmAQ9Xy0oiVCqzJwDXgcQtrFp8vnJEGcNvIPkA1nnLFdoFtQJ22aq7aLJ2c
	thATlo16pENjWT2vTAmk/LFd6ZKtU3/QJ
X-Google-Smtp-Source: AGHT+IFt+jAnp/1dorIrV5VN5se27tfdem9U33x4ONTBw1owAU8hcuV6CYu3Dsp/mq6lfYo+/yCW4w==
X-Received: by 2002:a05:600c:4710:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-441bbeda9d2mr172755895e9.17.1746538291112;
        Tue, 06 May 2025 06:31:31 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b28718sm217245765e9.36.2025.05.06.06.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/11] dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
Date: Tue,  6 May 2025 15:31:10 +0200
Message-ID: <20250506133118.1011777-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

We want these strings to be sorted in order of release date of the
chips, so the Tegra264 entry should go after the Tegra234 entry.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index df6784a7c96a..cbc02b2a156a 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -66,10 +66,10 @@ properties:
     oneOf:
       - const: nvidia,tegra186-hsp
       - const: nvidia,tegra194-hsp
-      - const: nvidia,tegra264-hsp
       - items:
           - const: nvidia,tegra234-hsp
           - const: nvidia,tegra194-hsp
+      - const: nvidia,tegra264-hsp
 
   reg:
     maxItems: 1
-- 
2.49.0


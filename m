Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5E42F5311
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912126; cv=none; b=FFr9nXiC25AsKTFPOfSPrinjGPLO3ZsQasOmwCTx9Z4gLTPH/PpN9E2/sXJAUDBzloNGmv8YSed0JfCohNKXdZBF4rXJYGRZUqjibEJLhmaoQmT054kzag64ef5AT7o+zDdTAMA/tXkzhidVeKtaPIvIGUbvC0DjItgeg13Bt24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912126; c=relaxed/simple;
	bh=Ng+kKkFaTeAHeDn37WPq+qcIK6a1rAYErWCGcqI4JGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cH16qdXTUSLuS9Jkc04rsngBcPBBq2jQkJ2zmxaxLvLSaVGTtzrlErrxjGssFpnKb4ycGmfWWxPP6i1BeMRxZGtomQfHE0WXitUDu4+iPIGRGySLzy6VRUsbGl8Rl0F0xbErEMah9gmPDq1rOh6/UZximLA4wrSZFe60RutBGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLtp0xc1; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLtp0xc1"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-36639c30bb7so61063631fa.3
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 01:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759912122; x=1760516922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXVMCYVqhYxHmVEcLB21GvSyFEdTGyVsbdPWOR94MMw=;
        b=LLtp0xc1tbn7Y/tGCIqtARDK8xcb5IMwh7tAvN1HsctIoRJzb9GBJ3gZFErff930VP
         c3nabZaY8u3des34DkQqNoomEMk7870rbyWY2fdW2MTppvJd4KZy2dZfCG0m5ZTSsHGM
         Bd3rubG/liZXOrSRMONjckmvfJ83TOj5cRxUePDhBeJTZEHhvFwwhwrBhBKLX/k5jhr5
         2dm1teikua5X0eq3jv/RAQEkg6onlHAKbnWKBlpJqFqCAzw66rrV5gE/mj/CdzB9sZL3
         bURuMWNaN/20sKyXjmk0w3PeYC+CWO2NgtCdDRCC6ivDdQagxs4NCABPybtXROIlf8+x
         LQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912122; x=1760516922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXVMCYVqhYxHmVEcLB21GvSyFEdTGyVsbdPWOR94MMw=;
        b=vd86srLYwkpNcCBAZKiCWpXgLeKspjjxjIWh3ppd4oFmKFVFSxguTNv6uYHiFrY9oO
         OSFw4MSY2PuAqRL66lZ4kdHIv/RGLmsVie/NUaw4StPV6gK2tfToLSWDmeUyV5yTQHym
         H2MxxzWiGYUQ/EL52O8Crx1Y2U2HWcTyDTukwZ/hRpoKmK+scG0IAx758f096n9z9P4U
         liVGZF7sFzh77H1BWskxH7ZlOQnAdgUUPJfD3kqZKCJbjO9Z5KA/LsmXhhOzkxwXAjpL
         qYFTHN5I//Pe+6qkzGy1pnC02iPS5M+QwmIEup2fI1hKgGWwbmTuFJPOhHmv58pf0akp
         ENGA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Wge5aqiIWMF2tgUFrN8LAClw0T5iggiv/n/JYpHgm+8pqx8mXuNpRiaD8W//O23++EcTyMXzOYAeuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUS2J8ZePeOSnaSBWMJr0zi3rbRk75xDCqVHV4IsKJP1i68bXB
	lP9sJEMQmxtuu+/F83Ry4JZyjYnN2NJK5QZ6V2GElYnX8dekM3Wvxvwj
X-Gm-Gg: ASbGncsYVqsa1ws8SRn5ELEEVdFvB+JJfZcPvr6wIqb5FiE/+dvTUOWh+XUC6e0tQbU
	D44KinTRttM6Lq7S0djx/dAhZXl3PPd4CT2n3tbQOodbHdqnucus4k3zmFZPJlZcC00ywA/yQZJ
	OMvWobBXxn8cY5VsDne7HdwDnhSKdzue+jf/bKGe+UPXukFxw9v6MJTGkmnqSyqwMVzGzJ77twZ
	trMK8yvtx5LXbbdzHTScsHqRQ/B2mh5fBHzCqH7SYlw8RH+d0bsHx9mgk7ov/YNuX/2iRqCI3ts
	y4Ow0DGCNC7tWv3k3e+fxNFWlLt8tRYiiSTbpBDDY+qu1FVfHoqz9P7lWsvwAAy+X2l+TJsV1QQ
	yR7uY25prx0KGyMNVzfTpheI5BAcwGYMhtdGH9A==
X-Google-Smtp-Source: AGHT+IF+1vf4Blkz3Lq4Rw8Uqfb7Lg9ffe/Kp4eC+9aI5yktFAQzgyPPiVzBw3ZloFpXuWtIim4mOw==
X-Received: by 2002:a2e:a9ac:0:b0:372:80ac:a33a with SMTP id 38308e7fff4ca-37609e604b8mr6494121fa.28.1759912122024;
        Wed, 08 Oct 2025 01:28:42 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:28:41 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 4/7] dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
Date: Wed,  8 Oct 2025 11:27:56 +0300
Message-ID: <20251008082800.67718-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008082800.67718-1-clamor95@gmail.com>
References: <20251008082800.67718-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Samsung LTL106AL01 simple LVDS panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5e8dc9afa1fd..c2963434c895 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -272,6 +272,8 @@ properties:
       - rocktech,rk043fn48h
         # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
       - samsung,ltl101al01
+        # Samsung Electronics 10.6" FWXGA (1366x768) TFT LCD panel
+      - samsung,ltl106al01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
       - samsung,ltn101nt05
         # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
-- 
2.48.1


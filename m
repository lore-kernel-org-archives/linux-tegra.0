Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0221A2F39A8
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908686; cv=none; b=YjWh83pm8fXSECsBtFJ8gx/joCzIBAEkNzEdQJPykldAYn9E4yav8s5xDZ8tYoKfmt3S+eiZiHHojFQZsaaL2RjHrB4DMtmEyNLiI3FYxTKh7zFHI4XgkXdREuYO0FkniksUZREmV/RSWYkjGiY6oBWVTeF8fUUI/5XPvlRZZ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908686; c=relaxed/simple;
	bh=a/48XUdptj6+42+EZNzEr2TY6pY90ELY94jo1ZmZXkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXZWmiD3I0m+n7L8456fd7utw3G803HddPZZgOHREeJS5TS9aUl7nOet8BMdNWrZV6EmYWzVfOMEopbRcIOAZVB7xqYL54HauqE3A+lGBNkGzdcJj5KDFwpZxMiawCaWHwG5JVExnc7O6MOJifX9wXQJrXNAJgfD9xsuVaIbbsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFxri1BG; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFxri1BG"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so8424076e87.0
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908682; x=1760513482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
        b=MFxri1BGnTXCgJLKZIkkDXzYe+Udpa8KvMxzEar/jDzmg5BO5WeObqk+AWF4zOht3z
         wofDFdZPFiY5oRoXd8KJmNOTmZLs1Z1P9eWNBt117/Mdrpc6fU2Mp0vbJs6y/mamMH0m
         75JjJvkCKMJXPr1N37phYMpszpvbfFo3Dy95MhgFUQCvrxNtOGxF+vh37g6/0+VkKF6P
         TNf/Ciq7r/xqJ4HygPpCfsJ3JkAAVDBzX1kReSim6yIXZde6vN66TGn3YKLWy/1ljTpY
         ISP3kHPsyXzX7hQBXh1szEr7XRInyDoKFHV4+s7ml7gA0ImJdc0+BPv+XQN02zzNgk27
         Ezog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908682; x=1760513482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
        b=miDADcfq+pjKVXIHSGf2ra/fpziAZSJ2KpSxo0/8WJSF2G1TBO8yp19PmK0mj05cXT
         4k2RyOMsWAh+j3nSjUKLLQ46gfh1S8oa+vsF8p4ODg0WtyX52E4Lt9mzJ37UMeTrCb8H
         sBLq/jNJRLY2VOt+fKX8AIW+R9O1kCJ8UFQXhhd49BzzcP0u7FyKe93C4UPf957RgIfs
         p0b4k75w7nPBlWhTDWYfT45AB566mZ2ZC/pxsrCoXRKO8H2Nvk6y6gtj8CSV3k/g1iX8
         zkpDXmKNqz18h7cwrOL+3l4WnaftmmBYyvHtSrKOpAmqy15KBXul4+YQi7FgRB7ZXhy0
         x6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxkQBb+o3u0KHBbSeiJveSR/SoomI8QbMMRQf5HHlILt6yAdhb6CVF4gSvRd9GI2daxO/uvgZAMmkb1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmpKnQ8n4FHUz+oRszqfFjY6ae1qyEkvp0BBb/fjUA8VF5nP2
	cdVU+NY+9ImRv8VuFcSTGrCEx3CVkATbYMmZPNtmZw6Er83PSHe4aFBE
X-Gm-Gg: ASbGncvu6E+1KqGps+BLa+G1j4PeTfdoqoD3ZsX5C0ygFgU1S1oGvtlPJITmRzVfnZw
	jN8BNOLh18LffcJ+Q6fzCfyo97OJsOF7F5nqE/FrbbA6xfetHzrNtKUvuwYcX7VERh3QNljh1aA
	D3aANrQMRjt5Tl+ETSNkFP6m10ICvtzl7n6fqkj+f1eThzxQTgoTO4a7b1Ap667Qw7IvIq9bWSe
	3N7YSO9n9SkAZvStJEomqpfd80jtrf7CK5/qQaypNZitK/BHgrixlgg/gemGlQx5+s5RQGY0/GU
	z0vz+a4xKGRqxqla0RRN3iYUoP8Pf2OeIgBkb4W51ZXm42KmYGNv2M/88kRjDh8ydfTPxbs7UtR
	J1I3131MzeTHByYFGOpJKO9zOaPXt+5bJREBtOw==
X-Google-Smtp-Source: AGHT+IE6CzpQ7p9cWL2g2u1KCij/uULFzIog+MKLpggK4YVhbmnkBbPJg12jiL753WYqBvss1sNwdg==
X-Received: by 2002:a05:6512:ac4:b0:581:7f39:d34f with SMTP id 2adb3069b0e04-5906dd74a07mr738319e87.43.1759908681823;
        Wed, 08 Oct 2025 00:31:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 05/24] dt-bindings: display: tegra: document Tegra30 VI and VIP
Date: Wed,  8 Oct 2025 10:30:27 +0300
Message-ID: <20251008073046.23231-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing Parallel VI interface schema for Tegra20 is fully compatible with
Tegra30; hence, lets reuse it by setting fallback for Tegra30.

Adjust existing VI schema to reflect that Tegra20 VI is compatible with
Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
an enum instead of list of const.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
 .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 2181855a0920..dd67d4162884 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -16,16 +16,21 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra20-vi
-      - const: nvidia,tegra30-vi
-      - const: nvidia,tegra114-vi
-      - const: nvidia,tegra124-vi
+      - enum:
+          - nvidia,tegra20-vi
+          - nvidia,tegra114-vi
+          - nvidia,tegra124-vi
+          - nvidia,tegra210-vi
+          - nvidia,tegra186-vi
+          - nvidia,tegra194-vi
+
+      - items:
+          - const: nvidia,tegra30-vi
+          - const: nvidia,tegra20-vi
+
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-      - const: nvidia,tegra210-vi
-      - const: nvidia,tegra186-vi
-      - const: nvidia,tegra194-vi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..9104a36e16d9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-vip
+    oneOf:
+      - enum:
+          - nvidia,tegra20-vip
+
+      - items:
+          - const: nvidia,tegra30-vip
+          - const: nvidia,tegra20-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1


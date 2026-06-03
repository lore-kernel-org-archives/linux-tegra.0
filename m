Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8BB40DFDE
	for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2026 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519449; cv=none; b=kBinRpQXG2D4qHTLcjKrV1E7j598P6MfsmsD0X/ZLwrbte91smUgoBlG0M2n/akANkBRZx7EpWu/Cx3am2awkl70GpPlAYxeCXNekE8NjITNG2+fv0lzs7ttL1T32yP/LAy2H5t1C75Z7fDwM6kpa0goqlYc6AffzZi4NEA8CSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519449; c=relaxed/simple;
	bh=cVp6ayeUgmE8WBe34rL32LQuso/i4iAijoExnQqrcQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4WCIp/iv3y3vN6lwIa2Os5akOdUulOiWz82AZiSp7gTCPXD2XC7r4W9gcUO7Kju3Eia3ok0/aMDPMymVu+8evG73ipYr+OdQ2PtR9rjTZfVs3NkNQ6Cx177W6clsF3Y+CJoEfAyLjiSd8K7nlUloDN7DSqBwnUiG8jon3ZOP4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qz9X5i2n; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qz9X5i2n"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-43d16405b54so7036fac.3
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519447; x=1781124247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLhbmjyf/Pct2anMIF8eJOQ51u9gqHgtr+412iMIgpE=;
        b=Qz9X5i2nTcIhNIe1a5IIN9d4uP34651mWbQht0SEm9kRuzWw6MibroZ3hRElOojd2x
         IcdFwlp1m4I2LQy2sfa5gvz9ZbjwC71Njc8tyfqes3DBiUvCFZPU6RO9kDEUE/hqhMef
         UGKjA3eJmgjTNlUrlFHxP+RiFjW8XcirN6EOswyUX7bp1BbdEM+Jf7KAgBKSVFeRFDge
         J/w7Pd/V83MYDXurrjsX6NXVF/mhxXfeY+IX41HUmQdft7PPjZwuTp01pi/NNXx4gGj0
         iO9C5mywFFGGAZZN7UaVmqG4YdRwj1OzoVfkxJ6v6KzFw0eRKsw/lvT57ic6e2BX0uhY
         +r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519447; x=1781124247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLhbmjyf/Pct2anMIF8eJOQ51u9gqHgtr+412iMIgpE=;
        b=DBfcyRZcbflS/LuiepPWxRBeGcx+lsh+yhUsPy+gstU//XNSS+oZrYjg48Pa/fvHtR
         Jz4W2WYcd0IN37OOSk7DDf39BtKM+QaDbvHpmF+PGfJsY6oIRcZgizs5MykMdluoQLmH
         zqlLJe8cx05/UIogTvEnW41qbu7pIPYHEj7OXLf0jRz00xdQ2o3agX271jrcZXohRqkv
         r/XBhYy838Fhez8eDkIJSiohoSluMQb6t+C5btnGMXP5YEgaD8o6n9aI1Cwx0tc/r8he
         PKNRQnjVsM6yOH4Kin7iDWrZouzceqW+TnbXi2z/cd+TGvhFAh9PiUiz5ENja6OL1Z21
         SuqA==
X-Forwarded-Encrypted: i=1; AFNElJ8K5V3YanOO2xjRyTTtvt6UNNwtvMNCuwFmnosIcgJqAI2fpmL9CImmk6waHSiBLmAMcjxKupWuYDtqsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJq0aYMsbPOS3RjDrACUOzKrZ1sM+ZoETYQw8035Ax5FIUuCYN
	sDxpubVoK91POioTceqsaiWvZeIuzDjGtKoHaYvc1cfbx9Als5HCaFhi
X-Gm-Gg: Acq92OGrUORVvLvRY42fNnYLZIwTdjPlG0Hp3S81VZdtl9ygSn3bOF1PvbvNQsxzU40
	eHB9kMSO+D9C5hBsOHTjbY8Je6G5cCrzcpvk5YZQDfUKlFOAK2uKrcu6DoeMGRW7eO+9UMl2Hm1
	UvS4qFJhSHjyROTfnFZkFdWhdy0bYb57GTOrS3XiHWuJ6wWywiK1is0rp1+fMwTGow9bA2UMs1X
	yQ3Ko1YEjFq5GCWqqjgI7gq2In/vBJonIeZ58c0P7TwpcWCkDghr9Fb952PSPKxwL6LOiJuZAHz
	0PR/Xy96Ge3P5SBarBdsjNSv2Cmy+1TSuYPAfK9YVGVv9tSTiFrVZ/vObNdd8e1zrKsckYSYrm/
	L0EB2W4vc+ftsxunvW/gq0fFxJCGjYtCxf9ChgiDqUCQ/sHS8DV5fRm2BrUnLK/5ElL3GH+SMm/
	13tpuiz4+kf83yLihaQzhF4JPJWOMV9F3WjjJosRx3DNRgMPtD2MIw5Oeetmkd
X-Received: by 2002:a05:6808:50a2:b0:47c:be93:9214 with SMTP id 5614622812f47-4865a97f66cmr2948106b6e.20.1780519446735;
        Wed, 03 Jun 2026 13:44:06 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2667962b6e.4.2026.06.03.13.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:44:06 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Wed, 03 Jun 2026 15:42:20 -0500
Subject: [PATCH v2 3/4] dt-bindings: net: dsa: remove obsolete dsa.txt
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-remove-redirect-stubs-v2-3-c8c19876ab64@gmail.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Akash Sukhavasi <akash.sukhavasi@gmail.com>
X-Mailer: b4 0.14.3

dsa.txt has been a redirect to dsa.yaml since commit bce58590d1bd
("dt-bindings: net: dsa: Add DSA yaml binding") introduced the .yaml
schema. The .yaml has the same filename in the same directory, making
this redirect unnecessary for discoverability.

Two files still reference dsa.txt, forcing readers through an extra
hop to reach the .yaml. The stub has not been touched since August
2020. Update references in lan9303.txt and
Documentation/networking/dsa/dsa.rst to point directly to dsa.yaml
and remove the stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/dsa.txt     | 4 ----
 Documentation/devicetree/bindings/net/dsa/lan9303.txt | 2 +-
 Documentation/networking/dsa/dsa.rst                  | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.txt b/Documentation/devicetree/bindings/net/dsa/dsa.txt
deleted file mode 100644
index dab208b5c7c7..000000000000
--- a/Documentation/devicetree/bindings/net/dsa/dsa.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-Distributed Switch Architecture Device Tree Bindings
-----------------------------------------------------
-
-See Documentation/devicetree/bindings/net/dsa/dsa.yaml for the documentation.
diff --git a/Documentation/devicetree/bindings/net/dsa/lan9303.txt b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
index 46a732087f5c..0337c2ccfa9a 100644
--- a/Documentation/devicetree/bindings/net/dsa/lan9303.txt
+++ b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
@@ -16,7 +16,7 @@ Optional properties:
 Subnodes:
 
 The integrated switch subnode should be specified according to the binding
-described in dsa/dsa.txt. The CPU port of this switch is always port 0.
+described in dsa/dsa.yaml. The CPU port of this switch is always port 0.
 
 Note: always use 'reg = <0/1/2>;' for the three DSA ports, even if the device is
 configured to use 1/2/3 instead. This hardware configuration will be
diff --git a/Documentation/networking/dsa/dsa.rst b/Documentation/networking/dsa/dsa.rst
index fd3c254ced1d..42a99f5dfa2e 100644
--- a/Documentation/networking/dsa/dsa.rst
+++ b/Documentation/networking/dsa/dsa.rst
@@ -509,7 +509,7 @@ Device Tree
 -----------
 
 DSA features a standardized binding which is documented in
-``Documentation/devicetree/bindings/net/dsa/dsa.txt``. PHY/MDIO library helper
+``Documentation/devicetree/bindings/net/dsa/dsa.yaml``. PHY/MDIO library helper
 functions such as ``of_get_phy_mode()``, ``of_phy_connect()`` are also used to query
 per-port PHY specific details: interface connection, MDIO bus location, etc.
 

-- 
2.54.0


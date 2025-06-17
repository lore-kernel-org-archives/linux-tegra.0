Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22128D827;
	Tue, 17 Jun 2025 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143828; cv=none; b=naZ2N9R46KNWD55iVyuAYsFvPtTXouPyXBqrJ6pCMqEGQEuME3E6iSdjy6fvXaotJIjxhgZl0wzgDz8VzUDMzA8lJB7YRaR1rQsq478wFAjjYeJurynYQCWhzVubPGJLlLRoiaK/kzDOpYQ+4G5iTrVnQSpTMLYHGihHcBnPiD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143828; c=relaxed/simple;
	bh=Go9kQY4Cf/0m/2ndhISA/csNmyOdz1/clqv8HISg6JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSuI0vq+kdT1/QdOxER/QaHOl22tBMRSiCTpxKMksATBsf7eFVEoNDwOirkTIANMtlI8GVVzn0hjvNtT0ABCbx0UvdHBhZxP4jnSXtIFrjD/HemzckcX9fTxdsRQB2Fb8sO1TnM9woKfoJSAGFnRIOf0yFUhrv7mcbamZ+VbbVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdY4XOMQ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdY4XOMQ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54998f865b8so5048255e87.3;
        Tue, 17 Jun 2025 00:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143824; x=1750748624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67aHHGr/9M3riI6drWDtEAom9IKHNVLM2r7fXP9AaVs=;
        b=IdY4XOMQhKC/FK+SWrpqJZsml5pwXczNaX6PV6L2d5x8eIePP0odQ/AKZQPNNnMCvh
         eg01GD+r86ARApf3CdQl7Tx621gm6K12ukw5vKaGzdAELNvTyRb6DvxZBZlNd0F/D+rK
         8znq8jhww4ULHIz2d0tEreC7yTGkCGvUwQ9CX1QxGmNszZXv/wVtJoLR6qWmH2yHctDZ
         La+VOQIrguhieZo8P0LpgHcCE7NBVhtO0sZFP9Bwp4DAo5l0M24o7vf2VZHN56RkEhZS
         /qTbPz6KCNbS6yLFqeqCo+uoTTNVnSkTGusmGvfi+wQqRf+akF7oxi5dK/MF0i7wpDvL
         mEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143824; x=1750748624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67aHHGr/9M3riI6drWDtEAom9IKHNVLM2r7fXP9AaVs=;
        b=WftAVZtUyP3gSn/wWTlTJqVOUfb1JGXCeTfvXEJFAmI3BruD349r9fEhq8WiU7yOtb
         PCSu+MkUKqUd/BODru2l5iqhJeNmTA8ALKAkYiT93SFIxO0MPuNcHAnMS/VYe2P118ge
         VvohAKZciDtWsiWY7B8QGeabeoHkmmhktPYtCXgGszNppzM4t8YtPzQ2/w8oHjFLJO4n
         DONK4M16+YpkI6LgkKi7y6HKflxlCNMIYMg3mOvy6iZmxDMTCzsCXrGhr3An6/cWwzFy
         13ss+WRZtAA/IIH7YlRbc5gv+aul6YfGcidAW09ggesLoJrcMV5so+z+TX+NI0peehs6
         tJBw==
X-Forwarded-Encrypted: i=1; AJvYcCUch2jo45g4sv84D9i48yidpXSijheHEvItVNEDlL3PUMfJpB6E8zSuvLcY9/SBXgPZywPdEm0jFZrj9s8=@vger.kernel.org, AJvYcCVY3CCoTXeDv6i/7tmqD9C6SWwibtcy+tBgr2fMPb0SCILkC29Tr8ip4eD1FNhb6JZpptXhiXA9u1F91fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHkBwTxzqVzOCVQcpWavnkvWY2oJkn3ycWB/CDkuPxYqzF4QcD
	Bq4zsM0A+psSoGjTjByVKVcZ5Hw5I85QsR7g37vfAxyb/1JL8PV2q+mn
X-Gm-Gg: ASbGnct76ODKFVqhCuP9ZKt1DI9UC3IYC6+xFGBTi7id0tQPLS0hFDZ9UlYEFreAi0n
	LoZ51bQ9hwSK54OrUtEdurveeSmlh8No3J7PclSXt2COEl9ZkeAJ367xQYzMy680iJzznjivSap
	q2KFQsshPzEl9H2IsnJ/UQQw1xhs5MRyCzwR+vf3SNiz/15FVAzIkeI6C97TGfuor0HA1X+nmrJ
	y9V93Ob3Ugsnn6N1PplTEN8jHkybeq1LtpqSaBw5duIVFs/Ku53HBRridvcBXZjxOBi/MxjFdef
	mPTGy5GzUc5qoWqhhPaQ9D1+J+UHEPxk0TXNDcOtWOzgQ7tUjv0QhA==
X-Google-Smtp-Source: AGHT+IGTb1O/R8WuLXbPa6uJop8ySVEJbpXR+bXI7d2N+cIJY9LKjjahO+fjAIWgfPkDYNU1wIIuKA==
X-Received: by 2002:a05:6512:1150:b0:553:2a16:2513 with SMTP id 2adb3069b0e04-553b6f4cd59mr2847802e87.47.1750143823668;
        Tue, 17 Jun 2025 00:03:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab9c8sm1800427e87.114.2025.06.17.00.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T
Date: Tue, 17 Jun 2025 10:03:19 +0300
Message-ID: <20250617070320.9153-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250617070320.9153-1-clamor95@gmail.com>
References: <20250617070320.9153-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Add a compatible for the Asus VivoTab RT TF600T.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 79b027740694..534197a87439 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -65,6 +65,10 @@ properties:
               - asus,tf300tl
               - asus,tf700t
           - const: nvidia,tegra30
+      - description: Asus VivoTab RT
+        items:
+          - const: asus,tf600t
+          - const: nvidia,tegra30
       - description: LG Optimus 4X P880
         items:
           - const: lg,p880
-- 
2.48.1


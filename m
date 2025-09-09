Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3823A562;
	Tue,  9 Sep 2025 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404211; cv=none; b=A9QY78E+aI9VScmJHS0nzLroIrTJHeDcpMCC8gOGsA2rT2JokU03MB/FO36fOC/hPxMz2vmnHp6e/NKZPkSbjPX+b3+1ULUIh8ZndawXKi8h0Vpkmo9uIDM6HFD9dN/AeI/KMId8MmlsOAEdq9K1JukFFJr/hPm5VuCZe9G4bC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404211; c=relaxed/simple;
	bh=WvFEmzsYep/kzWOHsKd/XnA0FA5PrBGqTXdsQ+R/qzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cByEwgDhtteeuh3aIeY2FzsrlpAIZzdCgGrfJpAOBxLH+5/DPUCjY+4U/0Peid+PrXsrw4QyIlKsgXAwoLbQRlzmYpZv/AuqaUgxn9uuUxRGVjXQnmUdEjUGG7QDYPu4YqMbPqQhZWNguFFqIrUCLIkCM2QTuRvWFDucE3lrVe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPXQoMop; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPXQoMop"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f6507bd53so5669973e87.3;
        Tue, 09 Sep 2025 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757404208; x=1758009008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1TsGZjGZEVTw/xsLGPk9vSJ9yVGAGNvsNyTGBqHdq4=;
        b=dPXQoMopSCv7p0yWBxxZQ8Gdz25PG4PolTXVS5DTuOTK8TjUevtTFxk5dXni8NiXcD
         +3yJgzGgyfKBYbKC32cPr2CwqyDGAawTu/KiRRPtUvuWk/PGZ/DJL/BW8KgxWGObo8Bj
         UTfG+ozHiHe/FMu737UqyHbGZHdhMdRdXadNwwLHF9cZhjpBrrVu+gpuDpi3ydSiUZxC
         LKOisUScQw/GH4DXfqI4T1cPtBB1JiQccRKka8EgeigygoPBy3/6Ae8uIVY4gYPjwV/1
         OujsToqyN8mzg+P3aTsO4dj0mgg51eI/++oGmQ5Em+dDrXyTZxeyBl0ZlqxuYp6fUnHQ
         6iYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757404208; x=1758009008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1TsGZjGZEVTw/xsLGPk9vSJ9yVGAGNvsNyTGBqHdq4=;
        b=XLEeQrATrAcfW5Lhx3T2ICnoWtclc5R80GsHxEXEHGvQuUUkqei7eZNF4lZVfeF+OJ
         4IvkPVUwSFFKfEyEgJzwU395w2GDJ5e03BKnnU8RYJmYvVkhPlTEz0IO9zPU5C5WSwIc
         MP+sn+zPGNU4zLkMLXxkanDxm+9OHUdhUgOz/frAwdxQxjVSN2TRJcZOgEflbx3/GS2K
         KXBqJ3fa7nH2/ytCHE/MOR8x+iKGm9kq5Is2S5jgHuWKKOJMrMzfNWewN4tcAz9FVMXx
         4WALmzSnyL0t9iCJeIIUeNIN1VS3rEMrg6QusKYyIuO6QOR1lxhTYDmmXVdWrm4DCAvu
         L+Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVg+P7NhBJSzqSsVt1t2eXVTli2ctoTf1fFxhJlJIpXJ2t4w1QxTxZ8wRBsR1rSe4X4JTAXALmb87FDJaQ=@vger.kernel.org, AJvYcCWe1xf901ObdFhkUS7QnjN5AECabEeVnUtiA1t+bf+0PolLzGIJEwvcg1VmjwHDOQfJz9mLL285jKbVJKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdWGdwwpRtTVwuTuu3C3K3LoZPetFWyc4XvMfDtog1wvtRwjin
	GjDCtyQzA5ht1D5S6Hg462J3lNPuJWNFKIuTDxQL7Z0rhvm/+rn7oKWL
X-Gm-Gg: ASbGncsmB1KLDWWY50eUHAoVAqyt/sGnT6pBJlSwBPvga+8qd6GUs39KJ03QzMCurDR
	0iXyVmyYj+gc6HjYQkdMmfnuULj2BZglXrzL+5rb57oyHfdQewgR1ppFGBOBv3IrqppazDaYJRO
	KjausIgThL4l2DY5Ehj2vxc6hKFnOR3FE8D5tCw1gODI2ESdK8h9x6EHeMsr5OAsiBbJcyQpdd+
	XuPkHvBpPWvmBwqi7+K33jdmYAPISmwNqsZmYWTuxvgejzFeU2ieniso+vgrcyqEMJbAfUnXc2Q
	nU0JRg3+k3AHqkOI4VpldROTcCQftgp8nGw4ILuQuQ4EwAoTZ2DIMUlU+Hgd5un0z0Gdh0uot52
	ymww40+mLnuAcT1kOREcdZbZT
X-Google-Smtp-Source: AGHT+IEyb4ikHmInbnU0t09k6p2pwK+p8pBjC07n0VhIaN0vVvND6YzKUwuM9Pvyl6TcWLRMkq3msw==
X-Received: by 2002:ac2:51cb:0:b0:568:fcd5:147b with SMTP id 2adb3069b0e04-568fcd51644mr264064e87.2.1757404207487;
        Tue, 09 Sep 2025 00:50:07 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cce9f3csm340021e87.52.2025.09.09.00.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:50:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: tegra: add Xiaomi Mi Pad (A0101)
Date: Tue,  9 Sep 2025 10:49:57 +0300
Message-ID: <20250909074958.92704-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909074958.92704-1-clamor95@gmail.com>
References: <20250909074958.92704-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the Xiaomi Mi Pad (A0101) tablet.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index e1efe6639329..58211aaef226 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -178,6 +178,10 @@ properties:
           - const: google,nyan-big
           - const: google,nyan
           - const: nvidia,tegra124
+      - description: Xiaomi Mi Pad (A0101)
+        items:
+          - const: xiaomi,mocha
+          - const: nvidia,tegra124
       - items:
           - enum:
               - nvidia,darcy
-- 
2.48.1


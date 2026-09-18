Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C251813D
	for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 21:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765326; cv=none; b=I9arUnoB60Hfo/VadNEV0HXn54fCuXOlDOextG8JPYnR07gSc445ryMHTFb/WoD6YIHvrvpOM5lzkdztmN/4jAKzKAHGvj1lzGWnu6oM8gANLRwknqeEcp4Ho4c1WpvJ+f7EGfGerlsIjx/W5fneeyyPtEvECKCs6ThIRZF2lCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765326; c=relaxed/simple;
	bh=h2xXVlZKgqReyGTqA2at8TQj11rI+3lzMWWgGV3k0/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGaZgMjSBmKZlw6pA/dfkWHD4DnPV9+XLb4xWSCrxxknzXjSMwi7GrERx4P2qhvEZNZtUId8IHgg4RN2TXDOceVcrYtJzoA6UD6suYqC3/FbwIm8LP/rQLLyW/owmz2GjZ009bRB8uJknxJro3308x2GeRpBY9PdBNp9NmIOnko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcn4SZtr; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcn4SZtr"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85368f1d484so165286b3a.1
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765324; x=1790370124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h38ODDWwiouXqh4d0uZxfCmE9hOLqrBLpPALHbL8zMI=;
        b=gcn4SZtrF08N68S4D8HEnqZsVWe8PKMIVtupOXjmxEPs+Jl7a+w7GRYgFrE1+KbtB1
         sFSpg9jGplzDOKXNTRI8e5DT2JaZ4kvZ7xvuGpPMJ5kq6F2liKyZD+ABdckA+44W4oH1
         Yv137j3OOpjy3AKoqtc4LMyFw6ItkbJEMCeY77qVU3W/xaicoWNWnwM1/xyHAeNEr8k4
         ySLsYz1ztxqOOyU2PXKQ2zeEBqsrhx32deLioUvo7mSgQs8NdivV2oSNZ0Bn2VcUwAJ+
         YyBvN9hO2vsAWHjnNG0cU/A/aUwmZqjcuSXdb65AjkB5zKjN3Akg+wEh5Zv34/I+nqxI
         attg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765324; x=1790370124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h38ODDWwiouXqh4d0uZxfCmE9hOLqrBLpPALHbL8zMI=;
        b=yR2YhZ7v7+IhkVG+6JSegHZPOdVhalj+kBJurmtuSLt1EqXkfuN75pnGODLjXzRUqo
         i1co8vDcnZv4H6ZsTqtKb6x423NDZfislB+kgQSxfvJ4khkDip7+yh4qMg/dAwnUnwwI
         pBaVPpm8IdTp7ET26NhLOQmb6uJPYh0es+Sai9uClzqM2kAQboG/uPJSngaauchpUOST
         jGGsqSm9AcQvsQVaZQV/m2QdaYqmk65E8TS3Ef34S0Cik3WKh4enRUy3D4t/sEaNwZMB
         LIK/bX+7wAZc/jgbVbEgijyvdG9MrZGX9p9qssP1BPW9Ql8YVjxI8uV899t+3xPAuvC8
         fRVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzR2Hb9HvLWfCzw3fHWZ5a8vWedUjA/L2w6+kLgDBvYXCAQ/kWpfF67DzzhANns4Vc5hCPh6aQFgSns6Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kWzl8FF63vOP6Z+y1P+tgTMShgrdWRsUAFlyKpUl1ah76PDxYb
	ShbILviM+MsLpLkOuoNjHGOFN4MTsLqiYvVxetlf1+8z+OOz2DP9dnou
X-Gm-Gg: AYBFou3UnaMoSWS5t0HU3oANthzrjSIRTbHJh8/nre3u97lz1NpMKNm4j1zjoKkcUoM
	VYDc5Biq2pzP9Ivy/Ml9ON2IcbmfDfPwEwct0Z3r7azRsHpTqShXN9a0IheYw4/1sVruqt0JVaD
	S60lznBMSXNRHk8+2ssD3HJwhxMekgCiui+J0/dWZUcI+4x9M5ayCCawQ72sgwEVcabM+025l5F
	YfssUQ5iTquQLrBCAu283tz0e5XuWGl18NFocR8pT7WjV0Jibj+YYwRlX/8ww3FdsEg29WCjgGv
	yGkZvrjl/QmIJyWNniGE8cnF02mkHp7SArFirhlmVY2e9mQe8xP99EPzCttqnl+eOVKjh14bHdi
	6HC2AaPlber3ACG+CpjSCTnC+vnOb4sWc0xYFXI/kOpjCvEsUwEEhqiedSYU1w51TxAO3ltrBDm
	uePyu0pPYHyCUePgxGoW6GyDIhoNwXrPU8DSF6coi0Cjk4s/VhSMEByh13SSCoA5GXVgL+pW5ve
	kK5hhXZ
X-Received: by 2002:a17:90a:282:b0:39e:b778:2b2e with SMTP id 98e67ed59e1d1-39eb7786404mr463150a91.5.1789765324132;
        Fri, 18 Sep 2026 14:02:04 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:02:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 19 Sep 2026 02:31:22 +0530
Subject: [PATCH v3 1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source
 and GPIO hogs
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-ti-tps6586x-v3-1-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
In-Reply-To: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=1219;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=h2xXVlZKgqReyGTqA2at8TQj11rI+3lzMWWgGV3k0/0=;
 b=PrZIb1oaJCJoaQZ52TqsTlrI9VOHr32Zwu8IJ8m+cdJ/8q3aieapZFuwECgaU/ny6xcaPQ/Jb
 u9N1RujfnTmBtUlUKps0j0RnX0QiNUfMWGab/bTTMn0YgzoUF9v4Bj9
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Device tree validation throws warnings for the TPS65911 PMIC on Tegra
boards because wakeup-source and GPIO hog nodes are not documented in
the schema, even though the hardware supports them.

Add wakeup-source property and allow child nodes that match the "-hog"
pattern.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0c..caff9dc0b2bb 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -37,6 +37,8 @@ properties:
 
   interrupt-controller: true
 
+  wakeup-source: true
+
   '#interrupt-cells':
     description: Specifies the IRQ number and flags
     const: 2
@@ -163,6 +165,12 @@ patternProperties:
         vcc7-supply: VRTC input.
         vccio-supply: VIO input.
 
+  "^.+-hog$":
+    type: object
+
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg

-- 
2.55.0


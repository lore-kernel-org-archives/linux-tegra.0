Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82AB19E992
	for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564207; cv=none; b=VCi/1+5c3ltBsCaXvhnqkV46Rtfq/TlfsNIfbkBPyE+KhCJ0TcAov3awN5I8Ub1+v5rnqb0qulgsFE3eU021CS8Woy6wGK1pY4WQ76w3zO7zROABHnoWdYS23Z7rmGgR/Bnw+jqBBJhqYEQePSPLUfC9EEaSaFAOTUcgpJ/2/Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564207; c=relaxed/simple;
	bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dOSfkyZWVdnMmr1lLDeJFajz/B29+7sajXQ9wPZO5sX1ZJs+ePiLpIbdqycxgixIlbtT5Fw3befiHr2EO07BRiEkviN15BzawfSGbN9n21b4Vuk71kgb0dFDRur/tq4uQSsUEupTI+CGABTwd58M4ayW12F+/eP4A6bi6TUwqIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJGGB/4n; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJGGB/4n"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b1a806664so132614a91.3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564204; x=1790169004; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=lJGGB/4neg/fnWE/EFaXicMNrjhgwFeDXAW6QrlOEUWmVjHBV0cZ+3StJf04Rlxx/x
         b+Ij+WDjI/rkhTLcUxQYLoKRJo3xRzUeUjOuX3FYM82incp8AsjncCMc1TAtODuZQmy2
         MJJV/d6QKQlcWYk7lchRG1eE6sfvoMfBzkgDx9zoG9hTmBU2rYRfkSo7v6pL9c87fU6A
         98hksHXjtqiHeR1hLPI2VFBXdHI/qTdqITNSftVLu5b3gwPTvyPQaqT6bvBQsE66yHaY
         1IUKrcB9E2ffgwX72o0crnj2QdA0WAbwnysGfbg9Hm+6R71zRBFlT9n2TtQsrh9DyZ9E
         qvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564204; x=1790169004;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=ouQOJFy2hy6mETohmrJiFCWyvSCaDlqBVwvYi16c9FS0CdZxKoLWyY2DE1FAnbJPB3
         nqi4D488iNlxkvA5y89eTKU+NGPh6Dc0zok2vrcCYK6zBAuh7AS1Bx+iBBan7b9GTSoL
         ot9mPUipDn6THHoHbVzEujrUIA9uWmhQO9/cSk8+H0IVob4D70S2baicpsfs5qimdc9A
         MsId7XUJwGdQ0+KmZyysNy1zbxDI73PNR2htE7+6BCwFaBpeOtnnoVqb68tBhZYkZXvl
         zQFtrqnK8yYGYuKZfNXprOEherof5gb/CUx6IWDWUHET/d4DAHROn4hH8RRIN7yMULLR
         /FXw==
X-Forwarded-Encrypted: i=1; AKwUvByDBt2HUzyeUNxjRd39hEjy5TvN9LxJta/gcuATuE41J1T1VvBb8yiLRjuRvlMWkrNOqVhGZVz07ogHDA==@vger.kernel.org
X-Gm-Message-State: AFuF++mrsj5jJ50f6WV1HRMq3N/OXp7lKHSS1ph8dbFqhV61J0jAGq+Z
	4bfkw7yxtuZFgx72fOWdj4KmekwsVdBARn0iOgaYAWLXg01QwIPP2Fnv
X-Gm-Gg: AYBFou3RJsH7DE4k0o3c4eHD0vqkdW/8lB9B57vrRZwduwPlzUy85pE27jNr/q5AdLz
	rMGuDC2nmN+jXyPDEno2qJkr5qDlsX8qvXsbr60MpGjUZ8pcUEBwnM638IVZocjzsE1DCQiQcfB
	96dau5leeUepqSBkN3BO3Hr5B3avJiUVeIGhOz1h4Smr7MY+6AWR/Lw2qT+k+cxbQimqiOp8r3j
	8L1A1zraWi8NzSPxMT6tDDL3EsYTxgeMcX8SZKb2ojxKn4KoDkc6F3QEtPkG8D7PpO1irrDVFL2
	K9bjdaQ7Ibs8e4tyAng5Em3PjwfEte8NTxTwOHrVIPLJq5wF9n/+f3/h7CKnZ7UBfoZN1rp/5k2
	Ml7XUJj8E457TFE7cGsx2x+e6gRcgLb45mxM14SR4EQoEddYLhKMEEjn0imlh6/O3cBaQqnTBQ2
	q3SV00H1IwgV8hkJ4f8HVPE2g8l0IAvNfWTt9ZGXLjc7A9j+gAM5DDKOby0VbKpADCi20f0QrPe
	5vOby4JBJw=
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr3893628a91.5.1789564204084;
        Wed, 16 Sep 2026 06:10:04 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ac47cfsm7186272eec.17.2026.09.16.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:10:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/4] dt-bindings: regulator: Tegra coupling DT
 conversions and cleanup
Date: Wed, 16 Sep 2026 18:39:30 +0530
Message-Id: <20260916-ti-tps6586x-v2-0-31b98eeff7f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6CMBBFr0JmbQ0zQAFX3sOwoHWEMQqkrQRDu
 LuAceHyJe+/P4NnJ+zhFM3geBQvfbcCHSKwbd01rOS6MlBMOi4IVRAVBq+zQk/KZCnniFhibmF
 dDI5vMu21S/Vl/zJ3tmFLbEYrPvTuvd+NuHm/Mv2VR1SoysSaVJuEDOXn5lnL42j7J1TLsnwAk
 5/tUrgAAAA=
X-Change-ID: 20260821-ti-tps6586x-b54e7111917c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564183; l=1796;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
 b=h4Sn/Q8+2ydvx+1ai82bKpETRX2wqt/JMINlNqyzcv8hIJDj4s6LN8xR6iCcdiEifDU+WPAA8
 q+kQJQbpTG8A+Tl4xABPdsdK4NYgXn+qtCJTephF3KBFkOC8QMLm06Y
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series adds a shared DT schema for Tegra regulator coupling, 
updates relevant PMICs to use it, and converts the TI TPS6586x 
bindings to DT schema.

Summary:
- Patch 1: Fixes existing TPS65910 validation warnings.
- Patch 2: Converts Tegra regulator coupling to DT schema.
- Patch 3: Updates Tegra-related PMICs to reference the new schema.
- Patch 4: Converts TI TPS6586x to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Add patch 1 to resolve warnings from TPS65910.
- Add patch 2 to convert nvidia,tegra-regulators-coupling to DT schema.
- Add patch 3 to $ref to shared schema.
- Patch 4: remove individual properties and add $ref to shared schema.
- Link to v1: https://lore.kernel.org/r/20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com

---
Bhargav Joshi (4):
      dt-bindings: mfd: ti,tps65910: Add wakeup-source and GPIO hogs
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema
      regulator: dt-bindings: ti,tps6586x: Convert to DT schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       |  20 ++-
 .../regulator/maxim,max77620-regulator.yaml        |   5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt |  65 -------
 .../nvidia,tegra-regulators-coupling.yaml          |  76 ++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |   1 +
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 7 files changed, 294 insertions(+), 204 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav


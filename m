Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E056855D
	for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 19:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710209; cv=none; b=lnPxy85BGkJczWA2NQU0VbcXtGIu+Wg7ZMTNFdKGVwBUHlXVxPd12pUNcFWhhQFHbZ4LJ8+M6qr5nRImFbLcpsBJGtgxheOvJUfehWC9f7wOXRaMZ0EPNiZVzlqKBGjyW3Z3qT2bV2qQdjboB6oUm9EBCfTeHM7fuPHRwc1DPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710209; c=relaxed/simple;
	bh=dcqC/R6KKT/sQfJIFw2LiQyMk+5YWArPLJR/2wCqPRA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lEx7J6UsgoWpHs7EM1N51ZoiIxOnBw0bkKZztKF0jkjZrRySkKnhKtECnbqHaorWWGJQ3t6382D9ZNmil1DISzRp+2hES3hVJfZuiL/m/heU7FoyOT+YFXUzxUoL/a5hLwCkQ91aignpkudwUOkNi84TRlLgIyeAGdg2wgmDbSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fohw24hc; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fohw24hc"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343bdca7590so162857eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 12:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790710206; x=1791315006; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8NtU6ZgB5rVnB2TieQI+YlMezMRHZXxmu9/97X08t/8=;
        b=Fohw24hc2TW53G7PfmQZ75qoNqEGDCmAACYcpgcT8T/pXTLi8wmFjjSMIF1nFb6T19
         lAmwoxUYxrUzWipoJivsl4LXO4mZ6HAouAb+qYjP0EEY4BIhcP4UD2/b4RYwR5cLlS69
         Bzci079u73stV648rNVEIqfK+0W7ByjQBxurLjascSyL9IIDgLQqDGBT6MAnl3RP34Cw
         nKqNepjjIUD48TITIkEsY5DGq4e//Uq/J399TLkmK56GyoUhz4aTxWXwmOxYCemVUBLP
         Y7cjjyAUS17bmywBor0pxF4ho0Zr5BgC2U4EzvHisRUUmLo/avEi68hwREn+BdK2O0dw
         E/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710206; x=1791315006;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NtU6ZgB5rVnB2TieQI+YlMezMRHZXxmu9/97X08t/8=;
        b=vFYfsZZpLi9wLTvqkq0Q+anUK+07K0lreTy/jFebOSiEdRBjCxEjmZoozfKoXapFuD
         feW5bWjV6XM1t3LuI8PUwy5FvPAHVbFmxzhn959e+mOpaU5H0yozAnGAy6r2YwGj0xgI
         Y9Y6Sh1S3ua83aIDC12UfI9mh1qnpYVR5Z1vhXkAQr8LPp4aK8EwVg/MU7A8ZcxHsHus
         yp9BlJZPH+YxP/KSn4ayI0FDt2CuZDgPgjelzYX/tYQlc08qqLuK1jSnCeGaR2pYAppK
         KkHjRNoWe71+igKW9WJyCWgjK0QaYnLrHU9+D1dSq36SeHAx2wvO4fipgSgs5yKIs/dT
         5WsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz21pxpXwhRMtmsDwt8y2wIIuyx3GXp9WEP2p3wkCXnSQMjzBAiFBsT4fYCAdJEt2rfggm5f8BqS7Ft7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6fjhBhJGcEKvFF2e7obP9Co1YJ3DkMU6J6H3G0zAUrNkltqf8
	5ynhYHQHn0uoYDEYJUcK8QoZutBpYksUAAnBPxAr03X5FhyWGkLtNQX/
X-Gm-Gg: AYBFou1yzVnTQZMJA3j0f4KrLQf2XAoO8t1F7nXpNRhzHYUlMnSgYsNEs5x7azhQgsQ
	PY/S5bCaqjn3IYCYgm8mSE4kuajaTCBT4ZM82udRCAQRZ8pJthbLFF/b1MgETsYHDoM/OCROUwr
	oaMd0EvymlhqUhilpzvRArjxcOjvne3TrHJjGBAWB+AerXwCa4ehPcSSbrh/flS5J8D0twv0QJz
	2Xq9rFswOWCU4zXkSjOHNJaynj0im3grRXrNRWEqiwzgPgo7IxRRroC+4hp/p1tGB0X7JHVamuW
	Wv8H2+gYJDj2qeW+ejsXSsAQfct1Yux6DmRNhSyj8F+Qjsb3fXbue0u63aKOczrQlea4TtjghY+
	uiEbMvZrfwRJekou2KU6lgabOWFeaEQvJG/OlmXyA5II93ZQnT04FxOXb4yIhEFbX62J+WpMnz/
	8e7E5dYV7gorLScyZFRDPpimqsBiHdA6VZAhJdq6HE+DAwrB6AeVSS3je2UzU9rEnwADAkbXMuH
	T0dmdoUIg==
X-Received: by 2002:a05:7301:4d12:b0:34c:3ae5:ebc with SMTP id 5a478bee46e88-34c6128bdf6mr606357eec.0.1790710206173;
        Tue, 29 Sep 2026 12:30:06 -0700 (PDT)
Received: from [10.211.86.252] ([2409:40c2:5054:69f0:5c6b:5195:5b7b:d414])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386b6bd9sm1275349eec.16.2026.09.29.12.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:30:05 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v5 0/2] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Wed, 30 Sep 2026 00:59:41 +0530
Message-Id: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13NQQ6CMBCF4auYrq1hpsNQXHkP44KWVmtUDEWiM
 dxdqjGCy5fM989TRNcGF8V68RSt60MMzWUc+XIh7KG67J0M9bgFZsiZRpBdkN01cq75Lk1OrgC
 AEgorRnFtnQ/3d227++x4M0dnu5RIF4cQu6Z9vN/1kO6+ZZyVe5AgS2UNsVFosNjsz1U4rWxzF
 qnc48+WwHOLMpMe0PraGyK2/1ZNbTm3arSs6hop88Sa/i1NLNLcUrK2qLQ32jDx1A7D8ALJkTC
 1bAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790710190; l=2057;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=dcqC/R6KKT/sQfJIFw2LiQyMk+5YWArPLJR/2wCqPRA=;
 b=ilhdseio2iTuo0yviwOatf83AM0VBGpCAYeK5Hkt5ozS9PWnQcn/FQ38a6gjWl/sMMFJAv/so
 Qrz5Kae571TCPLKx5GN5PNmAJHRi2pb4fjqXH7eqQom3wILB2QDreKA
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
Changes in v5:
- Dropped example from nvidia,tegra-regulators-coupling binding.
- Link to v4: https://lore.kernel.org/r/20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com

Changes in v4:
- Dropped applied patches 1 and 4
- Rebased to broonie-regulator/for-7.4 to resolve conflicts
- Link to v3: https://lore.kernel.org/r/20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com

Changes in v3:
- Patch 2: Add '>' to description
- Collect tags
- Link to v2: https://lore.kernel.org/r/20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com

Changes in v2:
- Add patch 1 to resolve warnings from TPS65910.
- Add patch 2 to convert nvidia,tegra-regulators-coupling to DT schema.
- Add patch 3 to $ref to shared schema.
- Patch 4: remove individual properties and add $ref to shared schema.
- Link to v1: https://lore.kernel.org/r/20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com

---
Bhargav Joshi (2):
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++-
 .../regulator/maxim,max77620-regulator.yaml        |  5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 ----------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 38 +++++++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 5 files changed, 52 insertions(+), 69 deletions(-)
---
base-commit: 05a3330f490cfa266831c0fc7f8c6df942866d59
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav


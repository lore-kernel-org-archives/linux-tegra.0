Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7AA4F4723
	for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 13:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564349; cv=none; b=ktzxBoKRESI2btXa1cxamAlub7G64u8dIUrqPIVjpvrCkM12ZO5FspJ1U0Xmlmfq9dwsTf/SD4zAaWmS6zZ1UmOL1rvWIpX4qoqTI0Q2iTE0LVb/Kecb/swmmrd6MNK7cVC6OR3N7cYU78jIxqflfOkz/a6Q1tknRuZRDVV+lpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564349; c=relaxed/simple;
	bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dnHgveNApztWzEsmywQyMy2976qsjoF2l7S8or/hXDvMc1xm00eyTOy/8QXxIX77VNMA2M9wQHoS4x31wgmUs/1vNyO8g8E+TDonx7FnZvOdGBok/Ax6w+kLvR1q42My569Nd9gwYOtnGT64gm/jVjGsKYa3UCe1wQz8wG1jNsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHTlX/w0; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHTlX/w0"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ca696d43so126201a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564347; x=1790169147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=VHTlX/w0KJDYGklXv2DNuafsXtR/2NmVEUe9HL7/FUdrATClb4sj2L5ASBIcovU2xI
         dfRarhgoYHat5ttNKAU1vjSlsA6/mEzCpHOIXDKM/H/MmOBMoGE6T5LMaAhGPhbWqo/z
         OhZkciO8wP92XDuAFt/6YsE4tEdz734EAXOr3VQPzssOF1LY9KHu4qo2lXra365muqSR
         srsGOwFtF0ZxZ4aXWX9Sz3ExELQgOyHBnlsDqAx352GJ0MZ6s6rgPZTLRSl/vku6GqPl
         GDycMsHUWcrpC1b19qoT0SLYIQXvbDYqvAexg88ux5Jzdg3eftnJgHTmUc6Y6P64rbk4
         Welg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564347; x=1790169147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=jAXAmrKxliNdfISh1r39D4Oq1oLdArzxCJLh2qX8Y64TdaA32ji6V9zCk/5rZIw4l3
         CfK1LA0/7MztYhMK1soPIi1xoEAdyCX6sTFyU9H5rDJ7uJ03s4ztlXl+vwRLH6Iq4UKa
         5UCvXEW8pL9K2gtAPO1Jj2wahbOFuRZ8FDLjooDdjQ+HjykbQcSmAS91+ktOQ80X4Ehw
         nn2jYBp7cbVYnjC17NWy3gnhvkgQzr9VYRBWsxoaUzCDFL05bvJqNm4jnb9uIKWRGlXJ
         Od7TdRZNsSOK60SPHNYGacSYLnEFcEjaToCMJ0o2w08xBTvqvm711RbRWiIDP9G0SMiY
         VO0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKh58heI6jzXYY1+th3wYPQ0TfcGxyzg++q8WDYloBHejhgsyWd7/iXj327N/YFuuWugth6eRVgIWiYg==@vger.kernel.org
X-Gm-Message-State: AFuF++ka8xrdCxhcjISEnZG8RQ18llHlA42CEQg7etflgZsq/0gj4CDA
	668Cl88Rt0YhyNDKlobEkbmgSdnZEHEsjEeNA8/gPy+tPqFsfzXQ00tA
X-Gm-Gg: AYBFou0GMgYOCCjdbd/wW5kIBNAWvjE9s9/W7mwpypp6jl9HsctXxsiWuP8YfV4qTXF
	YTJOQAlUGZwOjBO8Cn1eK8rh3B01epMpvCU2eHmvPctEUZz8jWFYBrXcowi1OvCrSXqPonAkrz2
	8P9SsIYRsd0ALU4E5aYFGgOCz+ZN5hWvK4DEQlvRzUq8FRRd/X6Lz9/yW8i1yCK3tusIDY+mimD
	2CattKFBhuIXUJSKm1ewN5C4znxAwZZA89YIj5UeRcZJMa1Mdzj5N7nmsvCr0OxYTvxrMuu2PfS
	avygWKFOarDHZ+Nv/aUx6kQFDLyvnA1jeaPonhDBwlNOZl7+nWb8QOl/afasQXU+x0IO/hotzVn
	/YiQvMFeCa7bI9ZddYAp1iEa3rU9nw8x7hP/r4J+st1CLB7pHQ7+wMUYX9yWpIgEJwNs4BBfCI1
	seQ4F9HL2tfn9HQdNk/P8VUWG5mD+EHsRhYH+5qbhIUffUkyyJ3IVTWLhKFa8zfNMZeV6O8TBF4
	ikqH73lcCo=
X-Received: by 2002:a17:90b:3985:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-39e1e5b05c4mr3774510a91.6.1789564346731;
        Wed, 16 Sep 2026 06:12:26 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:12:25 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/4] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Wed, 16 Sep 2026 18:41:25 +0530
Message-Id: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=1796;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
 b=2ye56ypaFgSH7USqMbWUuVvBf/TDHcEaDTrhnaB8zVgFJwMnkcAVhyAStEA2IYP3R4D0er4WJ
 4KsDh6SANL/Bmvb3BCoGm4UqBId3woAO+8sopOPJOkUBNAh96A5cHV2
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


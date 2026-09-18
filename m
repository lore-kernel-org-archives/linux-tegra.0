Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490514B95B3
	for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 21:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765309; cv=none; b=a3yrIt5M1adzDw9g+7ch3BpFe5+KTYCKtlCR3U3NLeox3bVCMQfW8phpt8cCBhW5WfUAdFFgY7n1QHGxU6MpGFIpyoYC35jdy3lPRBXjQ51iKRpvwyu17BMIYb4oZ8h2Tv6bylfy7fVb0LbBvJVbGCLNVULZ0FL+SWq9M/uGwSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765309; c=relaxed/simple;
	bh=ZRyjLwuWb+X9g9IpWHeNCy8T/E28/fkf3KvfcIaopTA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ix8raSD4VVCCOpxGH5piXezxQnWE8o3AEnx3Z/2rmfuUPpFQBJLvlhe8PbEUGtV1LOgRGjDdV+JAeeptty6hhNKwr37Wr3Dcx3XBQFidExpJVaVC2Yw/mWZk8r1p4BvcqN1On8DfSF4rOFSNtloKMBk7pNJl4s616czr2sI/2VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhH/Ekct; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhH/Ekct"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1e1b51234so142143a12.3
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 14:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765307; x=1790370107; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3WiUysQa48NgmiHeWEdLUhz2qNirMR0WRXFvV2RF1mM=;
        b=KhH/EkctWCwnfuKjXN5sOERAtumcLoyJ3tl/SOjDZYNucM3AlsMs89aRMyazJJClKe
         G5L6XzFGF6l+eL0PYvxroOBxx4iKIFV0Ob30ZtwY6r1Ck34wJdSwLWaTVZi9FSoGo+tv
         jV7YHr9wQvchsWv2m0zYJl+1nq3Ej+g7NBz5mnnqB+k+h693CW1RSssEZYBUnhpv+ZZk
         fjAEiSgsX59vdxvJuMd22hh108i6jZGX9aI57mPLxH+Gm5QDXuGx1dCyb21XF4lnytYP
         XbBDcF6odtcdfFUSC1BISMH8pF8xjvTAsGoRJSLHEzXv5jYoZ0zh1nuBkFuALEWObebb
         CI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765307; x=1790370107;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3WiUysQa48NgmiHeWEdLUhz2qNirMR0WRXFvV2RF1mM=;
        b=XTPNEvU5emjmRIA6vT/tc3+QXy3MxmjZhGoAMVqaYGZHWbFLt6tpUd0bxWv0B6e8qu
         zcBWymqmXbWVGmyY2ZG+hSNLgIaeCIhBTJKYcRKptMc+pN9RJqUVytwPq9fGZa4iO4UC
         VNai72I3iNBt+TKWMEHIluR8NU5jw71ipqV7rLKiMh5ZaoIuRkNb5YAwe7s9X/KTBiyb
         Gq3oxtaCb3C4QQfkyPe5AnljhfhUbw321ZBTgMGQxJ2rFJfaGtMx5Ar8dMTYoliWK46B
         oTC8sbowFY6KoZsPViCgBurhO/4BUY8E1E+fGUwXkMaljg60bTbxuQnf3in1Ym99L9yx
         zKbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWZrSMRE5DwgSH3nTTw05T+MNoT4eE2OjakrVIzcwUXEsJH1AO0GHSioW2ge0BhoozG5Th10w+in4m0w==@vger.kernel.org
X-Gm-Message-State: AFuF++kXqinSJK6ldJlUwJE4p8kb2YPpqLjfYD574E233BpAZT10b60G
	642QW3Q9mTg3SRlEEv2acu/Dn6V0fl+C9z+hkDYKQPELX2DQR/0uwZFd
X-Gm-Gg: AYBFou1/H8U/JCjrj2SdDjHud9e4kk2gkf+y+AwBqBTc3a70a3jiPjRlhhIh0fJdLt3
	Q+VA5bY5QA8SKPRSwXnVHBRgW82Legooe7Ld5QMiGGef/Spt2ShdjSgnodpzI0CsNwSPgGKnGbJ
	g9b+s8qICixiFQkcVsfflqoPGV3rJMtG+QwYLkt++2+uM39IRuAWnYP0QLgdX+iuWCmFKpEdjc/
	MmEs34zccqYX4uN9ap0KHqZSp9WUQAQXgUGtGg3w83LzjMifewg+HOa68HdFcxj2Hy7RTldg3gL
	VvQKTlKvPKu5gf6fkzwsUYg9rqIfEAjwm9fNaAWMY5cVZ8N2rdLy6/zJbt/LwzlAzNJzebo20go
	Zob1aN47ejsW7I3qHFOIyiONBblgcZJ8WTeQITMcD/8tdMNf/4gKvmnsEhF87h9q781r/N8b41q
	LlXx4G9tuoZYq4m78hYjnY07s7FXC9E5+PjS9YQwRWH+Unn0e27QMejfyh1fTXBPlcFEVFR+3Dr
	40sfqcF
X-Received: by 2002:a17:90a:609:b0:39e:b778:2b3a with SMTP id 98e67ed59e1d1-39eb7786460mr468341a91.6.1789765307417;
        Fri, 18 Sep 2026 14:01:47 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:01:46 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/4] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Sat, 19 Sep 2026 02:31:21 +0530
Message-Id: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNyw6CMBQFf4V0bQ33Ugq48j+MC1paqJFH2tpgC
 P8uxRh1OcmZOQtxyhrlyClZiFXBODMOG2SHhMiuHlpFTbMxwRR5WiJQb6ifHM9LPlORM1UAQAW
 FJJsxWaXNvNcu1ze7h7gp6WMiLjrj/Gif+12AuPuU8a8cgAKtMikYFxkKLM5tX5v7UY49ieWAX
 7cC/u8iTakGlLrRgjEuf911XV+ofasx9AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=1955;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=ZRyjLwuWb+X9g9IpWHeNCy8T/E28/fkf3KvfcIaopTA=;
 b=pDWSttThJKmSFzcPLOWIIcnuPe6VgcSiNvLmer69KwJPqMHHUZ5ptr/3bl0iXCSPyu84XHxru
 iuqZob+NJ0TBIt47S6zvpR7aVJgVPcmTD2rBdOtTLbQf/sqkllZYKhf
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
Bhargav Joshi (4):
      dt-bindings: mfd: ti,tps65910: Add wakeup-source and GPIO hogs
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema
      regulator: dt-bindings: ti,tps6586x: Convert to DT schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       |  20 ++-
 .../regulator/maxim,max77620-regulator.yaml        |   5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt |  65 -------
 .../nvidia,tegra-regulators-coupling.yaml          |  74 ++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |   1 +
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 7 files changed, 292 insertions(+), 204 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav


Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14208472F9A
	for <linux-tegra@vger.kernel.org>; Wed, 23 Sep 2026 22:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201044; cv=none; b=R95g/Qha4dR5nN7Qcv7UdnwBEidZ3GlGrSa9WvDxQkigFWdklbgRQNrdAxUauQ8vMmRrhfxfuOSgk4wJL5Nb2QTwD4uA5hwIRDl70nr5PkbzqkWAMDbALlp74UUoUe79yiMOK0yDk2w07QH9BQwP8Pjnyvh5nNdhutQZgFahz9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201044; c=relaxed/simple;
	bh=XYWu9x6hbf4E5RXhwpVrlV5tcStGDII4x4irJ8rJ/EE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PB7y08vt7HL3XSK36XTwZ15Z4RkeoBZ1JzlzP6kulifIxMpVVK1uV/0bDU1i6mI5+BogdduwPCf24EkIui1lfRQCGyS7/Hcg4lkb92Fd4hZ3wQu1R+rP8/8X9tBVTo1WfPDHZb8mAotu1WXOp43Kw0w0Uq6uIuh2RaFCs/rVxDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNXWdi49; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNXWdi49"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-339795849f6so335295eec.1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Sep 2026 15:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790201042; x=1790805842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fh/HcB1NxrAKhTVrmSl2V1/xU2WUlyCi2XiJkw/1lm4=;
        b=BNXWdi49PDhslYHV0UWkY3qmxM0yqvv/SS7QhqjiBELlj0W8cDNKCcd6YAIQ+s2aOY
         AMW5oqMbmTeTiLYgG3+HoJRl6lYmCpKAfL2uzzq21mo2zsPzZPdtTlpBzi/qpLMQAnIE
         ousHIBgo5TSLr9ohroxcriBQhP9Tlf/sQHeMX24bDsQvZg0Tn79bEskByTqQtgc6Qkbr
         whxKePvAXPOaZ99YbUdlUpme8tnonT/rUAEUjCAeygqjgLyL/6P006TqjDRcS8LEQ0ZE
         z4fEvQm0ODr84SwBBa05XfFMfFbuyBWp3tyPexLgP2IA7Bd/VpVNlHcscUYi/KGKfi5E
         ADPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201042; x=1790805842;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fh/HcB1NxrAKhTVrmSl2V1/xU2WUlyCi2XiJkw/1lm4=;
        b=1eyURVMIxK/RKA0I4DqANZu6MhomnEuesvBAsQ/YpASQiNXFxmLoGZYj1s6LWgaXSn
         lHLtcgePSDJwqJK1BGK6Q1gFs9ineK8EtbI2kGX8ogRhswbREGOY182KzzgLZaVtEk7y
         rA9TyIuEtMYKh8pJW7VPsqgIelOnf5wcQoKR48irMoMGjhVzVIWNKXwhUbb+eo4aVFra
         9A1W2fkxUPWVNYGmHcSSdthaBbF1eCszHzGHa2vVsUV25WCBLdl7EqX1T8ojrrpZciVj
         mfbnHQMmhOO30nmG9c2yi1uJ2gCsbXCFY2A83VoSzrdBUrdwXjr6I1qEcv7DHFVmU7HH
         XEDg==
X-Forwarded-Encrypted: i=1; AKwUvBw+r4hlpV7qduP2mJwH0qYfvD8yI9p7+ww383QV3KihxF4fY3GvoHFiIGjVQpjYj7xVKmbxBPv6GeiuGg==@vger.kernel.org
X-Gm-Message-State: AFuF++l+anO1LA2oohHJfUSpNkjycFNV7dfl8/+BBPwoAcybx46fRF03
	YX0Bdg9p9JZw6Qk80R2XFCn/33+Rfqif8C9HAK6eqP451N3wxwmATPxj
X-Gm-Gg: AYBFou3p7HGNxf0Pw7QPyjNPWTjUZEl+dNv8uuzCWDe6K7MK5bvfIi4/G6rzf07Ubu0
	ScaodqIm7V1X6kOEtCQ/v+Ya5PQv8Vr4V9vRZYzN+Tncpt4TFUiMNuUIdVnF3pIttviZ7jU8vRK
	fLwu8RQgJ+PBrMwWwSicQ4Wn/aFnq/T1eVw2VFvj9jukA4tKbEmwg6l5BnOfe4qRmM1F0YcSHUU
	WPgrbGJQ9gs2rzJ0FoHEMX4EtaXF/Vs7NN29+pQPFm5/fSuPjciEyJnmlV/E70WipkQeWK+SD/z
	CGlZdx0Cg8KenQmdKFGUZb3l1CR+aph/O76us0gCc7uHdZ88k94gRtKl8DB7qMUUXWBV3dRwVN5
	HR+JD4tva27mS8IZpVWmZ7ksdy9juMcXAiadpQHpcaCqnZLsXltOwUZsFjjNo99IRFmx3kZqPlQ
	czk+L0yQuCNn2pyAIwayZJQkhkhOYjlu5C3e+5h2id26HqlxKFEhd4Mbfqa+N3doPCaGMFLSx9B
	0OZ1vY=
X-Received: by 2002:a05:7301:c017:b0:33b:e1f2:fa0d with SMTP id 5a478bee46e88-340032c70f4mr570866eec.2.1790201041985;
        Wed, 23 Sep 2026 15:04:01 -0700 (PDT)
Received: from [10.197.48.252] ([2409:40c2:5047:8a3f:9ef:734:1515:aac8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm7962458eec.8.2026.09.23.15.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:04:01 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/2] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Thu, 24 Sep 2026 03:33:29 +0530
Message-Id: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13NTQ6CMBCG4auQrq1hpqWAK+9hXNA/qFEgFBsM4
 e4Cxgguv2Sed0biTeeMJ6doJJ0Jzrumngc/RERVRV0a6vS8CcYo4gyB9o72rRdJJgYqE25SAMg
 hVWQWbWesG9ba5frZ/ilvRvVLYrmonO+b7rW+C7Dcfcu4KwegQHOmJBeSocT0XD4Kdz+q5kGWc
 sCfzUHsLdKYWkBltZWcC/Vv2dbme8tmK5jWyGPLRca3dpqmN8jpxUgwAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790201024; l=1889;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=XYWu9x6hbf4E5RXhwpVrlV5tcStGDII4x4irJ8rJ/EE=;
 b=EKEgcgmUWan6pVhjGd6mHholRHJ1cdAWwsrhcztq4uuwyQmAoTn2FJwVEw5A6qJg/uyHilqap
 ptwgibKv3dLA8L/kGcrhqZ5z892dPq4Hc7FN21w999t/w1Mq38LpS/b
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
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 -------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 74 ++++++++++++++++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 5 files changed, 88 insertions(+), 69 deletions(-)
---
base-commit: 05a3330f490cfa266831c0fc7f8c6df942866d59
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav


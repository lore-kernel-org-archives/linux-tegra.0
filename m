Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E470520B7EE;
	Wed, 27 Aug 2025 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294675; cv=none; b=YXYjCFkg3nW8x6LlkmE7ELE8rhCpbOfhaEVMPR07UawxGtZQVbYQ1Qe+PHgoAEyKvOthxyiZqkp7AdMJAZgDA/+FUD6cSUv6ppkXm1TY448aw1dniXQl8/69AphoSLO3Sa3EMK7/oZuajnD4G9NTxolDktZAK0RQdLcfJsXR4Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294675; c=relaxed/simple;
	bh=TI1ysOXPP4hVMHn60o6TUG3RYzs3fDZDuOhKElmj1NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G88QSRJRMtFlFMNGzZTmoJCRdELQJR3dHJHnlVXdSd9JEiOh3bum8kO14RuWbkaLUef6RURz8npKtPNikVob17pTrWK7dLjmWXUshz9Q5PayyB7yvBgk3swQk1c+yL+8IOLMd+5L+V6ASxcOKORS+2GdtrH6EIy+S/5Prd/fG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GL7w5nlP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL7w5nlP"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78ead12so937392066b.1;
        Wed, 27 Aug 2025 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756294672; x=1756899472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0TL/ekeJOQg26wztgmTDgEuvDo0zmkivmyNIAbPqQQ=;
        b=GL7w5nlPUIdbA8H4Z9LvljoS05tAmolNg9FdLTQb5LUMcCPno5uq1Q6cLkrzTlsKCA
         27wIYt4wmapobS5a0riCF+vqRS4VAGrF7KMStix/Yd1eQLPz8za8Es02GVuLpbN/f5Ex
         H4iy1XBPjyLn0vYbJa1Mz59nkEEPcWSIIy+hOLPZ1SypsDBC825/P5FJlKoEGkUcsUdj
         jrnomwyzX4bmpD3SioD8MY+NP7zjZAFzrdOEBhE9MKcNuc+qVP2NmG3h3+EYG0WXa5QF
         kR+erzbaniWgVRDIIx1up8+Y8SDjwL/y61/Du/TFgk+TUz0Nu8WGjV6rhZhllSj2jgtV
         gt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294672; x=1756899472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0TL/ekeJOQg26wztgmTDgEuvDo0zmkivmyNIAbPqQQ=;
        b=qvIAp0YimWE/al0L9l08nVGUuuNQvEJ6WLQadjFPQALIloHHom8xs+9WVDgF+IM8V6
         N+DB9Et92ehpgI0MJy//s7DKQhb0B4/NhvN5anPzTXQ/oPR1I+Demcj+YG/yl5+nvjPo
         T1GhIwJEZxbzqxYSnHQ6dA1qEEvLND2FvV6aYKzkw1GVb3Q3CHgI1XMKV0n25y1DX/I7
         l/NlzrCfE5bP3C+ahc8uisD7U0T30nNITGGU+Y/Zvv11nwEpiMwAlFq+B9hGGOkmD3R2
         DXt3BY/B32aRRS4Za1tCWgl5edwIjvFs3FMHQsrnXH+Eg799Gl2hNuTV0lpeozpAiXIA
         B+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWWsrHVRjSnx2tSKDXjUuhnL+yy9c2Z/xU+aM4YPaa8on5SGVOPUYudSmNSS4r/+1gHrXIQ0dV1ezWADA=@vger.kernel.org, AJvYcCWU51tX8JeEx34nhGM2rdftAaq6ENTU3brrFg26IV8uoGOSJFTtXXWjxGrWlIn7OVkcmj07EIq0S6KqaBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Gdh8Zoyvs57em/VBL/V3RonoE7qu9oTimbdCfC/ldA6uD9iE
	pbFsJKmk/BOMb1Qy/y0JWEFyHp/bCGpHJTH9sl5ThD+mAMIKM6E10HL4
X-Gm-Gg: ASbGnctqV0sZyQDRHtLAHHobW1aEkFKrX7oQl1t05XRJDUrbNIcFCGpo5KRwCQu8QKE
	a25jZKaw50lCeqw+5gmWCel687nY/XLEIikRyNlZ217chu1EgoAjsP0xsyO0wHrpB+IK7oibQ59
	w47MNDxUzxPXUsqO1kaskChjiKxHnmSXfX83V7+6IZ/u59k410WXkeNWsIZOyDe99zwDixgS3FI
	My/brl/mf2vf5lUkYfwZJOBTWI8sVLfwt43WTMpTMHBMP+8YzewMJ3NMPGB6ef7xnd/2o+cCwSX
	fsd3MBqOVG3DNVjVEPi+XvsyqErK5JmuaKk6Va2CXc+6sQcgKY524UXBaTzv2hlGfLwF/Ejbw2Z
	HpgslGEgp582p4lle/glCvo/ngk+yeuGqAxc=
X-Google-Smtp-Source: AGHT+IEHKp7wptHFcLrBt3UnI/jHvsdzwxscNBgxQZxapqmiUONBatuiJfqrhX7xGiGufIrkshgtCw==
X-Received: by 2002:a17:906:f5a7:b0:afe:ad45:acf5 with SMTP id a640c23a62f3a-afead45ad78mr436922466b.34.1756294671995;
        Wed, 27 Aug 2025 04:37:51 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7aad5d61sm675607866b.105.2025.08.27.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:37:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] ARM: tegra: complete Tegra 4 and Tegra K1 device trees
Date: Wed, 27 Aug 2025 14:37:30 +0300
Message-ID: <20250827113734.52162-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete T114 and T124 device trees.

---
Changes in v5:
- dropped clock and reset names from TSEC schema
- removed clock and reset names from device nodes

Changes in v4:
- configured tsec schema to cover Tegra210 TSEC as well
- added required to tsec schema
- reset-names preserved for consistency with other host1x devices and align with T210
- added clock-names to align with T210
- operating-points-v2 check https://lore.kernel.org/lkml/20230119131033.117324-1-krzysztof.kozlowski@linaro.org/

Changes in v3:
- added tsec description
- swapped compatible back to use enum
- clock and reset description dropped, added maxItems: 1
- reset-names preserved for consistency with other host1x devices
- dropped interconnects and interconnect-names
- dropped isp nodename
- dropped multiple rest names for mpe/msenc
- dropped tegra114 msenc example
- fixed reset name in second isp in t124 dtsi

Changes in v2:
- dropped accepted commits
- added EPP, MPE and ISP compatibility for T114 and T124
- added TSEC schema
---

Svyatoslav Ryhel (4):
  dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for
    Tegra114+
  ARM: tegra114: add missing HOST1X device nodes
  ARM: tegra124: add missing HOST1X device nodes
  arm64: tegra210: drop redundant clock and reset names from TSEC node

 .../display/tegra/nvidia,tegra114-tsec.yaml   | 68 +++++++++++++++++++
 .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
 .../display/tegra/nvidia,tegra20-isp.yaml     | 15 ++--
 .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
 arch/arm/boot/dts/nvidia/tegra114.dtsi        | 64 +++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi        | 64 +++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  2 -
 7 files changed, 230 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml

-- 
2.48.1


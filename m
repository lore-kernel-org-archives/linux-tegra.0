Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E562AD2C;
	Sun,  4 May 2025 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746350628; cv=none; b=gWorBANkKNZayoxJ/oTDo9VDA5Z4HB1tYclRkvTpeOLj9hNHlC84xNE7tQ9iE8M1S48ywlfYawpquoVLXo4zh08m8yOp9pz5+92Yk/5xPUJeLz43M28+QBZp9K27Q6bcmyQgOzWvuAIHJxoiN4fD3Zm4MENq1TzBogxHeLgyo90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746350628; c=relaxed/simple;
	bh=Z/wLesU/upHvvAffQRHDs/tfmsS89ObVZ7/4iwPs8us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXmdsZdoGQ/Tm1KuAYi6lJdd47euz8cjaOwK99pa6Cux8cf8+yurZSnP2FOsjTy/fg80WCX+1DIszQEAHCvH+Por2SDaTWAajQx2epPyCsROowlyNE3/vo5fz0j/rnAzhz3UmOW3CEwtFyDa2wx4hzunagdU/iCoEGfluZOTpRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiWe0fku; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiWe0fku"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acbb48bad09so624799366b.0;
        Sun, 04 May 2025 02:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746350625; x=1746955425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wukg0Qpk7AR1GIRYF/LwuQcmAOnY6o+ntzPPoaejwTg=;
        b=iiWe0fku0xSkn1FJgtcpf6ekgOrF5l840tCs0YdhCmFOOXtu/sFFbKxydbnWpyRlVZ
         2dsAvOS25TTzQhKkCpSIFmt9/M5EOCHoSftfzl3a3k+gsmkGd47jrFcG3Sdb9Doguht/
         q7SVfIoUrG9N8+eZPWlaWrwhVw+4pmBB5Tg9Ete6gprg4fydhL8zfS9gEOIVgZvS4tJk
         3fCedyPJfHJ4Ups1E0f2bChfu+avjIxJHZQaHsZyqpbS8CdvGfmBVMmVYckens8NRDvL
         77PAeh5USljhwuSEMB7CPTtWAIMOzg9u0dD8oWkPi6WVfbo9K6DAu59jbFZ/Jn4N/Bpd
         UoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746350625; x=1746955425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wukg0Qpk7AR1GIRYF/LwuQcmAOnY6o+ntzPPoaejwTg=;
        b=Gq7ffPBLepW83WcUJI6UsuBeaJsALqK1R8fPaIfBKdyCVKuEENbGrgQxLco+GJ7QkK
         AsY/0nemB8tuM8wpUG+TMZgf3d0Qkrp2KBZFSWmH2cTfwsC7ObXu0dbEK4+/nw36erWM
         yjZpPP2CHG7rUYRLLrgHmSre5V1dPUWXJ5Z7nFKaBqmuKuX+BpxWjS7QlgymZlZFLJ8V
         9CnpGZQLQRbNg08Q0+BxUQE+LXiysyZJlKxrBlLBVP+ty4ERBEqMZDTp+Q3CXXbqFfGX
         lDuAmUDgBfRC0ymGa9lYRlwjvkZ1gzDFsXB89lNLiB402UfFQKaR/jWHxqgpl+cmY0C1
         9eww==
X-Forwarded-Encrypted: i=1; AJvYcCW203hHeQ+RkopOymnQ/ekiRwuSir+0WGuoHY5EgKcOrWiz8jpC21oMJqyLAUqQYKZroFt1BkcHt74yS1k=@vger.kernel.org, AJvYcCXU0PjNAlfRcXIGCLt+pKCVtCSIYI35WqUcd6NXHwDB8qKeMXZV5vprme6SUL2qpPBZ0Jn/MkGNjDgRG8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDRHYVoWdTafXSL6dQog4m0ZbPlFwJgohZC4tSoOkbwNLavrNG
	z7p8Hn4HfDhrZm9wrP0PdMcDPGu3amJkXAGu8/MAzQJRRHerPGDm
X-Gm-Gg: ASbGncsZRzUYMWIoHnk9OjyHGrttF34/+gUT6M5OzZT14FQ5A2KMiaIgJQULwTfDWFg
	nAjjam3eNwXZCmTlywcxZndHNOG5STqo4vEWVbyg1tMFzIzUHmzCj3FVVyDTWOJFwRDluXA2ys2
	zgBOyckTA2cleAR+acnvH1197TM/MLyZ1O6j6HgzbBus3xauv23vxCgjwCNsqwDJuFS1E4dmTgO
	0Y03L7dpVrve3vt84zayWahcdkW/sLtvqwUGkd/Tc8v3XrgiXq0PigTojKNfYmMb74IDlCqtcly
	0x1jINlPcXnSBg2y/ocVmtlClAumWv4R
X-Google-Smtp-Source: AGHT+IHQl2DxfmN1ppv6Ja7k7ndh6ZBKscKyu0r+/1iqiYGyo98UWkzsNTwLN5NeQ1pDTaoW4y3YfA==
X-Received: by 2002:a17:906:9c94:b0:ace:bead:5ee1 with SMTP id a640c23a62f3a-ad1a4a8d3bcmr259923466b.42.1746350625206;
        Sun, 04 May 2025 02:23:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a26bdsm306050266b.43.2025.05.04.02.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 02:23:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] ARM: tegra: complete Tegra 4 and Tegra K1 device trees
Date: Sun,  4 May 2025 12:23:21 +0300
Message-ID: <20250504092324.10802-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (3):
  dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for
    Tegra114+
  ARM: tegra114: complete HOST1X devices binding
  ARM: tegra124: complete HOST1X devices binding

 .../display/tegra/nvidia,tegra114-tsec.yaml   | 79 +++++++++++++++++++
 .../display/tegra/nvidia,tegra20-epp.yaml     | 14 +++-
 .../display/tegra/nvidia,tegra20-isp.yaml     | 15 +++-
 .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
 arch/arm/boot/dts/nvidia/tegra114.dtsi        | 65 +++++++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi        | 65 +++++++++++++++
 6 files changed, 243 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml

-- 
2.48.1


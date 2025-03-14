Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D1913C689;
	Fri, 14 Mar 2025 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741938405; cv=none; b=DCM1TcWbWyO1jsYlLyPOoM0OzgiCBx5dVW41HYNr1S/2YNyT20aiqukj6t248KDARMEPeLU4XOgnXZUcnAM3J3I9LTq41gSqfh+po19iP+RHOBHL5GsUKK0VgvzfDYDC6zq8lt/AbblZJBxQTC4AvBi9ay15Ys6HDssoY9VgztY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741938405; c=relaxed/simple;
	bh=s1fKh0QzGWDUZFeScnFKkL845yv38DEziSQnsNzrPH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rsN8uqqc1IeqXwfvoEbITxroH2Tx0X/1jwK4AsCNMrlP+OE+Es0qsakM4H4WYi6UGcnaPKg9YoizBSxZeDh5cSK5EtE6D2lCe8613AteIBFqBU5PMK6jvSSAJwJW418c+5CPydKiv2fFlivKk8GaONc97LCy+Y/xQnC7TQHx1vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAS5MbTo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAS5MbTo"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so2996828a12.2;
        Fri, 14 Mar 2025 00:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741938401; x=1742543201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvzOU4qdVCwUGw0rRb6hsvttK6x5TtFV/+WpulAfuC0=;
        b=iAS5MbTohE3ydvPQRvRIYwd3uzdmjNNif0QmNZz5POwcNGEy+xHfsqhxwdfkNuq98i
         4LBVqPGb5tZePy15Pwuy+l7HIUPiP+q2wWHzwqd/uXdtHWFGqkZog8HmscHuF9yq0XXr
         ohm3f351BgRbqO4ySKggz6J1iP6N2k9K1s3IOBWsxs54JrD/Tz3ojV2iXTy6FOm6LCyb
         X+7hjmyjXE5WeVp2twok4WSC6CQfUeZhMngLEzBNoPPR3ok6s/Xy6Rgh2bbgJUcIrZ4c
         0/GVK+WTKrufv+BmR3Yyaii4graoMmQmN9zIqQsqzFXapW1tesKzvksj+enowqzqY9Dp
         mzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741938401; x=1742543201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvzOU4qdVCwUGw0rRb6hsvttK6x5TtFV/+WpulAfuC0=;
        b=RK2nyyabCZ3MitEJna9h4r70ZFloyJzIG1AyC6ceVzfqFA9CjqrGc11ww6o8t0/JMo
         Kxg4Vh0qArgso2Z9cQFuPURh9wmAylxeheGWNbUXRtQH2wpy2mC6653wwcsSuQAaLmIJ
         BLzP53rH7hh/MTnzz1pmgrbvsx0FjGOPV6ONJYLmmBjEw2mK9Ia66l3NPA+Mgsd5AU8H
         jCz4NWeiydkqMjkwXzFXXx1uRDnmrvAoxjp+QI7dGF2uQFFU5CIn3i9NOaA6GQAfLGPR
         Bwo91GuSzjLj5pLXYa08TWiFURkDDzbNFC+QnQ3VDKI7yl5mrnkunDlJhN6jEyVHeDrL
         Io7w==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7nl6xjl8k4hXpOjCGfROxIdj2woo+HiE1JlMgTYNdGrp/PpR5myhdbeulPWC63nCrSklxBvhchzWtV4=@vger.kernel.org, AJvYcCWi+gSbLce8pocKeRXRbmJlnZX9kuj50ULjqMe0pLZskbf+J/TlGjR94dgczWATmqHoHj5XKzbfJNIKR9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaB5oAwLxn+Vj+YAmH/muG33HLyfa+RHMB3JrRBjDd9V/8pMRU
	E0RYjHbquh4Fp8qvr2a/vQi6GWWSFamZ7AUJWwnLbcHDtyMd0UBH4EZPcg==
X-Gm-Gg: ASbGncsAzwKtaMMRDwlHhbPWZbsuD58vsvyJ+zbuPHWLF6caeUSHbvHtOleJQsDnK3X
	YOLFdkK+fT58t5w7JcbtdPEVF/ZxunEkZl5B6JhxVJWMl5IROQ+abkJSSZ+C/nSW5aiX+zgDk9m
	of82fR8qslihybGRq4uWMjWIwIQU2er5qbW6GIyFGA4QXpe5d0YB+kl+Bwa2dVd48j6RKEps64C
	5oI/vAk/i9or3V3ZNXmWnFqpznV/vt/HTyXnnt1k+AXxhtES7O8aTQnw/x1Vn6rRtYrM8PSptuR
	pO2UoNQkD91PGynMY0Xrv6ESFd2Gt1ZEjlvNbUIMcadnYkc=
X-Google-Smtp-Source: AGHT+IFNzKmoZKbuyzfNye/dsgQjPtY7LefesNA6de/i8ygbI+kuPY5BO441ozpXqh/ibh11MA6rtw==
X-Received: by 2002:a17:907:9487:b0:ac3:1376:465b with SMTP id a640c23a62f3a-ac3301e1e21mr143402066b.4.1741938401154;
        Fri, 14 Mar 2025 00:46:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9bce7sm185498666b.164.2025.03.14.00.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 00:46:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] ARM: tegra: complete Tegra 4 and Tegra K1 device trees
Date: Fri, 14 Mar 2025 09:45:54 +0200
Message-ID: <20250314074557.16367-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete T114 and T124 device trees.

---
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
    Tegra114 and Tegra124
  ARM: tegra114: complete HOST1X devices binding
  ARM: tegra124: complete HOST1X devices binding

 .../display/tegra/nvidia,tegra114-tsec.yaml   | 66 +++++++++++++++++++
 .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
 .../display/tegra/nvidia,tegra20-isp.yaml     | 14 ++--
 .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
 arch/arm/boot/dts/nvidia/tegra114.dtsi        | 65 ++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi        | 65 ++++++++++++++++++
 6 files changed, 229 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml

-- 
2.43.0


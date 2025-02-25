Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9EB26F476;
	Tue, 25 Feb 2025 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494130; cv=none; b=RXQcbJTHZSpFSjkx1TI49Lb8vVRnhfV1EgB9jnO7LgqlYvH5yh1McpEjy8U1CR7bblkydLE8TuqB68hCNZxhD4k8u9EC0IpbW1jGwnbIrsTU/eH3gNcl8JnOvUf316P1zC3ESzAIJkTFMDbbQv68pvq7uMBS/18wjHHhXsqPjyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494130; c=relaxed/simple;
	bh=YfEJJxOaE1bubUz8y+eeOayZ+HoMY9iGQM+S0HF15ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxYV/3qQt8yW/pgoTlsNeJno5URDbAXCj3mH+OvbxrNZUUOqH8pbhmG0zqIEpVMavkXjXdiLWZjtTnhWLilfcstLSMbBBvawUN5nQ73nmbLXC52k6scPj0pJT/TewfpxmqU7q24RLq/MAPvcguGdf4+4aotm4GCjMDc6XtRARYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbxXeH8m; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbxXeH8m"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so10210669a12.0;
        Tue, 25 Feb 2025 06:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494127; x=1741098927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+MhurcEaBGY4o3NzbZONDtgfllk1+j/+ZQ6IGQegIz0=;
        b=gbxXeH8mg6BZ86S7U+FWMgZDQpivmfTC4skmRMEyHAeg/G41a9sFh55pGv9dCdosiN
         LrWqpAnHs45KComB0JOkIZe21SCwzckU3SGsaLN2W5ygpPFkTW53n1YH8vPiJHNH4Ziq
         Ak9pbi8t/ImvO/Ugu4bGtzRnAjrxbTxbHRwLApGWs7N9SyiDq1RQsf7t4SqqtebtjUYJ
         MbPbGd7AOkHWwBTixscILD63TBOOFB2BlVgCBkgrNFiOrQCOpTuEVgzq1ozvE64a1Raf
         YMY/M0fAewAqBffdlXcoH89aVrOXO3B4wZfXi6JvMSGTKkUB8wNqLyLr5qeEeYxdo7t5
         9qUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494127; x=1741098927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MhurcEaBGY4o3NzbZONDtgfllk1+j/+ZQ6IGQegIz0=;
        b=aLgoH+gR+JERPupfqqIpi+X+W+qhxkBkVN7W46qo3jBNLUCINQz0wM9pX9vZrYXbOn
         WTolr4TRBxQAcwZxdrRTC9XyE0adEipM8K1rSgNKAacc9NEuZJOR0Ro5Q8x6KrKvjMjM
         lLrQ1ClMwgRhvIoPk8PtK5I+5bDpNt7R66jJE1Dc1Nh+IBSrcP5zclGev28Oiq2KCEbz
         yLpjP8R3rnY2MkVnhEcAFyC+olB/EJITSP8ufrN8jNfyVb7kPONKgYJejsOyHMI4Hb/u
         k6zryQRnjftW1s20OeWZcLu3hAg6nqS5UiOLT5eyex8dFeOCqnZkQ1p7dkY7UqhXOtsO
         W+AA==
X-Forwarded-Encrypted: i=1; AJvYcCVArG141V0zYByksPZIIqCNDMtHED1PYc/P2IIFvCqOrgnjoVBXi8w70m2AVfWm62rql3o9vfK9yFgSBko=@vger.kernel.org, AJvYcCW1AMeUEHCg/SktN5w3St7ZlHQ52FzYtt87uOAvwEWsClku/vlhI0J+u9MMmzbzabV8+BVRgtpI4vl9@vger.kernel.org, AJvYcCX7k5GVpk7Acab1U3HMuwZPa2Pu6GA2Mhz/FtIuRUQX4fZIlVum8cP+wDSU+Y3OksQSTyb89jBoGgZN@vger.kernel.org
X-Gm-Message-State: AOJu0YwX1xmzY0akhtfIEi+AW2mkDhJ/uhjjVD9mZiUvXxhwhBYq01Tq
	u78h7lrfUs3xDkxfWvoDPmjuniR8uB4Yx5qIrpPiAiyQDfogd6uW
X-Gm-Gg: ASbGncvPfGPJxCeKyxx2D5fjDYWY4xTYmQPzpmtL/vcfvvzt79SFLq/pvg8jjAIdVCO
	TvJLFreafNsY95SAAjLvgY8PnWWqG8bgi2gspd6IGQ2+mZW0LsHfdhsFhZ0bZAUnHF1m2nz6xtW
	A2kEZXqCCuiqAgigIddEtZ+jU2Dn9uT04zYf4YaX/cjKe13OlqfnhesOch89C96eyWiYcOduRMZ
	/EIXA0V3al4CHzL0wbWkfit62vq0Y9KApCMAv5emJ+8A3sLETmr5vMkEj31NC7Nv7W/WqCVj6Io
	piEWS7jqEeyCMX6eBg==
X-Google-Smtp-Source: AGHT+IHMUYvZiaDlxxq0smJOgsYCOC14lv21ltA6f7PMPOKxPMVhcSvf8pMZ64RMIvmRtNh7xn3HLA==
X-Received: by 2002:a05:6402:2354:b0:5de:dd44:929e with SMTP id 4fb4d7f45d1cf-5e0b724438dmr13910661a12.21.1740494127006;
        Tue, 25 Feb 2025 06:35:27 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8629sm1298750a12.59.2025.02.25.06.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:35:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 0/9] Tegra114: implement EMC support
Date: Tue, 25 Feb 2025 16:34:52 +0200
Message-ID: <20250225143501.68966-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for External Memory Controller found in Tegra 4 SoC along
with adjustments required for it to work properly.

Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine.

Svyatoslav Ryhel (9):
  ARM: tegra: Add ACTMON support on Tegra114
  dt-bindings: memory: Document Tegra114 Memory Controller
  drivers: memory: tegra: implement EMEM regs and ICC ops for T114
  dt-bindings: memory: tegra114: Add memory client IDs
  clk: tegra114: remove emc to mc clock mux
  dt-bindings: memory: Document Tegra114 External Memory Controller
  memory: tegra: Add Tegra114 EMC driver
  ARM: tegra: Add External Memory Controller node on Tegra114
  ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
    device-tree nodes

 .../nvidia,tegra114-emc.yaml                  |  431 +++++
 .../nvidia,tegra114-mc.yaml                   |  154 ++
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  |  151 ++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |   32 +
 drivers/clk/tegra/clk-tegra114.c              |   48 +-
 drivers/memory/tegra/Kconfig                  |   12 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra114-emc.c           | 1487 +++++++++++++++++
 drivers/memory/tegra/tegra114.c               |  193 +++
 include/dt-bindings/memory/tegra114-mc.h      |   67 +
 10 files changed, 2561 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-emc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
 create mode 100644 drivers/memory/tegra/tegra114-emc.c

-- 
2.43.0


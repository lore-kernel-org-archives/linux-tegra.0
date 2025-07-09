Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F0238C3D;
	Wed,  9 Jul 2025 22:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752099717; cv=none; b=IJCo58wiyVid1Ftmu2j8GujBvQX9DS5F+24wQrq4PkzAbuxPx08hPqr72d/nkVlkR98SFTZisvw84B5Nrl0yWbQMWspY2PNxwm1SGsUVIx9s3ozn/x4OORdaa3Z7w71y4d4842bdUdxnB0SSzFvlTlCs8ZBUgoPpNQS5IwRVHqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752099717; c=relaxed/simple;
	bh=7mpZCRqoRfCg8BZ5xo2NGCZ91F7yFHgpqNPru4vmBDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxTwzUqln0nW2+hg3GbIuRS1o0fxi0toZdcUJuRNfDoM0GMP6+BIX984jPo94aDpZQs6b8xmNxSrRHfPW4eu/QLDzQT6B0Cca7Ta+U9FUvJhV1ccsiFeiElW0wGLnlWytE6BmqDRjmPwc/lIys03rFzIg2Fm6c+OIQPofLRQ58E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKjDe8jF; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKjDe8jF"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a510432236so319412f8f.0;
        Wed, 09 Jul 2025 15:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752099714; x=1752704514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+FxZUJdA42/PhnEXKvZqgsEn+PSa0lrVbiYJEuvgjqw=;
        b=fKjDe8jFkabyp4Z4W+5sjcZpHQMmYv4IwN6yEk6HEkyFRLg2kOjfVxheh3tTb9uGDY
         24N/AgKfai7bjfQFdOgWJvYi04fCnI8X3QTO4Mqc3g0FPjobQy19AhJOuGpZfsWwOayr
         bqgzuUNfzDVP4mes3RLQdmHJ7lrNjYJiVFcz4di+6Se9xJ7DB9sIQ5jCjhhZk+mP31tI
         FFZ29fQNN/uXd92TTLzZThF7HHGBEsaQeQO42OljcyMDsl18EXuxgrnC+A3P7dhJjE82
         4PtUXXLvVhRIKL+8y/nOcgI7PzcKCm7uTjEQPmL7pd8Hq52LKMLMgt06C0WdDnQva3ai
         ypLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752099714; x=1752704514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FxZUJdA42/PhnEXKvZqgsEn+PSa0lrVbiYJEuvgjqw=;
        b=icWB4jkLUmN8Oy80r7y8eq+lqwjV1C+uSr2sthuB9dDRzWcmgswmy3GgqSEiAquXBR
         NSDqFjPjUVQJMQz/+OJwJkVcKRpmtZifHPGXVAA9X9NvJT053bNJgUjOrXSeczLKkpki
         W5urFKYxuqkQXUbfXXKfyJU5EfLzlGWXcprBFuW5qGffBAsXXl25APuVpn4qaH+xTs2n
         Xo9KKeRfJKupyuWoiB7w9AcQ6Xw5uNZQ0ofrKXPR9FhFIQ06viX6tLP/5G9aNkCa/KLO
         8DkD4XcRxfiZIQ9YzUOhjp6mjonHgT0rWQCl5x+/WWLwMEisjsbjm9YR9UF2D51K84k4
         6ypg==
X-Forwarded-Encrypted: i=1; AJvYcCU0GzgFA44WsyYzjJjpXgmsmb0u6cCBh69INb03YKJcjF1rMmdLjg9GXDukAfNd2JTjcn3cizCzHLIGZSY=@vger.kernel.org, AJvYcCVPQbwWFoJBcxaenNKO3VCClHMJMUsa2cbLX6IDkwZx4mRzaOWujuAZM6ZrwmfoFYxI/irerh4iic80@vger.kernel.org, AJvYcCXv5ZFpulGuQiGsyCtS+A0+tRHIOCOE1v/BWdrLey4FSkpwsrkO9eMSbyvnkpYofIkCusCf/SancVb3i86i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjx1LDnKHHZKfdO5y2ZlNZnchHInNwfkVMyxYbv/sxV8IE4oS8
	XkLZp4hI5hi27tuqNf2/qn69YyQa8RTp0EV1edcCzD3XbgPKLxi/ny4s
X-Gm-Gg: ASbGncv7v9h6iyH7+5m1S+jfG/EeNb3Tc+vZMT7F5xZHCmXB9gY0Ez49bZJeHsevyIP
	45sAEKeQfR0ChMjq9YUuPz/o52rfblXKEagZnQyb5ssquXd3UXULYFGAJaCZ+QrSd+j830FU7ZX
	0RJNqyi7oc2ynq5mCvm6f/TTP80sZw3yTHPaKlsCZPxEm99yTCmq5Rc+JaEnNed4bSO7FZllD2/
	2y72G+yIy6o/qI49QJRKu/jF8oMkSOQjhsiE2Ym8AJaUGV7PZFO5moVOOmHUi/gu5hdSZf+Q74p
	VUwv1FyRl6Ebik5Ow6/d7tHyDTwU1mqTqK1EysVGb3EpbTcOAqx0Mr2vG2vmB1KOCTB0TOPrtKE
	1kPR3Olg8z9xYokpETqcIr1iCtTcL90ATyuvP3EgskFRtCZy/E7vubA==
X-Google-Smtp-Source: AGHT+IFJ77g60sJdBslv4i3acOTnQdrC0ON+RQ3E5pwWCZp48aJPe43eA5mQSpqLouCk8epCGwMFUg==
X-Received: by 2002:a05:6000:41ce:b0:3a5:88cf:479e with SMTP id ffacd0b85a97d-3b5e86de861mr314847f8f.48.1752099713887;
        Wed, 09 Jul 2025 15:21:53 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd1924sm106305f8f.16.2025.07.09.15.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 15:21:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] memory: tegra: Add Tegra264 support
Date: Thu, 10 Jul 2025 00:21:45 +0200
Message-ID: <20250709222147.3758356-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This set of patches extends the DT bindings for the memory controller
and external memory controller for Tegra264 and add the necessary DT
headers with memory client and stream ID definitions.

The driver changes in patch 4 are mostly an extension of existing code
and the bulk consists of the memory client table for the new chip as
well as the bandwidth manager calculations.

Changes in v2:
- squash DT bindings patches into a single patch
- address review comments for bindings
- add Acked-by on patch 2

Thierry

Sumit Gupta (2):
  dt-bindings: memory: tegra: Add Tegra264 support
  memory: tegra: Add Tegra264 MC and EMC support

 .../nvidia,tegra186-mc.yaml                   |  84 ++++-
 drivers/memory/tegra/Makefile                 |   2 +
 drivers/memory/tegra/mc.c                     |   5 +-
 drivers/memory/tegra/mc.h                     |   9 +-
 drivers/memory/tegra/tegra186-emc.c           |   5 +-
 drivers/memory/tegra/tegra186.c               |  17 +-
 drivers/memory/tegra/tegra264-bwmgr.h         |  50 +++
 drivers/memory/tegra/tegra264.c               | 313 ++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h  | 136 ++++++++
 9 files changed, 613 insertions(+), 8 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra264-bwmgr.h
 create mode 100644 drivers/memory/tegra/tegra264.c
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h

-- 
2.50.0


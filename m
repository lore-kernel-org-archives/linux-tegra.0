Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378499;
	b=AQeLLj99TWwZk0PEN6rFx/vmS0O7AiCizXccsR9q+3ZX63KMH5NWjroFw2GpxzyXrxdh
	 vRT8U+bZoHNHGhcMBzPEz/EkhNU7DrW51hdbBnjh/cm5OjCdlh0gqWEs9vYWLwzN4JHdl
	 3gtjmLbSw+Iu/ejFmV4z91k4HaindYolRzLKlXLBTleh2Ps4HiIU/mBxdAKt0Pan06Opo
	 W8/ZQ1Y0/O67Tjz83c2+jG3JzgUOdlL2s/E/yg45S2/++NoQmw4PKd9xBKZ1XkAB+kqeP
	 6/tZoebZbvSOTujq+01MWKQBLVT4rqB3mXz7aTKTPAuN8M+rw9Er1aKPE+5S2oYov6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0/AroVXg+wKJ6uFX9onZDHbggt+VRwYm3F0cMN9wqxg=;
	b=g5CjrXzPFqC0LqQcBgfUOFY7SX+zJEWvNipqmti2+l4wGdEhJqzqbXrjhQgiuVU9wH6M
	 okkR+/5UBsZTtUEpiJezAen2i7JFP0wLfFSev088HIRVocf+0Qg67Ihi6Uyf/Ti9OP6vw
	 r/o78RVTgLq2YcDHBCR6+r9uIGn+FTVGw/7P6mCy3ilJcdb8d5/BtKwCCHaL7qeQ0NKcd
	 s3Vn7/alH00IMvJlgEQMamzeElkmB7vmnJUmvDvHgqEarP5ogeHUPxL6tcHyTRehMBOMo
	 oxmpP+mM0WUVyzAZzoZaSVZ6lAHzgBC7ncAUCtWrs9sT5wH9SGNgkxDTDgUWYYRZt5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMNnYhvk;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F9A606A331
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F9A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMNnYhvk
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c51373ae637so397518166b.3
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378498; x=1795983298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/AroVXg+wKJ6uFX9onZDHbggt+VRwYm3F0cMN9wqxg=;
        b=oMNnYhvkB8Cvof2QHWD3pgxxbWR+ocjTtM4HIZWTIWD+DqfWGYxSmoSbKccTDAi5wY
         VwEV7mbsNh6r/Bvei+D1b6LANI22rW6gIYszhPwAxhAuddFkog6x2Rdo9dLgjwiOghZs
         tf38d5D9vbNP3sfyiNxKr6xz7ZA3bXA688n/gf+2zsSqWLws7H0peXw8OtQ0SCKU+6i5
         ILB0cNn7Ip6uuUqpro4IS2BmihFYNj9hAkHZN+o/lqnhjorF3huc/AYKRm98+nmhFQto
         Zfyi3MuYOC5zpIp94kbaXcj8pfZ3mfvcsuL5eVyFsAFZz/hbvkrfEERI0zbR8ghY3+/u
         dgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378498; x=1795983298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/AroVXg+wKJ6uFX9onZDHbggt+VRwYm3F0cMN9wqxg=;
        b=rTAvh37rl8TjrHeKvPM8gyNibbLQlX+Nm3UYC0L7ftAEYzIvgMFiZ+IN2JKMGt1p1J
         zBrAv99LmAHUhyqQnG4OpS4P21f2KzYeivH20QEHzJdRv3rqXN6FFc+6VItgAoQyO3uc
         9xTrLz5BW0JiZVud3QbBAt0B0Yqf6zBp0qjdMZiCsmxNkGjW7y66wYb/Rt2ytZd6P5Xf
         /nQn3+KtEUC/jgaWYFNOmaAVBN6EGXCvzfeu7Mz5Do4zbw74Q6hQE6EAZd/iu7vXJ4Qq
         brkEn5rbuLMIle/swhliAdJoeqY3SESQcwE62+8itwKpz9+pR/kusa3R6EJRiWSHDdtM
         PtrQ==
X-Forwarded-Encrypted: i=1; AL+hErFmQnEL2HhcjVvzJjfORUMiz3DMw1JUdO7ee2zsb9UdoHu6DZ+mWgSG86f4TISUwroYf9mM+gDCs6ojkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z87kcMh4+yS3HNupfWGIoH2DZSd65HRzwQiHj+p4kc1HiMsI7af
	sNkfsWnOK9nth/8YvCwm2SanUBWrFTMTJWfq3LY+73SnBK7dPpSCEjei
X-Gm-Gg: AZFdTZdqVy/vXggJ0Z7uPwDYGhbEo+ZdN/4wGdX4vYa4W8zOjflh0u6an2Mwdr2tQKI
	PO519OHuiySloMGDAF+XBy5wmDn5pG4MySASsTmK1jU/w2LkLZWAEqHP32+dKx0wptW0w1pzDjm
	qi7yNtCZ3S8vjv/zSJeqtgn2JWTYN4I1RgXvIYeW9TsfBaOslJV9wfbgUOSk8P3nbjU3+yP56z9
	hn8pxGVlesyFZX4qwKETG3ebzjD45WkQzwgrv7QLun2RjCCYHec/M3lQEnuZIiwFGIOzxLTH7Rn
	bL9jGaPFJEQ6exSS9W1zS2YzdXr+qFALARrY3FaB16SVcLti7JHq2rUdyIkhwsPf8h3MW0govqN
	zR0uCF41rOTVLfLzSLiXeJUi3Di8UrUnRtsO7ND2YhRHly9M5BHqLfPEch0uaDtAidRtjPtYgB+
	ViH0LMzOmrFcWqy5UhlrDigti+n5lcS/pYTCQLpNQg3ebVFVsSha5THtJiKLvszmVKyuPp2lpEw
	h4M541GR6CnmW72xKMgCnDeioPHfEUBwHPysBrUBGSo20H83YZGQR1wmkYy/w5JoL8pQTopgljk
	9CZ2TiZx5igjHAltuWQO2xsd39GQi82GEsMjP0SJKXO/L6vW0EJSEaHphVnEX5+86oYNzZfb5sy
	ExztRV2azPg==
X-Received: by 2002:a17:907:7f9f:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c513a274be7mr837483266b.0.1795378497880;
        Sun, 22 Nov 2026 12:14:57 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:57 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 14/18] ARM: tegra: tegratab: Add CPU DFLL clock node
Date: Sun, 22 Nov 2026 22:14:03 +0200
Message-ID: <20261122201407.23742-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DFLL for Tegra Note 7 since it is now supported by Tegra114.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 42a10ec5ad4ee..cf8cd037a732a 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -2133,6 +2133,14 @@ i2s@70080600 {		/* i2s3 */
 		};
 	};
 
+	/* CPU DFLL clock */
+	clock@70110000 {
+		status = "okay";
+		nvidia,sample-rate = <11500>;
+		nvidia,i2c-fs-rate = <400000>;
+		vdd-cpu-supply = <&vdd_cpu>;
+	};
+
 	/* Wifi */
 	sdmmc1: mmc@78000000 {
 		status = "okay";
-- 
2.53.0


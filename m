Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE71C2BD001;
	Tue,  8 Jul 2025 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963306; cv=none; b=TzwR42rVIe5MlwKZwVUhHarRjnAZtkfv9S1lFrEYuTsNQ6Cx+xn6IicPjYRQSpBLL8STLvahPZu02eyx5ea6K+zIg/fU/cucWCVkAYLG9VimA7ah2ydH658ZUUdRJhmq/NIAip6H+N89Q+HpGtssNVBbGwbttEmJaTNlMA85n0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963306; c=relaxed/simple;
	bh=U1cESLvAy+latqj+yPp0YIPdoOamSSkvBAqaG6NuGhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chg/dEZqRp6rbI+jSidSKvj0zSKmfSyznOySCpaFCOqLgzqy6xolqVsyGi7wJN7E4cJtJnTTPGp/itU2YY755g4GlIGVYp3FSJPLEMP6TphTgkbMfabLhgXLDT+XvSv4vCK0D+GDRDVxaSwqT40pk+Akv6RWE31rUm3Rwid2lYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWwVYyYm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWwVYyYm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso31323545e9.2;
        Tue, 08 Jul 2025 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963303; x=1752568103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJMlSlom/KiMTwkQbIEAzuRLUW9VwcuZovWJtgWynck=;
        b=VWwVYyYm2Jv6bpqbeEzKrNNNZa1oLPtqTGwlgdLEIb2/yqFcWfxrIqIlf158lbCK7j
         GiCwYe8lxlX4XEPgw4tQSLWIFeGuAKn4F1xQ8Rcy8OobYbNLSwfYhnJjk2qeOcdK6H2H
         KLxgsQ7MVsVqnMDJZbpB9+GEs24/ikOnzGCHCKeswJDXe+/M5Lziwq4lw7xKvv+0VARx
         YqyqccoFVZOWOT1SGY7lwLtkUMsCGCUGYQFT2F66Ub7AnEzGyDoldwYyqRtHpkw6ZUup
         5XLtjI6GkVv6CV4RhJpgLff4orjFftPi2i4OJbfzR/Te0GKFapdFaYIA7t3oFIkC0uLF
         lmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963303; x=1752568103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJMlSlom/KiMTwkQbIEAzuRLUW9VwcuZovWJtgWynck=;
        b=qp5UDYUAEqpBQ/K/QTPgCbDKNKDrCpGEdQMQBhkbPvTUCcw/RyVwIhGcFNZC783qN1
         n89sTT2MtmuA2DgIpGg3fq0htw9kZ+tMaqAP33EKjvNF0auN95QdljLra3C4ed8Igq+R
         oZ8Ed797abylZvkchp+cEoL8Dh3OfW3Q3Cpk1ALxFySzEsKhmCvbS8ufBm2isjDuwkbX
         DPc4d8M1K5jxmwVvuo1dal668NBzBdT9pZ4sAATU2QISxsxQGwdNE/d0TrA2xVPBliZ6
         UCrqQB4bp4FGjDOBUSldRtCV5yHlOZLvru7Y6nk0JjhX8tnq3cB9edxqSS10y61un380
         ZP1w==
X-Forwarded-Encrypted: i=1; AJvYcCUzwMIFr7EqVM2vHweyP6Etq47R4Kri5s/NlTY2GxdY5gZABNc6nF10CeNpxLviVe6P3j5dq418C/n44jk=@vger.kernel.org, AJvYcCWd2SSFQNh7+2wjs3xNclagNh5mTVT+SRt4WdKucj+JqQtentJ+rRLYOLqvdrt0RXTXpqhCL17Ov43F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8cwlbWE+NndFgsXZZhQ20UEh7U6Isu+fBGayIssz1JWMgGatl
	v3OK+baCjiCzVp83R81veE/dVeFeHN7uM17OPLkPiQH5dj1Jkhxct3sFmPtBfg==
X-Gm-Gg: ASbGnctP87cAl0ptcVtOkzcM/clJ4/zun609JmFbM20AG6NKtVfWdHlSn5q2KIpdDMg
	8mgk1Z8CdHVb3iwTxo2E9MqNLegGZpKrn0PzDyMtcKd4IPurEE4w8wGx5T3eJUB89k3KWX3ZIoN
	+GRVCTVsu6j5LSum946LkcTvYJOKpeCMKJ39Grnowha1TqQla52R0rK8CLOZV03gBumP7GNWtSa
	V3+Of1UWgOvojEeiLFQruUyhd758x8uBOwL46Co8P/HS3kjWAd8qFPSr2NupfOk/wPihD9HD+Vo
	XLdpYW4hZu5i6fw+TIWCqV7QFvYSABJgQktV+dX4dD5dBstghMOlVg6t76pY0e29DRG/z6W9oLH
	1seOhJDk/bAk9xbgqFGbpkqNCmcwuPHRsP7Tq9Ax6yG8IBtp9+LR/7A==
X-Google-Smtp-Source: AGHT+IHK/SvlgTww0dZF/jMCnrR4g7wCb7VA7kOnihLMUb1SjCpYvZ1MmfGNFml+RJq4jAKd1ZEkQA==
X-Received: by 2002:a05:600c:34c8:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-454cccd644bmr21048225e9.23.1751963302733;
        Tue, 08 Jul 2025 01:28:22 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0aa0sm12596532f8f.34.2025.07.08.01.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/5] dt-bindings: firmware: Document Tegra264 BPMP
Date: Tue,  8 Jul 2025 10:28:10 +0200
Message-ID: <20250708082814.1491230-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708082814.1491230-1-thierry.reding@gmail.com>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

While the BPMP found on Tegra264 is similar to the versions found on
previous chips and should be backwards-compatible, some changes could
eventually be needed. Anticipate such changes and introduce a chip-
specific compatible string.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index c43d17f6e96b..3c44fe607e12 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -70,6 +70,7 @@ properties:
           - enum:
               - nvidia,tegra194-bpmp
               - nvidia,tegra234-bpmp
+              - nvidia,tegra264-bpmp
           - const: nvidia,tegra186-bpmp
       - const: nvidia,tegra186-bpmp
 
-- 
2.50.0


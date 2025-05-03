Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78F1DDA00;
	Sat,  3 May 2025 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268220; cv=none; b=WTzrKIn77qNxoreoYsW5qd+nDJCuk78rkKfIQxhUJpc2TDmdxwnqZkhAfUKfTNm/nFlwaRCAdeFrbGgazmUAc5IvpCDma8kSKwTWO7YFy1PPdulqfewzaDs49zUJ78NxaNBvsR2+JDOAi4BMhayWBzkCfym4kKkwcPBiJ5O+DvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268220; c=relaxed/simple;
	bh=40s5sn5siItiK9xnENoObH7RaaMBur95bA6rF29tizs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifwp/9K0BqFt4f8Cf0vgXQLRKOMg6tqoZ6AZ13lQqcGZZVmvtFVVIfyp28t0ri7AI39lSBBOxtmJ+zmLQ43i3i7l0d0URf9aiHj0jQcAkEnY44OQ3DDpxyUGlqvwlzszcc0jM7COdt3Hubj/xCAoF6bL+9W/ymktP1LJTvaBKZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOF6HVfj; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOF6HVfj"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so454717966b.1;
        Sat, 03 May 2025 03:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746268217; x=1746873017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb2V3VCtn9nXykE14In42D8Qn8pMICt0aeeKrPB/loI=;
        b=LOF6HVfjq5r1MSqHdT7IN8pKRKQL1DW6PnOoBdv0YOz5fTUWVs9DLUQU0MJl6SwdfD
         Ixb7WN7CHil/aYqt64MNcpX7Rh+SXG2/7GkIJEQOwpYHnb99YgSTMmARFWvcIRyfQoIj
         B9dsn418xLkz+sbVFzhU6uW1frAS+AX1E2quW7/VJ4FoH2WxjLgtnx1Xi+OQjzo449vy
         38SK6RdkcTZlDS8M+qH+yH34WBi9eypB5Sfj8JkHh3aeCRL6Inx+CJyScSVHFPHuc/PE
         T/G6z3QzW+cfdOsIy/7iagO1d3RTt2Nadqux2yNfyvbmrzg4ehrNVzSGQvHsVBHr7olB
         cSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746268217; x=1746873017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb2V3VCtn9nXykE14In42D8Qn8pMICt0aeeKrPB/loI=;
        b=P/vahzFj28dgjZf3U4J6ktZhAA0m1CN3S11GNF3i1AWPBpT6HJegFm/vLYuWhMvL89
         6jgFfGaxC6nmJHXi78q06LjjYCYt++zCOe9g6MmruAiHSRZNPEDweL7cMBNVXqyNF2Dj
         bzM6r44jvIuS991QSbHHftLglXv+3r27S0DIbI0ptr5Nds8ApZr3Gvk+xmEuILqCxKzF
         IYJmLGvsuOoGK1trKscLq7l61deq/2Vw0ACmFnGEPA064+xYos/fwt19K4nyDq2czBj7
         5wthvGsg/9GLG2eRzChiESj35J9Fap8oIWT22QJYgpTKTguJXYrjplA1L+k15UQpN/dX
         zlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ58kaHMLvGsJ8gTkmNhUFIF5leybhlAYjOWANC5zt6LD2U7tpylY4po0ac3j0Yc47V0mUdAqywedyH/k=@vger.kernel.org, AJvYcCVW25ts4LXeBGrWxHoGA9s3KjftBljEim8FY+hjmZgERol21/aVYUgEcVl7Qbzkeb5OYJAd94nShXjp1bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzIZMCAvr53Wmwqi7tEqaojzcDyO4+WVnGa9T07W5Tnrv667Jh
	yA+OyJABiMiMf+BieXyQ9pZOX7qySogTOtSjlEOBfn4l7ltCd2on
X-Gm-Gg: ASbGncuQyxBdMmDsRzmeT3kGgeF8At0+7Vtp0zjvl9Z3TudPVGdUFjz6Ep2meRWMK/M
	d1JopzCOXCRTHb/3+LvqKlGhzilYMvhPPdhi/gV1C4An7Yw3QeN3x0h2cAmSX4kmB0BwC+hLv3A
	1oyAE3F8P4RSOf6N/9BnVw8Te0oHpc/nxuyA6/LUH5qJLQGcI3avGaUZm9sKShvVRFdOv0zL5IU
	PJQkIvvguE8BhlrOwGoF27jriVMHNKNF+TsJicfwZidpv1S8zT8046UmsoZYI2RUBOyPtz/g4NT
	LV7IYBFS+lKp7sUf0lkE+/Evn8d7jZOc
X-Google-Smtp-Source: AGHT+IG8ibgK7qJIUj23UZU2c60b4tUpsZJyNT7EEkCxyl7GpF/+IHtLjUrtIMyIw03gMPM98J4YpA==
X-Received: by 2002:a17:907:6d14:b0:ace:3834:bb59 with SMTP id a640c23a62f3a-ad1a4b0e770mr43640466b.56.1746268217368;
        Sat, 03 May 2025 03:30:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189509088sm177848766b.146.2025.05.03.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 03:30:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: arm: tegra: group Tegra30 based ASUS Transformers
Date: Sat,  3 May 2025 13:29:48 +0300
Message-ID: <20250503102950.32744-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503102950.32744-1-clamor95@gmail.com>
References: <20250503102950.32744-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Group Tegra30 based ASUS Transformers under a common description.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/arm/tegra.yaml         | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 65e0ff1fdf1e..49021e940d3c 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -52,17 +52,13 @@ properties:
               - nvidia,cardhu-a04
           - const: nvidia,cardhu
           - const: nvidia,tegra30
-      - items:
-          - const: asus,tf201
-          - const: nvidia,tegra30
-      - items:
-          - const: asus,tf300t
-          - const: nvidia,tegra30
-      - items:
-          - const: asus,tf300tg
-          - const: nvidia,tegra30
-      - items:
-          - const: asus,tf700t
+      - description: ASUS Transformers Device family
+        items:
+          - enum:
+              - asus,tf201
+              - asus,tf300t
+              - asus,tf300tg
+              - asus,tf700t
           - const: nvidia,tegra30
       - description: LG Optimus 4X P880
         items:
-- 
2.48.1


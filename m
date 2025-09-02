Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26B30EF9D;
	Tue,  2 Sep 2025 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828011; cv=none; b=bHw/s469pv9KetBkP1+zOgHSP0kDiSlq+zuMjNzKB34dotCVf4MzGCN9ZLT2QiLSeCoxC7Q8VYvZTv8eIeAMKq7o0l/fEMMVdBlwsFvq4J0fgJ5wAHkW2mfLYpc2xpDQKJLpvRsLj7d6T2yIRLYpwI0gn+eVeAEi7Ms9maHhCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828011; c=relaxed/simple;
	bh=f/b63Dyyg5oNKGH6Ufw3er4I6rS+Q+Yu8DINR3C+Kjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWpFTrPvtz3ZJfH6bP1rbmHaqlh2X2fmpF2C35A+Fo8sg+tg1zXmrlhOSooXwAyDVw9ShBoAtb2QRRy+ZM70wRX8ypqnehDme7IYoNvjZpyZG10m3Sk0rXxOlUrIAYPEorTJqLb7Dw//BjoCqBRVcNg8vEZXm67sLXlL2UWBDl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZn1r9Sl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZn1r9Sl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b7c56a987so18072495e9.1;
        Tue, 02 Sep 2025 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828008; x=1757432808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4LUm3xzftHp/xE2ENw2BOhVhXc1ZcghNq/wiRAVNUo=;
        b=AZn1r9Sl90ILPAuINF/zp5/LOK7Ta2sM24x93Gz0lhoQsexuhuZUzyE8R/atixttgY
         /Kutc36CmBCGC6NXk9Lx8SYG0ciXEPDpobIA8ZAem8ftyTihiiQk+MfmgkGmZjJLttCV
         o/eGFeTBwMEQWPNH5qXP0FzxbdSGwJa/LcfTRZxQ5bninvZojs7+5ONUNUcul7kq8qGh
         wrk3/pV1S6lg6OYh4F9bSs7g0FRpVWQ4PFWXR6t+p3XUpjvrOZhoBvKeagZWCnVlv4zv
         ZFvBiKNaQgda3YKzv7tq/XtYDLTn6QLkUsstKYvoCtZNbMopf7GjEq8fObAlYNGBSyG/
         RLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828008; x=1757432808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4LUm3xzftHp/xE2ENw2BOhVhXc1ZcghNq/wiRAVNUo=;
        b=hTkjeYYbOrzsh5qBrJzQIX5ABfwlQu1Y2AtpzJlzYFn0EqcNuBu8ZUN1mzZ/xLRCds
         2NxixQqhznjSq3zlLNm3VMiBYRvyMJGCC0C4ve/4mCMvNNYqzLrkGA7q2Z2KQzso2pqF
         fWfIjaR/mr/tjnFj+c1HVInm08fdiW3NMHb59wMCkpdoFidnM7rX7oNkgsrQXUUhjFe2
         IrCGtgG4M32wvXlYdAdDigF+5sRCTivdeSh+09J+ndgmk/bTFDw36mjX+tilPrcOx7Qk
         kUcqGjDqCK37kKs1ejYd5G0NGiUzwOl/LKuMPsMf1Cuagl7uix+bKfBwPyXJfoYSUxYR
         edpA==
X-Forwarded-Encrypted: i=1; AJvYcCUMqeLcEXf31ynjXt22KMS2zD1ZVfe9bti0Q16xnl8gKDNvBMocX5O4S4rgtridat+HnCcux8YzYSrfwhg=@vger.kernel.org, AJvYcCX7IYacvVYab7h/Isfx01nHSp90FgHQB0Tlkk9lGh3A79uHsflIMyM63yit+TR3nNgDezUivjQ+YN0F@vger.kernel.org
X-Gm-Message-State: AOJu0YxanfmCWNbB5pkhMJX+ou864A7EioaxubsVZyXB4Ev4AGQGuuS3
	p2G12asREb3E+vphDB0gNV9i+AeQofywFY5NNhQqs/nXizYr5Etpm9Sq
X-Gm-Gg: ASbGncuCLFH4DjagFE3d6jCsVDP0LwgFmYzXYsKZQwRxwmckzOdgU80oQeobrHyqfKZ
	9Y8yGnx+lUtEJpAd81T9k3QkEKo4rNoi/rZ2ogBZ9uIbTLzDQGVH4Ej6AZa5IvNgE5wClr+TOvm
	0/Ft99PuLFZ9ycuT7YgdLyLvRJ8T9KWjGKwBsl+4DC3hVroWDbAjQgAdDk8baGGXhqazeN62YXz
	Csh8iTvMI/y/y+lNwOFZHNEeDcfanmx6DCtt3IhsT9/ctx2V+5gLqPkuhiK3sWjBEV6fT22fipC
	z5eVeakoe4zd+E6qxCJQXCcYz5WPeXwDGp+io16IhVFZ8KPkh8MPk0ITJXp5FLDmvP2Kgw2ER82
	t3ajkTsKW/svyGsEWXRczqoJBGNVGraJEef4rh5THKX2wfvdJAhYSSwP+S8CW1W7VwKOJ5kfCqS
	KOwk8VfdWrxgDB3Q==
X-Google-Smtp-Source: AGHT+IH1ceyRh0TFSkY7cElx5alHVXNEHIyhpSLS5qn4WT0MeK4fu88w2CD9wveL/P6+3CQyGvCJWA==
X-Received: by 2002:a05:600c:1f94:b0:45b:772b:12b9 with SMTP id 5b1f17b1804b1-45b855336dcmr103786195e9.15.1756828007780;
        Tue, 02 Sep 2025 08:46:47 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e898b99sm202121435e9.19.2025.09.02.08.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:46:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org
Subject: [PATCH 2/9] dt-bindings: display: tegra: Document memory regions
Date: Tue,  2 Sep 2025 17:46:22 +0200
Message-ID: <20250902154630.4032984-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Add the memory-region and memory-region-names properties to the bindings
for the display controllers and the host1x engine found on various Tegra
generations. These memory regions are used to access firmware-provided
framebuffer memory as well as the video protection region.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/display/tegra/nvidia,tegra186-dc.yaml     | 10 ++++++++++
 .../bindings/display/tegra/nvidia,tegra20-dc.yaml      | 10 +++++++++-
 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml  |  7 +++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
index ce4589466a18..881bfbf4764d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
@@ -57,6 +57,16 @@ properties:
       - const: dma-mem # read-0
       - const: read-1
 
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  memory-region-names:
+    items:
+      enum: [ framebuffer, protected ]
+    minItems: 1
+    maxItems: 2
+
   nvidia,outputs:
     description: A list of phandles of outputs that this display
       controller can drive.
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd562..a012644eeb7d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -65,7 +65,15 @@ properties:
     items:
       - description: phandle to the core power domain
 
-  memory-region: true
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  memory-region-names:
+    items:
+      enum: [ framebuffer, protected ]
+    minItems: 1
+    maxitems: 2
 
   nvidia,head:
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 3563378a01af..f45be30835a8 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -96,6 +96,13 @@ properties:
     items:
       - description: phandle to the HEG or core power domain
 
+  memory-region:
+    maxItems: 1
+
+  memory-region-names:
+    items:
+      - const: protected
+
 required:
   - compatible
   - interrupts
-- 
2.50.0


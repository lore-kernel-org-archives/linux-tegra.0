Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D68322C63;
	Tue,  2 Sep 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828016; cv=none; b=WxmdMp2TNU53Ek+TiJmK6k9kIhrWrM0NN10GASrfiDfWB9onkg1kudoM09QYBQFn/5yerDksdGqUpHLuKG4cUL9NjGFqQWKAfhDKvmSWlvcVz+tkA7NoC3ZTdKGkMpnTIEvFMKlRBePE42WlCP3MQ7T040T90sra/eqPfy3+B4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828016; c=relaxed/simple;
	bh=BULF2BVTlsNEcA9lk8Ki7NGpfyiK74w2tltJQV/iQdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cW5VS9/IgwaS5izfAcNwEjHxEiINA7EWxgb2IP8LzLn5GoAnZc3HcSmblghyO34Z/8ChmJfXzJi93LQswGgv/kwniWO9DK6nSBPWX8rhRISz1tiiE/R+FeuIWSDSdr2r6lZpp38CXAqOZItloPBAEXpt9phJhoZ50bapbi5Tt+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMOsPB5q; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMOsPB5q"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3d3fa21a77fso1634831f8f.3;
        Tue, 02 Sep 2025 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828013; x=1757432813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/5Ql6ePEZB3sncY9PXrRkrrrgHDmfb5EstPCmtwQL4=;
        b=AMOsPB5qmyrs3Ooih65EVGVkvB8TwY2c2gbtHtGfE10vdC3uffnLMV5+fcQjpdZG27
         2YfDrgC/uJHD4HyU5a6HKDKXJq/Hx8gw1fbG+V04gr4vCCdmBVVKO5x9ZZOzEqbYP3w0
         S/tA6/6p/EEZ82554n5ASERxI7LD36ZGZRjOxaslWiJ3WtWksMw2GQbruli7bfMQWM2D
         vXZNFtaN6mOjxEJBYBqggPfW7cUQs39emhK/TZW6lXD3pV3okUtnhcpelwm3qASDFErJ
         DQUfbAlyrjk5tXEo3H9wOyqRclGx5ZossX7c+SQufsQJkiJKw2aK7TlPmloupBDEmmva
         Nj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828013; x=1757432813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/5Ql6ePEZB3sncY9PXrRkrrrgHDmfb5EstPCmtwQL4=;
        b=AtpZOw/HZdGNBBjMRmG7i0RDko3qsLHSxswfmsZQmxKEvrHxgAikiM+KcFIqRpendS
         JMkpS1KF/4PRCvE6rp0G+rQi2bGaBpx4TNhpvMnesu+jjpmn6wCrN5ODjMN6LQ5eHDrb
         YqyovwB6bpz63wseyA5c/Sz3UyONPfyqYIIG1h5T0keupXb6WciWsuLzwEzQGPyGZvHZ
         Abp9UftPRH4cNZpze1e+nhknfnXMk4CNAB+aF6bupxU9v6R1HhyctcPJRbA3YgUr3ffQ
         RFERG8r3LKxsAjIvSiowKXoCt63Q8W3m9u5iu7gkBhekAI/0O6qcUpCP8kh+lAxps7Cn
         w+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV4bOAxOlwbg3TNSfI5FwxgJnoN3Svj95Oz/EQPkvn+tLucbGYANO+83PbL5gu7T+q2q8o8B3gBdrys/c0=@vger.kernel.org, AJvYcCWuyJjv41w8UKR3tKjMG3Qc0bYwuDJB+mIlaJYxK2Ah6tXsf7x/ncOIbn2VVx0kMW0L4zhWzq6KK0qB@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWrhZAn7nmohHK1Vrip4C1wAQivrynwdfb3FwABpkvuiptGOR
	483UaVQOExcbQV3J0IQ9CcMfPpGK0zARYAoGQJzOXw36NukUD/zaFRTV
X-Gm-Gg: ASbGncuz2EDNgf1A7YAh0avoB8uzBjxpYrKcfO8QYgSB7kaiVuJq2qJPkj6hFIMTf39
	CqIvfNzueIpWJTLVWohP2tNbIwDHN6u9HTHl4o72vpy+eg38upQcarac11iyZnJ4/KQhOPynOXQ
	eFGVtzi/GkwyqwRwPq8E/iY2f9w5D72JptQ/DCzE53AjFlLBfz6hps4BiKvvW4l8DHM5V7haD9Y
	p0Ws9Zz9/BdrI3iAmIKuRvEfcnITObBaI6dRvQM3xNJ7Z93dnV4T0/MhJzO920Th6wamorAxaHy
	0uXHmN9qzvYppH3fdDSMVHuP5cYrKdN6dtq++mhcIfo8tkCVgF5dQeMxKU5nbYvkR2UqTb16f99
	qht2zNB5OYnH/9xSujnUEUBMeXvHQO61lYF55825wBqvtSTllCfcMvPk0qSASQrOT0raksOYu/o
	9T21XX1xH3o5clLesZyb4d/B1M
X-Google-Smtp-Source: AGHT+IHq43AbE5VkmkapAR0tzhsq3zXTXrsk3nysd56WKEVtoZpJPwZ7v6YnW4KfZ38+U9nLscJHkg==
X-Received: by 2002:a05:6000:25c6:b0:3ce:f0a5:d598 with SMTP id ffacd0b85a97d-3d1dca7bfdbmr10337054f8f.10.1756828012868;
        Tue, 02 Sep 2025 08:46:52 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45c447244c4sm4765415e9.6.2025.09.02.08.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:46:48 -0700 (PDT)
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
Subject: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
Date: Tue,  2 Sep 2025 17:46:23 +0200
Message-ID: <20250902154630.4032984-4-thierry.reding@gmail.com>
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

There is no technical reason why there should be a limited number of CMA
regions, so extract some code into helpers and use them to create extra
functions (cma_create() and cma_free()) that allow creating and freeing,
respectively, CMA regions dynamically at runtime.

Note that these dynamically created CMA areas are treated specially and
do not contribute to the number of total CMA pages so that this count
still only applies to the fixed number of CMA areas.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/cma.h | 16 ++++++++
 mm/cma.c            | 89 ++++++++++++++++++++++++++++++++++-----------
 2 files changed, 83 insertions(+), 22 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 62d9c1cf6326..f1e20642198a 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -61,6 +61,10 @@ extern void cma_reserve_pages_on_error(struct cma *cma);
 struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp);
 bool cma_free_folio(struct cma *cma, const struct folio *folio);
 bool cma_validate_zones(struct cma *cma);
+
+struct cma *cma_create(phys_addr_t base, phys_addr_t size,
+		       unsigned int order_per_bit, const char *name);
+void cma_free(struct cma *cma);
 #else
 static inline struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp)
 {
@@ -71,10 +75,22 @@ static inline bool cma_free_folio(struct cma *cma, const struct folio *folio)
 {
 	return false;
 }
+
 static inline bool cma_validate_zones(struct cma *cma)
 {
 	return false;
 }
+
+static inline struct cma *cma_create(phys_addr_t base, phys_addr_t size,
+				     unsigned int order_per_bit,
+				     const char *name)
+{
+	return NULL;
+}
+
+static inline void cma_free(struct cma *cma)
+{
+}
 #endif
 
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index e56ec64d0567..8149227d319f 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -214,6 +214,18 @@ void __init cma_reserve_pages_on_error(struct cma *cma)
 	set_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags);
 }
 
+static void __init cma_init_area(struct cma *cma, const char *name,
+				 phys_addr_t size, unsigned int order_per_bit)
+{
+	if (name)
+		snprintf(cma->name, CMA_MAX_NAME, "%s", name);
+	else
+		snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_count);
+
+	cma->available_count = cma->count = size >> PAGE_SHIFT;
+	cma->order_per_bit = order_per_bit;
+}
+
 static int __init cma_new_area(const char *name, phys_addr_t size,
 			       unsigned int order_per_bit,
 			       struct cma **res_cma)
@@ -232,13 +244,8 @@ static int __init cma_new_area(const char *name, phys_addr_t size,
 	cma = &cma_areas[cma_area_count];
 	cma_area_count++;
 
-	if (name)
-		snprintf(cma->name, CMA_MAX_NAME, "%s", name);
-	else
-		snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_count);
+	cma_init_area(cma, name, size, order_per_bit);
 
-	cma->available_count = cma->count = size >> PAGE_SHIFT;
-	cma->order_per_bit = order_per_bit;
 	*res_cma = cma;
 	totalcma_pages += cma->count;
 
@@ -251,6 +258,27 @@ static void __init cma_drop_area(struct cma *cma)
 	cma_area_count--;
 }
 
+static int __init cma_check_memory(phys_addr_t base, phys_addr_t size)
+{
+	if (!size || !memblock_is_region_reserved(base, size))
+		return -EINVAL;
+
+	/*
+	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
+	 * needs pageblock_order to be initialized. Let's enforce it.
+	 */
+	if (!pageblock_order) {
+		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
+		return -EINVAL;
+	}
+
+	/* ensure minimal alignment required by mm core */
+	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
+		return -EINVAL;
+
+	return 0;
+}
+
 /**
  * cma_init_reserved_mem() - create custom contiguous area from reserved memory
  * @base: Base address of the reserved area
@@ -271,22 +299,9 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	struct cma *cma;
 	int ret;
 
-	/* Sanity checks */
-	if (!size || !memblock_is_region_reserved(base, size))
-		return -EINVAL;
-
-	/*
-	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
-	 * needs pageblock_order to be initialized. Let's enforce it.
-	 */
-	if (!pageblock_order) {
-		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
-		return -EINVAL;
-	}
-
-	/* ensure minimal alignment required by mm core */
-	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
-		return -EINVAL;
+	ret = cma_check_memory(base, size);
+	if (ret < 0)
+		return ret;
 
 	ret = cma_new_area(name, size, order_per_bit, &cma);
 	if (ret != 0)
@@ -1112,3 +1127,33 @@ void __init *cma_reserve_early(struct cma *cma, unsigned long size)
 
 	return ret;
 }
+
+struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
+			      unsigned int order_per_bit, const char *name)
+{
+	struct cma *cma;
+	int ret;
+
+	ret = cma_check_memory(base, size);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	cma = kzalloc(sizeof(*cma), GFP_KERNEL);
+	if (!cma)
+		return ERR_PTR(-ENOMEM);
+
+	cma_init_area(cma, name, size, order_per_bit);
+	cma->ranges[0].base_pfn = PFN_DOWN(base);
+	cma->ranges[0].early_pfn = PFN_DOWN(base);
+	cma->ranges[0].count = cma->count;
+	cma->nranges = 1;
+
+	cma_activate_area(cma);
+
+	return cma;
+}
+
+void cma_free(struct cma *cma)
+{
+	kfree(cma);
+}
-- 
2.50.0


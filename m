Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="S0UQOTWH"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993F619B9
	for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 12:49:49 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5ce8af1eab9so44193767b3.3
        for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 12:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701204589; x=1701809389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6nAo2mT7pHcrL/oNBUQ6H06jfJ0V1n29MMcCYzl3v8=;
        b=S0UQOTWHBNlFGfUS4oGwhx5iaN0e1rCi7aqR76MZSiPG0xbH9+lXPOVI4Z2x0nm9Jz
         8FVqAma4K5GcauDVS52zXymBUgJ1/4kmzrhtLpzUgW7cp6Pv72F6IOeRTevdCLnKVmG0
         9F4hkBykJAhtVz1b2Q2ZszgZWy47Y9i+JHCOsOvXnANSH4mKo3IQsQuI5VcU2EE6+MeL
         LyDw1Pr6LsdVJ89PFwTRLsOaRYYVYSHbcp8EvLGnmCUoQw7ojSpQL/wYST7Fhzy8MnlC
         VX1ZBmx550XJVf4NJdQGERUa/E+jQOXP7y96zaTD7iWE6epcHzVsbQAbPHVYp2qCEY+N
         HtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204589; x=1701809389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6nAo2mT7pHcrL/oNBUQ6H06jfJ0V1n29MMcCYzl3v8=;
        b=GtOgBTS06wbNJzhbBRF+0LLcfwicpxmZZf31qOZtxqaTGZVSplJ6ok5sQFmOqM8nYj
         WqMTjNSdxeKH8/P1G7Ep6CZTEH1CVyXExSUF0FpUPmxZt74xuQ+oLkdjVuA4Vfwr8TyN
         HHDRiwDPyBQUZuTSg0r6u8471V+RgQP7NCaQceaPBpz++XQ28AcB9WeIUySzWgYhpH9o
         ieMwrhav7n5R6Q8OrMekrRDgfRFfzR8ncqioUJaDnqosuJ8yIu48tww2eA2dVl1K1+Ec
         Yeh0d0GXLgkdz9YcAKPzFVVvL0x+z5Dc8lxDRDaaOP7Brt0gvAc/o5P4AAf189YCfSRD
         0Cpg==
X-Gm-Message-State: AOJu0YwgA+MaPBfXNz+Ftus5th1KuRW6NMrvRvSC+AM7WV9CgMOICErc
	oXzgNbwZEdqzVkQ9gMYywN3XbA==
X-Google-Smtp-Source: AGHT+IHzqIoJvEd/INF3AF90sz+4QhWdk8I4ronh0w1gK1vKHyIxxYwztLst06FhLLj54D6SeAj/qg==
X-Received: by 2002:a25:68c7:0:b0:da0:c6ae:ad0e with SMTP id d190-20020a2568c7000000b00da0c6aead0emr15080570ybc.21.1701204588830;
        Tue, 28 Nov 2023 12:49:48 -0800 (PST)
Received: from soleen.c.googlers.com.com (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with ESMTPSA id d11-20020a0cfe8b000000b0067a56b6adfesm1056863qvs.71.2023.11.28.12.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:49:48 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jasowang@redhat.com,
	jernej.skrabec@gmail.com,
	jgg@ziepe.ca,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	kevin.tian@intel.com,
	krzysztof.kozlowski@linaro.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	mst@redhat.com,
	m.szyprowski@samsung.com,
	netdev@vger.kernel.org,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	virtualization@lists.linux.dev,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com
Subject: [PATCH 08/16] iommu/fsl: use page allocation function provided by iommu-pages.h
Date: Tue, 28 Nov 2023 20:49:30 +0000
Message-ID: <20231128204938.1453583-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/fsl_pamu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/iommu/fsl_pamu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index f37d3b044131..7bfb49940f0c 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 
 #include <asm/mpc85xx.h>
+#include "iommu-pages.h"
 
 /* define indexes for each operation mapping scenario */
 #define OMI_QMAN        0x00
@@ -828,7 +829,7 @@ static int fsl_pamu_probe(struct platform_device *pdev)
 		(PAGE_SIZE << get_order(OMT_SIZE));
 	order = get_order(mem_size);
 
-	p = alloc_pages(GFP_KERNEL | __GFP_ZERO, order);
+	p = __iommu_alloc_pages(GFP_KERNEL, order);
 	if (!p) {
 		dev_err(dev, "unable to allocate PAACT/SPAACT/OMT block\n");
 		ret = -ENOMEM;
@@ -916,7 +917,7 @@ static int fsl_pamu_probe(struct platform_device *pdev)
 		iounmap(guts_regs);
 
 	if (ppaact)
-		free_pages((unsigned long)ppaact, order);
+		iommu_free_pages(ppaact, order);
 
 	ppaact = NULL;
 
-- 
2.43.0.rc2.451.g8631bc7472-goog


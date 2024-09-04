Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B581474A2
	for <linux-tegra@vger.kernel.org>; Wed,  4 Sep 2024 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436970; cv=none; b=jamB9BWAjxCUGpT2yR5WElDUNsd0A5iy5aPxqwY/U8AnvHEnudN2xf6gM3PUrp56Eq73T79ewVmz/gzskGm+6Bdpsn6fr+RTVyQGIvxxNmcHQJjnV0YNw5cVDMZQurOCABhQzOzCbyTiFcd90JWG7kfhIWN5XNMuLwZ5F7F2iGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436970; c=relaxed/simple;
	bh=dDcdKq7ppSYN4Yv4rxqWl4NK1gtCIBnTvMkiH0xJG6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EXrHKYSAQDyzRenSOirHFgN3mA1WQXLRWkLMBKaRgP6M+3ad92EY6eN49I+dPMihT8NT8NOmiOgCeUIhc2st0qGVLg+KKFeAdiCEe1IMJScyMTExGEEC8xKvJU9gxW5sabr4Q2U6hQ2kGzyjJzdjifrxL4tj/0OESuWd7d270Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0AVtAK1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0AVtAK1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42c7bc97423so42160655e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Sep 2024 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725436967; x=1726041767; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbsiPwHzdU7yQfw0bVfDw6SqwSWkWnRdJycvBly0WUw=;
        b=g0AVtAK1iEnn/iWInE2LZounTfgvg9QgLlTJuXSKcm26scsd5c8wi9KrrKt5KrMYR+
         4fnRw1ho9tHknXL9GxqneyaRhymcKXOMFraZdfhylBXFglJyfBA7MOarnj3UnE2B/13d
         GaR36EVG7o6WKB/wK0F0EAMT1Pxh0DB++qoeHwvo83/l8Yy08yJcAir5OoZ1kDoIm1wW
         PVH1iKMPJfbm0h5VlQINaQATRYm626DILTgOiV6JVNtEvVmPupqvOfqKOIeRUNqTzNj7
         5xwP44BwZEy97mB783w60rzohzAz6l6MhZTamW8vpxSyDo5xqSAftQinyI05hcDuDg4d
         ztpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436967; x=1726041767;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbsiPwHzdU7yQfw0bVfDw6SqwSWkWnRdJycvBly0WUw=;
        b=SY8TAXbVB9+U5SRuoHVlA3laV3SXeo8JUcCRHMviJ7ndjXrY+No4+Y4ZNorWdKYOrV
         Szxue7a1jBjvZRgro6TwN9OMCb+uDE7EFOvZ8Ei05knwMULJiOM5J2LH1v4iZhH1mRo+
         3p0n5qBILivW7kue9b/pdcuofd8xuoxeHNCB1HF4Y0U0RmfY0IarwOAyUun+WgAQ79f5
         Asa9BuC500kQY0aGzQTskzg5lD23cvsokfnIy0dsWpuZoxUL5kYPyd6b92keEiI33b3U
         jrrpbBZQLd/k9tyFybgl3mjIyjmgWpSmU9e8aztGRttn87+RjulfQh+P/jXbSB1YBC5t
         7UJA==
X-Forwarded-Encrypted: i=1; AJvYcCUXl44W3xqdUdkces75gz3GxLZFtJDLiCDXsxDQYbKFlYcBZpZPYV6tU4PnK89XOvkwZTMTK7xePC0hlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBgKMpzwSjKlIjjSOjU7VbufMA0lWSURu/iFv2sm8XCMiUY7Fa
	iAJl5EwZ2aBOOuxEmiDIesziZE/qqQ/UhzARXuoHZVEXL1i6w42OxJocZ5Y0jhY=
X-Google-Smtp-Source: AGHT+IGyDGx5cm2clgCM+58D1DQI6ScWGOORu/UwO/wHkk24NWcrYuEi0RVx30LWqkM6S3wJfZbhMA==
X-Received: by 2002:a05:600c:4512:b0:426:5e8e:aa48 with SMTP id 5b1f17b1804b1-42bb01c1ff9mr187146885e9.22.1725436967102;
        Wed, 04 Sep 2024 01:02:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b9859486sm12993928f8f.111.2024.09.04.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:02:46 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:02:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nate Watterson <nwatterson@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] iommu/tegra241-cmdqv: Fix ioremap() error handling in
 probe()
Message-ID: <5a6c1e9a-0724-41b1-86d4-36335d3768ea@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ioremap() function doesn't return error pointers, it returns NULL
on error so update the error handling.  Also just return directly
instead of calling iounmap() on the NULL pointer.  Calling
iounmap(NULL) doesn't cause a problem on ARM but on other architectures
it can trigger a warning so it'a bad habbit.

Fixes: 918eb5c856f6 ("iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 03fd13c21dcc..240b54192177 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -772,9 +772,9 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
 	static_assert(offsetof(struct tegra241_cmdqv, smmu) == 0);
 
 	base = ioremap(res->start, resource_size(res));
-	if (IS_ERR(base)) {
-		dev_err(smmu->dev, "failed to ioremap: %ld\n", PTR_ERR(base));
-		goto iounmap;
+	if (!base) {
+		dev_err(smmu->dev, "failed to ioremap\n");
+		return NULL;
 	}
 
 	regval = readl(base + TEGRA241_CMDQV_CONFIG);
-- 
2.45.2


Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21E812EBC4
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708094435; cv=none; b=VVH5OZ5RYZYQqRvWx2zLpQ7JoIP3Cl/NbqkKZDRXloKPyv2b1uPaA2sV2tynS/7jU6lFbqsZXcWDKzZOjvAuBBURhw1/d/JLyFdPw70mnFYDO5C3uWAT61m3AaoG9yhV3K2yM6w6khywooXGeglngeeCap45E3P8irsbxpLxfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708094435; c=relaxed/simple;
	bh=VhhgxqgxNna3VDXzGb+u29de1zzuvgOHxd0eRr4Za/8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=AC4kjSUEZVflTeWyNEnvIS8utMYBNRJ5brYV1ZELiWx5zEe4bmDWFcWMkduayk4E6PvUZ+i3yh4d2/WlDEnmYeFmnRR+LNt1zA+IVeRTSj6yS9FyYn5T3bKD69VrC6d3J15YrSqHK5OhyHETZWdwePF6DcDgyl0lW/KOE8O44eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6vRSD4J; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6vRSD4J"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3dfb2e03e7so39043866b.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094432; x=1708699232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRC42YbuNYRdIwcaj+US8j1sKLD+6CzDw3sU7mb37/4=;
        b=C6vRSD4JJq5VeMpEP/qRigg9X6R76yWVZMsOrj+Tc1BoLlL99PJRhdXCL7JfIyG5GX
         jCqYQWrKDtOxbjTqzp6frBGY01m/xc0MIHJ5tsq7llV9AxClh/BJH1UexH15Fbrn6jj/
         1ta6q/qIsSOO8XZIMNWh3LjtVanF5H6mCeRsxOzxGNcxH3e7ydzkfp880eOUEdcqf/Zi
         0DrgV7iwPy6YcfTijX46hkS8bSz5xioYPguXBptI40L1ZCfSNdNvbfBkvMuN/Y7Vzkkp
         nYTbWV4wGHkvdigTBChx/xitB18De9uMjTYTUWAgwfE3ZLMkJcLp7kbAfmc3JXapjIGO
         laUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094432; x=1708699232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRC42YbuNYRdIwcaj+US8j1sKLD+6CzDw3sU7mb37/4=;
        b=XXGl2esH4xg2t9ftF3HnbcpbnFjctblfZzlWixQO9Ev715iKSr1STJhqdS5X21ZvLj
         q2srjtx23ouAJ6IfpB+tuyQ/DY6cAdAXlQThQCbPAnjKWJUFNw2WY2tx3ElVOZMN37O0
         qFvwQb7arhM8aYU4aMVXl3Ss3xdjFeeu+xoI3gPbdmQOdfzM3ISVdJ4aFFnWeNmtirx3
         HAGk7y0qr1CiKZ9mhl1jn9dTkUHhVeWwRFAgbkpIHBOJC+bzKGRuqpULTYFGD/mwCf5j
         wI7xHGJoG4NSoF2+cqm3GmHKkWVVcO+ryKkZbtoMBStGNbKwN7NQxqy3K/hbOwigkDcJ
         JQcw==
X-Forwarded-Encrypted: i=1; AJvYcCU5szTX4Qs45nvo7hPGcr6jNqjB90xztsS8OIzhRd4jy8LkmsMg3rGZfHRMAnoTcYU76OnV0uo+1HduGcKCZ2ujJzHqR11AxwVDLyY=
X-Gm-Message-State: AOJu0Yx+eIfQx76YUntg7jG0Qe7FdtW3FStS3pqBh2DFygJThMEq1I/K
	jPPHbf9TtqbIMvGUAN5NToXTgSSM7jTZ9RBJObUG6qJ98K9mx1fb6z7uzmzWPpM=
X-Google-Smtp-Source: AGHT+IHf//9yt3eTnyw6VXgXdUG6tjNHVGPCN0at0VvNZn01LUmWCi7a4swsg2sOshpZkHrmmM9UNA==
X-Received: by 2002:a17:906:185a:b0:a3d:994a:791d with SMTP id w26-20020a170906185a00b00a3d994a791dmr3667044eje.59.1708094432164;
        Fri, 16 Feb 2024 06:40:32 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b00a3ce3c5b2a4sm1592942ejp.195.2024.02.16.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:40:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH 1/4] iommu: constify pointer to bus_type
Date: Fri, 16 Feb 2024 15:40:24 +0100
Message-Id: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make pointer to bus_type a pointer to const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/iommu-priv.h | 5 +++--
 drivers/iommu/iommu.c      | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
index 2024a2313348..5f731d994803 100644
--- a/drivers/iommu/iommu-priv.h
+++ b/drivers/iommu/iommu-priv.h
@@ -21,10 +21,11 @@ int iommu_group_replace_domain(struct iommu_group *group,
 			       struct iommu_domain *new_domain);
 
 int iommu_device_register_bus(struct iommu_device *iommu,
-			      const struct iommu_ops *ops, struct bus_type *bus,
+			      const struct iommu_ops *ops,
+			      const struct bus_type *bus,
 			      struct notifier_block *nb);
 void iommu_device_unregister_bus(struct iommu_device *iommu,
-				 struct bus_type *bus,
+				 const struct bus_type *bus,
 				 struct notifier_block *nb);
 
 #endif /* __LINUX_IOMMU_PRIV_H */
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d14413916f93..170329a085b8 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -291,7 +291,7 @@ EXPORT_SYMBOL_GPL(iommu_device_unregister);
 
 #if IS_ENABLED(CONFIG_IOMMUFD_TEST)
 void iommu_device_unregister_bus(struct iommu_device *iommu,
-				 struct bus_type *bus,
+				 const struct bus_type *bus,
 				 struct notifier_block *nb)
 {
 	bus_unregister_notifier(bus, nb);
@@ -305,7 +305,8 @@ EXPORT_SYMBOL_GPL(iommu_device_unregister_bus);
  * some memory to hold a notifier_block.
  */
 int iommu_device_register_bus(struct iommu_device *iommu,
-			      const struct iommu_ops *ops, struct bus_type *bus,
+			      const struct iommu_ops *ops,
+			      const struct bus_type *bus,
 			      struct notifier_block *nb)
 {
 	int err;
-- 
2.34.1


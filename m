Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674685;
	b=t/jGseQem9hQthohCe7/TQAaJMRI0q0X3bmX+w8wYPxT2jJLrwd73XIBZ8sAlZ+ADbbv
	 pvJAdnhq7l9b7lVsZG7hr7QuwJ3fU2oWVkpA8DR3CM2bAGlzkj3PkDh+Y0fFjbs+uya3s
	 zjDnXKpGSwY+6BAMTshMZs9MssxwOowKCUDVdm+g3/UOYmEFndop98ChZPTBIosb1LL0d
	 Abg4JJzprd0ybdZJOwki/1qTZZM4Z7UAMKHnTFNIh2BV0eiy39MW+XzlyXoXA5Kd5SSzJ
	 LyLK+5JeKy+KhU3o9s8N+Vr+A3XfF26P7b/EeZ4W96325dlSzK4UeOWn1ch4X6jYoKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674685;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jhqkkZb1xyiTM3p5mhMdriB2MfBIObVGOLjcPnfdlLU=;
	b=2jG9S4MSCAWIZtYrxxr7GvnLgJkwqSrk75UuaN1s+Ggo0e8+9q1G6XQipn+FvoHD8HVE
	 pQFi/84bzbUSAKleMU+GhCIsP+bIleSxnqv8gbIUSUOY9t6TvG56/jrCBHxI10oiQEijo
	 Dp85WnEmh1+MIrlRAvm5g+btMYKo7TyrNYAZy2FaHvFtUWOz3IbA0Yb0OuEM4JbxvMgVX
	 7iRLWBD8KK/eg7ZCFkGKcdzaOACU96an7NhDwcFBaXZrGLhl63mN9gtUTp2mtBPIiuUMb
	 IaN5KzZ5INANYjFjGskfDrxn4S0/1IMnpBBklfEc0asqF5E3ka8tDPnszKPbg1LKEtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=kKdRVnMh;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A001606A32D
	for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 06:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A001606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=kKdRVnMh
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795674681; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=jhqkkZb1xyiTM3p5mhMdriB2MfBIObVGOLjcPnfdlLU=;
	b=kKdRVnMhLNAx3/m8FI73thxYrji8lmbhW1Ch+uY6cOgkObVRyQkj6x12KHm/s2F5zpjiH+bedsfpbOKjTNaifsJmmJ7PpbxYtCavMm/fhcqRNFPZZL1+lXsLQuKBwx+BK38Wri3hE210PIgRW7U6A2g6KAqb09mZpDd05pWpxpI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R731e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFTbSUK_1795674679;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFTbSUK_1795674679 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 14:31:21 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
Subject: [PATCH 3/3] soc/tegra: fuse: Handle unknown platform IDs safely
Date: Thu, 26 Nov 2026 14:30:56 +0800
Message-ID: <20261126063057.3245315-4-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126063057.3245315-1-jiangtianfeng@linux.alibaba.com>
References: <20261126063057.3245315-1-jiangtianfeng@linux.alibaba.com>
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

tegra_sku_info.platform comes from either a 4-bit HIDREV field or an
8-bit SMCCC field, but tegra_platform_name[] has only TEGRA_PLATFORM_MAX
entries. Using the value directly as an array index can therefore read
past the array or select an unpopulated entry.

Resolve the platform name once and use "Unknown" when the value has no
valid name. Names for all existing valid platform IDs remain unchanged.

The issue was identified by Kitta automated review. Qoder AI coding
assistant was used to analyze the problem and draft this fix and changelog.

Fixes: bebf683ba682 ("soc/tegra: fuse: Use platform info with SoC revision")
Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 7d27b2aef..87df3ddbf 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -466,20 +466,23 @@ const struct attribute_group tegra194_soc_attr_group = {
 struct device *tegra_soc_device_register(void)
 {
 	struct soc_device_attribute *attr;
+	const char *platform_name = "Unknown";
 	struct soc_device *dev;
 
 	attr = kzalloc_obj(*attr);
 	if (!attr)
 		return NULL;
 
+	if ((unsigned int)tegra_sku_info.platform < TEGRA_PLATFORM_MAX &&
+	    tegra_platform_name[tegra_sku_info.platform])
+		platform_name = tegra_platform_name[tegra_sku_info.platform];
+
 	attr->family = kasprintf(GFP_KERNEL, "Tegra");
 	if (tegra_is_silicon())
-		attr->revision = kasprintf(GFP_KERNEL, "%s %s",
-					   tegra_platform_name[tegra_sku_info.platform],
+		attr->revision = kasprintf(GFP_KERNEL, "%s %s", platform_name,
 					   tegra_revision_name[tegra_sku_info.revision]);
 	else
-		attr->revision = kasprintf(GFP_KERNEL, "%s",
-					   tegra_platform_name[tegra_sku_info.platform]);
+		attr->revision = kasprintf(GFP_KERNEL, "%s", platform_name);
 	attr->soc_id = kasprintf(GFP_KERNEL, "%u", tegra_get_chip_id());
 	attr->custom_attr_group = fuse->soc->soc_attr_group;
 
-- 
2.47.3


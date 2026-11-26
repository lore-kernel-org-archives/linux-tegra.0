Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674684;
	b=iE8iCj78Q0n2/jwYIlPfoVCtJdHfX5gK1O3cRZ7qiwZvo4i2rW0C5+PRNP0Kkk1Ij1Xp
	 3t8xm2XamfaSWF+5o5+78X4+SgfKJ6E3oCkYcHvkdhg2/W/MnGDCePkw4gz/7RZxujrCy
	 fqnIgROYKwpFkGV4QKIJMe0PreEZr5FoFj3ecaNROpbKqHRra1oSBoR9NpRBL8dIuBroO
	 s7N3tXgx+F5udZCdkkp7dCBma6P4293sc1iuAdyytLfA2vvk0vYLE/ZxuuWK9pSPIp9CB
	 fxmgLOnWYWl+dawSebIHF9+riJrYtOqbkYlDGpCm6XNRpv9Yzroeao1gUzLSbK+G+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674684;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tuGCHJGZDlQsYx8nOFPalmGw6UDEl1qzx8nnX4g1lrU=;
	b=eYg7fllhV4Itmggg8BZQPNNoZpNze0H8qUpzX7cstS9aw84twbYrACazkP5/kEoYMiQe
	 dPoEqKkx6WjcxGoUnR1HlFEYrV2eWzov4Rtp3K+/MZ9PXrc4VVLU+ZPX2Rm1HI+uZim+G
	 cge9VwtZCXPB4sm2Cv+OGEUix2psdWibBMb9iUcZxSjX43Qk+joOB6jmmGmdoeRQHxqx0
	 vlvaeeqKL+HvwJ4vnunRAG/Jq5varRygcYSbsMMITMnyVyE/EUIHtbnc4afSUyxZIxfIF
	 3NcjueMCy9UEsYZBqYs8q/lRNVHer8YjfQABgpvU+pfm0Ys1swvMg5WuQBYr4HyF1Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wae10APF;
	arc=none smtp.remote-ip=115.124.30.101
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312D2606A33C
	for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 06:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 312D2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wae10APF
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795674679; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=tuGCHJGZDlQsYx8nOFPalmGw6UDEl1qzx8nnX4g1lrU=;
	b=wae10APFwu9tyc/lxWSfydniNsmMkrqHNm2hjBfthxUGP6s6KtfuE2Vm5OID4EfkwRiJco3Ul6dvjJSUJ1O92LWStXpy1iT5Uxia1dJnNosuoz+c1hAboMsEH2f9M57+CsejnNT+VWSi8HhOmV8RYNDo6jJ+SAME+VZ9QdC2B5U=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFTbSTL_1795674676;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFTbSTL_1795674676 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 14:31:19 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
Subject: [PATCH 2/3] soc/tegra: fuse: Clean up nvmem lookups on probe failure
Date: Thu, 26 Nov 2026 14:30:55 +0800
Message-ID: <20261126063057.3245315-3-jiangtianfeng@linux.alibaba.com>
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

Lookup registration in the common probe path can be followed by a probe
failure, leaving the entries on the global lookup list. A subsequent probe
allocates a new array and overwrites fuse->lookups, leaking the old array
and adding duplicate entries on every retry.

Add a devres cleanup that removes the entries and frees the array. Using
devm_add_action_or_reset() also cleans up correctly if registering the
cleanup action itself fails.

The issue was identified by Kitta automated review. Qoder AI coding
assistant was used to analyze the problem and draft this fix and changelog.

Fixes: 8a3571618c2e ("soc/tegra: fuse: Register nvmem lookups at probe")
Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 04075e2b6..7d27b2aef 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -140,6 +140,15 @@ static int tegra_fuse_add_lookups(struct tegra_fuse *fuse)
 	return 0;
 }
 
+static void tegra_fuse_del_lookups(void *data)
+{
+	struct tegra_fuse *fuse = data;
+
+	nvmem_del_cell_lookups(fuse->lookups, fuse->soc->num_lookups);
+	kfree(fuse->lookups);
+	fuse->lookups = NULL;
+}
+
 static int tegra_fuse_probe(struct platform_device *pdev)
 {
 	void __iomem *base = fuse->base;
@@ -239,6 +248,10 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 	if (err)
 		return dev_err_probe(&pdev->dev, err, "failed to add FUSE lookups\n");
 
+	err = devm_add_action_or_reset(&pdev->dev, tegra_fuse_del_lookups, fuse);
+	if (err)
+		return err;
+
 	fuse->rst = devm_reset_control_get_optional(&pdev->dev, "fuse");
 	if (IS_ERR(fuse->rst))
 		return dev_err_probe(&pdev->dev, PTR_ERR(fuse->rst), "failed to get FUSE reset\n");
-- 
2.47.3


Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B6417D2;
	Sun, 28 Dec 2025 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766930751; cv=none; b=p1/gRZZPUwEAcBWIsDGiWHsQc4ghd7tpMcuAAj8zk/r+I5/AcF+AYWjX0/P5dDhaLdcIXnvY5mP3Qzf5p33RTLFEGL6355UvYxM+bxsFWrOLeTbOx7Zx3Dwqo43tuz8CP8kCDMu0puxoH1QgQufobpdbVlRqz0h8mPuYmRk7Pos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766930751; c=relaxed/simple;
	bh=FBXfg07Vy/REELT/WtPWWE2sgR4BtVwR4C0c9lNQYTk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oZyGzsx+olH4C7MLOGH75d1BccS4FTSQYA+1kiL2AHCOf6BwJ7l2Nlq9pjaBsayUuP0bxz0vxMIBzE+I5pV3TFIUoojmf9X1joVVIQsea9BNq/ouIdoklHIY2NX6Ev8sYg2GnyGKLM/+jQIxtYUiQbqhEWmpt8Zs5jDRDFGu7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowAA3yw4rOVFpwKtAAg--.51186S2;
	Sun, 28 Dec 2025 22:05:32 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	mkumard@nvidia.com,
	ddadap@nvidia.com,
	sheetal@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] ALSA: hda/tegra: fix a memory leak in hda_tegra_first_init()
Date: Sun, 28 Dec 2025 22:05:30 +0800
Message-Id: <20251228140530.3739960-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3yw4rOVFpwKtAAg--.51186S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr1kKry3XF47ZF43WF4Uurg_yoWxKrb_Cw
	47WF48Za4UurZ2kF1Fyr1xAayFvFZakr1jgrn2yryj9FyfWrZ8try3WrW3urWDJa1vkF9x
	Xryjvr47GFy5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiDAcKE2lQ7ahY2gAAss

Add azx_free_stream_pages() to release the resources allocated
by azx_alloc_stream_pages().

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 sound/hda/controllers/tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/controllers/tegra.c b/sound/hda/controllers/tegra.c
index 6ab338f37db5..656cbd88b9aa 100644
--- a/sound/hda/controllers/tegra.c
+++ b/sound/hda/controllers/tegra.c
@@ -380,6 +380,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	/* codec detection */
 	if (!bus->codec_mask) {
 		dev_err(card->dev, "no codecs found!\n");
+		azx_free_stream_pages(chip);
 		return -ENODEV;
 	}
 
-- 
2.25.1


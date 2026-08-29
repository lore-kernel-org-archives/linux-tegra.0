Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B2F21257F;
	Sat, 29 Aug 2026 04:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787977254; cv=none; b=tgooAjjL1nj3k5qSAeYrSi/b+U4jhmACYwwlZj5a0s+vGVqutoSRZTRRaW80J625ZqHA6EFnYEAA1sWj02qp1vcp0tPzInol3NPVIUpM/ucvrXoCuD9r2Z0fibkjDd2QUPaLclMRWWVafjB2WA7++yRWIohP9H4I12W2oeQmTas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787977254; c=relaxed/simple;
	bh=NUOo5P7itQaXPFKS+Y8hDdeW53aAqqv9AJSoUQyBIBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tHvH1jos7G/oZYt8bIa5JBN9If2f4+MIaKTDQucLglgedFsM2GSzEWKp3C4UDAS200IvnOA+CES4ZbdLdHpS2lYjTmfsK/oI9m2R/BnwleTLaDlsqBBjb53NiR9WGKgADyKOM/kLTe5qVB0XOL5UozDVU9cbwtAldVn5HNeDeZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowACnrjwQXpJqceWEBg--.26773S2;
	Sat, 29 Aug 2026 12:20:33 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: dc: Propagate powergate failures on suspend
Date: Sat, 29 Aug 2026 12:20:30 +0800
Message-ID: <20260829042030.21346-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnrjwQXpJqceWEBg--.26773S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWDtF43CFyUCr4kJr13urg_yoWkWFg_ua
	1rXrykKw42gFZ8A3ZxZr43ArWIvrWDuF40g340ka1xKry5XwnrK34vgr15CF17Ja1IqFnx
	J3sxZryvyF1xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

A lifecycle transition can continue after a required state restore
operation fails, leaving software state inconsistent with hardware.

Propagate the failure and unwind state acquired by the transition so
callers cannot observe a false success.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/gpu/drm/tegra/dc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0b3fcc7011b3..bac78b57dcff 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2878,8 +2878,14 @@ static int tegra_dc_runtime_suspend(struct host1x_client *client)
 		return err;
 	}
 
-	if (dc->soc->has_powergate)
-		tegra_pmc_powergate_power_off(dc->pmc, dc->powergate);
+	if (dc->soc->has_powergate) {
+		err = tegra_pmc_powergate_power_off(dc->pmc, dc->powergate);
+		if (err < 0) {
+			dev_err(dev, "failed to powergate partition: %d\n", err);
+			reset_control_deassert(dc->rst);
+			return err;
+		}
+	}
 
 	clk_disable_unprepare(dc->clk);
 	pm_runtime_put_sync(dev);
-- 
2.43.0


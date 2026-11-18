Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976273;
	b=aYZdXWManfUk2Y65IGjH8XXgLwxWcDMXcHCMLDdQAbp+Tdayx6jpqxHpQIf3YBhR8YR8
	 rZOG/e+5MesMfnrZ6hoxPg59KvXI+k8W7RCPUB0CH4u5xVKQBuzsZpY2Qt1l2Xb7oggl3
	 ChGjMBLs77Ood6a69XphIw2h0+1YIUDq4TkJKAbrKh3bwP+LMf021qqoksetdpDhe4iJR
	 cVkY5ZLXfE1lQ2bpCsP7aegOowFVwfBwBrK0z+O109Mv9IPv6QC913Scd0iD2KCALLGSo
	 /foySmt4c3htFEwG/er7xwRXUx/BePrXP6duuXrQF/opzL0pYjOnof2odfISqTQ1fgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976273;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=aJYpWdcwgjtrJCmjq6LAdZfDq9Q8xYW3XVZLxaRVNPA=;
	b=eefkXWrIkYjuaSQTFrkCyEP1i86d8nKLpDHXvk1SIKoFDL5m68IRJ4HCUgUxJrknaZIh
	 qZ2IZfe7V8RCemFNXcm0BvxdBnJETPHH830L7135ISDbg24rw1zBy+2EXXHcuskgdavEN
	 IoNxJElqzGRy4XkO255zXZYcQXpC9tKf/nVurOq0BwvaRikTkFRK49R/sljSYkusHxQUz
	 SViuW2ERxa3mbCBUGXpAebt9eaMuTFWLj6ueIok038tKDaM/WgJCSyKeL0YcsnFrvdFnH
	 3lVKHowOdhFUaTp7YbSQnpvkjGbJhDS82SB0q/SxPhK3niwZw53b2pl+euS/yiMVPaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCE7606A31C;
	Wed, 18 Nov 2026 04:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAXJpcMKv1qe_tFAQ--.33934S2;
	Wed, 18 Nov 2026 12:31:08 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: tegra: AHUB: Remove unneeded semicolon
Date: Wed, 18 Nov 2026 12:30:43 +0800
Message-Id: <20261118043043.616702-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:rQCowAAXJpcMKv1qe_tFAQ--.33934S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXFy7tFyUuF18Grg_yoWxCrg_Cw
	40gw4xX345CFZIkF98Jr4Iyw1UZ3y3GF4fKryjvFsrW34UuF4rZryDWr17urWUZw4vyFy8
	Xa4jqry5Ar4agjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUHpBfUUU
	UU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/tegra/tegra210_ahub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 7abfa07f227a..3deaa599f53a 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2448,7 +2448,7 @@ static bool tegra268_ahub_wr_reg(struct device *dev, unsigned int reg)
 			return true;
 		default:
 			break;
-		};
+		}
 	}
 
 	return false;
-- 
2.25.1


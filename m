Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226821B21BD
	for <linux-tegra@vger.kernel.org>; Sat,  6 Sep 2025 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757155842; cv=none; b=TzLhvRL/3Df/gDcd54qBs0tYmRjc/iJ80l4V1rwnCsJJahLfoN1GBlVFY4SNfHRzosx0nNTL1xq1qjXWbiIVf5Xh5olSDVVZnaEOenOSs4UTWhAyZz5l5/7oq/sKd4iaYf11J7VNYlVh3InvP0h92RD6yDPmSNHHGmxvTvSmw70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757155842; c=relaxed/simple;
	bh=Vqi8LhwrQkAuuDQg3G5GLZLGIK3VE0xEfeM7lMhRMkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n/p/rnmewkqUSX8IdbcPt8JEMTUjss672Oyf8ggJM2HOa+7+hwQtq/y4TC3Bt0evXFHMy/zsZJWPxW9DNlw3vaInn5U6TufgW68iME1Hvt+5q/KwEtbT7VhzE2joWxp4OVegrNO9qRQlM54LjZZ6eah9MaxMmQCajgk+n40WbuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn; spf=pass smtp.mailfrom=iie.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iie.ac.cn
Received: from localhost.localdomain (unknown [159.226.95.28])
	by APP-05 (Coremail) with SMTP id zQCowAC3WRP4EbxopWoOAQ--.48314S2;
	Sat, 06 Sep 2025 18:50:33 +0800 (CST)
From: Chen Yufeng <chenyufeng@iie.ac.cn>
To: thierry.reding@gmail.com
Cc: jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	Chen Yufeng <chenyufeng@iie.ac.cn>
Subject: [PATCH] soc/tegra: regulators: Fix locking up when voltage-spread is out of range in tegra20
Date: Sat,  6 Sep 2025 18:50:21 +0800
Message-ID: <20250906105021.721-1-chenyufeng@iie.ac.cn>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3WRP4EbxopWoOAQ--.48314S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy5tryrGF45uw17XFy3XFb_yoW8AF1Dp3
	93WF9xCrnxAa18Xa9rJ34Iya4rA3sxZF4IgwnYkr45Aan8Jay5GFsIvrW3CFZrJr4ktw1I
	yFyUJa48Ka1UZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUgiSdUUUUU=
X-CM-SenderInfo: xfkh05xxih0wo6llvhldfou0/1tbiCRAREmi7kivv-AAAsj

This patch is similar to ef85bb582c41("soc/tegra: regulators: Fix
 locking up when voltage-spread is out of range").

A potential deadlock issue exists in the voltage coupler code for 
Tegra20 when the voltage spread (voltage-spread) goes out of range.
The code does not properly account for the maximum voltage spread 
(max-spread) requirement when the CPU regulator has no consumers.

In the tegra20_cpu_voltage_update function, the voltage range is 
not properly handled when there are no consumers:
```c
if (!cpu_min_uV_consumers)
    cpu_min_uV = cpu_uV;
```
When there are no CPU consumers, cpu_min_uV is directly set to cpu_uV, 
without considering the maximum voltage spread constraint.

The issue is resolved by introducing the max function to ensure that 
cpu_min_uV is set to the greater value between cpu_uV and cpu_min_uV, 
thereby preventing the voltage spread from exceeding the limit:
```c
if (!cpu_min_uV_consumers)
    cpu_min_uV = max(cpu_uV, cpu_min_uV);
```

Signed-off-by: Chen Yufeng <chenyufeng@iie.ac.cn>
---
 drivers/soc/tegra/regulators-tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
index 6a2f90ab9d3e..48c29b89fa59 100644
--- a/drivers/soc/tegra/regulators-tegra20.c
+++ b/drivers/soc/tegra/regulators-tegra20.c
@@ -305,7 +305,7 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	 * survive the voltage drop if it's running on a higher frequency.
 	 */
 	if (!cpu_min_uV_consumers)
-		cpu_min_uV = cpu_uV;
+		cpu_min_uV = max(cpu_uV, cpu_min_uV);
 
 	/* restore boot voltage level */
 	if (tegra->sys_reboot_mode)
-- 
2.34.1


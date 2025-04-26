Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EE15661;
	Sat, 26 Apr 2025 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672096; cv=none; b=Qf9Uv2IWzCf7PfeUgIw5NM86U/q3dLJu+ozW4Jw7yhyE0Z4eIEPoELVLe6f8g+NAS4HIXYJkuc1j2xXAaG2zQbRST0VJ9qzgBQ1tIsayNnSt0i18AtTvLow8/YfnRe2mrymcnqo54D4DcRfZreReeYsV2mzUHodPQb19i/GpIxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672096; c=relaxed/simple;
	bh=qbqKmJyaTbaUBHuw1e5uY4FwjJY7zF+2e5++z6J+52E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y5EWbvQxkn72cRdjrYk1Zv9oGvaf5Gx6ZYdS5x8REuOHFOzRGxAXLB1Wy5oXeUVzl8e+3ejd080yL4Reu/pAdb8Rz0g14SbwxdSCALvm145bbgMSjMWu2+3Q3GN2WE45oSQgUQbiQMqUzu+KhOkmzV+GGz8/0XkjB4fvfA68mgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=MlJea2bk; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="MlJea2bk"
Received: from fedora.intra.ispras.ru (unknown [10.10.165.5])
	by mail.ispras.ru (Postfix) with ESMTPSA id A16B740737DD;
	Sat, 26 Apr 2025 12:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru A16B740737DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1745672083;
	bh=0RV3L+Qf5fQ1ETxGFcMm68u6hLC3r2iQrxdAPrtncRw=;
	h=From:To:Cc:Subject:Date:From;
	b=MlJea2bkXDqiv78LxsFaG/nXcXqeG/lf2vG6hjST/ahT3PkEtxyrs6c5zXpjPqbFx
	 YCpEriB5fDgczX7qCy4HPkT0TZUN+Dg/acGOEaMrlaLrxpS0oCr+B9lnlBzhrhAbhH
	 WBpqDq3/mO6n3lTKYmGRLVs9gcg9JBXHwbnQ1eTw=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Michael Turquette <mturquette@baylibre.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Timo Alho <talho@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] clk: tegra: do not overallocate memory for bpmp clocks
Date: Sat, 26 Apr 2025 15:54:28 +0300
Message-ID: <20250426125429.31838-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct tegra_bpmp::clocks is a pointer to a dynamically allocated array
of pointers to 'struct tegra_bpmp_clk'.

But the size of the allocated area is calculated like it is an array
containing actual 'struct tegra_bpmp_clk' objects - it's not true, there
are just pointers.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: 2db12b15c6f3 ("clk: tegra: Register clocks from root to leaf")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/clk/tegra/clk-bpmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index b2323cb8eddc..77a2586dbe00 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -635,7 +635,7 @@ static int tegra_bpmp_register_clocks(struct tegra_bpmp *bpmp,
 
 	bpmp->num_clocks = count;
 
-	bpmp->clocks = devm_kcalloc(bpmp->dev, count, sizeof(struct tegra_bpmp_clk), GFP_KERNEL);
+	bpmp->clocks = devm_kcalloc(bpmp->dev, count, sizeof(*bpmp->clocks), GFP_KERNEL);
 	if (!bpmp->clocks)
 		return -ENOMEM;
 
-- 
2.49.0


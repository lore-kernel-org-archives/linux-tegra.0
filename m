Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4941D1311;
	Fri, 30 Aug 2024 01:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724980535; cv=none; b=AFttqhD3Yq8McoEJK2heVy/JWywfpz+lXTxv+TVHZ5mpgRQsPZBfXdQFnmBTf4nnnXdw2b87qv3iPDFviN3nMXgwBxHGxh3gq9nALj/WZbHDM0w9QhP9AO2t6Lx7OBCj4BXfCJjLNGx51Ry1A1mUa3pOXcKEQgz7059ecC7MW7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724980535; c=relaxed/simple;
	bh=dZAXB6ml4dh6DLUw1ewhDva6jE2g3f6j9n/MCya7Qoo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kXdnfzUbP7kyoUM+aGT6BGNGdzg5rLgjyqE44G4NcdNNu35C6ts/d2121UkUABtOO1vtMNnT51HdMC6rY4K2xnSdY1UxSpJdWWVJj83BUoY+7Iq2Zuj9oa3QRT6cLXI5DkCcUu7i1BPHc7Dy2OWMLv66HsTYonQEPqHDfmWsObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ww0XF1cx8z1xwfM;
	Fri, 30 Aug 2024 09:13:33 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F608180042;
	Fri, 30 Aug 2024 09:15:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 30 Aug
 2024 09:15:30 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>
CC: <lizetao1@huawei.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: [PATCH -next] clk: tegra: use clamp() in tegra_bpmp_clk_determine_rate()
Date: Fri, 30 Aug 2024 09:23:44 +0800
Message-ID: <20240830012344.603704-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500012.china.huawei.com (7.221.188.25)

When it needs to get a value within a certain interval, using clamp()
makes the code easier to understand than min(max()).

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/clk/tegra/clk-bpmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index 7bfba0afd778..b2323cb8eddc 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -174,7 +174,7 @@ static int tegra_bpmp_clk_determine_rate(struct clk_hw *hw,
 	unsigned long rate;
 	int err;
 
-	rate = min(max(rate_req->rate, rate_req->min_rate), rate_req->max_rate);
+	rate = clamp(rate_req->rate, rate_req->min_rate, rate_req->max_rate);
 
 	memset(&request, 0, sizeof(request));
 	request.rate = min_t(u64, rate, S64_MAX);
-- 
2.34.1


Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384A33C060C;
	Tue, 26 May 2026 06:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779776026; cv=none; b=gE+6JBk7AQzQi+CWWWlsEcCmgMAtq/6RRkAkKMs5xH7EEdKHbCVJsE0z1qXXTuoGbF4PyC6nX99CKeY81+BJw12WZrqgCLnyxYmg5kR+WJISK8fpWJ+QKpe1G497eFX+2w5FiLy0QGJ5mpSclgUue1f7Sjir4SMH1GvkMZd3/6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779776026; c=relaxed/simple;
	bh=GrHFpELXT1ZEnXH3wpbf5nHyzQir3GZ3lq9NJNEFEEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ulj2N5tUkmThO65l9uWzR5w5U3WdiXQ+yecpByzxdhh76rEYTlNQpAN6bqLGE6ycnsqOr0f7V35X5UqP93tMt3DqbYeYpPGqFBukfHu8qfBCzhR8L+QKLFxVEP9d8Oj+0FqNmDv/oesDkqIMqyw+UGkLPLG4PSWYt9mRYZW+xxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=ZX41z1yx; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="ZX41z1yx"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=GrHFpELXT1ZE
	nXH3wpbf5nHyzQir3GZ3lq9NJNEFEEQ=; h=references:in-reply-to:date:
	subject:cc:to:from; d=al2klimov.de; b=ZX41z1yxM6N+G3A4V4Gh7niib3uEqOJa
	Ipquqlj/9PX1q+9RHd1c3HmcqiFy0HwsrvJOO/SwdgMaQtjkHJKv7X2ZSF1lX34xG/fl/G
	Oc2tIrUmGoVDuunaP02aM33JM+gOycdzvA+1uGKs/tFNa/FY9dH716NO2RNQFpIzs6qNBA
	P9gRNF2O/iP0/0ZkmYn/+nnc56du2wzyDip9RMHAvYj8kGhUSxMX0OUxBXi4r1x8FBxeGa
	RMRRGbXf0hXWhYfCe/Ed4+h/SW6JmXRTRnCDGi7TAERS/3jWJ8/DvQ7JTWgqwbI1iDy2U1
	9bKnW10f1FZH/AVHDwzP/qjag8J64A==
Received: from cachy-ak (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 4e3f1903 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 26 May 2026 06:13:38 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clk: tegra: tegra124-emc: fix krealloc() memory leak
Date: Tue, 26 May 2026 08:13:13 +0200
Message-ID: <20260526061321.6123-2-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526061321.6123-1-grandmaster@al2klimov.de>
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't just overwrite the original pointer passed to krealloc()
with its return value without checking latter:

    MEM = krealloc(MEM, SZ, GFP);

If krealloc() returns NULL, that erases the pointer
to the still allocated memory, hence leaks this memory.
Instead, use a temporary variable, check it's not NULL
and only then assign it to the original pointer:

    TMP = krealloc(MEM, SZ, GFP);
    if (!TMP) return;
    MEM = TMP;

Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index f3b2c96fdcfc..8053fbbb06c8 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -446,14 +446,13 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 	struct emc_timing *timings_ptr;
 	int child_count = of_get_child_count(node);
 	int i = 0, err;
-	size_t size;
+	size_t size = (tegra->num_timings + child_count) * sizeof(struct emc_timing);
+	void *mem = krealloc(tegra->timings, size, GFP_KERNEL);
 
-	size = (tegra->num_timings + child_count) * sizeof(struct emc_timing);
-
-	tegra->timings = krealloc(tegra->timings, size, GFP_KERNEL);
-	if (!tegra->timings)
+	if (!mem)
 		return -ENOMEM;
 
+	tegra->timings = mem;
 	timings_ptr = tegra->timings + tegra->num_timings;
 	tegra->num_timings += child_count;
 
-- 
2.54.0


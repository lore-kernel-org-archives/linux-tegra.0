Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA6E336EC9;
	Sun, 31 May 2026 19:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780257239; cv=none; b=pQgoHZr9d0ylskuMMPwA/WmLKMhxyImT3p4cIyn6y/Q+D8XYCDKaBSXqcR5fE6eoMAUmSGmUsvtdjfAUr1gYS0aEo91ZhQmXTWegneZQ/N8jZuzUYnz5f+eFeDBptT1UjbXGjgiItIhedTywzho3soKO0GByQ1tyZGO9IPHftyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780257239; c=relaxed/simple;
	bh=Ok/76h30j/DmvaFJRXEZMciSEbTzOAQ8fJQk/r2uSxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jVLi1LZ40vnUo2QYl+M+I1xmxjGVli738rPn64rjmRaNtlzxKvV+ow6ii559ZMDoNIVJgsAhMPc9GF+wVWCODlr9seSg216DTljey8kan1P/P4q+lEfpRQFmx3RBlf3V+TGkbrT9aWG5+VrIOodmtT1AbteJKu+5TNexymdT4KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=nhzGi4aF; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="nhzGi4aF"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=Ok/76h30j/Dm
	vaFJRXEZMciSEbTzOAQ8fJQk/r2uSxI=; h=references:in-reply-to:date:
	subject:cc:to:from; d=al2klimov.de; b=nhzGi4aFbFe8AzSSxgqwxtnVbDaEQKhY
	UuW0dLmKB+Ed2AvOPyxX8V0I29TV5gEhj6RNEzams4iu4gkPVNtrbRDzNlRDaQYd0qWHez
	J1OCflCE71eDi5xGfALWmhlnhQW8CwcfQd6GBHZxaTfozcLIJw3cBrG8PpteGHgTG3dvEv
	qRDo3gOsnFlPNUEy1R8CPHM+0DSw0XqgppjfziiVeht9FEFIrasJJTifoV5VZZ17hrWpvK
	GvO7AiOypPt9HwlT/WmqHVyrrqGJ35Y0aMdq84SGm0HF8tG3jJuYaitYGZN++6XJ1ROvfz
	V7pCOvXbM5PrTM318LJTUqyfI0NCrA==
Received: from cachy-ak (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id af376ef6 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Sun, 31 May 2026 19:53:52 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: 
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH v2] clk: tegra: tegra124-emc: fix krealloc() memory leak
Date: Sun, 31 May 2026 21:52:52 +0200
Message-ID: <20260531195313.99447-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ahilgKKwkttOd9H6@orome>
References: <ahilgKKwkttOd9H6@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 v2: Separate variable declaration/init
 v2: While on it, enhance variable name
 v2: While on it, explicit variable type
 v2: While on it, re-order variables (reverse Xmas tree)

 [✓] scripts/checkpatch.pl --strict
 [✓] allmodconfig compiled (i686, LLVM)
 [✓] localyesconfig booted (IBM T43)

 Note to myself: use --in-reply-to=ahilgKKwkttOd9H6@orome

 drivers/clk/tegra/clk-tegra124-emc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index f3b2c96fdcfc..81e4c02a807c 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -445,15 +445,17 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 {
 	struct emc_timing *timings_ptr;
 	int child_count = of_get_child_count(node);
+	struct emc_timing *timings;
 	int i = 0, err;
 	size_t size;
 
 	size = (tegra->num_timings + child_count) * sizeof(struct emc_timing);
 
-	tegra->timings = krealloc(tegra->timings, size, GFP_KERNEL);
-	if (!tegra->timings)
+	timings = krealloc(tegra->timings, size, GFP_KERNEL);
+	if (!timings)
 		return -ENOMEM;
 
+	tegra->timings = timings;
 	timings_ptr = tegra->timings + tegra->num_timings;
 	tegra->num_timings += child_count;
 
-- 
2.54.0


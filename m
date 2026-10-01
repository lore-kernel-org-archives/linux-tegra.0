Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1D6366051
	for <linux-tegra@vger.kernel.org>; Thu,  1 Oct 2026 05:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833629; cv=none; b=qGUvQBXRS+XL8WPBDp7RfiwOtv6i+N4/rplx+auaPOtR/5Pb9nLBXYGv655HXLOv34YI0jt/m4TsfX2h1lge+eNur4+yo/j0SzBa+nnDjX0N5ZjWthTuA6ABSTbLY+ND2tsUo//b50rc3cKiXBD/TCh4/joa9hxS4DNvIQWfgPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833629; c=relaxed/simple;
	bh=J6CDJfDrHs9Xh8xm7mF4JVU7BUMT89ttkfJpwjj06p4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foL9YK5b2D/bC9yYsogMG7jJz2C+dcVvaYF6KYF0EIEFoiQTYY3aMmmhSpahmR8FJAXY2KSw2hW949cN4ivli23vXQpMiqztrpTetQfeuxtjShO2N9Pxk1wRjgY5IHrzRnSoja+KatzupwTHqhokNNDGLaBeQlo9uK3uhlnXYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwD7LtRm; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwD7LtRm"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93c599e3902so552058185a.2
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 22:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790833627; x=1791438427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ole5s+LPcjnPZwgGNmuzsjKHTKb0fD2/ZAwdN7H+e4w=;
        b=EwD7LtRm+QdsLN1rVB2nV3oa6TUh8JPA1zIm+wENinQnq2/v3jIg8EaMTubh55Hw/J
         3qmBgpeBr6dqyLkR5c+judV5Psg48LOKCNZr3iIFKaHCO9I1x3uArM/vYmAmZfhhmlVQ
         p0mXjsR1ff4P31r6fw5UfnzO2kG7CYaC8VILjnh0ak1Mbrps5CJq4NtZAIUhRr6/R3sT
         G2E6ToaR3bcs9b/u/YWTVkygA3RhmP22AG1ZcMbs1WTZbsswnkUbqeNS0fesrXEWZhY3
         0wY723tmJvqPxOsy7SWBC2FB1yc6xJI+334CnTMd3Qp5FUAkXHfTrUn6ScZ8ytj+UyQC
         UiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833627; x=1791438427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ole5s+LPcjnPZwgGNmuzsjKHTKb0fD2/ZAwdN7H+e4w=;
        b=Es1MEfQYnep+lGZkt3CkcfPO2Cijkn8OWKhZqDn2gLqeMowCXH6l2Q28zbghhNDfsp
         B/qD6NPyyECmdHlfrVpJ8AyE5c+m3uN4ZrY4uNv6UO6h/qgoyZ4jhxdZtX+kiZRY8GFE
         lkb5zZw+Lwi66ECHbkJhuxO78Rc6dg4kpB6iF7FgdEXS+LeYOHwDZqYURBggrqhQBPTy
         hx2JQjd4JinSSqa4JyF4NAUkCy/PpIiCoX0TYYGmW5rvGCzczVJzhPB+XSaDxaJ42T2Y
         /j+mR3q0UFKURFtXWse8+9k0kynH+6K3HI2aOv0ZR4q9AYj+eYFVyPp35SYndjxbbStp
         tNwA==
X-Forwarded-Encrypted: i=1; AKwUvBySnZrGRMxLPcoaVnKXwI0sZDYpDlJqOG+ED6Bp18ShYe57NrRAafv+W6fWGqfFv2DxKMngqvIG5XKR7Q==@vger.kernel.org
X-Gm-Message-State: AFuF++n5zVPIkp7VOWogzyg7f0qK9+gK6XluOjgl3/c/jkDzLqsjfjHp
	4YKUwpxf8aG60pa1N0vVL2uiuitjAJpCyj/6VTsy4n0POpjGuSwu4ETw
X-Gm-Gg: AYBFou3Brhw7YuogMXLgzsaNR7vA4J16YDYgCdm1kV5c0P/AyDH5bbbsjqkCxd5F8W1
	aMV9JW2zVlx2+Hde1l14JGRQRj8e9szaxw38xu19n27Qtl8Uyf1ESYxt6qhgiBDWSoDuqa6eR6Z
	+NPCU7peZIoqIXhJJ1d6jUhGiF/rYBm37BXoUt9Zm6RJj6nmKZCF0+jLcV1Jf256CpV9sKvvxj1
	6AP7K7hJanwHmIZpvFIv71dKLwx0EJS0wEcbvQclZTA2+bolPE5byxs98i1g7LH2OU3X8XE05zV
	cFdpVlDRZoXSBZd5Mn+p9Lj0JqXFIc3GQcPcw2DgYR/OE+C8mLqiAMbHRZ9OqaMQW6W+591ii89
	IFlSNN8zoJHnKemBSuMC9Xu+l9Z9IMz9D/n7UJELpr4gXjSMNaGS257cT7b+VpwsEt60JrgjNdj
	gX3aT10rWNP1eFWf0CGo/JNalqPFZNGh6NLIyRHCIBfoZrvBwHbEjk90h79mEEjgxI0pm3S67Q1
	S6EAh+4PskPHjcqTrd4u1Imt/gO+RERU635xEpwBlk4pqVG0dfel2sMQr+rQT65IjrPg25evAtS
	v1ySrjR092dpfF/N7yeHQphHqr9zHx/6LNgCOuQUzrhLT2eEt5uy2aHDpmke
X-Received: by 2002:a05:620a:2b96:b0:93c:7b3d:38a9 with SMTP id af79cd13be357-93ca94f6521mr633545385a.2.1790833625365;
        Wed, 30 Sep 2026 22:47:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cb64eb59esm140040785a.22.2026.09.30.22.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:47:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH v2] clk: tegra: bpmp: remove kcalloc
Date: Wed, 30 Sep 2026 22:47:01 -0700
Message-ID: <20261001054701.39160-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to avoid allocating separately.

Use __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix subject
 drivers/clk/tegra/clk-bpmp.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index 067a8555c4e7..15b976162b59 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -32,7 +32,7 @@ struct tegra_bpmp_clk {
 	unsigned int id;
 
 	unsigned int num_parents;
-	unsigned int *parents;
+	unsigned int parents[] __counted_by(num_parents);
 };
 
 static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *hw)
@@ -518,20 +518,14 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 	unsigned int i;
 	int err;
 
-	clk = devm_kzalloc(bpmp->dev, sizeof(*clk), GFP_KERNEL);
+	clk = devm_kzalloc(bpmp->dev, struct_size(clk, parents, info->num_parents), GFP_KERNEL);
 	if (!clk)
 		return ERR_PTR(-ENOMEM);
 
+	clk->num_parents = info->num_parents;
 	clk->id = info->id;
 	clk->bpmp = bpmp;
 
-	clk->parents = devm_kcalloc(bpmp->dev, info->num_parents,
-				    sizeof(*clk->parents), GFP_KERNEL);
-	if (!clk->parents)
-		return ERR_PTR(-ENOMEM);
-
-	clk->num_parents = info->num_parents;
-
 	/* hardware clock initialization */
 	memset(&init, 0, sizeof(init));
 	init.name = info->name;
-- 
2.55.0


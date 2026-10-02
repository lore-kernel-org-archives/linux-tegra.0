Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0A47533D
	for <linux-tegra@vger.kernel.org>; Fri,  2 Oct 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932606; cv=none; b=YBcL9ftsyBCtum1yYMp3XtpC7VOk0JPcQS74LJOU4BORktTnFNJ0TV0pqvZs7dVGS5Bwy1YtbxlMZFF5yhweSxU8iUay/pa2KkVs30IXx9m41cEilfYaOzjHi+P7WRPfkFfzYSbj42lxmPfBYNPukWJWvMfDMfibF5aavxFFn9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932606; c=relaxed/simple;
	bh=7MTql/gURkERAdxMCy1kIGmv5mN/mQeQk1H0lLfcG8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OR6pLGIGaeKLEmmWF0jeEwcVUa31HFr0rFUlI8L+tu9enKtO95WT7c4ivJ2iK9km6zml3UrWjlsl93asD2KyxmwrihgnzjnytVfg4zCP20y5n6nyRMUSRWKrwX8wNg0k6+yYQxtPpgXwEaULvPabj9E+aR3iv47mNfqXP6aaQrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbd84hm1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbd84hm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB501F000FF;
	Fri,  2 Oct 2026 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932604;
	bh=C5Zz+ccu3RGcbVMwyHc5xIJBOHO5rdi2RMhX1weGFJg=;
	h=From:To:Cc:Subject:Date;
	b=hbd84hm1AS7typdt90W0+Csh1o0279SOzAYCV6CKTtuLrsgXozmWWxBXRukOY+xJc
	 CJJI8AEETzscN/Pb4Ir9QiUMARv1fFZiVo7yJ7J3GGXt4kLuzQcuMO/ekuI1CFyX9a
	 rmAnB7Lmz7KBwy4BYAKz4MXQIYpWdRntRhkkboFiT6D+ig6QpxeqoDuB5nbz2GbpVX
	 sz/sVVAx/+61iiAmXkVoyMEmRj6W8/0FAIvqXMzQkGIXS5fAfKhvTNatglxnmPdbw0
	 loxtR8UPDjfOrc9vf153jvAnq7hK3W5ifDNmNnjt1kzyRSfreiF7DM5eeyrtq4t4WZ
	 STTG5pK8O6w6A==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH] soc/tegra: cbb: Fix loggger -> logger typo
Date: Fri,  2 Oct 2026 11:16:42 +0200
Message-ID: <20261002091642.2201543-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Found using codespell.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 69ef929e04f8..be35ec0f39de 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -1912,7 +1912,7 @@ static bool print_errlog0(struct seq_file *file, struct tegra194_cbb *cbb)
 
 /*
  * Print debug information about failed transaction using
- * ErrLog registers of error loggger having ErrVld set
+ * ErrLog registers of error logger having ErrVld set
  */
 static bool print_errloggerX_info(struct seq_file *file, struct tegra194_cbb *cbb,
 				  int errloggerX)
-- 
2.55.0


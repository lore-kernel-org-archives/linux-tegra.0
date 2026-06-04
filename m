Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D43FFACA;
	Thu,  4 Jun 2026 10:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569394; cv=none; b=Z/16BNd+xZ4x2m/twiAXI1+A6fCyNZIcvDsgIiABPiBitdRL18HWiRViGun1/p5bwMbPcNneFU3qOkhXMrq6FfZiITp6+NAyLbt3QatXJMeDagiybgyJdu/e41ATwLtFpQBClKggNPXsbH3wzQ1Y1K8+Q/8DhtWSe7UWBFcAQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569394; c=relaxed/simple;
	bh=uqILPwCJAysFwEijBp5Q58ZSmrk9HovXy9x7jorydW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vw22GbHZL8bL1GIc780mCeuHhu4Dh0KQmzWWhswA2FWbGmo1SnZSGpxWQVyda5myZ2kD0ziBvj7eNv0+AbuRq6+bieL1TD1WA09A/zZfo6UORbAjaQqPa++BoAPgAHXJlshDXZg5OJfgusxKFAycRobNnxFrU50Kd0aMupML1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=R2q6+igk; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="R2q6+igk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=YgKJFFxO4e56PgrNO+9WzKGURzJiC4PerYs5ydguxaU=; b=R2q6+igk1+ogcCNoADlmm7daI9
	R1mTFvlBbcGbpEEZH2svHk2m7VX5PR7t8ZOik3+hQzT/pnNHzlSPKnHB4+oYnNP39MKeh/8VtJi7e
	wk0f2RBO6VU0MewlsVrM1seSkWH7GQuOXuxCbvFyAFVmxXIEd4s0MDFjX0L+NBB3c41EY2vOouMJA
	nUYEhqtdnEKni9peoA04Fofl1hmZp3eEntmD7cK7v08FI73owC6JTP6aXHxjT9cJomCxLMNp0aPRh
	5vOz1aQuVmpHbulEr6PliY0NbBXKCxXc6SIitXmu6qfazOWsUFAaFwB2ygR2Tt58ExXXxnPfuMYuB
	Zgmtdy6A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wV5R6-004SLD-2I;
	Thu, 04 Jun 2026 10:36:29 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 04 Jun 2026 03:36:17 -0700
Subject: [PATCH] soc/tegra: fuse: Fix spurious straps warning on SMCCC
 platforms
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-tegra_warn_fix-v1-1-78522c852340@debian.org>
X-B4-Tracking: v=1; b=H4sIACFVIWoC/x3MSwqEMBAFwKs0b20git9cRSTEmY72JkpHHEG8+
 4B1gLqRWYUzHN1QPiXLluCoLAifNaSFjXzhCJWtWtva2hy8aPC/oMlHuUwcuLd9M9dl16Ag7Mp
 Rrjccp+f5A4TxziVgAAAA
X-Change-ID: 20260604-tegra_warn_fix-f9e8085b4175
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=leitao@debian.org;
 h=from:subject:message-id; bh=uqILPwCJAysFwEijBp5Q58ZSmrk9HovXy9x7jorydW0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqIVUpgyge5jl4xvG9AteA8RzvqxHGCyRUGzFYt
 dE4GAdf4smJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaiFVKQAKCRA1o5Of/Hh3
 bbTbEACIGyeuB9CbmlnwzQP0OWGj54W3IQ/sNQFpZGWPB+YZvBWk4zMupQWj/kCM/G9nB2flrjn
 dnK2XoXmNfWT5MQTh693qzGC1042Jlzd9/04SGa3uvCm30Gs2RXyd97KhtrBhpM91qcWX+Rgvjm
 6jyn0ucBuOYfqeYM4iWtlADbLn0xQiJn+hMJR8rHXhumldnCxGrWGJ+cHbHanWz649C/kj6YwWW
 gac24NqbhD9cdieMuY/uKjg8m/H14EYjGywll4M1swIVMbItF+fnld9pSsr+RkwlcFKi/iuKw0S
 d/i5X7RTJL8u5JyU1syzYSYQiVpVll3eatmtOzBEpnGsSQ6oqBezzTlEtqc7Tndp/jd/YOxgi0Y
 sedysvjpqfOHnVPvcydG88DuxbZ6Hq/3SGAGKN8sm7GbMNrA3zSdd7HmyhpIAT7x8tAijckqBMs
 fHsB19mDqW0g3MQjnflLJxHmGQRlQnpakhmHmsvdgtkfAcwR01wsV2X+cojXYw+JGszf9iSzxqR
 zUVTv4AuYWO+wKsAgf59kzQ9QmqhcwChNwucstXWg5jhu0kcFCCkddHRNweiOf8q0d1moCpq0SE
 VB4W/MvG1Lyd9Ya5kziPAOzkSx1HIsp6Dp2uca4Mlxq2AYc09TQcibrkBTf3NmxuHMljOR/7Ha5
 tc/Y/gYNdNZs6eA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

My Grace host started to show this warning:
  WARNING: drivers/soc/tegra/fuse/tegra-apbmisc.c:120 at tegra_read_straps
   tegra30_fuse_add_randomness
   tegra30_fuse_init
   tegra_fuse_probe

tegra_read_straps() warns when the static "chipid" cache is still zero,
using it as a proxy for "APBMISC has been initialised". However chipid
is only ever populated lazily by tegra_read_chipid() when it reads the
APBMISC register.

Guard on apbmisc_base instead, which is set unconditionally in
tegra_init_apbmisc_resources() for all platforms and is already the
sentinel used by tegra_read_chipid().

Fixes: c71f213fa5af ("soc/tegra: fuse: Warn if straps are not ready")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 87ae63a7e52d..7aba7c58bad0 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -117,7 +117,7 @@ bool tegra_is_silicon(void)
 
 u32 tegra_read_straps(void)
 {
-	WARN(!chipid, "Tegra ABP MISC not yet available\n");
+	WARN(!apbmisc_base, "Tegra ABP MISC not yet available\n");
 
 	return strapping;
 }

---
base-commit: 1f5563665c2715e5ab2f64ec3d4b0af60927014f
change-id: 20260604-tegra_warn_fix-f9e8085b4175

Best regards,
-- 
Breno Leitao <leitao@debian.org>


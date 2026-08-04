Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D46E555
	for <linux-tegra@vger.kernel.org>; Tue,  4 Aug 2026 12:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846015; cv=none; b=oWXU0AHh2qcup60GWlNvJ1tO4tIp0RY5TJEpQe9z3Q09jza1pG744XHv7MNxXwEMwi07Iq7jut0P1GPVvab7syPFBnJskS0YnKCd5oQHaYMcjkewVkcPwkpAKLXhXlM8b8h64qt7csYYz6yM5jAG6+mZYueiYkpdJaeMoV4AEU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846015; c=relaxed/simple;
	bh=KSgJWK+VpI8rltL05ssW/EvkopF+w6LKVQcu1NrL1ec=;
	h=To:Subject:Mime-Version:Content-Type:Message-Id:References:Cc:
	 From:Date:In-Reply-To; b=TZYh2rgiu8HQ+LSYKtPOwn5i8XQJm0c3mMEv0ycYHlRYqq7Kt8Ornc9o9ET3rvgZofrNOA66aNajDF/01YkMEyQH4qNoRz6PRONOuO1sXlTXiz3T5T4mhQgSEb4zbV40p5WduwHYrvofeu4HnxPQLdtphUhY/qSCP0i+ieX0HcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jHio57Jh; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jHio57Jh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1785846008; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=aevrnnfHbvyJZa4AXopRmIYISqXV7gyVfUIjKkBnHQc=;
 b=jHio57JhBm5BhMkdanHoclPBznOigD9cmSKXsMZ2Rd0WN3NEqL8k59KK6MvcJmMvJtBwZH
 /zNSYw3OYwxxuo5Rv2MmNXZMBRQg9X4kqsyxqeJepRoTQEGikZ7/DsqiHfBhjHamuIh7Nd
 aSmPy8x9WSl/MZzEEmZZEzr4tii7tge45AhYSNq4dC7n8DSYI4Zy/G/0EE0NHV3S9jojIH
 wvvFiHQrAUVyYNe5sjlWSbewYJWKT2kjYAZC9bkRJarfbQ0R51CWnUxyj7WRy0aQMfThUy
 CypfvhE3pgX/GyedR1kPst58ZUusHDy/6ro0TvS45elo39SIle44QI5EJjDe8Q==
Content-Transfer-Encoding: 7bit
To: "Thierry Reding" <thierry.reding@kernel.org>, 
	"Jonathan Hunter" <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>
Subject: [PATCH 1/2] soc/tegra: fuse: Return -ENODEV for unsupported legacy SoCs
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Jinhui Guo <guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Message-Id: <20260804121910.4961-2-guojinhui.liam@bytedance.com>
References: <20260804121910.4961-1-guojinhui.liam@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Kartik Rajput" <kkartik@nvidia.com>, 
	"Jinhui Guo" <guojinhui.liam@bytedance.com>
From: "Jinhui Guo" <guojinhui.liam@bytedance.com>
Date: Tue,  4 Aug 2026 20:19:09 +0800
In-Reply-To: <20260804121910.4961-1-guojinhui.liam@bytedance.com>
X-Lms-Return-Path: <lba+26a71d8f6+70c19c+vger.kernel.org+guojinhui.liam@bytedance.com>

When booting without a FUSE device tree node, tegra_init_fuse() falls
back to legacy SoC detection on 32-bit ARM systems. If the detected chip
ID does not match any supported SoC, the default case only prints a
warning and breaks out of the switch statement.

In that case fuse->soc remains NULL, but initialization continues and
later calls fuse->soc->init(fuse), which results in a NULL pointer
dereference.

Return -ENODEV from the default case to stop initialization immediately
when the legacy fallback detects an unsupported SoC.

Fixes: 7e939de1b2bb ("soc/tegra: fuse: Unify Tegra20 and Tegra30 drivers")
Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 78b054d43a42..e539e6b595b0 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -520,7 +520,7 @@ static int __init tegra_init_fuse(void)
 
 			default:
 				pr_warn("Unsupported SoC: %02x\n", chip);
-				break;
+				return -ENODEV;
 			}
 		} else {
 			/*
-- 
2.20.1

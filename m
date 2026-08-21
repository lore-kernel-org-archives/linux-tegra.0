Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE40235C681;
	Fri, 21 Aug 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302359; cv=none; b=WoM42Df5Bs6pbQyGE4tSPfHK8xnTrTYMGgzf7tPXavDIuG+qUZnOrRAf0JwvQZSVMCPaYiuV9jBr8jdccSGFFnq3g2lv0I1gCArSxJY1b3nd9tvA0YichLOkx9AmnyP/W30Zd6mKdXxe+bWcMquYj6Ys9S7G0m0pSablnUsdP9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302359; c=relaxed/simple;
	bh=2mZ3yMwiewY5r0pE+NMW9gw3kcnfQ/7yjV1ZdF7t5wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4ESFlgTzkzK5f7M4jnjaplvNXIGT82+dW+XVZtt2M4TAwVU/2q4/Di7MDABVXtodp7zgs+Zog/q6ddC3JCBBJsWgAgmJXI8Zppx6qnoyQs4MMXsMPQMrvnrrteQ6ef8wv+PLj+mhonFk2KltAx8gPKDLu3dYOvg7HibkAL3k5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224A11F00A3A;
	Fri, 21 Aug 2026 08:52:34 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: versatile: clock: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:52:24 +0200
Message-ID: <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787239869.git.geert+renesas@glider.be>
References: <cover.1787239869.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 arch/arm/mach-versatile/spc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
index 7c3191aa3e12d1f3..d3f84819532fa498 100644
--- a/arch/arm/mach-versatile/spc.c
+++ b/arch/arm/mach-versatile/spc.c
@@ -522,7 +522,7 @@ static struct clk_ops clk_spc_ops = {
 
 static struct clk *ve_spc_clk_register(struct device *cpu_dev)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_spc *spc;
 
 	spc = kzalloc_obj(*spc);
-- 
2.43.0


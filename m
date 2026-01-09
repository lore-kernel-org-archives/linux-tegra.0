Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6BA35C196;
	Fri,  9 Jan 2026 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767962730; cv=none; b=EWsHDhOcaMsxLQMxIES4tJV3J+ZAV0b6bnEQ4i3opuoPeuICj+OBp120fYDPSl5AsjGpQtkzItsDyIuwh1VJopPX3ivuhGY9YiQft8DllfHTPAUXgnWBRs1l7cLVWNC6TPk3R26Z9A1x/dp+oh5bWirvoNlUO338LFby/k2sHlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767962730; c=relaxed/simple;
	bh=zKpMRR+nvBZTUSzMRjW+gy5R9oXH95XhWIyvTncKVaE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h+X3fMu7icZQT6cmTt9dddD62AyJ2+BihVFHPPEf3wCOtL3tNhSFg2HyrGu3z1SxRuQBEQfn2/uDviGTmbi05/N0kQ9MofuiH5sEuBpVRY5VS4v3Fc0dbitIN1lEBiTNhgBxMMpJx8lNFh1n/aMxZP94EzUK6x309g3iizUKI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=fq0jZREY; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="fq0jZREY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=hX1Km62k0Ac0PW8TZ4V0r6fxrORu8UscmHNrKhm0Yyc=; b=fq0jZREYVDBx68
	tL9HhNnFxq8AgKORl4gSzOyP4wSayyWLaH5MOF1cR8Yt+6SF77jQMVg+RG0y/1vMt6mdrhOvnQ6rf
	yPprxdnbyggsnPywVDaM8IouxoAWQAMQ2IgB+eBtVOe6sgKnyY288tma0P8D0SI4Xd7ghmSfpYMIH
	2tf1x2BxDcnF4E/AyntE6qDezVser/bLK3iM+u1zgeQfiSFwQGI6TWnzxIr9nVdXmUDo9RYp+/7iF
	DI5fSpRG9KtpYEEPlwNAQurJK94rtFp6BBSzc96PTrBj5aNUtvatrPytsxK6hQijtDw0KAGMZqYnZ
	ma6g3quWEN/W2jmJe2Hw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1veBrY-00EvWe-Ss; Fri, 09 Jan 2026 12:45:08 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1veBrY-00000001h1z-2c3p;
	Fri, 09 Jan 2026 12:45:08 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: simona@ffwll.ch,
	airlied@gmail.com,
	mperttunen@nvidia.com,
	thierry.reding@gmail.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] gpu: host1x: fix missing 'host1x_context_device_bus_type'
Date: Fri,  9 Jan 2026 12:45:07 +0000
Message-Id: <20260109124507.403728-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The drivers/gpu/host1x/context_bus.c does not include
any declaration of host1x_context_device_bus_type, and
after including "context.h" it also showed that there
are two definitons in the kernel, so fix those two

Change context.h to include the correct definiton of
host1x_context_device_bus_type by including
<linux/host1x_context_bus.h> in context.h

Fixes the following sparse warning:
drivers/gpu/host1x/context_bus.c:9:23: warning: symbol 'host1x_context_device_bus_type' was not declared. Should it be static?

Fixes: 3d70eb8e60c6d009c988 ("gpu: host1x: Make host1x_context_device_bus_type constant")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/host1x/context.h     | 3 +--
 drivers/gpu/host1x/context_bus.c | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
index 3e03bc1d3bac..5215922905ed 100644
--- a/drivers/gpu/host1x/context.h
+++ b/drivers/gpu/host1x/context.h
@@ -10,11 +10,10 @@
 
 #include <linux/mutex.h>
 #include <linux/refcount.h>
+#include <linux/host1x_context_bus.h>
 
 struct host1x;
 
-extern struct bus_type host1x_context_device_bus_type;
-
 struct host1x_memory_context_list {
 	struct mutex lock;
 	struct host1x_memory_context *devs;
diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
index 7cd0e1a5edd1..89f61b1f7d33 100644
--- a/drivers/gpu/host1x/context_bus.c
+++ b/drivers/gpu/host1x/context_bus.c
@@ -6,6 +6,8 @@
 #include <linux/device.h>
 #include <linux/of.h>
 
+#include "context.h"
+
 const struct bus_type host1x_context_device_bus_type = {
 	.name = "host1x-context",
 };
-- 
2.37.2.352.g3c44437643


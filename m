Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3154739FD6
	for <linux-tegra@vger.kernel.org>; Thu, 25 Apr 2024 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714021394; cv=none; b=XIpwjdZVoM+rHDhbfIFJulXSQGTyh/stT7CzANQ01edPOFBwhFBAUveEBcueQPyPFk6kd5IEr11uD23CgvEUaddD0osYqommbXpmmo4RuLCPXYI6+CcI7AMTPyQn9fsq1S2Rs2dWX0JghruRmR0WVQpr+I3n1+73ZRn2ZrIXUlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714021394; c=relaxed/simple;
	bh=gIuo3L9j5bssPoaEpLjEotmVXDILr0mylCd+9qvNA5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9j0gFzm9Zl1SW2zH4BFdWGLX8W3kXkNwQfvWgnyTUOv0K1cUnrhDxY10egwcA/9TzCug3ywedCb7wWnR8cPQNaypTzBDls7dANi2ESIZCBDahs/Eti1qi1vVGn5tWN+UkR6F0Edmz/duYUBIrpfBFVHnsKqeiNDeAKGh1YdA30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=JMPtZM65; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="JMPtZM65"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IraaDCivYjSTWuW5xMiYXzF2l6kZQ0FvZhCC9oxOAis=; b=JMPtZM65YfDTaeFc42hGqnlyS5
	e4cNDtXL6zT/RjY5oALy4NJpbYZZ2btE4cNrA8rGF67r4Ec7o7ew4c+sbh1MmIMA9joloZyd5dCcH
	64hXOGuHmPRs8HPclbkFK4XHMYH6cLYvOuMmHqB4JJNN1ZlHh6G3NP7rfzv/OzoEDN516UsvP8FQK
	GCRecslmtLA2RL0gxvCL+VTqBvL/0twjpkPWdo6SKaBxdqXm5CxfyxRr6vHhAqR24pTKHQnrLHtuw
	GsDMgG+e5xd5bDq2YEzUEn/aN2lGqlwU/UN39R9OoGdD5j7epLQoVPLu9KSFhswNVU1R+SSuc3bCz
	UuKdJnvA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1rzrG8-00Fmla-0E;
	Thu, 25 Apr 2024 08:03:00 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 5/5] gpu: host1x: fence: Disable timeout on pre-silicon
Date: Thu, 25 Apr 2024 08:02:37 +0300
Message-ID: <20240425050238.2943404-5-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240425050238.2943404-1-cyndis@kapsi.fi>
References: <20240425050238.2943404-1-cyndis@kapsi.fi>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

Timing can be wonky on pre-silicon platforms, so disable fence timeouts
on pre-silicon platforms.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/fence.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index 139ad1afd935..711eeb93689e 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -11,6 +11,9 @@
 #include <linux/slab.h>
 #include <linux/sync_file.h>
 
+#include <soc/tegra/fuse.h>
+
+#include "dev.h"
 #include "fence.h"
 #include "intr.h"
 #include "syncpt.h"
@@ -127,6 +130,12 @@ struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold,
 {
 	struct host1x_syncpt_fence *fence;
 
+	if (!tegra_is_silicon()) {
+		dev_info_once(sp->host->dev,
+			"fence timeout disabled due to pre-silicon platform\n");
+		timeout = false;
+	}
+
 	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
 	if (!fence)
 		return ERR_PTR(-ENOMEM);
-- 
2.42.0


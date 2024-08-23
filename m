Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5D813DDC6
	for <linux-tegra@vger.kernel.org>; Fri, 23 Aug 2024 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724400456; cv=none; b=W0fEq1zeVlMNWNuAETxPHFuhkgJ4CWn1OUnIPpWXQXA+qRqr804CQ/H4M0ZrfIY4s4+teBFB7Wz/7A0B27w39T6c8m4SO2sQwCV0JWUbCUok8TmGBU2CLsGGjYl0RAi9B1WC+IFIfao/xgJJE48wPcHtsX9aXcHyuHYu0TUKr9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724400456; c=relaxed/simple;
	bh=QURK93jpnDhdkzPAI21Rp1v/Jku3+w+7UPOptIm0Uro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bg3st2IZY6nSpzGg4cHHTf4l79Hb/71/SkfRPxu31hY6z5WOmmNesC7rMetlP7giWz8yFYAi2KU9sGsiuVPQ63AKRPuAzihgD3m2KfwKstNGC9l/g8na5D9RC9FK2xgOyWGnN1MYXBmm5X7rOaFqXCpZDsMDE2N+hviI2NcN1cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U8r8HRX+; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U8r8HRX+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724400450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q06oqOIsnlBXOPeX9QmHFvGk4DIwl/omFgxTtDgtIdY=;
	b=U8r8HRX+MecBuIaubX7KG/DiqadhPH9bhKB6ZsqgHjrqEPmVNOcWeKKALOFqm+jJJJ5q2q
	NM1/DahPLSsLPc8CzzmlNNtXKZE92L65cA5hYLe/8lLlZtSHhkPDuCExOrVEgE88ldZ671
	qe6c9qxPO+zPKVJx0llqA0qAevsRhfU=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] gpu: host1x: Make host1x_context_device_bus_type constant
Date: Fri, 23 Aug 2024 16:07:24 +0800
Message-ID: <20240823080724.148423-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kunwu Chan <chentao@kylinos.cn>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the host1x_context_device_bus_type variable
to be a constant structure as well, placing it into read-only memory
which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/host1x/context_bus.c   | 2 +-
 include/linux/host1x_context_bus.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
index d9421179d7b4..7cd0e1a5edd1 100644
--- a/drivers/gpu/host1x/context_bus.c
+++ b/drivers/gpu/host1x/context_bus.c
@@ -6,7 +6,7 @@
 #include <linux/device.h>
 #include <linux/of.h>
 
-struct bus_type host1x_context_device_bus_type = {
+const struct bus_type host1x_context_device_bus_type = {
 	.name = "host1x-context",
 };
 EXPORT_SYMBOL_GPL(host1x_context_device_bus_type);
diff --git a/include/linux/host1x_context_bus.h b/include/linux/host1x_context_bus.h
index 72462737a6db..c928cb432680 100644
--- a/include/linux/host1x_context_bus.h
+++ b/include/linux/host1x_context_bus.h
@@ -9,7 +9,7 @@
 #include <linux/device.h>
 
 #ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
-extern struct bus_type host1x_context_device_bus_type;
+extern const struct bus_type host1x_context_device_bus_type;
 #endif
 
 #endif
-- 
2.41.0


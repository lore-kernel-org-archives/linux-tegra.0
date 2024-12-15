Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F913653;
	Sun, 15 Dec 2024 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734299283; cv=none; b=KkarDFenFLrZmL9QHDZUylk/Jsd/SsIeYao4R7ZD1enqvAuqYCRIzvVp2xa1lP7xOhLD4e7ftwda2sbGGIPna1FFfHUpdM68OmoP/trP2g+EK8rO+fbIrnXICAusONDj1TZKNMGRPaDmwk0+ENNvQGMOZedrDbFeKouWDZQ9fs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734299283; c=relaxed/simple;
	bh=vEFeXeLScr75rsFNgY1KWtU450y8shtGwTrVMWxtj+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDfMPSTWh7f3UjIs08EVrO7Ct6aDB7AH5vBYSTlxWnObbFtVLA8DtbblgztCEH78OhB72ZEw27l8QH4DeZ/OZorH4+utvM0q1lSlcvb47IZEnwltdXp/PG5C/nyK6gh1l4vbxVlxdaxZJGYSnYkUaDExarZj3OqyNTNz80tSqu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Q+oLF/Kz; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Q+oLF/Kz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=cHBKF03U+jZMko8P8Q0VvvH1LhKjNSPqXhElrlL/24A=; b=Q+oLF/Kz0ZXyL/Ma
	D8lb9TCiSdsTRdc4cphsUJmWW1nLfRC/HsDrtogd8Q0N5olIj4B2DvUwzdkNOA8FA3dW+KFFmyR3M
	JBKo2v5ZIJIj5cxeiN1zyXL79vppwgd2l4oS+bEXRzf/nONqiU8gdohV14kn6yQRZ2ar8P3bf3jr2
	YMvg3x6ORhsd0SpIaXGWahVrPPLSB+gkrC7tHFrqOqGLNrT0sUlyugPICmGGZK1xLnmKinTCBT3Lb
	W60z1CCgQPGnaJ3CAGr3wjnIn31S8Ck30gXsRSqlsGNEUp1q9pz2A2R+2eNJJUeiGygyEzLBhBzvH
	mV8EP/3b2iWHrSWnkw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tMwSt-005UzH-1n;
	Sun, 15 Dec 2024 21:47:51 +0000
From: linux@treblig.org
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
Date: Sun, 15 Dec 2024 21:47:50 +0000
Message-ID: <20241215214750.448209-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

host1x_debug_dump_syncpts() has been unused since
commit f0fb260a0cdb ("gpu: host1x: Implement syncpoint wait using DMA
fences")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/host1x/debug.c | 9 ---------
 drivers/gpu/host1x/debug.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index a18cc8d8caf5..6433c00d5d7e 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -216,12 +216,3 @@ void host1x_debug_dump(struct host1x *host1x)
 
 	show_all(host1x, &o, true);
 }
-
-void host1x_debug_dump_syncpts(struct host1x *host1x)
-{
-	struct output o = {
-		.fn = write_to_printk
-	};
-
-	show_syncpts(host1x, &o, false);
-}
diff --git a/drivers/gpu/host1x/debug.h b/drivers/gpu/host1x/debug.h
index 62bd8a091fa7..c43c61d876a9 100644
--- a/drivers/gpu/host1x/debug.h
+++ b/drivers/gpu/host1x/debug.h
@@ -41,6 +41,5 @@ extern unsigned int host1x_debug_trace_cmdbuf;
 void host1x_debug_init(struct host1x *host1x);
 void host1x_debug_deinit(struct host1x *host1x);
 void host1x_debug_dump(struct host1x *host1x);
-void host1x_debug_dump_syncpts(struct host1x *host1x);
 
 #endif
-- 
2.47.1


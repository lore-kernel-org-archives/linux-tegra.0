Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166B139FD7
	for <linux-tegra@vger.kernel.org>; Thu, 25 Apr 2024 05:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714021400; cv=none; b=c8b2LbNIl5d8DHgogCH8PXHbmGeEB7g70xV4mVuo6Rw6P6tR/aH0e6+0mRvRl01zTv3w9B5nHT1K8vOSzEsHPbTy4kewisYGrL5JwZg7M2uQUz+N/VaHjXE26IMUTW2eTzexfO0AF8dr7j1EQFuWn3mxGdhjA2+Qe5MumDYVsGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714021400; c=relaxed/simple;
	bh=dl/H55x13//hBEekPZNtn38QxsSMAN0RKfTqrVdsjDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXj27u0WZ9SE7uOh0wkgOM0nR+lhUNmAkGuvCuPbwQEN/nEcn/DHDWv2rG+y0q+IhlsMrfDVwrhuFf4uX5vpRv3az+ESIVVykx/geh436xFVek9sU9ksJiMIguv7jsuVviJUGeFkRjP2kx3OMAFfSELJvv+o7qLdIcrRikoAI9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=Fw9jHNAU; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="Fw9jHNAU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5e3ZOd5UOHrN2erPJEkwHsJEoSpTtc+7EQ0plRwyCUY=; b=Fw9jHNAUbHD2kv9+jwb0t0zQlP
	rNMNrYGdF0yYxGCNSYNGcfLWhIeNoWS39nFlhE4lJJcRPY4zEiAZd4J/qHJVlmjrGwFUYhzAxfekp
	KSdaRtEQxUvTbPYOsw9fgbtErRsm0I0PDyUTUoY5ZfRuxWh+nSAE7CNV0EX+X1auwZ4Dag0s62/jY
	28Pluraa+6qgd0ZqsurtYENLj3oii4OJcWzRaLKlUteFGrP178TLnwTdzN2y8Kg6z3P844yeu/ers
	TvAec6CCWWzO8QyHqwNH54qjP9tApSABI7Q1aAnUGQSJ4WZZoAV7fPNoTNU4Ximwq8C7r+mQpoFIT
	Iaofg3GA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1rzrG7-00Fmla-1h;
	Thu, 25 Apr 2024 08:02:59 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 3/5] gpu: host1x: Complete stream ID entry tables
Date: Thu, 25 Apr 2024 08:02:35 +0300
Message-ID: <20240425050238.2943404-3-cyndis@kapsi.fi>
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

These tables contain fixed values to program the host1x hardware
with, so fill in the missing entries.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 150 +++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3a0aaa68ac8d..f83aaa40b13e 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -142,18 +142,29 @@ static const struct host1x_info host1x05_info = {
 };
 
 static const struct host1x_sid_entry tegra186_sid_table[] = {
-	{
-		/* VIC */
-		.base = 0x1af0,
-		.offset = 0x30,
-		.limit = 0x34
-	},
-	{
-		/* NVDEC */
-		.base = 0x1b00,
-		.offset = 0x30,
-		.limit = 0x34
-	},
+	{ /* SE1      */  .base = 0x1ac8, .offset = 0x90,    .limit = 0x90    },
+	{ /* SE2      */  .base = 0x1ad0, .offset = 0x90,    .limit = 0x90    },
+	{ /* SE3      */  .base = 0x1ad8, .offset = 0x90,    .limit = 0x90    },
+	{ /* SE4      */  .base = 0x1ae0, .offset = 0x90,    .limit = 0x90    },
+	{ /* ISP      */  .base = 0x1ae8, .offset = 0x50,    .limit = 0x50    },
+	{ /* VIC      */  .base = 0x1af0, .offset = 0x30,    .limit = 0x34    },
+	{ /* NVENC    */  .base = 0x1af8, .offset = 0x30,    .limit = 0x34    },
+	{ /* NVDEC    */  .base = 0x1b00, .offset = 0x30,    .limit = 0x34    },
+	{ /* NVJPG    */  .base = 0x1b08, .offset = 0x30,    .limit = 0x34    },
+	{ /* TSEC     */  .base = 0x1b10, .offset = 0x30,    .limit = 0x34    },
+	{ /* TSECB    */  .base = 0x1b18, .offset = 0x30,    .limit = 0x34    },
+	{ /* VI 0     */  .base = 0x1b80, .offset = 0x10000, .limit = 0x10000 },
+	{ /* VI 1     */  .base = 0x1b88, .offset = 0x20000, .limit = 0x20000 },
+	{ /* VI 2     */  .base = 0x1b90, .offset = 0x30000, .limit = 0x30000 },
+	{ /* VI 3     */  .base = 0x1b98, .offset = 0x40000, .limit = 0x40000 },
+	{ /* VI 4     */  .base = 0x1ba0, .offset = 0x50000, .limit = 0x50000 },
+	{ /* VI 5     */  .base = 0x1ba8, .offset = 0x60000, .limit = 0x60000 },
+	{ /* VI 6     */  .base = 0x1bb0, .offset = 0x70000, .limit = 0x70000 },
+	{ /* VI 7     */  .base = 0x1bb8, .offset = 0x80000, .limit = 0x80000 },
+	{ /* VI 8     */  .base = 0x1bc0, .offset = 0x90000, .limit = 0x90000 },
+	{ /* VI 9     */  .base = 0x1bc8, .offset = 0xa0000, .limit = 0xa0000 },
+	{ /* VI 10    */  .base = 0x1bd0, .offset = 0xb0000, .limit = 0xb0000 },
+	{ /* VI 11    */  .base = 0x1bd8, .offset = 0xc0000, .limit = 0xc0000 },
 };
 
 static const struct host1x_info host1x06_info = {
@@ -173,24 +184,26 @@ static const struct host1x_info host1x06_info = {
 };
 
 static const struct host1x_sid_entry tegra194_sid_table[] = {
-	{
-		/* VIC */
-		.base = 0x1af0,
-		.offset = 0x30,
-		.limit = 0x34
-	},
-	{
-		/* NVDEC */
-		.base = 0x1b00,
-		.offset = 0x30,
-		.limit = 0x34
-	},
-	{
-		/* NVDEC1 */
-		.base = 0x1bc0,
-		.offset = 0x30,
-		.limit = 0x34
-	},
+	{ /* SE1          */  .base = 0x1ac8, .offset = 0x90,  .limit = 0x90  },
+	{ /* SE2          */  .base = 0x1ad0, .offset = 0x90,  .limit = 0x90  },
+	{ /* SE3          */  .base = 0x1ad8, .offset = 0x90,  .limit = 0x90  },
+	{ /* SE4          */  .base = 0x1ae0, .offset = 0x90,  .limit = 0x90  },
+	{ /* ISP          */  .base = 0x1ae8, .offset = 0x800, .limit = 0x800 },
+	{ /* VIC          */  .base = 0x1af0, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVENC        */  .base = 0x1af8, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVDEC        */  .base = 0x1b00, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVJPG        */  .base = 0x1b08, .offset = 0x30,  .limit = 0x34  },
+	{ /* TSEC         */  .base = 0x1b10, .offset = 0x30,  .limit = 0x34  },
+	{ /* TSECB        */  .base = 0x1b18, .offset = 0x30,  .limit = 0x34  },
+	{ /* VI           */  .base = 0x1b80, .offset = 0x800, .limit = 0x800 },
+	{ /* VI_THI       */  .base = 0x1b88, .offset = 0x30,  .limit = 0x34  },
+	{ /* ISP_THI      */  .base = 0x1b90, .offset = 0x30,  .limit = 0x34  },
+	{ /* PVA0_CLUSTER */  .base = 0x1b98, .offset = 0x0,   .limit = 0x0   },
+	{ /* PVA0_CLUSTER */  .base = 0x1ba0, .offset = 0x0,   .limit = 0x0   },
+	{ /* NVDLA0       */  .base = 0x1ba8, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVDLA1       */  .base = 0x1bb0, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVENC1       */  .base = 0x1bb8, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVDEC1       */  .base = 0x1bc0, .offset = 0x30,  .limit = 0x34  },
 };
 
 static const struct host1x_info host1x07_info = {
@@ -215,54 +228,35 @@ static const struct host1x_info host1x07_info = {
  * and firmware stream ID in the MMIO path table.
  */
 static const struct host1x_sid_entry tegra234_sid_table[] = {
-	{
-		/* SE2 MMIO */
-		.base = 0x1658,
-		.offset = 0x90,
-		.limit = 0x90
-	},
-	{
-		/* SE4 MMIO */
-		.base = 0x1660,
-		.offset = 0x90,
-		.limit = 0x90
-	},
-	{
-		/* SE2 channel */
-		.base = 0x1738,
-		.offset = 0x90,
-		.limit = 0x90
-	},
-	{
-		/* SE4 channel */
-		.base = 0x1740,
-		.offset = 0x90,
-		.limit = 0x90
-	},
-	{
-		/* VIC channel */
-		.base = 0x17b8,
-		.offset = 0x30,
-		.limit = 0x30
-	},
-	{
-		/* VIC MMIO */
-		.base = 0x1688,
-		.offset = 0x34,
-		.limit = 0x34
-	},
-	{
-		/* NVDEC channel */
-		.base = 0x17c8,
-		.offset = 0x30,
-		.limit = 0x30,
-	},
-	{
-		/* NVDEC MMIO */
-		.base = 0x1698,
-		.offset = 0x34,
-		.limit = 0x34,
-	},
+	{ /* SE1 MMIO     */  .base = 0x1650, .offset = 0x90,  .limit = 0x90  },
+	{ /* SE1 ch       */  .base = 0x1730, .offset = 0x90,  .limit = 0x90  },
+	{ /* SE2 MMIO     */  .base = 0x1658, .offset = 0x90,  .limit = 0x90  },
+	{ /* SE2 ch       */  .base = 0x1738, .offset = 0x90,  .limit = 0x90  },
+	{ /* SE4 MMIO     */  .base = 0x1660, .offset = 0x90,  .limit = 0x90  },
+	{ /* SE4 ch       */  .base = 0x1740, .offset = 0x90,  .limit = 0x90  },
+	{ /* ISP MMIO     */  .base = 0x1680, .offset = 0x800, .limit = 0x800 },
+	{ /* VIC MMIO     */  .base = 0x1688, .offset = 0x34,  .limit = 0x34  },
+	{ /* VIC ch       */  .base = 0x17b8, .offset = 0x30,  .limit = 0x30  },
+	{ /* NVENC MMIO   */  .base = 0x1690, .offset = 0x34,  .limit = 0x34  },
+	{ /* NVENC ch     */  .base = 0x17c0, .offset = 0x30,  .limit = 0x30  },
+	{ /* NVDEC MMIO   */  .base = 0x1698, .offset = 0x34,  .limit = 0x34  },
+	{ /* NVDEC ch     */  .base = 0x17c8, .offset = 0x30,  .limit = 0x30  },
+	{ /* NVJPG MMIO   */  .base = 0x16a0, .offset = 0x34,  .limit = 0x34  },
+	{ /* NVJPG ch     */  .base = 0x17d0, .offset = 0x30,  .limit = 0x30  },
+	{ /* TSEC MMIO    */  .base = 0x16a8, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVJPG1 MMIO  */  .base = 0x16b0, .offset = 0x34,  .limit = 0x34  },
+	{ /* NVJPG1 ch    */  .base = 0x17a8, .offset = 0x30,  .limit = 0x30  },
+	{ /* VI MMIO      */  .base = 0x16b8, .offset = 0x800, .limit = 0x800 },
+	{ /* VI_THI MMIO  */  .base = 0x16c0, .offset = 0x30,  .limit = 0x34  },
+	{ /* ISP_THI MMIO */  .base = 0x16c8, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVDLA MMIO   */  .base = 0x16d8, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVDLA ch     */  .base = 0x17e0, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVDLA1 MMIO  */  .base = 0x16e0, .offset = 0x30,  .limit = 0x34  },
+	{ /* NVDLA1 ch    */  .base = 0x17e8, .offset = 0x30,  .limit = 0x34  },
+	{ /* OFA MMIO     */  .base = 0x16e8, .offset = 0x34,  .limit = 0x34  },
+	{ /* OFA ch       */  .base = 0x1768, .offset = 0x30,  .limit = 0x30  },
+	{ /* VI2 MMIO     */  .base = 0x16f0, .offset = 0x800, .limit = 0x800 },
+	{ /* VI2_THI MMIO */  .base = 0x16f8, .offset = 0x30,  .limit = 0x34  },
 };
 
 static const struct host1x_info host1x08_info = {
-- 
2.42.0


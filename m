Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D126D4F7;
	Wed,  6 May 2026 19:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097281; cv=none; b=qR2VblPJrgf9kPH/fagxIOKsbCfjzv4bqzwu/buUacykwYmMtoyzo6SKjJy4FTHfYAPe6cb5QSd+OA6lzGV4hrpu89RWa/4h9WuniXJJeILtlStD1yO2yeW6OZWdudFFTq8wbVu23dAX4N3zv5P+hK40trcQl50OwJovVettRvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097281; c=relaxed/simple;
	bh=4n+0fGUAb/dEj+5phkMmlnkd8FXDOzoewOZqP6eQGJo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jAIBSOStpTjDWDUAzVJB239wUoYhhRhfai2wIC/xpz8HMz7IBD/PNqmrf3t7BC5vN7nnL45ur8qrPe4e1ZsxkseEGBLXYrvR06kvjvr9N1NOSkA85PE49Gf5qeCdTFKB+n0A2VmUkuOW6joncOtKpZTabeO6YmGqm1JV8+uwOQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=MvjJhaVj; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="MvjJhaVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778097280; x=1809633280;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IDa//TTZOLGYJkS4DJ5IkrB1TtKWbO9xChjF6ob/Vag=;
  b=MvjJhaVjfIyz2ghj5LA3RSPahaxQjSkenGHO3hT5D+JjfuST809xdKpO
   dGJbIQssh4gfxRiYVlmPQoj43QdprjwVM3ig1HsXIJzgyXH2LS1c9cn8o
   GnOAqCYbyeDlVa3dq1vR8mPjl3MRuRyPA7+lBs9EZuHNTL15ef8hOc3Ky
   qTU+S5NxreTSYgopDMyHtI7uA6lg13tl2Qisbm7PY4GBAwknSaOLEa1vi
   Yqe4fS2f23vPesVFvVGXoTmPUfpY2gzZ7aDkYrmdKvbkFMMKmHPHfi+v7
   2fv096HcGZyB4kv/YTjIo8qddSs7iQQIrE3L+u0jqsmjtxl2/FmwzyFCz
   w==;
X-CSE-ConnectionGUID: ztkExzERQbGlHYrz1RfIkw==
X-CSE-MsgGUID: SnOSoO2/RFmALpVJ3hswkg==
X-IronPort-AV: E=Sophos;i="6.23,220,1770595200"; 
   d="scan'208";a="19052473"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 19:54:37 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:29785]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.37.224:2525] with esmtp (Farcaster)
 id f90c5e39-243d-4a8b-bc6e-4e1f75dfcfe0; Wed, 6 May 2026 19:54:37 +0000 (UTC)
X-Farcaster-Flow-ID: f90c5e39-243d-4a8b-bc6e-4e1f75dfcfe0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 6 May 2026 19:54:36 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Wed, 6 May 2026
 19:54:34 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: <wsa+renesas@sang-engineering.com>
CC: Saurav Sachidanand <sauravsc@amazon.com>, Laxman Dewangan
	<ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Andi Shyti
	<andi.shyti@kernel.org>, Thierry Reding <thierry.reding@kernel.org>,
	"Jonathan Hunter" <jonathanh@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] i2c: tegra: fix error handling in tegra_i2c_xfer()
Date: Wed, 6 May 2026 19:53:18 +0000
Message-ID: <20260506195319.44810-1-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC004.ant.amazon.com (10.13.139.229) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Fix two bugs in the SW mutex path introduced by commit 6077cfd716fb
("i2c: tegra: Add support for SW mutex register"):

1. If tegra_i2c_mutex_lock() fails, the function returns without calling
   pm_runtime_put(), leaking the runtime PM reference acquired by the
   preceding pm_runtime_get_sync(). Add the missing pm_runtime_put()
   before returning.

2. tegra_i2c_mutex_unlock() unconditionally overwrites ret, which may
   already hold a transfer error from tegra_i2c_xfer_msg(). If the
   transfer failed but the unlock succeeds, the error is silently lost
   and the function incorrectly reports success. Use a separate variable
   for the unlock return value and preserve error priority:
   transfer error > unlock error > message count.

Fixes: 6077cfd716fb ("i2c: tegra: Add support for SW mutex register")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9fd5ade774a0b..704942d10d69d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1656,7 +1656,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			  int num)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	int i, ret;
+	int i, ret, ret2;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
@@ -1666,8 +1666,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	}
 
 	ret = tegra_i2c_mutex_lock(i2c_dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put(i2c_dev->dev);
 		return ret;
+	}
 
 	for (i = 0; i < num; i++) {
 		enum msg_end_type end_type = MSG_END_STOP;
@@ -1698,10 +1700,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			break;
 	}
 
-	ret = tegra_i2c_mutex_unlock(i2c_dev);
+	ret2 = tegra_i2c_mutex_unlock(i2c_dev);
 	pm_runtime_put(i2c_dev->dev);
 
-	return ret ?: i;
+	return ret ?: ret2 ?: i;
 }
 
 static int tegra_i2c_xfer_atomic(struct i2c_adapter *adap,
-- 
2.47.3


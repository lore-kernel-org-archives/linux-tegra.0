Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCDE345757;
	Thu,  7 May 2026 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778191964; cv=none; b=iBT8e6lMVMKrO8mKMx7gOzOws9/J0VTJmjreRG1UVB50y7BkZzG4QdthQKexkBIAgCha18TJuJm+7Hc5CNh4Ioj64clbJwGauxaF5MT4dfPnCW22ZLi5F+tdX4pFxdkM7/4o+iCFukqltYXb5GdXyumR1p7zbPD3SfN8UCMXbQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778191964; c=relaxed/simple;
	bh=OzoZeLZrsZ55RtatIl4SFulVtjmtfkP+1g5kA+psCeE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIs4x9Nj5Pkgt9wq3uCzgdYNMrhJjj41lUxClxIguaVHWOW+uO/n94+DLmxb9prF7aTscHJcBlrxOFUtwEDl+aX5arNXY7rqPbwW0VZVhl4bqh2BJJxnJuCmP6Bhm3Gny58CZYlwbGZRYlqZiszAjZnk54FXez/TiZjUzzv863Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=MbRNjG8K; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="MbRNjG8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778191963; x=1809727963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sL1HG7kqsqyCzapHAzWi07Pmq8z6lTjM+WUQjCvQTeU=;
  b=MbRNjG8KKVPn0ut83JzwH1E2geeYIV/VPGFe5/7G/JBf57zPmmdhuNyq
   JV7x3WYMB86jskBoQ/T6dWgbHgaFogzHPeC/baIwihzJREWnc9qgJy6v5
   2x91u7cIMdF5u0suqcz95Qv7fGn1bf4ucaibuwAeAkFF3Ix2TVwG6NZjM
   J1i2Y1T8o+e146LU+UtirFDDzE5Ascz9l7wzgvVKBmDeVyv+nlT5t5QmM
   V/tFFUZqdpqkw3ZV66hJuHxdV6KMdDWRI66Cdu3GpxJdzDS5srFEihSdO
   l9zJ2xnTwFq9ezE0ZrT32s0FAPQjw66Q5UQoX819OBi8K3kvPO32BvGF2
   g==;
X-CSE-ConnectionGUID: GbDAeoq2S/Wnw5xZdYNbNA==
X-CSE-MsgGUID: fZuvjD0sSiu+fDE/vtxucg==
X-IronPort-AV: E=Sophos;i="6.23,222,1770595200"; 
   d="scan'208";a="18936095"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 22:12:40 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:7377]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.47.215:2525] with esmtp (Farcaster)
 id 31b8b753-8200-43de-96b0-455a44c7dcfe; Thu, 7 May 2026 22:12:39 +0000 (UTC)
X-Farcaster-Flow-ID: 31b8b753-8200-43de-96b0-455a44c7dcfe
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 7 May 2026 22:12:39 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 7 May 2026
 22:12:37 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Saurav Sachidanand <sauravsc@amazon.com>
Subject: [PATCH v2 1/2] i2c: tegra: fix pm_runtime leak on mutex_lock failure
Date: Thu, 7 May 2026 22:11:44 +0000
Message-ID: <20260507221145.62183-2-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507221145.62183-1-sauravsc@amazon.com>
References: <20260506195319.44810-1-sauravsc@amazon.com>
 <20260507221145.62183-1-sauravsc@amazon.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D044UWA004.ant.amazon.com (10.13.139.7) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

If tegra_i2c_mutex_lock() fails, the function returns without calling
pm_runtime_put(), leaking the runtime PM reference acquired by the
preceding pm_runtime_get_sync(). This prevents the device from ever
entering runtime suspend.

Add the missing pm_runtime_put() before returning on lock failure.

Fixes: 6077cfd716fb ("i2c: tegra: Add support for SW mutex register")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9fd5ade774a0b..c24b8de0a9c7b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
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
-- 
2.47.3


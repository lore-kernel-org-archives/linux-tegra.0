Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4FB2F8EBD;
	Thu,  7 May 2026 22:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778191992; cv=none; b=qG7Vygm/Q9voGnPgTGA/mCKoKSPZUKFD209xfPzvHVvF+k3Ksi6J2JCyiSv0dg+H9F4KjknYwxKdZkSf/IFmzdn8Q7jpja1vwaUEPlrCXabqUo6xwIyqhfESUcs//384qYrz6WHHDW3/7wHVu0PGqvlPu1zHlhcQ2AUJTetV5X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778191992; c=relaxed/simple;
	bh=akk1j1Xn9tcYR2vV0ogopsh/iOJv8tB4tpZ+PKVxtag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bszem0HjB5jEs6Kdl4gvauZXOxk5dzl3cUxOg80mbtk5nLcdqIaTNoeZdJJlxv/JIbe8ktdDde7I0+1+NWgMSJ8jwYiFUVbr3o9wjfvEcWmmVp72X1EPsHL2jevnGJf9AAnemThhd0W+cJnlKy1JaJqfMkfJ58U42abXyKl1aUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=MAnT9v8v; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="MAnT9v8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778191991; x=1809727991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ezGRIwcYg2jFN1fARq/lLcKzJyltevrkYigu/n24CeE=;
  b=MAnT9v8vO7KHEl3RJlio00V4S5L3uuzii2Y+E9U5Wvto60SIzpiHDeqk
   INw4QdjMXCPeINsCtoPjirXsEcsRfuUF2MF0dyz2XZKY5DPafKv9R7+dY
   j0mnxF+kwf6IJ39DjgPqI2hTVFbZiyB/6BJlo3pVr7Wll9kWLMuihBWiC
   RD76M/PqOt2L9rWYe9aeX0NveNCHiHRoGjorggwMQsrLDfaNILubynipr
   PP/auERjXCctj5i/Nu5yeP4K3BBr/u3xV1hOasQWlgBuXT19AJNm8dvAG
   kflRYPz2oY0K7NPsQMaEO3UDdrZP7e3pAoHwWakj3jlGpzy3nzn5b4kM3
   w==;
X-CSE-ConnectionGUID: Jc7OnXf9TKCqJbdVigBpFQ==
X-CSE-MsgGUID: eWu3wH5SQdmfHr86P+LSDA==
X-IronPort-AV: E=Sophos;i="6.23,222,1770595200"; 
   d="scan'208";a="19124299"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 22:13:10 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:27431]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.42:2525] with esmtp (Farcaster)
 id 3b87f01a-ba66-4338-804c-9d6105016112; Thu, 7 May 2026 22:13:10 +0000 (UTC)
X-Farcaster-Flow-ID: 3b87f01a-ba66-4338-804c-9d6105016112
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 7 May 2026 22:13:08 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 7 May 2026
 22:13:06 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Saurav Sachidanand <sauravsc@amazon.com>
Subject: [PATCH v2 2/2] i2c: tegra: make tegra_i2c_mutex_unlock() return void
Date: Thu, 7 May 2026 22:11:45 +0000
Message-ID: <20260507221145.62183-3-sauravsc@amazon.com>
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
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

tegra_i2c_mutex_unlock() returning an error that overwrites the transfer
result causes silent loss of I2C transfer errors. If the transfer failed
but the unlock succeeded, the error was lost and the function incorrectly
reported success.

Rather than propagating the unlock error (which is not actionable by the
caller - the I2C message may have been sent regardless), convert the
function to return void and WARN on the unexpected condition. If the
unlock fails, subsequent lock attempts will fail anyway, making the error
visible on the next transfer.

Fixes: 6077cfd716fb ("i2c: tegra: Add support for SW mutex register")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 drivers/i2c/busses/i2c-tegra.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c24b8de0a9c7b..479a1667e88d5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -589,25 +589,22 @@ static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
 	return ret;
 }
 
-static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
+static void tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
 {
 	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	if (!i2c_dev->hw->has_mutex)
-		return 0;
+		return;
 
 	val = readl(i2c_dev->base + reg);
 
 	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
-	if (id && id != I2C_SW_MUTEX_ID_CCPLEX) {
-		dev_warn(i2c_dev->dev, "unable to unlock mutex, mutex is owned by: %u\n", id);
-		return -EPERM;
-	}
+	if (WARN(id && id != I2C_SW_MUTEX_ID_CCPLEX,
+		 "unable to unlock mutex, mutex is owned by: %u\n", id))
+		return;
 
 	writel(0, i2c_dev->base + reg);
-
-	return 0;
 }
 
 static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
@@ -1700,7 +1697,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			break;
 	}
 
-	ret = tegra_i2c_mutex_unlock(i2c_dev);
+	tegra_i2c_mutex_unlock(i2c_dev);
 	pm_runtime_put(i2c_dev->dev);
 
 	return ret ?: i;
-- 
2.47.3


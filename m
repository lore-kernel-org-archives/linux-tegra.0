Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF151607A4;
	Thu,  7 May 2026 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778191940; cv=none; b=QVcRadz1taL3qBImWS7EywPgF3gzacKZymr6Plumoj9c0WUm4cJ1Xa4WU1b+0sOlSX6W/5T1tCK66MUg6nDSJZ9B1FRqYYvEJsZ5kfknez3Uvieegsd5y9IIvuZAy44yzKFlPgxU9sPOlcHBKrYOxVUS9oAverugGc/QT3kceQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778191940; c=relaxed/simple;
	bh=5Iz1jW22WJF8MTTgi637YMsleySLpdqtcYdy2AI90bM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oT3Ekmm1RM228C3B8zzrt/DGVIJi+/K4czZBWXDcpmRemlBnJ9ekU6BMhDNMlHzm8ssFxOg6iPBbymbu8tyfL817K4hwxC1RCW43uLfBAJvmltYGm+pu4IPH0267KZLgiWg5zvDO0HL0iD3/MUsxLR9pEjASikvxGW24WvMkcFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=TSYvSS/O; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="TSYvSS/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778191939; x=1809727939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Me6vW1zg1ICKmqO5GfPSrEQwd7B1POaq2QXbncQv7ds=;
  b=TSYvSS/Or7Shu2z0cd0AEuPxQzTsIqVy4s5jx1n23PVlkQk5J+lodWNc
   caMOsvXqHJBGCo3+uzJtgaNejg4uSrL54DRFtxE/Bwt0PstjO3/VRkEiW
   Ut5p+bB4d0UvcKPF6Dhz4hiP2bp2x3SrKbEa3xB+MIcWgNDvMJFpjs6FV
   P+q554BA+ulvsfglJ/NRp/+FxSWcDPfRu0UksNA49t6dCnXW2n+5EvOCl
   pCt8S6+DV1UOfgdSgqP0Dwoa8ujLUKD7u8KkkQeeniXWUARZfry7EpcF7
   tIhu8IH6npjEZoMbevKTsDkIAUCNLpnSky9nHqdGnZkIJSeM0rmC24jC0
   A==;
X-CSE-ConnectionGUID: DdjVrFrBQsKPNHwT5hJwmg==
X-CSE-MsgGUID: TL3LNifsQIyQrsIuYv0ESQ==
X-IronPort-AV: E=Sophos;i="6.23,222,1770595200"; 
   d="scan'208";a="19124264"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 22:12:15 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:4691]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.42:2525] with esmtp (Farcaster)
 id 966878fe-4ee1-48c7-9c60-ac4acb547e0f; Thu, 7 May 2026 22:12:14 +0000 (UTC)
X-Farcaster-Flow-ID: 966878fe-4ee1-48c7-9c60-ac4acb547e0f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 7 May 2026 22:12:13 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 7 May 2026
 22:12:11 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Saurav Sachidanand <sauravsc@amazon.com>
Subject: [PATCH v2 0/2] i2c: tegra: fix error handling in tegra_i2c_xfer()
Date: Thu, 7 May 2026 22:11:43 +0000
Message-ID: <20260507221145.62183-1-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506195319.44810-1-sauravsc@amazon.com>
References: <20260506195319.44810-1-sauravsc@amazon.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D036UWC004.ant.amazon.com (10.13.139.205) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Fix two bugs in the SW mutex path introduced by commit 6077cfd716fb
("i2c: tegra: Add support for SW mutex register"):

1/2: Fix pm_runtime reference leak when tegra_i2c_mutex_lock() fails.
2/2: Make tegra_i2c_mutex_unlock() return void with WARN to avoid
     silently losing transfer errors.

Changes since v1:
- Split into two patches (Jon)
- Make tegra_i2c_mutex_unlock() return void with WARN instead of
  propagating the error value (Jon)

v1: https://lore.kernel.org/all/20260506195319.44810-1-sauravsc@amazon.com/

Saurav Sachidanand (2):
  i2c: tegra: fix pm_runtime leak on mutex_lock failure
  i2c: tegra: make tegra_i2c_mutex_unlock() return void

 drivers/i2c/busses/i2c-tegra.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.47.3


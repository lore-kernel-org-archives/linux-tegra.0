Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F62E2CCC5;
	Tue,  1 Apr 2025 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507100; cv=none; b=BY2CIEg0Mqduz5KsnGguMMw7ui2dtxP2/miLVYftnVOetuuokxQEEFSQU2op8gk5LTeHardfKd070W3WTACGWvITw33p4pLGROYWAVCT/FqvrjQ6OuaPno4ttpMV1dSiIIlajYRTIP5eItZDilx8BdQAZY27EgRsMMvYbdAhUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507100; c=relaxed/simple;
	bh=yej5F9L8XcGYyFdwKI0upvafsPA0pPHb5yAKbRUZUr4=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=RF1twMOXtuiswstv7ZiXx+dLeDxup5O6XGc/i/xsiZ9rFma/dyyFnI9Lyb6aJL6NidTeM6MwDRx+Wn2tGS9JeOSreaf4G5tArckMVq24OfqzcJnLemm5EtwdoI6oE/YqR8zIahhhYl2kXCZu7DwJ6na31NmBVN80zKUV2z7L28g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZRm6c2Mymz5B1Jb;
	Tue,  1 Apr 2025 19:31:36 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 531BVV0t089841;
	Tue, 1 Apr 2025 19:31:31 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 1 Apr 2025 19:31:34 +0800 (CST)
Date: Tue, 1 Apr 2025 19:31:34 +0800 (CST)
X-Zmail-TransId: 2afb67ebce96ffffffffe45-8edc6
X-Mailer: Zmail v1.0
Message-ID: <20250401193134281Nbc40spYmxjVmftwF0KTZ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <miquel.raynal@bootlin.com>, <jckuo@nvidia.com>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <shao.mingyin@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <xie.ludan@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDAvMl0gVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUgaW4gcGh5?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 531BVV0t089841
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EBCE98.002/4ZRm6c2Mymz5B1Jb

From: Xie Ludan <xie.ludan@zte.com.cn>

Introduce devm_platform_ioremap_resource_byname() to simplify resource
retrieval and mapping.This new function consolidates
platform_get_resource_byname() and devm_ioremap_resource() into
a single call, improving code readability and reducing API call overhead.

Xie Ludan (2):
  phy: marvell: a3700-comphy: Use devm_platform_ioremap_resource_byname
  phy: tegra: xusb: Use devm_platform_ioremap_resource_byname

 drivers/phy/marvell/phy-mvebu-a3700-comphy.c | 16 +++++-----------
 drivers/phy/tegra/xusb-tegra186.c            |  4 +---
 2 files changed, 6 insertions(+), 14 deletions(-)

-- 
2.25.1

Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F843ACA4A;
	Thu, 24 Sep 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248780; cv=none; b=LhOnIs8hcpkBjFZiGUiAdCdn8WsW3fVOMKvLBOJa9jwwOhi6CSUVXJAEa0Oc/wkpHdITykt1F+ZdFY3NZ4smC6rcs1CA1zkh047mBoRuPnzdJd0mxv1ETHSEauB4t30IsZD7cAcslTc8q4ypvEmvrHQT/YXiPfckqykkEVeQV3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248780; c=relaxed/simple;
	bh=a0Uh7g5jgkhC3r3VSPqhbhb5yGXwrDPzSjfdx4/QiHw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FZrb4gExaIbm3V03rX4JEGqfCDSpOt63RrAmahn8ZpACHLAMdMnZP1lZjakynwGxQQBsqa7zQACWMY1g/hsx77DKdfdNC0ySRKBSJpAhNJVU/1o4tCfge9isMNiZb2SPo99pJnCZWyfyBkKydt1ZhiUtBJmGt5OmOQLa9Wch5kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QV6BafI8; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QV6BafI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hz
	t1z7kJPPfoaRFuO9H4/NolLUzXNdYFjQv1jMOvkz8=; b=QV6BafI8pFOGaIVJwU
	DApg4+wC5O+K0cK2r1y8+SkescftBRTNkxHmTsPmnJki8rc7iu5W9DHSfLXVtzLD
	rRnOCyJ1DBO1QzsON5HQ5h7DzALZtMeBxz7OEtJfg7XaGQGYYUthdz0z3VRQ43ln
	t6W/OMSEjWH9agQGJ7QPhhWkE=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H4YqB7Vqww4oAg--.65098S2;
	Thu, 24 Sep 2026 19:19:07 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/4] pinctrl: free maps on DT mapping failures
Date: Thu, 24 Sep 2026 19:18:48 +0800
Message-Id: <20260924111856.622898-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H4YqB7Vqww4oAg--.65098S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrKr15KryfWw48KF47ArWkZwb_yoW8Jr1UpF
	4fWrn0yr1DJw42yF9xJw10yryfCa1xCry3W3W3Ka4rZFs8CFyDtr1YkFWrXrWkCrWUJa1a
	qr45KFyDWr18CFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiiS9UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgvTDmq1BysNcAAA3W

Several pinctrl drivers reserve map storage before appending mux and
configuration entries while translating device tree nodes.  If a later
operation fails, their error paths free only temporary configuration data
and leave the partially built map allocated.

Commit 17007cd700601777d9ee203a13d97e64ece3a10f fixed the same cleanup
problem in the generic mapping helper.  These drivers use their own mapping
callbacks and need equivalent error handling.

Free the accumulated map and clear the output parameters on every failure
path in the Spreadtrum, Renesas RZ/N1, Tegra XUSB, and Samsung drivers.
Each patch changes one driver and remains independently buildable.

Jiale Yao (4):
  pinctrl: sprd: free maps on DT map failure
  pinctrl: renesas: rzn1: free maps on DT map failure
  pinctrl: tegra: xusb: free maps on DT map failure
  pinctrl: samsung: free maps on DT map failure

 drivers/pinctrl/renesas/pinctrl-rzn1.c     | 10 +++++++--
 drivers/pinctrl/samsung/pinctrl-samsung.c  | 26 ++++++++++++++--------
 drivers/pinctrl/sprd/pinctrl-sprd.c        |  6 +++++
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c |  8 ++++++-
 4 files changed, 38 insertions(+), 12 deletions(-)

-- 
2.34.1


Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B01D39734A;
	Sat,  3 Oct 2026 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016367; cv=none; b=LHKTNTt568/Cb7c1b/J0kt2yKAs6X1cnqsgPlU7AZF5GScmZdz6CYXOKfGIYY5SmWzeoOV6R8f/m6JMWyXsxfcfe6VnNy1pgHQXFP7XA3+MuiwAINGvmKyu6J+qSdHfIoLKSiBfB6PDPMLzc7gCIE09Kgu+O125YRgX73CuyZek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016367; c=relaxed/simple;
	bh=mTgsraDyaZwUNKNLUzIDplC+Yod0FrM7Z7ibjSoJow8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dCGM46iSRKaBmko5pj2CarxaGvrcEsjRrZF546nl4offGA6pKSDkwjoYvtCxTG7mgNGiT5mHy+3d1wT2OI4OWDYjA8GBxw5MOIWAbYyVyfvI4Ato5zVm35FBIOzHDPr3v64G6GdrQGH0VUhQmn337KQZnuEHvRl2Cto28m7fx0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FlqL+VRp; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FlqL+VRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=I0
	96cPDAgu/rffSPuYsOvZ0nu9Fx4C52NqLyO2/RJjU=; b=FlqL+VRpdcFAWmYaMI
	aBRL3FvMMPe/QiX2CUAF4I04Ad1aPvQq1ty4z3wpa34NEzKU6BQmE49Gt4YK3KGt
	Hznk+wTN2Tni1nvvouOQjBmPnEhhXinvOzoZOSiPmeJkMVQ2YkZPFjZJS6PyO2TK
	CaWxfYnp61Y77D9qxJ89SVtBo=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3dzGDvcBqKMk7CA--.47308S2;
	Sat, 03 Oct 2026 16:32:04 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 0/4] pinctrl: free maps on DT mapping failures
Date: Sat,  3 Oct 2026 16:31:53 +0800
Message-Id: <20261003083200.459705-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3dzGDvcBqKMk7CA--.47308S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWrtw15tr4rtr4fAF1DKFg_yoW8GFyUpF
	4fWFsIyrn8Jw42yF9xJw10yFyfGa1xCry5W3W3K34UZF45CFyDGr4Y9FWFqrWkCrW8Ww4f
	tF45KFyDWr18AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEM5lnUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQRblWrAvYT77AAA3D

Several pinctrl drivers reserve map storage before appending mux and
configuration entries while translating device tree nodes.  If a later
operation fails, their error paths free only temporary configuration data
and leave the partially built map allocated.

Commit 17007cd70060 ("pinctrl: generic: free maps on
pinctrl_generic_to_map() failure") fixed the same cleanup problem in the
generic mapping helper.  These drivers use their own mapping callbacks and
need equivalent error handling.

Free the accumulated map on every failure path in the Spreadtrum, Renesas
RZ/N1, Tegra XUSB, and Samsung drivers.  Each patch changes one driver and
remains independently buildable.

Changes in v2:
- Add the Fixes tag and Baolin's Reviewed-by tag to patch 1.
- Drop the unnecessary output parameter resets from all four patches and
  update their commit messages accordingly.

Jiale Yao (4):
  pinctrl: sprd: free maps on DT map failure
  pinctrl: renesas: rzn1: free maps on DT map failure
  pinctrl: tegra: xusb: free maps on DT map failure
  pinctrl: samsung: free maps on DT map failure

 drivers/pinctrl/renesas/pinctrl-rzn1.c     |  8 ++++++--
 drivers/pinctrl/samsung/pinctrl-samsung.c  | 24 ++++++++++++++--------
 drivers/pinctrl/sprd/pinctrl-sprd.c        |  3 +++
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c |  6 +++++-
 4 files changed, 29 insertions(+), 12 deletions(-)

-- 
2.34.1


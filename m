Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793741412;
	b=Wpz7FC+CABes7lqS/tEbSHwEiWkzpFcZEi0K56CVNpmEkhiPy5Aar8SGP9ui8SZ0Hw2g
	 vGl1Jk1Z4SQOvmcEXck1Uwd9aG5p4QAtO8cqcpiPAZQmMMtuxuNIPmRID5ns6I4VR6pgK
	 ylYs1uxBEp2OzKoEdGIvevaNo5TwsnNnO7tAoQ1+Bu2om0DeC1QCV7Fl1e3z9bhZF0hRJ
	 fzuW+EwhwjP+BfY7DP7e+yiKiKbjRGUeHPE6nMUiw8HT+GUXmxz9iiK5rGl3foaM3qDfq
	 nWpPEtlONqQ7cwASXuM1d52vVuesT+DF2Io2tEgM9TwpmqxZdCvDNnDObYbTCIwbmjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741412;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hSCaaw++8I656zFNy7LQRd8ABGr7mMB4uT74hb/cMaA=;
	b=XutGZzeXOrPLVaiChsjSfST0UU9ln2y102HQyLPd/wA/gch3KmEyd8bGTsGmdf2nT/Ne
	 XMp0tFX9tx8h5ocD9OCYJtmyGRS0VuUR3NiuGvInTt5Uur0GzjX2DolpX9+PnXRuT6CGi
	 cr8/JWn3oWkuHcqTerQwDTlmjSJRn6BHGkhPjFUcoUCteQYhS1f7fKts6IT5ZcjoXRVeH
	 5+gDbkNtlyI4S3yYKhuj2WwIDMBhjjTuH5ukxRRE1cWq1RsxeAK/a3e9nKNeUpBpeqjyj
	 w2xebRIFCNh/Xwmo/UXoCuh8EZ6xJ1sMDbTXcFVoliJtpfPGDp6dMH23DmgWagEdeig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7IOfJvX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96115606A328;
	Tue,  3 Nov 2026 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7IOfJvX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5071F000C1;
	Tue,  3 Nov 2026 21:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741411;
	bh=hSCaaw++8I656zFNy7LQRd8ABGr7mMB4uT74hb/cMaA=;
	h=From:To:Cc:Subject:Date;
	b=M7IOfJvX4tS+cjxfv8hnjjn4ahQi/zSlCAzZpqOgV5iftbC/NJ4KlHvuPE0DJA+c+
	 MTjlkr/LW9q203SjetCZ8ymojJw1xErc2I/C00BOgA97La+kkxFTeF/pstxISoVrDY
	 aiMQhaNQXI9SLKqHJ8lLe5yWcxRmSBCsZnkUb8ySJwl8bLUo6yWTpU92W4YFYsQE+r
	 R0lI9CalC2dBG5yOkxJhvOz4wNb6eXUweZz3xXJ9jut1Ny1P/GPSo+kop5W/WviWZM
	 VE1n9S//CUEqIrm3cKlGQm6MgvaJrMIYLGmyxxFH1VEQrILd7I5MDI/hDSx4Q+GcYB
	 oJ/WyJL+KuUnQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aaron Kling <webgeek1234@gmail.com>,
	Ajay Kishore <akisho@codeaurora.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Andre Przywara <andre.przywara@arm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	James Tai <james.tai@realtek.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Paul Boddie <paul@boddie.org.uk>,
	Paul Cercueil <paul@crapouillou.net>,
	Qingliang Li <qingliang.li@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	"Ryder.Lee" <ryder.lee@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Samuel Holland <samuel@sholland.org>,
	Sean Wang <sean.wang@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Tzuyi Chang <tychang@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	zhouyanjie@wanyeetech.com
Subject: [PATCH 00/10] pinctrl: Fix out-of-bounds accesses, divide-by-zero, and error handling
Date: Tue,  3 Nov 2026 21:29:05 +0000
Message-ID: <20261103213002.1673560-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These issues were reported by Sashiko.

Cc: Aaron Kling <webgeek1234@gmail.com>
Cc: Ajay Kishore <akisho@codeaurora.org>
Cc: "Andreas Färber" <afaerber@suse.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: James Tai <james.tai@realtek.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-realtek-soc@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Paul Boddie <paul@boddie.org.uk>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: "Ryder.Lee" <ryder.lee@mediatek.com>
Cc: Sam Shih <sam.shih@mediatek.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: Tzuyi Chang <tychang@realtek.com>
Cc: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: zhouyanjie@wanyeetech.com

Lee Jones (10):
  pinctrl: sunxi: Fix out-of-bounds irq_bank index when first bank has
    no IRQs
  pinctrl: tegra186: Fix out-of-bounds register bank index for AON drive
    groups
  pinctrl: ingenic: Fix element type of x1600_sfc_funcs array
  pinctrl: mediatek: mt7981: Add missing entries to mt7981_ant_sel_funcs
  pinctrl: realtek: Prevent out-of-bounds access in
    rtd_pinctrl_find_config()
  pinctrl: realtek: Fix bit shift when configuring RTD_HIGH_VIL
  pinctrl: realtek: Initialise omitted offset fields to NA in config
    macros
  pinctrl: mediatek: Clean up partially initialised hw->eint on error
  pinctrl: mediatek: Prevent divide-by-zero for pins with fixed drive
    strength
  pinctrl: qcom: Check qcom_scm_io_readl() return value in
    msm_gpio_irq_set_type()

 drivers/pinctrl/mediatek/pinctrl-mt7981.c     |   2 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  24 ++++-
 drivers/pinctrl/pinctrl-ingenic.c             |   2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c            |  10 +-
 drivers/pinctrl/realtek/pinctrl-rtd.c         |   5 +-
 drivers/pinctrl/realtek/pinctrl-rtd.h         |   5 +
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c      |  11 +-
 drivers/pinctrl/tegra/pinctrl-tegra186.c      | 102 +++++++++---------
 8 files changed, 93 insertions(+), 68 deletions(-)

-- 
2.56.0.385.gac671c819a-goog


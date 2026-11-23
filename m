Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452525;
	b=C/9/8YcTDQi6eDvfH/b9qMvp4aOr9u/xK0dCMHCjYuG+6X7hSXoo/jNFebzoyZ3QfsO1
	 /5nL2ulCBlF3e3IyJ4c5YVtHsVem+AHGX6HesYyTZMMPjZ3zrbmSKkSRlJ1t5g7jbNDRY
	 IRiNppHYl4svGqhhOdpM3pN8kHNfdtuJLHIbi5hY1QUGA69Vb+5OgSOp6gk/m9E0XJYaq
	 +TsNVbwlIZV/0U7NRCRu1jr/a18ZDUiY+kKNZRWG9mEzY+VxvHJYdaBmPuI4axWjItGcR
	 TmJ5KtngV6FjGL9mQBaK2qr1cKLJfxvlAwYzz6yQrB13JaAClrTk1oiX5fD0lk3J6uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452525;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=msw4FIKrAUyInphRYrqr8Ra5cv1R+7cgbS2Ass40zs0=;
	b=IK6C4T0tLA/SXEkiDm2utLLdEZp0JHvajzRwxUUrpBDWkpxqUVB/Tm5SQRG9qUuHF7mn
	 jq/PepvY70FRwmgS06SrBi9ze8UekGrEzixbmkBrcWbH5rfCX+ED38kR1kv2NoUNcjf7G
	 U/oFAa6JYXxQ2DP5D1sg9B2+rNXY/BeMmtu4K7g7XWw+wuJY2XlLZAtKipnxdSmhqgcIY
	 ZNC5vYaS5VL3BAaXzDZyPnIptBQQ1lLp9He+t7ne2NUAGYqD2KqBzVzDVYinHiS/Xb4yz
	 pJStZBYRKsyT6xNzXKbzvuhjOnzsaqAJdq7aqGqeGGx3oSiU18hZnQsevzSGafYIksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDF5ZjcJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0697606A33F;
	Mon, 23 Nov 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDF5ZjcJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BEA1F000CF;
	Mon, 23 Nov 2026 16:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452524;
	bh=msw4FIKrAUyInphRYrqr8Ra5cv1R+7cgbS2Ass40zs0=;
	h=From:To:Cc:Subject:Date;
	b=FDF5ZjcJciDoEpkil1kpfCRri+Jge5eOMAixKUEN0r6++t8yVnG6E1DCNhHu5gYgB
	 S22zyhbQ5N7Uy8+2qGcKoaS2aHnbKKLSk8Wo6cdmfkRhGUc04L+BmIKpToi5ul/RIZ
	 BmItkIWXUGcu8LLQ1aJfSizqqFlgNLmcQaoXcfZ5/YSg1cf3HT7mRNVm+SxlksuMK0
	 ENWLPUcAPLz3GXQCcSCzkD9ecq1WlRx/xjhOcTlUxz4l6XaXFMWzObMkYH6yLp26hx
	 5z9wvUkJh/Xqv70vJNQrHjTAbU6iPKk8Xjja9FBbupMa9UaGjpJPMR1fG6HlnDyjT/
	 7had/M0yF6Olw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"Zhao, Linaro" <richard.zhao@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Amit Daniel Kachhap <amit.daniel@samsung.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Chander Kashyap <k.chander@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Drew Fustini <fustini@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Heiko Stuebner <heiko@sntech.de>,
	imx@lists.linux.dev,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jyri Sarha <jsarha@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Beguin <lvb@xiphos.com>,
	Linaro Ltd <mturquette@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Lubomir Rintel <lkundrak@v3.sk>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Marian Mihailescu <mihailescu2m@gmail.com>,
	Maxime Coquelin <maxime.coquelin@st.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Peng Fan <peng.fan@nxp.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Rosen Penev <rosenp@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sergej Sawazki <ce3a@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thomas Abraham <thomas.ab@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 00/10] clk: Assorted bug fixes across clock core and drivers
Date: Mon, 23 Nov 2026 16:47:33 +0000
Message-ID: <20261123164834.3330320-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

None of these changes have been tested on physical hardware.

Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: "Zhao, Linaro" <richard.zhao@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Brian Masney <bmasney+clk@redhat.com>
Cc: Chander Kashyap <k.chander@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: imx@lists.linux.dev
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Joel Stanley <jms@oss.tenstorrent.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Liam Beguin <lvb@xiphos.com>
Cc: Linaro Ltd <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Lukasz Luba <lukasz.luba@arm.com>
Cc: Marian Mihailescu <mihailescu2m@gmail.com>
Cc: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sergej Sawazki <ce3a@gmx.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>

Lee Jones (10):
  clk: imx: imx8qxp-lpcg: Prevent stack overflow when parsing clocks
  clk: lmk04832: Validate child reg index in lmk04832_probe()
  clk: tegra: bpmp: Bound num_parents by MRQ_CLK_MAX_PARENTS
  clk: composite: Initialise sub-hw pointers in determine_rate()
  clk: divider: Avoid division by zero in _div_round_closest()
  clk: gpio: Reject gate clocks with multiple parents
  clk: samsung: exynos5420: Terminate PLL rate tables with sentinels
  clk: tenstorrent: Poll atomically in atlantis_clk_pll_enable()
  clk: cdce925: Use devm_of_clk_add_hw_provider() to avoid UAF on unbind
  clk: mmp: audio: Use devm_of_clk_add_hw_provider() to prevent UAF

 drivers/clk/clk-cdce925.c               |  4 ++--
 drivers/clk/clk-composite.c             |  2 ++
 drivers/clk/clk-divider.c               |  3 +++
 drivers/clk/clk-gpio.c                  |  3 +++
 drivers/clk/clk-lmk04832.c              | 10 ++++++++--
 drivers/clk/imx/clk-imx8qxp-lpcg.c      |  4 ++++
 drivers/clk/mmp/clk-audio.c             |  4 ++--
 drivers/clk/samsung/clk-exynos5420.c    |  4 ++++
 drivers/clk/tegra/clk-bpmp.c            | 14 +++++++-------
 drivers/clk/tenstorrent/atlantis-prcm.c |  9 +++++----
 10 files changed, 40 insertions(+), 17 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog


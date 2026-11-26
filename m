Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677278;
	b=4RsVzU74aZgG70zt+M8x4hE9IYOhGavWwxfUKBLQRkz6B0C8CLG1wAt3NKfhqdquCRvK
	 p1uO4IxM5GjewxDWya1Np9HsFlbBLc1u/nFN/6/ygOY2DJZ1ZTb8KGvmZrY02/x50reS8
	 3gBTrxcjTL8I4Y0MR/av7AMIDMB30IQi2CJ7TH28HdTV8XS+Saz+2DLNIlXLy4HGPL/Nn
	 DmEDQ6YA+M0Nypyow6RFrRG8oz8h7o4ZCpEAsRBj0Cvpf+vj1u5CL3/TQwEm6Cq1jH4hS
	 R0sk/y5ngSJ7oVQqYiFeDwXvbZ4tKJh9TLu0Q5uerd+n4ScUknQgamTKEwp657HrySg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677278;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=53x66dpOysE700lhiF+v1Ti3qORDyr+UbN9kd+D3Gh4=;
	b=aqnbN+/W3cwlL89IMCMq3cpAjpXxWh/gX2qK/FUoHRgrSnQRA5Ex5dpNfO77jEMzY7e1
	 F4ID3Kk1okpYWkT3/jEyQc80UfdqO3ufg1P1iBbWkUsRxTNZNKTh9jw+cWiiDIMZSotjq
	 IM6hHp2uH0sTcEDR/kjUv3oDxc39skvOU1GxlpHs1gmuloOkP79wYfDi06RULZmpLv+JR
	 mkG7i52NZkrAItnfzFRQBTwRuLWLi6QfS6civX/z4n4e7fTeyvOm40pwto2VyEoZ/25DW
	 +iq5SJpyUnm0muVw6kFotVr8zj+Q8AnoWDmze821mys793ZXbcFX6rhGk6gXJClD0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nx1Y6HzP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC2606A31C;
	Thu, 26 Nov 2026 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nx1Y6HzP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9EA1F000C6;
	Thu, 26 Nov 2026 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795677277;
	bh=53x66dpOysE700lhiF+v1Ti3qORDyr+UbN9kd+D3Gh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Nx1Y6HzP6YmxBYDOcJWxCaz8aslRqwn3YbimRiB0dOW5tsFZkgAZVhYAcMt2cMY94
	 fw6Fk8Qiks7viNmu2NwepgpOnIYubHvDpVIfkf+TC+bqZivNzTGzKK+wCa6wsn0HyG
	 2Oel27nbR9E/ubhu4qWAzXiN1a58IKzKUDckNABhBiuA9AuE2qgl94pDmZDO9yXCp+
	 YfXaTY+SlRPmHvH8pbXP16/zWWPDHi7JOAoklCdn7eID6wnrE+1km+JUcikjgf/ckp
	 gJeIHXNKmFxlsyKZTk/AFmcg6c5xew7eMf206ku52vksInSAl6J+C70lkMbJH/Kmva
	 /vqGUNvj2PvPA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 "Zhao, Linaro" <richard.zhao@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Amit Daniel Kachhap <amit.daniel@samsung.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Chander Kashyap <k.chander@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Drew Fustini <fustini@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frank Li <Frank.Li@nxp.com>, Heiko Stuebner <heiko@sntech.de>, 
 imx@lists.linux.dev, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jsarha@ti.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Liam Beguin <lvb@xiphos.com>, Linaro Ltd <mturquette@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Lubomir Rintel <lkundrak@v3.sk>, Lukasz Luba <lukasz.luba@arm.com>, 
 Marian Mihailescu <mihailescu2m@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 Mike Looijmans <mike.looijmans@topic.nl>, Peng Fan <peng.fan@nxp.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Rosen Penev <rosenp@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sergej Sawazki <ce3a@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>
In-Reply-To: <20261123164834.3330320-1-lee@kernel.org>
References: <20261123164834.3330320-1-lee@kernel.org>
Subject: Re: (subset) [PATCH 00/10] clk: Assorted bug fixes across clock
 core and drivers
Message-Id: <179567727106.9086.4007919152692495322.b4-ty@b4>
Date: Thu, 26 Nov 2026 08:14:31 +0100
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev


On Mon, 23 Nov 2026 16:47:33 +0000, Lee Jones wrote:
> clk: Assorted bug fixes across clock core and drivers
> 
> These issues were reported by Sashiko.
> 
> None of these changes have been tested on physical hardware.
> 
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: "Zhao, Linaro" <richard.zhao@linaro.org>
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Amit Daniel Kachhap <amit.daniel@samsung.com>
> Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Cc: Brian Masney <bmasney+clk@redhat.com>
> Cc: Chander Kashyap <k.chander@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Drew Fustini <fustini@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: imx@lists.linux.dev
> Cc: Jerome Brunet <jbrunet+clk@baylibre.com>
> Cc: Joel Stanley <jms@oss.tenstorrent.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Liam Beguin <lvb@xiphos.com>
> Cc: Linaro Ltd <mturquette@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Lubomir Rintel <lkundrak@v3.sk>
> Cc: Lukasz Luba <lukasz.luba@arm.com>
> Cc: Marian Mihailescu <mihailescu2m@gmail.com>
> Cc: Maxime Coquelin <maxime.coquelin@st.com>
> Cc: Mike Looijmans <mike.looijmans@topic.nl>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sergej Sawazki <ce3a@gmx.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Thierry Reding <thierry.reding@kernel.org>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Cc: Tomasz Figa <t.figa@samsung.com>
> 
> [...]

Applied, thanks!

[07/10] clk: samsung: exynos5420: Terminate PLL rate tables with sentinels
        https://git.kernel.org/krzk/linux/c/16efc5f5b3963779dd9aa714fdcb55a6bd8469d5

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


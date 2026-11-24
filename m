Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546818;
	b=G3RHqXu2JBaLoJ1Fc7efdlrfN2QpZMqCSxmOj5b6YM2QXk9eHMGyb7hW1FVkJRqo4paw
	 XBpfdPKzrRhmOJXLm4+4u8WnQpa2k2RBMjtTXVR2KURmaG0wKEn8BGcA2zKxoVEb/JFJH
	 GzQQEqKidjZREjCu49jziEU/VQod0u44t28UIqWbK6+jVutybq9FJmKxHoE2k5+VMv2X1
	 lx8RSodSlXM0XpSnexLHPSevXxdNzipFmsRGz9BlWbfXKPgOIqP05e+ONpkFU/NrKLyUq
	 v5Xhxv4cqQnDOT2AtLomRbrLYajDuxTBShkEqjPXMcJoByPJEDMGMt7rhcUPfk6eeZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546818;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OfIXQRWoYznMpr75Y1t1EKHjE7dfreJB7BbbTEkR9WU=;
	b=nHtcb1dwozfpoT5jShdD79QM6YQLzjMLfvEFguOJdD3c+PhZT2JJlm6GDtpJeJv5IJ/C
	 ZekIqsyvL6HPnEg4RScCGpEJm1sUl3F4+f5+HMqFUijRvPKvbYOS3kb7KfBkSEAdsxf8+
	 1qup0gdDYbh3Yh/ee7Ejbpb+F114+RyEvfYeVcOZ9gtAA1jkoipYjcH0a5GLtDN/2d0fx
	 zzzVxgMOfifhKMX6DBRTocm6ltdnBmuuPk5yyC57W8Rq01YCqIHV3k4SQjmWCPSDTA5b5
	 P+M5iPLl/8198BVNIS+vyOoQpUqJnX9tEE3eNrDg10fB76Mz95TfQ1QhZNl3avejEpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncKK1whx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49F2606A682;
	Tue, 24 Nov 2026 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncKK1whx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA771F000C4;
	Tue, 24 Nov 2026 19:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795546818;
	bh=OfIXQRWoYznMpr75Y1t1EKHjE7dfreJB7BbbTEkR9WU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ncKK1whxIxltl9w3NrjL8l4PDTlrCE/FzSAxmSG7NSaUmYQuWeH6L8sIqoWaoNvrw
	 0/PeRp9VmjzBxclu9NKYtU+u3TYgQCHsL257kJ+cNY52LeOxS5SWVfKfP0WmIdoFVp
	 yASCbkBMPQqX5sAXqFJbm02JZFNTVe/3d1gLzMTO27O5CVmnblzubVOthX6sna3aPp
	 I+z99cPKoFG3wKJuOJ97BRWkLcmWMDKZV/jb9LgavqbrxZzgJNVi5uG1FDZ0eZxt2J
	 DdD+dIyU28gy++Kug8HSdUdHyu1wQVI9BUVUj4mRBFPJ1ysICP9aOag+8SjMkiMWkj
	 l1n8fJ1H4G3+w==
From: Brian Masney <masneyb@kernel.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
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
 Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261123164834.3330320-1-lee@kernel.org>
References: <20261123164834.3330320-1-lee@kernel.org>
Subject: Re: (subset) [PATCH 00/10] clk: Assorted bug fixes across clock
 core and drivers
Message-Id: <179554678508.352639.3508427370180732943.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:59:45 -0500
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
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=3203; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=Ag2AinISm4aFoF5s9EyCfBnaRyNhL06vGNk10A6iLlI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZ720tnJcTOVN5EVPBweUqLjvWLfm7rev3YcVz7FO6y
 hcuWLU7uKOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ/D/D8N9rsoXElmlecoVx
 h3xSf/5sSY/XeCnxXCfY81/BklWy+usZ/teydF76fdXpYmPdscuXihu2CR2aIzFx3erNj5okavd
 w7GUHAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


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

[02/10] clk: lmk04832: Validate child reg index in lmk04832_probe()
        https://git.kernel.org/clk/linux/c/503fe32e46b5
[03/10] clk: tegra: bpmp: Bound num_parents by MRQ_CLK_MAX_PARENTS
        https://git.kernel.org/clk/linux/c/875e62416145
[04/10] clk: composite: Initialise sub-hw pointers in determine_rate()
        https://git.kernel.org/clk/linux/c/efa7603036b8
[06/10] clk: gpio: Reject gate clocks with multiple parents
        https://git.kernel.org/clk/linux/c/ac7fb1e8ffea
[09/10] clk: cdce925: Use devm_of_clk_add_hw_provider() to avoid UAF on unbind
        https://git.kernel.org/clk/linux/c/b0c22a496660
[10/10] clk: mmp: audio: Use devm_of_clk_add_hw_provider() to prevent UAF
        https://git.kernel.org/clk/linux/c/8b01bdbcd6ae

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


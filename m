Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121276;
	b=cprLyAnKDQMY+6WNFvf/vcYqdRmryllnjGLlZ9/QHHWlfKBQPr8VWajEtrFyEbFvWpei
	 FhsKO5ZG64bY4IZlpQTYfD2T8sRo7IZyFa1U58NbeKjHpgvxrx8Vi95vZkCdmLiFHFunX
	 Yi80rI2Fmnzi8othm2k/j63cNc7U1P5WR4lxiKgNbDDoQPkufDS8H2bAbDa1yASAJk/3t
	 zNlA0G4IpG2H+2gMxqhXzg6BURaldjQek5yVXUVY8UofIY8YG7ZfxcoaVVzUKP52Tvy+g
	 4Z5ktDQBL/e7jUBC1vwxv7HULFvsrYCJaMoIm5IE6kok99Cc4EOqYwNdGCQ3rmVohfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121276;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fjP62IC7BY5+fCteY4TlTF+5AyEq5vMalnJjs0i2F0k=;
	b=Sfb0vrlhZw6Lq5CFyL+5lfJhD1jL9K/bCO/CBI3EUE5AFYxxZpJ5rkxy8T5qot6Zgwn8
	 4XUIBqoZ1vRtiGK3g7KKYpUkGxJhkQpTx7lP6H8bM1Vhgz5CJsQO0nKt6ZnkMs76jp5q+
	 7DRq7l3/G8EsFMRoOwzqhNE+x4JYGNknP9xvtuKLYqQ/gBjjRW7vej3mQV1aTrl8e/9F5
	 DdPtrEewTjl90Q5VssV4pbd57ZWvoL2AVIWJsUI94eyS1pcQTmQJ61/Y/Tf1lHr721b6v
	 2nsMy7CHNETi6bgFLW6bEDnyDW9Vb+iVMneUEBZdu9nXR/9bl572EOzg5wetwzlAtQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGzroEby;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DF6606CC5E;
	Thu, 19 Nov 2026 20:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGzroEby
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BE11F000C0;
	Thu, 19 Nov 2026 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121275;
	bh=fjP62IC7BY5+fCteY4TlTF+5AyEq5vMalnJjs0i2F0k=;
	h=From:To:Cc:Subject:Date;
	b=XGzroEbyIqfu1F020pLEYGri2yRna/SmU4yPDMxz2Wqj/z1KN7rGZn0GSOLhpYq7L
	 QSg6SjYUgyDMhMEKCg3+aNqudcIsmhBZDWrpZF0/t0mzfhT9gfQZo+Cs/wFoWTSu9x
	 9EBLqWQ5E+u3MaXNR+uRwGns1MurwMZswQqv+e2FBKtY5mGdGDHx2vU3exEwnSoWZs
	 juXbrdCssWoAxWX/jyKVWruN+nXmB6x1c/fHuySNxbYGVJn6HPlyDFlIslXaTWVP7x
	 3no91nBAFXMzjJvLMlgGs9DhKqw8GAlTDwBGfufKDHr6XkdwkYPu2iLKJAmq7Ov3Dl
	 egQy1lD7u+OLw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aaron Kling <webgeek1234@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Maoguang Meng <maoguang.meng@mediatek.com>,
	Nicolas Boichat <drinkcat@chromium.org>,
	Olivier Louvignes <olivier@mgcrea.io>,
	Paul Boddie <paul@boddie.org.uk>,
	Paul Cercueil <paul@crapouillou.net>,
	Qingliang Li <qingliang.li@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	"Ryder.Lee" <ryder.lee@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Sean Wang <sean.wang@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	zhouyanjie@wanyeetech.com
Subject: [PATCH v2 0/6] pinctrl: Fix out-of-bounds accesses, divide-by-zero, and error handling
Date: Thu, 19 Nov 2026 20:47:15 +0000
Message-ID: <20261119204748.2558209-1-lee@kernel.org>
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

v1 => v2:
 - Drop patches 05/10, 06/10, 07/10, and 10/10, already applied to pinctrl
   for-next
 - Drop patch 01/10 (sunxi) in favour of the broader Allwinner IRQ-bank
   rework in flight (Andre, Sashiko)
 - mediatek: Guard against NULL eint in mtk_eint_do_suspend() and
   mtk_eint_do_resume() before resetting hw->eint to NULL on error (Sashiko)

v1: https://lore.kernel.org/all/20261103213002.1673560-1-lee@kernel.org/

Cc: Aaron Kling <webgeek1234@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Maoguang Meng <maoguang.meng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>
Cc: Paul Boddie <paul@boddie.org.uk>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: "Ryder.Lee" <ryder.lee@mediatek.com>
Cc: Sam Shih <sam.shih@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: zhouyanjie@wanyeetech.com

Lee Jones (6):
  pinctrl: tegra186: Fix out-of-bounds register bank index for AON drive
    groups
  pinctrl: ingenic: Fix element type of x1600_sfc_funcs array
  pinctrl: mediatek: mt7981: Add missing entries to mt7981_ant_sel_funcs
  pinctrl: mediatek: Guard against NULL eint in mtk_eint_do_suspend()
    and mtk_eint_do_resume()
  pinctrl: mediatek: Clean up partially initialised hw->eint on error
  pinctrl: mediatek: Prevent divide-by-zero for pins with fixed drive
    strength

 drivers/pinctrl/mediatek/mtk-eint.c           |   6 ++
 drivers/pinctrl/mediatek/pinctrl-mt7981.c     |   2 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  24 ++++-
 drivers/pinctrl/pinctrl-ingenic.c             |   2 +-
 drivers/pinctrl/tegra/pinctrl-tegra186.c      | 102 +++++++++---------
 5 files changed, 79 insertions(+), 57 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog


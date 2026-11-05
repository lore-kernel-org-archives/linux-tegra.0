Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870188;
	b=NCVHGzEcw+qpiarAuQvocfNe6P/xhKMT861P7yzyLtC4dY94J28rUUejtoTfmiYjz/JK
	 L/3DwfWP+lqyMkd205Pp33HUvZqxKJkTJhM7FIhBI1ULoX7q7zOr46bIi6R2eFe8EUiB1
	 0LjMa6NHGh09nslHtLDU3amE4JltEbz8kB6pcDBrpEGb/NZujLbZRj2mNold9qgKcFEqs
	 YEc/7UrPVrOyc+FcDaGQbhijJmuxYZsq9QikxyxwwtT8RP6HPbXRzPJdZ7b8U8xl4zl3/
	 +XOyclLBmSLTq947k/7wNTlAp8kP/y8/GidU3Yp857QZBawkB3E7w58eR/uW5jnDD3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870188;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AaYrzlsh63Kq39GhHHI2u9iALQEdfJBV6NB3OKFCfA8=;
	b=dfX6t7qELYoHq9zrdtkMj6tFAsq3PLHs3hUG86WszsU9vxEDWpvZYbcslZT1yftF7z7J
	 Mcif3bSKttfLNZY1N8S4m4km13+gqjp5r4y82XhUjko1ezJE3L13UYDWWkt/x0cLgcd86
	 5WsuygpOfkDFrcMgqnQDpikpAGNeFC3u57pr3k4xpjBuFgEDRc9KX1MJisAS7IDHb60yF
	 eajQbVE9h68zu4PRLivj62ckLGCxFQqwTqjZG/GkuFbL2nzXMeU6GnaauOZpePtNP/MeW
	 vKHuvde7dwrFDxbcwl5N6sPgMxY/zZ6/pyaM5M2+F4e7LMB71G0yXDGeVerwxH1kBvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwLynrdc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A082606A337
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwLynrdc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5651F00A18
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870187;
	bh=AaYrzlsh63Kq39GhHHI2u9iALQEdfJBV6NB3OKFCfA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VwLynrdcYLs5RvmTneK7ASfYo7Q77QES8CdEFfRhbXxKuL9w/fQpBSt9HVRFDWqzm
	 qMrMTx00tQQGit+nNf/abi3xEEV3vDAOtnMIVA02L/EjRJYWhJmIfTlqTHbdbQrQuy
	 G5Gc1eyz6N+TsMSPrNuI/umq31igbmLYNkzR0GKeSikNKD3ewxz9Xhwt+2XVnbHLn9
	 RmgRuzF2KBuB5oO1+4DhdmbNNgU1NxU7eqdrKqv9s+PRIh/kSQOrAe+StC60lUmP9P
	 zGqeM6bR8qxjiOmKEONh0gLGwjy0paXgDi5ZjSWbW+enxibtPCwiGr2nUoIWOTVfsp
	 cMcPYiOfvPJUg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso3703521fa.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 01:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByMHeNF+HlriwcIGB/s7+7T8n1j+UeOe6Tquey6eoUY2L7pu13gzd5IJ0n7FWKRbjjuDDXKUSesxDK+BA==@vger.kernel.org
X-Gm-Message-State: APuU4Z908qOo1CdAoLzZ3Etlau2THRRfjSrQn3P5c2HZiWH5PLC9y4yc
	wD98HKwr+445yi2DZX5qWav5zteFgXtB7nU6gP8DB2/DfVzVvJDywcxEumIzil18++LQCSCA/ou
	/7wFsqjMMCL/0ZrQ2Wy0+qepXZEBX81c=
X-Received: by 2002:a05:6512:2306:b0:5bf:d938:b80b with SMTP id
 2adb3069b0e04-5bffa170f99mr528748e87.27.1793870186373; Thu, 05 Nov 2026
 01:16:26 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-1-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:16:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLkj=nOGMk4vveKvm8d0JY4dxwarZ-mJifrTgsDzc6g_tg@mail.gmail.com>
X-Gm-Features: AclHuK8Z_fG5b4bwr08ALhc1h2_lYGNTUPFKnPZS5m3aB2BlXOq_Z9AX8QOoOvo
Message-ID: <CAD++jLkj=nOGMk4vveKvm8d0JY4dxwarZ-mJifrTgsDzc6g_tg@mail.gmail.com>
Subject: Re: [PATCH 00/10] pinctrl: Fix out-of-bounds accesses,
 divide-by-zero, and error handling
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Aaron Kling <webgeek1234@gmail.com>, Ajay Kishore <akisho@codeaurora.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Andreas Kemnade <andreas@kemnade.info>, Andre Przywara <andre.przywara@arm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
	James Tai <james.tai@realtek.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-realtek-soc@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>, 
	Paul Cercueil <paul@crapouillou.net>, Qingliang Li <qingliang.li@mediatek.com>, 
	Rob Herring <robh@kernel.org>, "Ryder.Lee" <ryder.lee@mediatek.com>, 
	Sam Shih <sam.shih@mediatek.com>, Samuel Holland <samuel@sholland.org>, 
	Sean Wang <sean.wang@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Tzuyi Chang <tychang@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, zhouyanjie@wanyeetech.com
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

thanks for looking into this!!

I'll wait a week or so for maintainers to pick up individual patches,
then just apply the rest.

Poke me with something sharp if I forget it.

Yours,
Linus Walleij

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846398;
	b=qUinBswzdhSet64N6bgX1jYd37H/cuLZyWokjm7fCgdLMLu5lQFFK62hUxEmUBgJNqbG
	 QnIrMwAaVX0MI4aIfk8CE3NneYTKKqmkm1LBmWz6XmUbfZaY5Peb3ut9wiH0Q5fGF+RXU
	 SWa2r/KdAIMn6FiFzgjqgAGt4mSwBL0DfeDYMZAekn/mGQJoqzMAdOfFqAh7xg3XXKV9Z
	 q7A7OgYMw9K/JeQ1Eq/KyjbFs3Jhr/vhFriDXxQxhndxsemQBShaS+MstsPH7sypeR2kN
	 yEhuBbfLhaSHgDfaW3mhOKg7q2LlzVxwJgwTFMwgeBRYipbjS1JEC/gjaeTrNsQwmoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846398;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=H2xyoSAjrD3INE2QxE5iptHrmw6gRWWPm9Cv3uZPpBNBYNbX7262043wfM6t0MRxFsbn
	 VioYBVRC0GtrqUJFBRjLww1HO4n6q3pORE9CtaVJv2+99y0KQxz+vdFsgrv7BcDq6Rueh
	 +iqXJ4o4FRiPwa7yv9ouwdjq3PnbLHNhBE2zb/IsdCittE86uoX7ExA7RLAtPwtxSHwIp
	 3V43uewnj0Ex230NoX3+1H2zlJf4zTZfs7PxA17LWig8gxVAKBKIAlGZLAwIABfyEi9JP
	 RiOcit+NAIgKlgee+RIvcCLjPqkY3wEaKoLijqOyKtdOsq40it37rADvBvGnFMW84zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44CC606D80F
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 02:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44CC606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846386;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=Nqz4+xihSRA/SOazc9ytMPaaon6hM2Zpa/k876GDLA/rAvSdmROK7bgusiNH5yJRm
	 MxDa4YviOx4vP5CKZmEuJc3kfvwqLKu/L2OohyPYk21mJnJpm1Y7KU5OpOGkVf3+ti
	 zev+B3KBBNrXf3bQvlO8tLbPTEvcdSoXebx80EGI=
X-QQ-mid: esmtpsz21t1793846385t9086c288
X-QQ-Originating-IP: GzN6VmvtTqCGNs0V4yiis8fYCMjxRJUo3RwbxpC7uTM=
Received: from mail-pj1-f46.google.com ( [209.85.216.46])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15456548900643452153
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1102396a91.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBya6XcUmWUu03KEklwZLtKJ/5l49CaUNW31q0EEgXUEd3TXcJpGYJxmoZt+NS+MbssnoXdZwgdq+jU7og==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tU0jbiAVU8UhYkuC7ATOdT5A9apRNB+bz+3sUb3SikcoBNk+E
	WG1AwaLawsjAoNQ7qy7tEmmOwRPim8CylMMlaSHZAi4u72xK9+rYl7COR6nvuV1/vdBnaqNg4UM
	2gbV059Pp54AjNTlpXYUvTy+JmzRdAhw=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NAtJFUxAdU16G6+nGQsqeCSVcCediUmyyEi2V0ShjBAX472EWIUNkjoi
	JW5HxLu6mQRw1ChrwoohULSlGk9O62nQV2BJmtP7ZYwsHzmKdMzC4yBfeLLCca+R82071Eb
	Z4PUbb47OLbUEgvv6gCMdyOG0tDs/+EtpbthYHYyNK1AH1CmIlXb7ZX4ko8XdTw06U02+/q
	LCg1ynIHKJH9/7j6dQ1K6ifbUP5MTC2yk4/0j+fkufq+JBjvYTnyudWUxOQH1ryhWbwjGfu
	oWpzKajhW1CGywo1Hx4GRB7bnzdUnPs8TmBE5hGCax408r+spHWiZ4qsSZAemdxNhlKMGTe
	94LecN3/z3mVI1u23lfw/45M++gKn1TocNXMYjprieLeIVgyINiCzEFO2NktngcmavlE8nh
	sMHBOD1SXhDMp86Z6jM7t5OhQXhJrGgJKTG5O328eeR1rWb7KSknGVrmUKIpGE18oYq084p
	yviNhGyCUmSU9AoD5NA8nbUGOkfk2IV799hjHDo9o+IdttisL41+3fJf+VISPL5FvNh8Yov
	k3NXZkzPjJhL4sstjlEbGm6YXDrh34VYhZWiIRrco4JRB1bPehg+TavyqtdLhgh2Gn1r5z1
	Y0RTNJqoKLnrOkIoE5+aqD/has5U39ulrAaNICXL+HkmVcLCykFub8blHd4hGONmbYfbNa/
	BvNKlBQ+h8LZ6Z98vDcDciIwk6TQ0USQOoBxGAv41/6gv/xR7R6JUOTkJp64vDqhshqz+Kb
	f6l4jo6fbvMF1A/LpOItI6J+vL37MQP8nrjUbkm6hWG/zcCbxxWW+ZdpHgv2sxPbGS32WNI
	1lwaYpvRFToaCyqISx6ENZ2UXRC4UZqmKS0ykAMefmXLgYdRpTx3iTM2eilKeEFoYu8d+aX
	FKTQUX7a49bF05A33ZIHY3OVxCm1LW6MA5cYXoF5uak1L6D8gU73DvRJjeNp2oKMPYKouew
	Mqdz0LrOlvC+BzOcHG9aTLqDu/p6yfroYAADFgJI64JUzPRJo3HoFwLSLt0hrtAzy7SFKKp
	i7icNnpaGrloumjoVNROWrBzISzt9rjA8V8tqBOw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

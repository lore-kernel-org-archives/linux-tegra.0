Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F24F15ECE3
	for <linux-tegra@vger.kernel.org>; Mon, 27 May 2024 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814670; cv=none; b=MDUvMqTc3vPogw+AIKZdFZk7mE8rFuRZ49SS7F8Ml0abGUUdovp4trJPmTXYkAfMsNPPf0iK1LXVPQh6CLOnsFPTGMi9Pp4ic0wYe8WP2Pd5jZImI/4ylZOSDcJ00EfuZsJLX7G/7wJbMGmflFZ0Nlixhiz9mmIj9qeoC9fFgys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814670; c=relaxed/simple;
	bh=rNZ98tycbIm8gHCECF6fFAUqvVWA7Py4cjGRVlBtUzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwXgV7MsiJOlMWIoa573uZmHCWpSDCnlw+z8izouoEDpwJ+0Lb3r/UUeZDXRMbABsqTIqNcNYTidqIfZQuPamWb1lmZtJdvgfC/bHBbu0nxHVshddvUU/KnzZhRrzJh2YcfgzU9rQmHEbQBAq76PhMxxTfa0w2rObLhWeMinR84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZjSW3Kv; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZjSW3Kv"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-df4e1366da6so5316656276.1
        for <linux-tegra@vger.kernel.org>; Mon, 27 May 2024 05:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814666; x=1717419466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNZ98tycbIm8gHCECF6fFAUqvVWA7Py4cjGRVlBtUzM=;
        b=xZjSW3Kvib9bA2fuiZguOMj/iBQcVxTBNd4+MePuDiOWiLp/1cjpsIk0SX/FqpWHiM
         Pbsw80Fp0uSo2+qs0Yz8u65ZOUCrczWDUMpRUTZkANI60DYInk+z/cQbjU0hcxXZ3HnG
         Ut1+gUns56/8o4E4S4kw2dlqfZJo3Bvd/7XXJItZCy+w3B/9BftGY+pjKpyv0OhyJHWP
         uPbMOPzMK1ZC1pE9Vcg8T5Ptzh1qbAeBSOFxjjzXr+MlGnEGDeMOuOI5uiPZDzbYYnmR
         4eaImTMk0JpJdOZpRYlS1qILympE3IqjPRj5LuELPRgkR62y8uanQIw3P15V7bSJ/MVE
         U6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814666; x=1717419466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNZ98tycbIm8gHCECF6fFAUqvVWA7Py4cjGRVlBtUzM=;
        b=tsrjdgq3tfy8eqx/b31tq95TRRlD5uxvwQqsB3c/3NHO749KkT+71G3VArS6aFT5E9
         q8uJAh77HP4rU06TsvKwS20RwlvfhQ+yKSadS+53lq8xTxlr23C/hdKhJSeTmOHmr8QJ
         Qaj971OPOMnhGNtsng542J+uHGI+KiY6uYkoQ/IGcIAVXdFiTKBfRHdLEnKu3HxWVLzM
         lp8gcPAPQe3kuHwgXFz38avqOcqR9mzg3OVB4WCE7mBHS4FQ3KDZw5YKmIRM9zdW4arr
         ByIOozVmF1JC3GKGV/pb0U2MwWi5OfgaK57oAC2L8mrqqPXNxj70MBoUCmfId7vbDCqV
         ui4w==
X-Forwarded-Encrypted: i=1; AJvYcCU2IKsIiAbr69xc5cQdPyq9ZMJCVeE6YFnYqrzPz58qecJxQRRgksZX/d7+DKN7EUlxU+mST3RgARfsZfkGSyN/MBKK7h1LruNFUTg=
X-Gm-Message-State: AOJu0Yw9B5T5vAFeJJdymthaDvuGp6f61qKZiT1Ws5T1EDxxJTj2FhXd
	ZPq3wrC2xMOUQ9oZnHtB4Bl8CzgtuYGePZgQWg1MgQDEeFwjF4lQO6V4tBaX3cNtoGNDIcyDjro
	Bb18rPxMiZEIxHBsMTqIf1lIoak+g2HPrTeTJcQ==
X-Google-Smtp-Source: AGHT+IGPHGbdeDgQwNEq4mWXFwTqV0k8iDBOK2TyTZ4utk5viKokv4dr91DnLp+C01zzJZrl1Jzg3NthvUqaC/NhrDk=
X-Received: by 2002:a05:6902:70a:b0:df7:9946:b32c with SMTP id
 3f1490d57ef6-df79946bc95mr6983978276.29.1716814666366; Mon, 27 May 2024
 05:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-8-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-8-26c5f2dc1181@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:57:35 +0200
Message-ID: <CACRpkdbt0kE6VP3O+63U1rmJ_JKRvWENCnETT4f+mvNMMphLeA@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] pinctrl: st: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Patch applied.

Yours,
Linus Walleij

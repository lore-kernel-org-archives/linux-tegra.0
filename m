Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65483432BFE
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559245; cv=none; b=QtXYDQBUuqpPTiPkjHVFvk7CHe4keutpEnKRjOUxXFfUxWN9SH1zSauT96XsjTykVsVVkURJnzEHaa5FIshoEJ1n19FKmNbPvyRsJjYlVWy69JH/T37UPTnkGZQTRv0M4WczHoUKXtsYy9YS1+e2XKREDobrKaGek4ojPqPBsMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559245; c=relaxed/simple;
	bh=IKo5eopQG2hiHW1ref5R02ODVFGQ4cjhI3EWRSKFDuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Be4bANbqq3dGjR+m/EuHGABrqEdo1hsgQ4Y3kkzJ8OYZ8CIi4tkjEn8IoaiC8WB/3cwCCWaSeO4whd2hQn9kLY3wD36d6Tk61iVPNk8bLi6X71i51gttvDNsTY6rC74FKjDRGGG3ndh6DANFthUFCRIi5mc3eTxi5xA4qtQQ22U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYxPWK1r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYxPWK1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2F01F01567
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784559244;
	bh=q88Fl0V/0lAk/+TEzcTUp/7qPfUq146zXnUT1jSEMMg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=IYxPWK1rXxXdN5Fa0G5McnH/9BE30oH78m16049eaWAiGZ8KFbBDN/sHiRVE1A7Zv
	 eFRGTduevMm6chvQmkSybIEz2N24pDqIi6vN29/+4Ja9MOALWqfDeAhRIHhc/SARFc
	 WH4OIKCLUdaQZ5Kp724oR1HLazIfLgCtnIAki7qvaiZpwMv9uVyuvZtDBobdpVH/41
	 /mg3Q8+PKK5dbkke3ea7NtAkjnECokiBTTKva0nHE20cTX2FLTLulBNtLoxTzYJzsi
	 7qwK0tduSA9PqHlWZ/gxQ/0Cw9ujsL3VIWdBRdUmH2k2EOQrwPL0jm3F5nLJ0vjxeI
	 9W36YSXCxjo4w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so90331721fa.2
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 07:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrWpash9ln7O/9TIH18rtFsDeWLWqcXZP/8Ez4znKu7jMq+Lw01VRHmEcVAlMkaGsCOnbbTRsYoYJ+3XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoeH1320fxoDZBHjAYc+Q3kyFgoAl4vpl75xw2H6REqv3nVCW
	uRECK/0DwkYvZm1FJrygn0ojFodsZXBx88BAWEnR9DLrUvMc/BXFJwfoaqYoP5BpQ0V4CjDGRKW
	y781iKXImG7oxGIXtnh0EHdJOsVnX7Zo=
X-Received: by 2002:a2e:a902:0:b0:39a:fd6e:cac6 with SMTP id
 38308e7fff4ca-39eb2891a7emr29265181fa.25.1784559242360; Mon, 20 Jul 2026
 07:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716025215.33592-1-panchuang@vivo.com>
In-Reply-To: <20260716025215.33592-1-panchuang@vivo.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 20 Jul 2026 22:53:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v658wUKEph0RaKmZQkOGZSpJTBx6YRW4uNg4-ijRmEqWZw@mail.gmail.com>
X-Gm-Features: AUfX_myDUKvf94v6L6ujyRnopyyEs37-MefKzA-7jWlx7IViNmraOkkn3GoqGCQ
Message-ID: <CAGb2v658wUKEph0RaKmZQkOGZSpJTBx6YRW4uNg4-ijRmEqWZw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Remove redundant dev_err()/dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:MAILBOX API" <linux-kernel@vger.kernel.org>, 
	"moderated list:MAILBOX ARM MHUv3" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:RISC-V MICROCHIP SUPPORT" <linux-riscv@lists.infradead.org>, 
	"open list:QUALCOMM CPUCP MAILBOX DRIVER" <linux-arm-msm@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 10:52=E2=80=AFAM Pan Chuang <panchuang@vivo.com> wr=
ote:
>
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq(=
)
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/mailbox/arm_mhu_db.c               |  1 -
>  drivers/mailbox/arm_mhuv2.c                |  9 ++-------
>  drivers/mailbox/arm_mhuv3.c                |  5 ++---
>  drivers/mailbox/armada-37xx-rwtm-mailbox.c |  4 +---
>  drivers/mailbox/bcm-pdc-mailbox.c          |  5 +----
>  drivers/mailbox/bcm2835-mailbox.c          |  5 +----
>  drivers/mailbox/bcm74110-mailbox.c         |  2 +-
>  drivers/mailbox/cv1800-mailbox.c           |  2 +-
>  drivers/mailbox/hi6220-mailbox.c           |  5 +----
>  drivers/mailbox/mailbox-mpfs.c             |  2 --
>  drivers/mailbox/mailbox-sti.c              |  4 +---
>  drivers/mailbox/qcom-cpucp-mbox.c          |  2 +-
>  drivers/mailbox/qcom-ipcc.c                |  4 +---
>  drivers/mailbox/sprd-mailbox.c             | 12 +++---------
>  drivers/mailbox/stm32-ipcc.c               |  4 +---


>  drivers/mailbox/sun6i-msgbox.c             |  4 +---

Acked-by: Chen-Yu Tsai <wens@kernel.org> # sun6i

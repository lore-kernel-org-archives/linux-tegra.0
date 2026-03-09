Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2247334D383
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047323; cv=none; b=PRe3uRD+MBhyxivMlwfl5liVSdBaTNLB1UtEt2p92fR2H4iMAtXKL6/Hw4GUhmEbiwfomP9EW0rlRm93xZms5i1Xqo7TE94damUJzfLF0qvFyqDVhYz0+5BSc8DH8V/uRqDjHhtrZd+FpOssZEcmGTPUGSJtSQvx5nQzux2C+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047323; c=relaxed/simple;
	bh=EJAhZ60TwCaq5rP8E9O8CgQUpaCypxuz+TL3xs5WNFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFrpM9b3MpTPK1ltW6DF1fFF+KR+BizCOfVy7PqF734i+LEHg9KN9Dtrtzx1EhGSMCECqN7I6RDDS6PWE0cC30QsgzXUwXPG4Pw4bUpIVzOSRF5EGq430CGSbNOuq4vdu2DaJK1N2J+RzXf1uz0rnV6+LZk6k3VbTs5WiG7LQoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgvT4uup; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgvT4uup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9823C2BCB7
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047322;
	bh=EJAhZ60TwCaq5rP8E9O8CgQUpaCypxuz+TL3xs5WNFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MgvT4uupqPd7sUisqcE1az8KJWex6r+jsA5mDLANKKWYmZfnWuHvegrfzsKMJM0fZ
	 rtPVjq4m0bVJZPOCCJ4nNq7NcUdd2xMZs1BAG7hBprD8SleC9El0kaNsYxNok5apJj
	 MNbiDGcLegKRf+ny7Qp3RHtJeJg9QcWNbtnqdI51q+Z2RdOpvy4Cjl1NaYQK/BqQex
	 FWqXMLOYGG0yErFOhlf5MGJFc55NDwI4NQaO6/D8ODvVYqcES+4SWt7yyWM6ZCaULY
	 bj9NDb5NGzy22tXfpjk3HRRiJi4zcLOLI4aKZI58xtk/8Dr+BqPDZW04q/Lcql3zmZ
	 u9WlU+esmONXw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso22041211fa.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 02:08:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWE+1GqKZoMf6gJ8nEet6FORwDZagiJF2XTc+FbzpQFRHQRpnjy7BghLhaKtSkDZ8XnC9XYZAOPrFc7Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6V4+AurmGRkKR9iirtO4Wcre2bMuy+ckXGAOsZYfVjs9abau
	DOfafCmdvclQFvvBhsFVV2tsH8Hd5UrTYowxoajYcSwxME39QMOroyLprdnhV8Yzwa8QiHGydwN
	9qMBTwxMfntzufF/1AvPDV94dpv45SCFaJq0F+CtqgQ==
X-Received: by 2002:a2e:8e85:0:b0:383:227:2891 with SMTP id
 38308e7fff4ca-38a35129a54mr36312811fa.4.1773047321435; Mon, 09 Mar 2026
 02:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-i2cfix-v1-1-a95418e9217e@kemnade.info>
 <9b3c0190-7996-40a3-8306-5038f42b2b15@nvidia.com> <20260307182610.48cae8b4@kemnade.info>
In-Reply-To: <20260307182610.48cae8b4@kemnade.info>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 9 Mar 2026 10:08:29 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfrXZY5k-b6eUWUov=MLnXojAenPwiM-eeOpjKZrBHeSA@mail.gmail.com>
X-Gm-Features: AaiRm500DVMY-5Yc-YzOG36qYjsK3QrU7GWL1Kyqd4yQnObR6PcKBeqZpGD8xX0
Message-ID: <CAMRc=MfrXZY5k-b6eUWUov=MLnXojAenPwiM-eeOpjKZrBHeSA@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-core-base: fix devicetree alias handling
To: Andreas Kemnade <andreas@kemnade.info>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Johan Hovold <johan@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalle Niemi <kaleposti@gmail.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 6:27=E2=80=AFPM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
>
> On Fri, 6 Mar 2026 10:18:09 +0000
> Jon Hunter <jonathanh@nvidia.com> wrote:
>
> [...]
>
> > /sys/class/i2c-dev/i2c-0/name --> 3160000.i2c
> > /sys/class/i2c-dev/i2c-1/name --> c240000.i2c
> > /sys/class/i2c-dev/i2c-4/name --> Tegra BPMP I2C adapter
> > /sys/class/i2c-dev/i2c-8/name --> 31e0000.i2c
> >
> > After this change I now see ...
> >
> > /sys/class/i2c-dev/i2c-9/name --> Tegra BPMP I2C adapter
> > /sys/class/i2c-dev/i2c-10/name --> 3160000.i2c
> > /sys/class/i2c-dev/i2c-11/name --> 31e0000.i2c
> > /sys/class/i2c-dev/i2c-12/name --> c240000.i2c
> >
> > So the subject says that this fixes device-tree aliases, but it appears
> > to break it for Tegra. In fact, this patch appears to have the same
> > problem that you reported with Bartosz's change. Reverting this change
> > fixes the problem. So I am a bit confused why we are seeing different
> > behaviour.
> >
> Hmm, i2c-tegra.c was forgotten in Bartosz's change because
> the code looks a bit different.
>

It was not forgotten, rather my series only changed a part of the
users and I was planning to continue the work but it seems like Johan
committed to attempting to rework i2c using a different approach[1].

Wolfram: do you want to drop these patches from your v7.1 queue then?

Bartosz

> There is still
> i2c_dev->adapter.dev.of_node =3D i2c_dev->dev->of_node;
>         i2c_dev->adapter.dev.parent =3D i2c_dev->dev;
> there.
> compared to
>   adap->parent =3D &pdev->dev;
>         adap->of_node =3D pdev->dev.of_node;
>
> in omap code. So I think, the easiest to get forward is to
> also adapt i2c-tegra.c.
>
> Regards,
> Andreas

[1] https://lore.kernel.org/all/aar3rj7Db6NmTVS_@hovoldconsulting.com/

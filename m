Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898E13B8948
	for <linux-tegra@vger.kernel.org>; Sun, 20 Sep 2026 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789942037; cv=none; b=SMWwpImQjVv/OlLXTUOyAGiMEx4f9cNJNC/mgoF0C5c6QEjGXgebeo0kUAHHW7T41nM2wHF2RewBwxzERbjmNZSV76hiUg7o2jXwsCDyD0cH7DlS1WKHnE+VcY7OVP2AbBoV7R9MVPDtTeDJVZx7UCFyictRhuQDDQR3HIBg14c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789942037; c=relaxed/simple;
	bh=eM2T7KJzE7XrEgyW7SedFNWCzHyys8WpkYdSkfQ74AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvw2rlrZVZxMOyvW23PTQIYajS2C1KTLyfWLo0gRwRxRNYOnqZTGB9Ts0D2B01dkKIYYLHbAOrubc0EQEp7IT4uhY+lx6Wjf+lNQmuk0UtFjd1G5z+WGwc9fkxGeCh8utAcYZFugWEHHA1dIcO+zgHA67VdUnX0FCL1tnQzEdIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEwO5tWP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEwO5tWP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA63A1F00898
	for <linux-tegra@vger.kernel.org>; Sun, 20 Sep 2026 22:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789942034;
	bh=eM2T7KJzE7XrEgyW7SedFNWCzHyys8WpkYdSkfQ74AY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nEwO5tWPF2SmOmfitw1H5xy5EkaTV4JNJ3d1FZiCuIktjtK2mXxVoHFbZMze0akPR
	 Oo4mhEpsenHRuT3sNEyUkKo5EFWbSDAyRJMqBEX9AuljQdA0BBaXLBJ8oKNDcFyScy
	 WtM8OqB2xWrg1MaN30uPGvCZntM7OIFjdRz2F7Ala3tEfn0MviGWKKnM2JMFTtTfCb
	 OQIazbzx0AO3+M/nUpnufnz8Bo+Vrbj6pJEfhwOu0hI3RRWpWQGwaAiV2azHiHlnLu
	 owuQFJYyZYvNoRvsrtS4gj7mIKHsKrbUrR65UO/ZfW5SnJuE4/yt5UrvdUaHvLKEsg
	 6rey0k9xNiuKw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c795f805so1035783e87.3
        for <linux-tegra@vger.kernel.org>; Sun, 20 Sep 2026 15:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwrwOwUbTnZf9MNYeKf+S22ij3v0dHHmFirz6lfyDkmfdxdSaL9clJ0bTqSHGSJ2pQCQLMzhTq9llg8OA==@vger.kernel.org
X-Gm-Message-State: AFuF++kIbkNtvNM/4Ads82II8qZsFTSxkZzmdilA2NITDgnnLYZiAcmf
	2z8jtflNc2ZmDeuQL/dr2aPNMWFrCVrnCMKjiAfzHQoVgomP9VUecUzK6fQLeZLKamvDwqhfiZt
	+ePD1147/Bw9cQhQMcx0+scL8e5DfMzU=
X-Received: by 2002:a05:6512:39d1:b0:5b4:24a3:ecf9 with SMTP id
 2adb3069b0e04-5b8c180b6ffmr3029498e87.21.1789942032696; Sun, 20 Sep 2026
 15:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916065132.1411576-1-pshete@nvidia.com>
In-Reply-To: <20260916065132.1411576-1-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:07:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+p=fvVG6=EX3LvU9eMe68cfhCzQvoem0sEfpY43ktvw@mail.gmail.com>
X-Gm-Features: AcwNN1VOfHJBNeasa5J7ZELwn9CSLN9B7pBShBYstEigIj754ox3CA5qiQjayJo
Message-ID: <CAD++jLn+p=fvVG6=EX3LvU9eMe68cfhCzQvoem0sEfpY43ktvw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra238: Fix register bank for AON pin groups
To: Prathamesh Shete <pshete@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bhelgaas@google.com, 
	u.kleine-koenig@baylibre.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 8:52=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The AON pin controller has a single register region and therefore,
> the bank defined in the tegra238_functions[] and tegra238_aon_groups[]
> for the AON pin groups must be 0. However, commit 25cac7292d49
> ("pinctrl: tegra: Add Tegra238 pinmux driver") incorrectly specified the
> bank for these pins as 1 and not 0. This means that in the
> tegra_pinctrl_probe() function we use an invalid index when accessing
> the pmx->regs[] array which causes an incorrect address to be used for
> accessing the pinmux registers.
>
> Fix this by correcting the bank for the AON pin groups.
>
> Fixes: 25cac7292d49 ("pinctrl: tegra: Add Tegra238 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij

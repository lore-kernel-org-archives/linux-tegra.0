Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E7030CD8F
	for <linux-tegra@vger.kernel.org>; Wed, 21 Jan 2026 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768959368; cv=none; b=a74hlHJrvImDVNPOAkSorzo8pC9MaQ+I8MNQfCKxNFAfEv8NP+mQSIIJXEEA01drt5V+A+uRWPvaPIdKoCQljwNeiI2YaG1fH0bpBr4MhLyN1rGID7DLWX5nHkYsj7mF1m/kv4Vt0j8dRIw6jkGOVEyiYqocIxYXDxXCT8dms6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768959368; c=relaxed/simple;
	bh=1DQpMwysIx72w8i2TKT1MsIQPymniahlCBATcSMN3dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzfRqwp5Hq0s+NhqpXW6XWjT57CSGj0p2Nnp6zZ0BLwLWUdu35/WOmuag255S834yULpGqAo646+XLJCwO3LXpT+PsR7LnxoinqVgTrKTS/qpXhEq9XB7CJbvgbkGCR3boK1Cmi9uLFpaftD7UiuSsSibBymtSIfxdtRk15g9Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTJwq257; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTJwq257"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C21AC19423
	for <linux-tegra@vger.kernel.org>; Wed, 21 Jan 2026 01:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768959366;
	bh=1DQpMwysIx72w8i2TKT1MsIQPymniahlCBATcSMN3dc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dTJwq257ozafQb4dLnHNV5BR/Um2bb2uOcEyTEvcq4gOJnRQXtL8/LX4miQRGBV9H
	 vrmiKxzd1RYZfFLUmxUDkVTzE+lvzcC8wS2jsLchrOeFb3xuCy8/z/TgZlyiKKBihC
	 Q6aItSgX951TTV36pf1VVo4CW42OE68Q12uAzGrKlQ5aERje4Yobzd5wDrFqW9qKhO
	 v0bQaAgqJsxvpkAVFz4EUQVmDLL4WcgySBzJXPVtIXEIsoB6GuKNsrg15xuMDamt9R
	 QSHyoB6MUoJ01BS5RIh4tCOft9+Ak1jgbDlRbvyzm29Gn97nySYtvg/HDbMMd1z4uI
	 r663trZmigqLw==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so10025119a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 20 Jan 2026 17:36:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+zmj9wjZVgWgYexJyBOqoFeX4fKS0qUx8qatiCa3rcAxZoyMxPq8dsC8ScDUfAlZOoO7q+QoDLuBBfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5rrIKlB4HaScG8G2C+8IwjjD/q1iQVs3NVj0jTfUBVhBUocTN
	J4UY6V0LawxAcWbyP5Du+Uw/XKKJxrweGV4lEpYq1lfKpA02Wyo/bP0AdMMti7moAhbDJIL6e9k
	14FyVmBUdqLM2xp0muVhUGkPmglvWBA==
X-Received: by 2002:a05:6402:5113:b0:64d:2920:ef17 with SMTP id
 4fb4d7f45d1cf-65452bcebebmr13577113a12.28.1768959364990; Tue, 20 Jan 2026
 17:36:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108143158.351223-1-jonathanh@nvidia.com> <176861152450.1947082.2637987844354037789.b4-ty@nvidia.com>
In-Reply-To: <176861152450.1947082.2637987844354037789.b4-ty@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jan 2026 19:35:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+LUsfcU_-zPo88acsL_C6red=4jzmeca3ZCeyPgHDBvA@mail.gmail.com>
X-Gm-Features: AZwV_Qgjihn8pIRDJhY0BskwrbGpVtGIevu7oNI1Z4PftYc5SIvKgELrXXAp5Ic
Message-ID: <CAL_Jsq+LUsfcU_-zPo88acsL_C6red=4jzmeca3ZCeyPgHDBvA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: dt-bindings: realtek,rt5640: Various fixes
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 6:59=E2=80=AFPM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
>
> On Thu, 08 Jan 2026 14:31:55 +0000, Jon Hunter wrote:
> > This series includes fixes for the realtek,rt5640 dt-binding to address
> > a few warnings that are observed when running the CHECK_DTBS=3Dy for so=
me
> > DTBs that use this codec.
> >
> > Jon Hunter (3):
> >   ASoC: dt-bindings: realtek,rt5640: Document mclk
> >   ASoC: dt-bindings: realtek,rt5640: Update jack-detect
> >   ASoC: dt-bindings: realtek,rt5640: Document port node
> >
> > [...]
>
> Applied, thanks!
>
> [1/3] ASoC: dt-bindings: realtek,rt5640: Document mclk
>       commit: 601a821631c55014b02371740c39748d0af916c1
> [2/3] ASoC: dt-bindings: realtek,rt5640: Update jack-detect
>       commit: 2efe28d11cc19b69b19b9bcdb6f498c1bf842fbc
> [3/3] ASoC: dt-bindings: realtek,rt5640: Document port node
>       commit: b2788f6320722d6059f849f35a77eb082608c627

Please drop these. linux-next is broken. Plus Mark already said he applied =
them.

Rob

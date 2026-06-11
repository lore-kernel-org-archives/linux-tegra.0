Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3E03D47A7
	for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179519; cv=none; b=EMs9Xm0wZP89hkjx+6uthH/txRuQbJGCu9daJZEW6rRb8usCERBOdQsUsRfn4nuAOSzhul6H0k9B6zVP5IuQ70+afsd86fV/AJQQ6TIsOHaf4raMyGpas9Z8LLjxulrNgLVgM6t0g7Trmb2N4uXpBkQQlxyRh53XykjG4MHsw6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179519; c=relaxed/simple;
	bh=0ox/fqkWsVCdzpGqz0ilLvGi8+8qWbIpBbT2MLQ/xzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INRAvTbyjF0HLobf1jh6y29hBvNGbxyhbHEuYG0g9o0aXyTQAkYcvYGqsUcm4oqU0yG8qLzAB78tugR+euOXNNPXVmxK3abZGJV6KHs7UJL6Yh59BiAlMAVTHL1cvNsQOF6wLQJL2Urku+PsKQE34CFrr1MDiWZNlHQatFRDSQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSBYio2L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSBYio2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BB31F00893
	for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179518;
	bh=tzwPLZ1uKPc2EO+74Kx2DEzweWGuSsCcDEj8J61jBjs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aSBYio2LtxGa/VjLJO8JIr/qvAwztQ2XmJUHD7qYW6sdm7ZcF4/KFnMFg4cZG2qwM
	 ycCauTRw3BvBgUOT5iGedjnuHRGUsJVn5MqxYepvvgZoDUGGPIMFtJ68V/yZsTyTT8
	 P0plHseWQdkXwOwa13EDFKbR9x2ie1vOvl1RFINQFkjhgOR7GDwB+FwSa3BGaZx3ER
	 NUWz+ai4bVzPrTTRjz6wNFXsYSHruj5L6uZHDA0XI3YsF25sbK5Q7HQk6Sn6F9VV9F
	 yM1ZDf9dlzTk+P8NGHXGHgeRJIE8PxrqMPwVC9rtymrbGI8E9IRNBMhLchSXbUbRRC
	 IglpZCT1halyg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so7623098e87.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 05:05:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98H7C+cPY60Qq//lbGErnr9nnNRGSF5E16mz5yOmIifZjXO1nay0rmOi6SSdl09SNB0przMh/JwupOVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD1ZoYBhGDFMdfF1cACuLx55Q7NG4vxOxuGsT3U5CcTvSVdRfq
	qxUNTGreftsiRo5Yd5oU4SHilvqDMu7uOy+5ajFi/hgjE6NJwUk4ardz+AWyvSF205JcVzuiS2h
	svOcoURByHjqgmnU7BVeCf/au9hTcrH0=
X-Received: by 2002:a05:6512:3e20:b0:5aa:4ca4:d396 with SMTP id
 2adb3069b0e04-5ad27ab9c66mr776867e87.11.1781179517535; Thu, 11 Jun 2026
 05:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
In-Reply-To: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:05:03 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fP8OTgqhkTOacsCm7yRVSWi1juVrr_X32i+bx9AimBw@mail.gmail.com>
X-Gm-Features: AVVi8CdgWWkNh8u2LrT_7NUVxyvv9pybax-QmXRHly_PivQ12R3ZEvISgOVx2BM
Message-ID: <CAD++jL=fP8OTgqhkTOacsCm7yRVSWi1juVrr_X32i+bx9AimBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: tegra: PINCTRL_TEGRA238 should depend on ARCH_TEGRA
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Prathamesh Shete <pshete@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 5:08=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The NVIDIA Tegra238 MAIN and AON pin controllers are only present on
> NVIDIA Tegra238 SoCs.  Hence add a dependency on ARCH_TEGRA, to prevent
> asking the user about this driver when configuring a kernel without
> NVIDIA Tegra SoC support.
>
> Fixes: 25cac7292d49f4fc ("pinctrl: tegra: Add Tegra238 pinmux driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

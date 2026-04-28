Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49963DA7FD
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367365; cv=none; b=ouoZa+pApW8Ris+1Z4ggu++UlbnnJsXca2is4NDsW/v4XYRQwapVpb3fnVrbU13utylNMYdsGgUUWcCl74zAPoK9jjO0Si8INhVVWFjsH/GgngSn+lZvVC5oYYQPqPkWvyzJ9WXo/GTiWFAK2Dn+6wJnuBVlVkqpE6J+kyFwMb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367365; c=relaxed/simple;
	bh=morZQpxNKguhyxd1FSXh8eEZSwikKE219rmXsMB8VeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZZgcpW6ytW+suHKsUGYu7nqnY5a+A7GsKixeN/lTkGimExk8aR7jBo8vHlC8fQXVMaEkohIPk8D8cAXtjyBURtCaXjeDCqlwcUdF7LUjxwGbG70WqmgSDKpcYA4gYE3OTrfpF0TkbMPxi+lxvbBYyKq+b2uhbsEXhmauk6WPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYgUsocT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYgUsocT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76099C2BCB7
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367365;
	bh=morZQpxNKguhyxd1FSXh8eEZSwikKE219rmXsMB8VeA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EYgUsocTqZ1+cVjTwj7CzZXNcCmZ9YUX1GX7ZksT0T1NfcY9qmYLPvUXHkDX2NSCG
	 iM3L6+4RCowcI6TvKCSo848qBBP5RURVsa/bMITjs4VRLwP0i8myZsLCOmW4cqajM5
	 QB/Nqgu+/9+joNvGtVTiMW4FtdJew/CJDwNLXhRE01RESlLrZJYFTgzPYRlsI6rzle
	 uVolUMB5b1+QSsLpXKm8ybAnhk4OZ1ISyviFYvWA6CsoCIIE717EOue6NRBvl+8XXX
	 eS9edeF1lMQdLoKrSBoJZc0cK2ZCqtdkaQz4xbITW75IWicIocgv/V/JzitkVx3y9R
	 0DdG7Rmcz9LVw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e7d984096so123246061fa.2
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 02:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/kvMmFzYP96frLCGHtoz5nkLmwfdMAC1xoNnkYLcvYpfRHbulQ/wdXzJpyAyIQcHKR6cs3H9iFiMVd0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Hl0IBboc/2PSCMkwtmePpCu72Kux+P6NfqT6XpML1DmFeBRu
	NEljl132z+uRyoBA9j0YkS5mmRr7c+nn9EvhOqvlDsYrzNxOGNlKHKqVn1+K6cFQrnD8IhFtuL2
	fkR+nSUElscrXKbJdcMX4B8jsQlwZ6qc=
X-Received: by 2002:a2e:8a95:0:b0:38c:9503:ebfa with SMTP id
 38308e7fff4ca-39240d123e9mr7636281fa.14.1777367364182; Tue, 28 Apr 2026
 02:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:09:11 +0200
X-Gmail-Original-Message-ID: <CAD++jL=GFEiuSt0BZyu-A=up0A6t4CibbB5Kb1Z42LBnYy+jCg@mail.gmail.com>
X-Gm-Features: AVHnY4I-uiea7zO1yDCH5W274CSwhOMexNWBf8Y4CxI5F4ifEaHSc0Iv7gpGkpo
Message-ID: <CAD++jL=GFEiuSt0BZyu-A=up0A6t4CibbB5Kb1Z42LBnYy+jCg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: Enable easier compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 12:30=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Currently NVIDIA Tegra pin controller drivers cannot be compile tested,
> unless ARCH_TEGRA is selected.  That partially defeats the purpose of
> compile testing, since ARCH_TEGRA is pulled when building platform
> kernels.  Solve it and allow compile testing independently of ARCH_TEGRA
> choice which requires few less usual changes:
>
> 1. Descent in Makefile in to drivers/pinctrl/tegra/ unconditionally,
>    because there is no menu option.
>
> 2. Depend on COMMON_CLK for PINCTRL_TEGRA20, because it uses
>    clk_register_mux().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied.

Yours,
Linus Walleij

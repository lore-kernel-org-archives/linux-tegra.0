Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798D2340A6F
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135747; cv=none; b=I0d4Im0k3VbKb+HdnGY14itvivhD/V8HZfUvHxG5beX5/BpmrjGCwXIcozS/57yfWif1GY4P4blliaV27rqbFroUpWZ/xVO0eQHsdBxt7GDBI+zV8Oxok3xx5obAzPwLBZfQfv4kIoxSiUfjoS57TCLIVIqyWgkgJmECeUkt0JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135747; c=relaxed/simple;
	bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOe1HNDJSUctCVfeMn3Tl2e89CPJLGAclhA5IT1fG//aC/8Csxd9Z2Tz71W0YPbP4hh8sqV2p2OmPpuOjB+SKVAhAcn8hYTwavKKo4QG62Eo/Va973hgiHEXGQG31ZRs2Av727qsfr53LCVC3DPC3iqE4EtzYzYDNveLvxI6bBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tkC6Iyek; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tkC6Iyek"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-58affa66f2bso8036298e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761135744; x=1761740544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
        b=tkC6IyekXWvqNvAZqlRKLLBx1zlHKlMKy9AHypgVQKvlOe56k3XChntNbSdlHkAUy+
         Xf/FvunI1z2cdFIdBOKkTcdoEjf+imBkwT1skSBCHgIQj6Mm14EWAQMyGLsA3nkq2qsr
         zJssNoPnhy1Ei58rouZfoV3dX9TFV/gVxxM5hxTHWNyg7FOgEohqCG/HB58DMHNPirVk
         KNnXFthviULPqHjQ9r4aUafqb62fQgITQF6eZhsO1fq7cczxiE5SDcM8y6rawXMCTv5N
         /MVS/hEpyTOIsN7+iW/xsXGq7RdSZtfXF4nw+pU7ZB5UPs/4R29eqU1SlWLyS2TWLyUV
         Vsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761135744; x=1761740544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
        b=d1+MukA3nk0FYNU3qgB8P9QPgtS9xV3wfXTg5uumojtb7xZCYGfQKGHttzDgnSlMHQ
         EwELNq6enkPQG4rgn0yBNkf9YklFDCs/I5lWjsPahoRsOAXKZiplNAJ7yCw3Zm37odQi
         JhbvSdFFt0sfRYjup7VWQ6J0K/FKHry8Py92wNWiymAiBfwaNycs92PSttbfHTQVFuY2
         MSuPG7Sy2odKf1hlh8QPd2irUAZtKT4cRMhBG3L8hIIfNTGdVZbJ0snXolkoUTZ9lcEU
         Ej/zBZ3DLGGF1QYb+fc8o4QhIewTBPu4S+ELvIDYw50xsJT6hm5uQkPjLSJfK8xkMXL3
         WqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFrF1o93KQOKxODBYPp5Vie/H9xTjVkAFPt4Fqj9BK7p3xSMp1LLSVfKfxBEQRyvMN4eZpjNwQG2ij7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcLtRDVz7Fo1oAuCi9iHRZGg6Qu1z/JuWgYe2X2f5Bzh+bM+0t
	9zQiFukmyPMjJGqucVdl3vWXUk+w0EyIxCpOf2EpJD4gOqhKYZq6QNcO25iMe8/UJHghysUc6GD
	k987ZaQlHGrSlEaNj6e7aiA9wodhKcx+14MtUmGzYFw==
X-Gm-Gg: ASbGncstZlPrQLki/r6tND2zur0sSbLPZqoruhVDiXepnAShDUTtvUumsjymG9nQlHV
	gNWkFppZE5cNrWA5VfB95/or3OMlEiih9/sNbXZ5sufX5s6nW1sUeop/EeeB2HG7Ua0b0CWhWgI
	IhI3WK0fgjRVfKchkft+hbnWIMShVydExLzA0LhaellZ+PagAlpi7AuoMrMnc1ykoeDBvgQlY0V
	s2l4/RD7ytfrXKit9Pt1X/qSz7314RLDjgfGFMggRmRTvgDoTQXLayMVRT2k9sgOqFjfa0DC3kr
	lWY+UhGKJ02bkVhW
X-Google-Smtp-Source: AGHT+IHopjIXv8jRnOM7SdbKGejL8HmLCEbi6BqZ/fl5zn8nC+umc/NX29TWVW5P2ry8JnLwjKerkQkMpRF8tHTR1Sg=
X-Received: by 2002:a05:6512:6c6:b0:591:c473:5bc7 with SMTP id
 2adb3069b0e04-591d858f85emr7186831e87.50.1761135743550; Wed, 22 Oct 2025
 05:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 14:22:12 +0200
X-Gm-Features: AS18NWDxwRikRa37d3sfSPIurHFNsUg5soxDVQrWVC_wnbUDqwvc55kIMFCSQNk
Message-ID: <CAMRc=MdWFL_+RJXPUNLd0BTyxbt9x8jztf5SDViPQCkxSqoHdg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: stmmac: replace has_xxxx with core_type
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 9:27=E2=80=AFAM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

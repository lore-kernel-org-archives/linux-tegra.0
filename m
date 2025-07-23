Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A642E11B0
	for <linux-tegra@vger.kernel.org>; Wed, 23 Jul 2025 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753268931; cv=none; b=VnpKe0ybbm92tMWwJwKQvU4Vkcm+os8dIyxJlNhKAT+ZNrN6RvJZY0HueUbiCkIyyK1HAx2ug4lkSW1SodzytKbOmomamH2i4Dfeck4gw7P8/sF3nUY+qla7qUD2dyD7+p7DCbpgoWBR6PoZKGXAqVVQxVXQ4VxWHQXgQbuFOYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753268931; c=relaxed/simple;
	bh=3B0D+GxZIdTFezM7wUdeHc2Z7x4Bz95ATZb5mHcRHNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWGg4nAY2h/t99TzXfpb3iIrEqSPEsQpD9HqDIxBz1c6UJuRVmNhSzrt1corWGztO/bmHv4nppWn13DH9xmGm0Eir76QYWPlj2phq/pNGdNBaJEL4inWzhDoK2FjH7FCZgOzH2aojuBn954UsYmvtaFU9ApIv91AiA+YbyMWxs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O4UJfqe+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O4UJfqe+"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-555024588b1so6901607e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Jul 2025 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753268928; x=1753873728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B0D+GxZIdTFezM7wUdeHc2Z7x4Bz95ATZb5mHcRHNs=;
        b=O4UJfqe+a1uRJFOXYrDAfuQgdI3nruGymy2J58oYxaAIvgXRTPnWm6NGiDYJFUdK1n
         3xrS76FPfUfK8BHVVfS15hKXkVB/J/xh9354WQQXu+70RX6odvPSeEUhT1AsADkzuP5I
         kdyXiqtxzomhvnTxl3yZyaN5X6sSAPo52+QHDOwRjHjhZ8iSxJtT8mWdJdVsD8zWt/H1
         tecHpGmhygnVsY0QgqgAWGgYijcdJ9k3Nv6NHM0bDCmcwoHySagHnVTle3m7WZDslhkH
         p3e8gBcizrZWvAFx41f50XVsUBPi7vstLpUApiNZNRh/2JYSxzaaSwBiM55RhbA6WQA0
         PpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753268928; x=1753873728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B0D+GxZIdTFezM7wUdeHc2Z7x4Bz95ATZb5mHcRHNs=;
        b=fuge8D75rCEovTxiYsXB2A1435OSx5uNTepwXUuBNLBbBQe3Mm7GXIkZ+QtD6Atxvp
         2A5X8nhGX1sPCTHR9qik8aU070vviuPxuIpZjTVAfFwStvAYvEdrYjqs2NTwwRydAwjE
         38RFG8Af/ygCfhhp4vrZse+9QRGSFm45KRRw89cOulOd22h5VrAg68aVQGHBlmhCwKsn
         RkpqXUjvLQRVrjgcsfGkERLRPXNr5wY4Ooz6d7kzmNlBQMyaF7hrzOC8T7yN8cRoSh6P
         m9ULKeMRbjXomjfEkW2OBldVCKlwt48PTXyzu57PylQK0zEikkjGBz2QmGpXA7v6Ojm4
         vHXw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Irq/MOtI0i/WLy1OoywApGOCIykAV3AYjLr64RAqmZybFUn+wZ56sC0WIBhqdIDju3zU2VCyjlSHPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQiJ6WxOuRYjh++0jhZ9K8KGSIsI25qQbQY+5XasWtMxZLurm/
	MTSZ3GHSeT7Fv4qe2LjeQuUeSMIGy2jOk+mzYTBGa2Otih9Y91JZ8KJrppsJYftiy0t2x1I6VuC
	eB/PwRZiZ6OH9p+UqOWC69TzCzMAOUmyMHR3BiqlzvQ==
X-Gm-Gg: ASbGncsawUxIFTpiNk+HwD1eXWryVeygtPt2UjlqekbaQBQGfV6dLHonOe/FjOnBg6b
	VwJqV/AiWJwT7v3kTxThfQFIgCUCwsKhp6zH6zM2Q+3NdEgPmMlYXVAgxsXxhIZDCg4RY/FD2Ir
	EFtdkhCAgh6c5/SVbq7B7euLZI0sLEb+L/pzk9kjxvBq275QVrquDyst1lB4axg/kY1F4leQu/8
	No9Kqo=
X-Google-Smtp-Source: AGHT+IFKArCYdHOkQCTFcXAgfJ76l45O02eVn107esIDRp4PDEtys19CbwegoUBC08sGUKe6rDVxbL8pTwqzpc2cdT8=
X-Received: by 2002:a05:6512:39d5:b0:553:2e59:a104 with SMTP id
 2adb3069b0e04-55a513e983emr851506e87.37.1753268927568; Wed, 23 Jul 2025
 04:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com> <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
 <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>
 <yslfabklduaybg255d3ulaxmzpghyj54zdfeqkx3oxgisxf6fo@2wecuqpvvefc>
 <CALHNRZ8jq++KVKxKP2-GwMA6CauP=cM2_wt==MRAV4mOzK2kxw@mail.gmail.com>
 <xc72g7j7png443pjxu2wpsuqofgrpxvn43emkt3rv5qrjzf7vt@qzvsiy3eakub> <CALHNRZ928+=85FbvfKt1c4VX7RudU7ehuOa6wwLj8JJNz+=W-A@mail.gmail.com>
In-Reply-To: <CALHNRZ928+=85FbvfKt1c4VX7RudU7ehuOa6wwLj8JJNz+=W-A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:08:35 +0200
X-Gm-Features: Ac12FXyYD0AJUEr7X9CzcjA1Pj4U-nYzctmGPS86PrlZzjvsb6lrpBvI2Km-UA0
Message-ID: <CACRpkdbLzAJS=iqgOEzE9kD-fM9tx22JTDPgQeLwbTFKiStrtw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 7:45=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com>=
 wrote:

> I started looking at the pinmux scripts a few days ago, but updating
> the pinmux driver import/export for the t194 style spiderwebbed out of
> control quickly. I expected it to be hairy, but that was an
> underestimation. Doesn't help that I'm not the most proficient at
> python either. I'll continue the effort later, but if someone with
> more familiarity wants to try, it might be quicker.

If this means people with 186 dev boards cannot use mainline
Linux and they would if this driver was applied, maybe we need
to apply it anyways?

Yours,
Linus Walleij

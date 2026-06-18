Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4AE3B27C1
	for <linux-tegra@vger.kernel.org>; Thu, 18 Jun 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789165; cv=none; b=c9TgLI9mNMS5JmVGa/Y1KNcZoHUJe+tnCJdFMzMOIe1cCaPT4XHKWZI7TcQ0LJPZgT2P9ZP8l/QK6r8nnhvB5gnsbxrgh0cEaODVmAwch4f2eKb/p/xcWmRSAql9DhT5EIOCPXSpwG4SzVoV/lcErCCnWAcmoVLoNOpRPYuqY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789165; c=relaxed/simple;
	bh=yrqB1J+S3NrnFtw9TTeePpZ+5KkkCm5MnR2Ev4wGC+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNrpltvQMtEd6isGsaiTqZrD4PCd0dWw0UGp71lE7xEEAyFN5Eit/OIbVKVZPoBbL5ZUkWWAXhqFAgC1pdegA0mAbaxy8/xkK7F0C50vY4pOQjGCsa35E0WTpBD25mtd9RhQyvmWpnATs/uGFxBh3nArdEhsitZVZhgFtIR4GWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Okl9aJ+E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Okl9aJ+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679C91F00ADE
	for <linux-tegra@vger.kernel.org>; Thu, 18 Jun 2026 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789164;
	bh=txcC/Wxe/08cKhga6q/UcowCnqHDHbbg3CIOF6J8q/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Okl9aJ+EUcAiMUDQ9kgZ5oHl6DFnpK9pktr5zQojFHAg4Sfg7lV2Z1qWv2av8pWWU
	 yesWjlnsn+CGDdkS7ylcgPndLRodFkcsbguoMyvVA3nyDXesLXGBT9fmG1kGcm2oQK
	 F+9JPaoihYBYoBTCSiyrfNGBgNfQOxaYUrBbsQaLe63JcbxqBbsoOLABWcfVI5nrY9
	 55VvpJUulNHMgEy589NZA2SCc2M1pE5dLQsQPcXXlD3Ol3bk75A9yVzg4qnboJICMN
	 gVT8b4aigeYE5tAitnejMVHN0gw4DCYz+yF1KWcbz5WMBvp/tB3Wuwezq6VVrW230e
	 ioBjPG+HFmugA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso1107783e87.3
        for <linux-tegra@vger.kernel.org>; Thu, 18 Jun 2026 06:26:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ901InzzZDHpxNYfly2I1gH6Oqr98qBu7BLkrt7gXnVeSDfvcaixuirOFtHfCQmHLATedvFdINZEgiQ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqHQrqTiGFHQKmnlL/XldLF8C/E8w4O21LU7vOet5t8B5V8mBA
	idvso3SCLpTI8cITcd9iULrR6rVjwAu5YZB7bacJisDfRLvBExs3I1ODzyCy/lIbd8WqzYVF8ek
	0u86oih+jV6XwQxXEuE+3kgEqvyBy4IE=
X-Received: by 2002:ac2:51d6:0:b0:5ad:4ced:9c9f with SMTP id
 2adb3069b0e04-5ad4dacbb97mr1176548e87.39.1781789163192; Thu, 18 Jun 2026
 06:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618030609.958831-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260618030609.958831-1-runyu.xiao@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 15:25:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLkL+WV+WYCy7YsQ6n8ZQH27gLHQKf+-CYiV3GU=dbgcUQ@mail.gmail.com>
X-Gm-Features: AVVi8CfJ7c_CzaE_mn8nOqFsmSYUOP2S0RYUVlMahL0VwQhNRazkvD-npWNlbAU
Message-ID: <CAD++jLkL+WV+WYCy7YsQ6n8ZQH27gLHQKf+-CYiV3GU=dbgcUQ@mail.gmail.com>
Subject: Re: Question: GPIO direction callbacks calling pinctrl in atomic paths
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jianhao.xu@seu.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Runyu,

thanks for your report!

On Thu, Jun 18, 2026 at 5:11=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:

> The class of path we looked at is:
>
>   gpiod_direction_output_raw_commit()
>     -> <driver>_gpio_direction_output()
>        -> pinctrl_gpio_direction_output()
>        -> pinctrl_get_device_gpio_range()
>        -> mutex_lock(&pctldev->mutex)

Again that is mutex_lock(&pinctrldev_list_mutex); is it not?

If we go with my suggestion in the previous report to just
replace this mutex with a spinlock, I think this issue will
also be solved.

Am I right?

Yours,
Linus Walleij

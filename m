Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB0B3E275D
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454506; cv=none; b=hEk9YCJqjPlaHCVM/mEtbqHxsoYSVkqnSob594ogjlObiuRZu8eg+aQL9/CTTPJ0pzBraopQ0WvC6J/ZzqronN5OH5625hMxeLFcELzNOAb/DW0ym2vhEnnGvF5OxPCtubO7OyGiAucNiHVVWHEiUQ/RfY1SC7LDYv/sETmPyE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454506; c=relaxed/simple;
	bh=aldmRPDOiiniGw503t8LDK2MsDSx7z+uZZ/KCfzSBN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZ+9yOsO3XpYVZQfYRC1WRhs5x25WniB666wtTmNxZweNlUfN8XBeZ3DKGPG6MkTKnrKyImaCHoy5Otyabb0EePp5Mzd4u6KI4OdUxi4F4agbf6EUPEDoTdBMBrr54Z09J2z57IMfxJOK3hkEnmg+5hDVEIo8eH66eUhPHrl8ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gk0/ZngP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gk0/ZngP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E624C2BCB9
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774454506;
	bh=aldmRPDOiiniGw503t8LDK2MsDSx7z+uZZ/KCfzSBN4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Gk0/ZngPQjeGn36eOsdWZQWLWprEWy3AkR5hni/lE8ONxCfP3wN9iJXuu5vn2pyMJ
	 nJiG+ExwL18ilB8uMi+50Px+48WLD35cA/KJzXl30cOrLm1XHkP6/u7CfzuhuMgYBp
	 DDxza3CMzAS8sMQyLGYMo2oiYPpT8nggzBl8focYuTSXEM2IAcs5OZqZ1j3YzIY+XT
	 1I001RKPlZrVl+U7XDdwRzb6asn8XwzNOGgT85IMqibPiISmDfL5M3GvsTJxSjcZ3J
	 RB4byEEi8D5lGMQp3KZ85qQNPUmFfiaaLH5yO8GZd2D+YWbKD3ud9QCm4xCljSwmLN
	 AM82iX3FkN6qw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38bf47a6f02so21100561fa.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 09:01:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtVCxkHHVB2lyKrqSdueI0qjrvo+YYIpI4Jg8ENTwfFMAxP5rjNzsKlVpIra4R2nVv7vt99RRPeKfZpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbkyv/RCdqWeuEudeQsJTX9jN56G2RLB303Rqg1H5b63TOf/qJ
	4W7eZ0cPEqIkzP1kToI2Kj3CL8LyAE950IYkQt0yM0al7yQ7R+oVwWIcaJNmVrQWAn6pdfGHcOR
	49Ktsyf76/lutWIlo+R0EB9lDe3/7LlM=
X-Received: by 2002:a05:651c:1469:b0:38c:6b7:ad47 with SMTP id
 38308e7fff4ca-38c43072d48mr15879491fa.7.1774454504493; Wed, 25 Mar 2026
 09:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com> <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Mar 2026 00:01:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v66++ZtfJ_K=de9ah45sqK0sNDkPr0B64C_U+WMhW7jc-w@mail.gmail.com>
X-Gm-Features: AQROBzDy-rsBXq4Ru9U4FVjZxHD70RtzjKuDaTmPj80U_CHIL3nYWTBGwt2KYN8
Message-ID: <CAGb2v66++ZtfJ_K=de9ah45sqK0sNDkPr0B64C_U+WMhW7jc-w@mail.gmail.com>
Subject: Re: [PATCH 03/10] i2c: sun6i-p2wi: Replace dev_err() with
 dev_err_probe() in probe function
To: Atharv Dubey <atharvd440@gmail.com>
Cc: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	Enrico Zanda <e.zanda1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 2:27=E2=80=AFAM Atharv Dubey <atharvd440@gmail.com>=
 wrote:
>
> From: Enrico Zanda <e.zanda1@gmail.com>
>
> This simplifies the code while improving log.
>
> Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 ++++++++++++++-----------------=
------
>  1 file changed, 20 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index fb5280b8cf7f..dffbe776a195 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -194,22 +194,16 @@ static int p2wi_probe(struct platform_device *pdev)
>         int ret;
>
>         of_property_read_u32(np, "clock-frequency", &clk_freq);
> -       if (clk_freq > P2WI_MAX_FREQ) {
> -               dev_err(dev,
> -                       "required clock-frequency (%u Hz) is too high (ma=
x =3D 6MHz)",
> -                       clk_freq);
> -               return -EINVAL;
> -       }
> +       if (clk_freq > P2WI_MAX_FREQ)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "required clock-frequency (%u Hz) is=
 too high (max =3D 6MHz)",
> +                                    clk_freq);
>
> -       if (clk_freq =3D=3D 0) {
> -               dev_err(dev, "clock-frequency is set to 0 in DT\n");
> -               return -EINVAL;
> -       }
> +       if (clk_freq =3D=3D 0)
> +               return dev_err_probe(dev, -EINVAL, "clock-frequency is se=
t to 0 in DT\n");
>
> -       if (of_get_child_count(np) > 1) {
> -               dev_err(dev, "P2WI only supports one target device\n");
> -               return -EINVAL;
> -       }
> +       if (of_get_child_count(np) > 1)
> +               return dev_err_probe(dev, -EINVAL, "P2WI only supports on=
e target device\n");
>
>         p2wi =3D devm_kzalloc(dev, sizeof(struct p2wi), GFP_KERNEL);
>         if (!p2wi)
> @@ -226,11 +220,9 @@ static int p2wi_probe(struct platform_device *pdev)
>         childnp =3D of_get_next_available_child(np, NULL);
>         if (childnp) {
>                 ret =3D of_property_read_u32(childnp, "reg", &target_addr=
);
> -               if (ret) {
> -                       dev_err(dev, "invalid target address on node %pOF=
\n",
> -                               childnp);
> -                       return -EINVAL;
> -               }
> +               if (ret)
> +                       return dev_err_probe(dev, -EINVAL,
> +                                            "invalid target address on n=
ode %pOF\n", childnp);
>
>                 p2wi->target_addr =3D target_addr;
>         }
> @@ -245,26 +237,20 @@ static int p2wi_probe(struct platform_device *pdev)
>                 return irq;
>
>         p2wi->clk =3D devm_clk_get_enabled(dev, NULL);
> -       if (IS_ERR(p2wi->clk)) {
> -               ret =3D PTR_ERR(p2wi->clk);
> -               dev_err(dev, "failed to enable clk: %d\n", ret);
> -               return ret;
> -       }
> +       if (IS_ERR(p2wi->clk))
> +               return dev_err_probe(dev, PTR_ERR(p2wi->clk),
> +                                    "failed to enable clk\n");
>
>         parent_clk_freq =3D clk_get_rate(p2wi->clk);
>
>         p2wi->rstc =3D devm_reset_control_get_exclusive(dev, NULL);
> -       if (IS_ERR(p2wi->rstc)) {
> -               dev_err(dev, "failed to retrieve reset controller: %pe\n"=
,
> -                       p2wi->rstc);
> -               return PTR_ERR(p2wi->rstc);
> -       }
> +       if (IS_ERR(p2wi->rstc))
> +               return dev_err_probe(dev, PTR_ERR(p2wi->rstc),
> +                                    "failed to retrieve reset controller=
\n");
>
>         ret =3D reset_control_deassert(p2wi->rstc);
> -       if (ret) {
> -               dev_err(dev, "failed to deassert reset line: %d\n", ret);
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to deassert reset =
line\n");

You could also simplify this whole block with
devm_reset_control_get_exclusive_deasserted().

Either way,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


>         init_completion(&p2wi->complete);
>         p2wi->adapter.dev.parent =3D dev;
> @@ -276,8 +262,7 @@ static int p2wi_probe(struct platform_device *pdev)
>
>         ret =3D devm_request_irq(dev, irq, p2wi_interrupt, 0, pdev->name,=
 p2wi);
>         if (ret) {
> -               dev_err(dev, "can't register interrupt handler irq%d: %d\=
n",
> -                       irq, ret);
> +               dev_err_probe(dev, ret, "can't register interrupt handler=
 irq%d\n", irq);
>                 goto err_reset_assert;
>         }
>
>
> --
> 2.43.0
>

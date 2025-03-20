Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3E20B7F0
	for <linux-tegra@vger.kernel.org>; Thu, 20 Mar 2025 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458417; cv=none; b=UsCInKjdLYTOOxQQQZmTGxKegZtmPoDf71rvdnN3NGEWevOaYf4wTZQ/F0p8vcrzW7e6GHtLWiOpgTu+syyZx6QpmIs0+P7EL4XVxLEZSGxlqvzQMFIEa2krgIjKO0sCEm2FQ1S2xdSSCsmRG6a80CTcoQzH8UEiNylQV2obKbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458417; c=relaxed/simple;
	bh=6Ji1RBIOpRF3KKxjONADrWSLZ8hGYxB9lOHKQd1SPN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Swu69ehV30ps2GJLZjT831yS4QrxfFe7legILXu7ce3E36UahsusDVH4XymRoGRbFYnFTQNJcPk5Au18pX80CtNPjv7H+eSbqgUPN3oOFz5FsUQOHXv86Yg2kLD13l/Vo/B2WBUOXsqyO8HVenIS3XWDpSPaXpirSVockdPAbjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWhxWzso; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWhxWzso"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549963b5551so569773e87.2
        for <linux-tegra@vger.kernel.org>; Thu, 20 Mar 2025 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742458413; x=1743063213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH/3f5Dac1JZ7PB6fCTYluQ28FDUu14YKXsBxY9FGQg=;
        b=nWhxWzsobggiluwJCxbDVfDnPmsDCfvAABhSrHVU5Iw1vBbjUXA1W/RkeIUwka7q0N
         i37OH3tnLf1Na42ip7whz+23z+xpuTwg0QViQMQwueWsGXdEWqesVJxYMqg+TJdEVK2I
         5G0wFEosfn1XtAEaq7eRrnQPdXuUE00Uhqhr3tGOZgfcTOKv2Ew2yHN5BudbFdfaAwaa
         NdTs6KcEJNc9SB6rTscuRJwz4pfJ8tHKnYRvx1+n98L8LOa35gjHvGaFZOMYrA2xQpbJ
         n/RbxVB+RmoqP9WaTzEpBCtVho8h9QnZmSRDU8/VtvbnKWUWA1ynSRyBGrAvJ1QkgRaB
         AcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458413; x=1743063213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH/3f5Dac1JZ7PB6fCTYluQ28FDUu14YKXsBxY9FGQg=;
        b=o+O1B/q/QaUCUVYOq0yytdR80tA8WSzAPKuTiH4bO+fMbGd5tCYvhnw4/9UYoTEeCq
         EnBfR8dU/Y4R8FloeqEaTsw5suY6i1HFOZpFX0VhUZHyZsXE6juMzUi2HFhmYV0it4nc
         dNSGj+mNqgS5bffDjVIkwnGmQTPvVJrg2W6/tyWgvGIHfsKGOzRubgmVVKDr+FTR3+eu
         UaNiRDne885JdvxEjaA3lQqGjMOuoMPQ7dKk6H+DZ37etnp64BYG8PKKJbZPifoSOh4i
         Qe+Kgh8+2qn8SJoGdFbYIBUYN6hdPtoz5ZjXb1kl/7fQS78DUFoaxp12yeAqOsOlqegq
         UzPg==
X-Forwarded-Encrypted: i=1; AJvYcCU+EnYQpIOAdG/x+LOGmZbdIxh178qMarVyF6ht3XxicZl8zL0BRPIyj/RWxu1MF8+RSI9x0aAHch2uxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhXdmVc13mAGfivyV3oHIjLNVkFnsRg8izQO3Y91tEgYgiBrP6
	NIppm+AhiTKR2zj56mF/DD3zguohZ/NnTAYsmbWSF+RFeroTm5jswQuokGcUQ+E5kv8CFW3Y7iu
	MIDy86o8w+CCdpSyf9kqWux/0b3sfYAYv6GqhfIfpOrBW6zvhJkRInw==
X-Gm-Gg: ASbGnctkRhUhM7mi7C5QbMz1trjb35QFVE37OtM7OU8gH+u1fXN0MdBI7kon+vuJ3cQ
	AZvv5A+NbjpTuXjMjKir+FNXZA0g4DyZFmioYs7pwGA9nqIbnZzgNkaXG+4A9+mjoCzWPRlBj2d
	alcwxAJA0V5Zs+EjCvGqHWTuM=
X-Google-Smtp-Source: AGHT+IHlRAMm6DHFmGnX4O6qtM7WU7UfemcO1DW0vJWDefpFUiW/wKer02pkqfNiLKCodEdnMprWlIdw9ApK2Vl4254=
X-Received: by 2002:a05:6512:3d27:b0:549:b0fa:6733 with SMTP id
 2adb3069b0e04-54acb1fc7f6mr2205401e87.37.1742458412840; Thu, 20 Mar 2025
 01:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain>
In-Reply-To: <82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 09:13:42 +0100
X-Gm-Features: AQ5f1JrO8Xfjg5ntIWbaCB7qZbTiTVkH-WMLNIyd4WNCkBTjqRZTBB1zv4h7_O8
Message-ID: <CACRpkdY1NhHQ43L+pAoC6EC_ydJKY2u+P=nhNAgo_Gw9McNngw@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: tegra: Fix off by one in tegra_pinctrl_get_group()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Prathamesh Shete <pshete@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:05=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This should be >=3D pmx->soc->ngroups instead of > to avoid an out of
> bounds access.  The pmx->soc->groups[] array is allocated in
> tegra_pinctrl_probe().
>
> Fixes: c12bfa0fee65 ("pinctrl-tegra: Restore SFSEL bit when freeing pins"=
)
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks Dan, excellent find.

Patch applied!

Yours,
Linus Walleij

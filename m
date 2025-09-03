Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7962B32F754;
	Wed,  3 Sep 2025 20:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756929800; cv=none; b=H9lFnH4qh/a7EeJNuUeCCPznQ4iHtSfrfjb4FTCkUUHof1Rq5Ai/o72bX3IIb5O4wQ7yz2kMnYoVX4f1hEKxVmFdsc2adY4BzL12cUMdyflAS0zCQ9Xau8+E7uLWxCIywEWQM4qEz2YepSRr4+n0PPlAapx/4IbWRxPjt8fx3QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756929800; c=relaxed/simple;
	bh=/GnEnyvIds6NMEuy70lyQ7iozsauSfnagRTg05Nb+2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJSBG2bG4HaKvjU88IATu3YOXXmq2FlnF2Y74nzgQw9tAx/Q15A9GD8xMTF7M9jyA2GD/5afZTkva4lUpuLlwAzTwZZJpikb69ic1A3axEmvKc9WADKHBCWm9jSMfreXRyqeqUJvkqZPuCfCaZSBSox8uyOkwNmJs0fo9YyAkCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpunDJ7M; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpunDJ7M"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so200519e87.0;
        Wed, 03 Sep 2025 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756929797; x=1757534597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVCyKPOHSsiPuZSH2bGLKwR4+CtPnqenhzlKImlxxGM=;
        b=XpunDJ7MD1CqNCh5kb8wvcCicyNH6saZxcy30Hr5B9WtNbM3CPCYMIskxtJiSKDqf6
         tbvuh9E8EsGi78GUSmF8dbYkwJ0vsMnvYSzSc1iJJleiYTHniW3J0HmFKZl5EupMyL90
         8KPuEoI1PsJyZe6WLrJcocAMGpVCorr/RdxfVecqjQKv0Q1yGt7OV3KrirRHa4SPgMTb
         /f/qNA4WiOJol7BDpQ+JLGJ/Ania/tAosYtsZep/5GugouAvVA+YLu/sjPuCjlf+sinn
         HpyIRpW2dyPiaJ3Pm1NcfLCufr18Zjv8Bzi8jqzO4qlnDD/XzLQ0BWRel17bMcsNg68a
         1pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756929797; x=1757534597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVCyKPOHSsiPuZSH2bGLKwR4+CtPnqenhzlKImlxxGM=;
        b=ruT+epKLBGVOyqj3O2CDbn9BySTLV6/ZYmIwPuQZBp3e5ir+itRtpCuPJ5JudXXVLD
         Cg/KTJbyfD9PoVVxYBxOXZMV4QU5ldAG8HEIaeksGo5Jt8muUFyb7VUo20W5GXXIXHL1
         w8wahAxFMsNSLSvjNyAfnhoRr6Uj6SCw/YWW/EO+1FJJUTs33kVdvp7xryo0Iu5FF5F3
         511tVWQH3TAcQe/OKAjGrs7CgStdZ3RwYT+93/uuXZVJoBfhMa0EXzTEvIJejiMogIIM
         Rb4XDy2zsVjIVv790nEiITfrlUUU5dxJk7BNGYHoiQctISmFK7ESoLrmFJ3iH5fqT8n/
         qzXw==
X-Forwarded-Encrypted: i=1; AJvYcCUulxwvq2K+sl2CBqoPVfY2rmQzlVkmu3YqH894bdg/NwQvFiDRbU4g7qN/Am82YtARw9hVpXIf79ItdqfZ@vger.kernel.org, AJvYcCX2K/KNsBiPxD83Jig1DXtcVQArRTXs653CaFHdoko3pFK73T70EIquTgnaeuorquqkAI1lHKLdfrggXBo=@vger.kernel.org, AJvYcCXfbY7uDkEVCgInimjaKJhKkh5tvO0Nmv9m0SwTorh6IW/yEk/NHIWZqzBtzrkXdgRj9cc9vpM1ROAD@vger.kernel.org, AJvYcCXgSAx8KFmxndWZrVBM+I3HdNWYHoT7t35Aub91VaU4/mYRvAdNB26EdPgwHRryGY29pHZovkkZc86i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2NuLCxooek7bvIqEb+UqMmmZTGjzwYYK2nquM0okg/Go1d37z
	83JOIPKLe1a5kreUJsR9jiej6lSwTbFq9xatvkR6VDOvh9QsnpeYdRJF8NSBQatOzJzu2LKXTgq
	4pB73hxwOFU4xszAShGL115IDV8lim3M=
X-Gm-Gg: ASbGncv6alX9EytDyB1oQ/PepmPJOYJ3mYTt7odHsNuC6u0EKxpTHAdv2W/yjWAcxWI
	GvrnxHvWuqPpvQuRaaYj/dvJEWwwa7lRfiP6WSiDpPkoFTq7uArBZ2WtJFy60TItInQHD7MdjVF
	n5FFi4u/ayWMIjLW/y57vJ067t1ri+UkWrTYgQYS//kdPYSxA/8t9GwWPoVy1aGJ4XLln+jQmuP
	A7+VWupczbFWKvI7emw0p02GIxF
X-Google-Smtp-Source: AGHT+IGQ+MSQmso+WRSx4PehMSzyC243Ed59bXozsvm2C9c3duCkAx99xM+64CNu/YaQvU0yXQneMAeWEzI0NJeRFiY=
X-Received: by 2002:a05:6512:eaa:b0:55f:4321:4ad6 with SMTP id
 2adb3069b0e04-55f70948893mr5066121e87.44.1756929796386; Wed, 03 Sep 2025
 13:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-tegra210-speedo-v2-0-89e6f86b8942@gmail.com> <20250903-tegra210-speedo-v2-1-89e6f86b8942@gmail.com>
In-Reply-To: <20250903-tegra210-speedo-v2-1-89e6f86b8942@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 3 Sep 2025 15:03:04 -0500
X-Gm-Features: Ac12FXyxjeI6n6U06P265p3zT3OBNoc4LSPzdOdF_n2VtoVV-v4DkdQvlgmhS_Y
Message-ID: <CALHNRZ83jeMbudD9LfddEntkLDgygsg_D5LAovXXpFnZie9D7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: tegra124-dfll: Add property to
 limit frequency
To: webgeek1234@gmail.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joseph Lo <josephl@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 2:30=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> The dfll driver generates opp tables based on internal CVB tables
> instead of using dt opp tables. Some devices such as the Jetson Nano
> require limiting the max frequency even further than the corresponding
> CVB table allows in order to maintain thermal limits.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll=
.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> index f7d347385b5775ddd702ecbb9821acfc9d4b9ff2..8a049b684f962f2b06209a478=
66711b92c15c085 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> @@ -70,6 +70,9 @@ Required properties for PWM mode:
>    - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
>    - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled=
.
>
> +Optional properties for limiting frequency:
> +- nvidia,dfll-max-freq: Maximum scaling frequency in hertz.
> +
>  Example for I2C:
>
>  clock@70110000 {
>
> --
> 2.50.1
>
>

Yes, I know this still needs to be converted to json before it can be
merged, but I wanted to get an updated revision of this and another
series that depends on it out for everything else to be reviewed. I'd
still like to see Thierry's conversion pushed, then I can stack this
on top of that.

Aaron

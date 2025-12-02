Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BDD214228
	for <linux-tegra@vger.kernel.org>; Tue,  2 Dec 2025 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684141; cv=none; b=pQKHulZ0GpovHOR+PAUw3OAsLfgs8+PlIfNJa82eh/8h0D2GHdhF29eMjdAlHvA6M634/LqAeI+Nz5Mq/aPWu07SeS1fxuS9ATpETyGUcydiUzs3NNmBQ6A94nDYd0xAUWSD+MdZFKeQi6u8zONaTiiLE2sTMg8G4E0jUNT8q9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684141; c=relaxed/simple;
	bh=ak/Rt6uWiX+MT4pBJfZ+PD2Fezju7a0RibofMkxgxGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqQktVkriIRn5e54KwPXdBjTf9KeTZLbZLTaW1P2CTT2qu2AuWeHpGxy4eQGWQ6WCTftmC5FQRXR0ONYNdtosq0hcqY+4I+Ni7OCS4SUXPOKhxjjhd+Fwv9ww/KijazQb0Zmhtk70xw6L0mIYS7cT4+0JThx9e0hgWD2at+XCII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34372216275so5518821a91.2
        for <linux-tegra@vger.kernel.org>; Tue, 02 Dec 2025 06:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684139; x=1765288939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcG/XQXLp9HYcvharszf8uW0YuqvJnIwjKHOdBnLhz4=;
        b=mBUpWpK6ZeIwMuikniJmUVLyDEXgKT7XuKXiZ9hhaVA+DJRcfPEJ+1HePS/swD6AGJ
         xFwdR0EXrlsQn91JxfDpC8K0+n6zojVi/8WjAFF4xU/8k7AhDqC/Nz1Quqh3Dzp5ttx+
         3kFJEXPu3mmN/8y2+Eg8+qAZuKz83n2TUXkGLaGv3h2ZBxI34vDNVztDTq8et+v2fwQb
         k1DvAqkCjEZ2NJuQ6LYxlKbPv+r0xSKAeVSDPFu95gIaraQhZnVxN3knzeaYQL4/RVaI
         5k5sQ7COY+qfxg2QzOi182be47j7WUnGS48/T1fr7v/UTF3IP0VSdnqlRuUib3brIV/Q
         e5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0FdsbHk+eDF2NMICorCiTcxZUpP3zgqkZhtwvd63CcIWjVkcFXOGsgCwj3S6zl8EPb8weREv9LNZSog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtUp6idGUT+VBrFaU/+U8lS10HFvfGB/9usS6TGw0Vam/dx9F
	r6EuBU754naPgP/jPiSEcEPHwAOTLTI0XFBbYnU60OSmP3gckBPWyehC2IJUKP/u
X-Gm-Gg: ASbGncsd9yeqCzExHEooZOvpfEMF5fCJlSWq0lkgOIpgomsm5wbGmG6SBgcH4poy/iN
	8FBzxDqTU4AVlPecP1fvYlbAs9dlXgGv7Volpv13RgLtnPJ7SHQ8HHxzQE0NkdjX2vR5Q1ufWOh
	nrRedhcKxGA/wUrlnLOiwWL6vgcrCS1Z5u8CQRTo/agbYWThccISNDLChhNtYnypU9WernT42tP
	dexFQVZHKG8hFXGVutF4W+vtBL1KlTfKM5de+m1TfOYzPFwMusE3/quoD7DZY/HH8Ali6VdW+xh
	MqZntO8W7ZQDlHk8YLg3VgMP7C0rxF9LE+IgvSnXzxb6FODoYclfTnYN0iYGJYv+STC4uOy9zGd
	a0cDrjnLHrkf5hsQpAQ+jYd+cwsmpp9INExsf/3MXBXTopZ4ujbT/VaPI6aeNZO2/pkbQ4DZ0RB
	xNkmlVYGokI7hV/3E5ROB4Yd+Z3A0gk1+bPiLKCQ32z+ybnLiKixGk
X-Google-Smtp-Source: AGHT+IEQ265R0Nxh5xRIicqu9Xoc0bsd1QC0Vu5E5Pew7B9IONNTmBTEvO5TcTqqFpIzLkoHEBYiSw==
X-Received: by 2002:a17:90a:c2ce:b0:343:6c71:6d31 with SMTP id 98e67ed59e1d1-34733e93813mr42589056a91.11.1764684135348;
        Tue, 02 Dec 2025 06:02:15 -0800 (PST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a546ed0sm20329324a91.3.2025.12.02.06.02.14
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:02:15 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso6541838b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Dec 2025 06:02:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV16H+9KoHdkLxlwiPoRghFn6ZH0zhr1g50i7yimXC9pD5jnUHsJt8AGJ6aWT55ckqZRZR8uQ2Cmar2fQ==@vger.kernel.org
X-Received: by 2002:a05:6102:26c9:b0:5dd:89c1:eb77 with SMTP id
 ada2fe7eead31-5e1de39d9cemr17004298137.29.1764683823416; Tue, 02 Dec 2025
 05:57:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 14:56:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnP_BfEGwKLqJN8UevZeVXg10-IsXC-lVqCY3H9e2HFkqZ11liOD_Kw768
Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzystof,

On Wed, 12 Nov 2025 at 11:37, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch, which is now commit 6ea891a6dd370ab2
("cpufreq: dt-platdev: Simplify with of_machine_get_match_data()")
in dt-rh/for-next.

> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
>
>  static int __init cpufreq_dt_platdev_init(void)
>  {
> -       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> -       const struct of_device_id *match;
> -       const void *data = NULL;
> +       const void *data;
>
> -       if (!np)
> -               return -ENODEV;
> -
> -       match = of_match_node(allowlist, np);
> -       if (match) {
> -               data = match->data;
> +       data = of_machine_get_match_data(allowlist);
> +       if (data)
>                 goto create_pdev;
> -       }

I think this is a change in behavior:
Before, the pdev was created immediately if the node's compatible
value is found in allowlist, regardless of the value of data (which
is always NULL, except on RK3399),
After, the pdev is created immediately if the node's compatible value
is found in allowlist, AND data is non-NULL.

>
> -       if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
> +       if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
>                 goto create_pdev;
>
>         return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

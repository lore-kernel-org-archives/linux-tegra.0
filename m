Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8D200BA9
	for <linux-tegra@vger.kernel.org>; Mon,  3 Feb 2025 11:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580773; cv=none; b=asghVdkY4tfqlEM3s5UFGPhXKNpd4dTlH2MgdkX3Ova6S17dZnx6J5DuW1vsA+wEA50qnYjabqQWqBrH13eHLWhBeyJfXOQk9tqdIVYJ+5tcyMQWQ6rEU0slSUFJjRro36P6/c2orwg4JqDtMdaRHuYs1NUp5vnPHE4OYiCvMOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580773; c=relaxed/simple;
	bh=L0zjq6jDBZI7ii7JiZWpbP+ZJV7dABNH4fjU0c/3R2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXjjijSKw4Oe0bSHNErgxnY4zdpodOSl2YoZKZWMSUMMWNQFqhl6vq8Jejwn+xT7GVgJbLdFkKIVWPv6sgMOc5/kz7XUWKZa5mV796WyACAM4FC+LMDOrbN/K8qexAjdea5SB384IvXrOQHNPwnRMDTuCTMOprQYNFZwz/8aN68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-518a52c8b5aso1057708e0c.2
        for <linux-tegra@vger.kernel.org>; Mon, 03 Feb 2025 03:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580769; x=1739185569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LtzZBZK1xYBhlRCCK/qfM5LmHxuaONLUZDHgOpET4U=;
        b=cjjg/IOWp9Sl+dEyjflK7/erqxAu9HjbAPEUELsn8xYInFMv0OH/VpNwQN/YFfvjd+
         1GodjD3sPj7HVMMXo1IvZ/WLAk8uJBxP53nV77juXn/CvTYhOaPVJT0sWkbZdm2rvwla
         aQ+nkyhkPhaAhxaROha3kNOdgPlaAh5CanXLQjN6SBE1uiZ0fuvRUG9O4SfEhnWTbNX/
         26LOLZscFsTDRP9vSDXzlJN0Z9xFOh8dod6/Qke/z+bKrBaTJljxAAZhflMYvy1Ee+AG
         yrpbH5Z2iiqS1gWqexnSoTcRE6V7lyfjSM45pBpP6RE1qBBEnavo9EKLG2HvCjkQRpOu
         DT4w==
X-Forwarded-Encrypted: i=1; AJvYcCUwkO3PHR/Sez9ZwY1tIIU/8efUkgH4KDTKsc+kDYVOUzTOzKGTI254QzswamQIJDCnlzCO+jMsxF3o3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzat67ysUdLjI2e2CKPz3SeLybGf3Pefz6ijH8QWBr2K3kvrn/9
	BX25GP6AbA494skXQfo/esthJiQvYKY2Wcaf26LVJWnQKxbpi3xEEmQ2bH/7
X-Gm-Gg: ASbGncu3iYqQhiKkF2HNilXp5h34AcjPO3xWlK9M2Pipqi6xxQAKlLDu7qF/l3MyCGF
	5stSpOIUkb9FFEjEia66vexts9htTneUJ8bq9eur0eqKVuwAhRt1kq/3Eb/aVvef5HHyPkSQfyV
	H8mM6V705XNFv8ombSrFm9pibny23I7CpOt5L60qY99ojKxjvegj3PjTJQNG5M6yugvWRcRiQW9
	fSIsA583MkONgl6I9Wm9foDZXPPl5w1YWfcJuwe40Q57HSyrySjtNVkw/GzA850N16f7mCCnwAk
	VVLF5ZgwrlMRAipkfGQkfjK26csIWDsvQkq9DRjidmUvtL6N/vP2TQ==
X-Google-Smtp-Source: AGHT+IHr6MZb5nx3jHOMb1X6ZxWI5rkPAeiTEEZTrDf3h4JK897Csk4lkV4ElY4LqTqDe8ZlpGinyg==
X-Received: by 2002:a05:6122:6609:b0:515:3bfb:d421 with SMTP id 71dfb90a1353d-51e9e4fe79amr17210904e0c.6.1738580769273;
        Mon, 03 Feb 2025 03:06:09 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86694051d48sm1550162241.3.2025.02.03.03.06.08
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 03:06:08 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4aff31b77e8so1676116137.1
        for <linux-tegra@vger.kernel.org>; Mon, 03 Feb 2025 03:06:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/VQK8SdRn7UBXFHUsim0EtDJkL7QdA5aSTG2JJGP2k7zfK2m/ZSYlUAs6NMVeI5IrDZnVTf+GgPECFw==@vger.kernel.org
X-Received: by 2002:a05:6102:3581:b0:4af:bf45:39a8 with SMTP id
 ada2fe7eead31-4b9a5237dbbmr13881253137.16.1738580768726; Mon, 03 Feb 2025
 03:06:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Feb 2025 12:05:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
X-Gm-Features: AWEUYZnzGowivfh3HKcvshI6ESRr_FkQLsKDAfk4pJYroEWG9h9gdbwxIR0ysxU
Message-ID: <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_name().

That's not the only thing this patch does...

>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -202,12 +202,12 @@ static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
>
>  int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  {
> -       struct device_node *np;
> +       struct device_node *np _free(device_node) =

Adding the _free()...

> +               of_get_available_child_by_name(dc->dev->of_node, "rgb");
>         struct tegra_rgb *rgb;
>         int err;
>
> -       np = of_get_child_by_name(dc->dev->of_node, "rgb");
> -       if (!np || !of_device_is_available(np))
> +       if (!np)
>                 return -ENODEV;

... fixes the reference count in case of an unavailable node...

>
>         rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);

... but as np is stored below, it must not be freed when it goes out
of context?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

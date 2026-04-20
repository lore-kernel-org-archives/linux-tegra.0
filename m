Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42D382378
	for <linux-tegra@vger.kernel.org>; Mon, 20 Apr 2026 06:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667822; cv=none; b=fP/0P2UnTJzj8zjPbOB6+CMyxoZw0+G89LnZJjzHjMzKwcDcja+ukDrHX/mSB8zWGik0uccdEGOKxbHkYGhfzDnNI1mIhElyG7av1rRxNUIrVvn/47UXdIKYl9McAfu7VDOB/VZYBM4cByoBnscJGNpnxrNmxoFdNheRkJ5dO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667822; c=relaxed/simple;
	bh=66683rtKBPWrf7C4XTuvMiaBte65Hl+xhzNuAjnDIic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xl1L5yagdqqBK40ewp9JTSj6s4oPv2xcFhIIQi5uBrwuxlgxxz4KBHZPHlE5lTlAypeEJImIw6/dJLaT6FGLOXR5nks94KA+NIpzcp5xRiHgeiU5Vo02+Rbd8tDQAixZdeo6GHIEnTk4hGuw3uKbakqGWOUzkrL79Y5VKrtAqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-60580b17793so839613137.1
        for <linux-tegra@vger.kernel.org>; Sun, 19 Apr 2026 23:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776667819; x=1777272619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev7Q2PR+MzeC42yfPBg+fufDGNaPf4avnQMcEXwV9q4=;
        b=GDxlNZ/uhSCEoovoqy8i4Hw6hQ9Zlld9qBSGGi565/UMkJyM9i7111VqiKqaYdZ09g
         w9YNPQR3bTPA6cmsMdDJ5VuG3g1YbGnXr5cISs8w6DmGtKokwA9Qzq9XtSfxhCrBDLvq
         8rm7BbcrVXGIOJngleVZyhRMp4tt9Nam1mbKgv3RlbMTPlg/+Z40wiZXXgjETetaf6yH
         dmaS4v1D7dIW/QBoSCyw1QCdB4YsO5Guj1pz/lN0Atm1WSmM1K9fylDXNeuIMw2C7SvJ
         71pgiIP2EYxQx5uZAfPWn5F4l9ZSquCx4doWewJBY600eXmvSQ6AISwiw+vGw9qZu3Op
         nGRg==
X-Forwarded-Encrypted: i=1; AFNElJ83Vr8XUc6OS3ctzJ4HPidMNRc02UMC7DwWoQ5kUVgo83WWNi3FkVBFwR6cSiXPGfLd7Nf+t6wKlTFNIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykD/q6GJbg/fdUuxptY54rYMGT2GitfzDGSGHchGNclWHHKMwc
	xdGL2/sL5xp+D31/7+E3K3eT65fFje6lYKLr5NTjyVgaXOxZ+sKtSh9ltDrqMRpo
X-Gm-Gg: AeBDievwtLovVAz4uzjJhiK5AyRYDBxQwkV2TvqrB+pIBZQYX0Zr+LeuSuMN9JwFXDc
	YzBHi78rLz7mWAu1+dq9MPoe5OoayyVgUM775Jh9PlPl6ELTQ6KkCb1QAb6KtQ6LFu0wf3nuT5g
	lCa9WpewBrigcq7t/VOJRZJxrGhsVxntULjJbuNe82agc6xxEzHpd49VtPZ2CGnwPpzvVuojevI
	MjxCKlCh2zIVvvWPZRIHTA+JoocTJuEdCL2LqFsclwlEaBQkKrLOPj4PupIPdcKqe5RbFAQpDYH
	s0SRwc1MHBYNfgjPbzjEiuxH00QJnVm5wNvxhWajJsC47gbjpGT4FtdTWr8TX29Q+0NBN1CAev7
	a5BN63eTvpriUcRQyRf+9RaoAhx7QmWKs+OXT9SjnsB/GwkZ27fK2jN2dkV6xpIDCBGZV1rrh8L
	ozNKVEQzp6X1LfvaZHTI/ZIbPDAPH38c0I6rKP8o21/PuV8Gikv1owvrlemrzBdh/5Z0U69KU=
X-Received: by 2002:a05:6102:6f09:b0:5ff:cb2c:a04d with SMTP id ada2fe7eead31-616f73fb90amr3947341137.17.1776667819261;
        Sun, 19 Apr 2026 23:50:19 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589097ec5csm4357924241.4.2026.04.19.23.50.18
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 23:50:18 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-610aadb2d9fso830265137.0
        for <linux-tegra@vger.kernel.org>; Sun, 19 Apr 2026 23:50:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8OsTUB/UThibqF8wWfpuQQc1RlZakiucoo87HI+R7+1yZCNF+XCliUxiEYDrpvRg2mXf7g+OmqZgiYkw==@vger.kernel.org
X-Received: by 2002:a05:6102:6051:b0:60f:7499:9b6b with SMTP id
 ada2fe7eead31-616f859752fmr3673069137.29.1776667818181; Sun, 19 Apr 2026
 23:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
In-Reply-To: <20260417131549.3154534-1-thierry.reding@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Apr 2026 08:50:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
X-Gm-Features: AQROBzDvJRShLyy63Y8y4xm5mUkGqHiHZxGK82_lU0-LEkdWIcvZD7MEx0w1d6U
Message-ID: <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Fri, 17 Apr 2026 at 15:15, Thierry Reding <thierry.reding@kernel.org> wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Peter sadly passed away a while back. Paul did a much better job at
> finding the right words to mourn this loss than I ever could, so I will
> leave this link here:
>
>   https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u
>
> Co-developed-by: Paul Walmsley <pjw@kernel.org>
> Co-developed-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>

   "every Co-developed-by: must be immediately
    followed by a Signed-off-by: of the associated co-author."

https://elixir.bootlin.com/linux/v7.0/source/Documentation/process/submitting-patches.rst#L506

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add more missing entries

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

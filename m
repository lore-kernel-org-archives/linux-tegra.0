Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D10528AB0B
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 11:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079737; cv=none; b=KiCXQywaNu+pbtA7OlUgUBZtXHpy9xMdEvLRTpSES3JoXTEw30iBQyRc0SKJ1Q7cKwsVtQF3eFyxXI+99TJpzkM+KmsyfSI2ggpOIYjVcMdT1cAXXFWgnMSiXju6Jw2hsOgLg8Z7Rgm40ZcArP8x7lY2Z1m670P4+/7z5ZsHhfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079737; c=relaxed/simple;
	bh=YgL17ySxLRQFB2KUyEq/eG4A/qsGXvMYPGteQORDio8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWOgIfgIr5U+XIbD/9+f8EOKDACOpFwcEKudVRI85gyRhmH9a0Dd0qMDuH8JF8nwLurHlqy8XIHbREWjmHSXTfG87JfhtdmlmYKrnjLi0IR8NbYqlc6aBGNbu4UNt7pztpmyDFv5gLz+GUi7cv447fqEYH8mtDNpwlb36VNlIvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-566390e7db3so121311e0c.1
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 03:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079735; x=1769684535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN2yiAXGrs4j4CPQfUE6cOAJN86qtVnsMhnJLeMqjm8=;
        b=qhXIw21ZzbjK36K7Pio/Q6dLItAc4SBOyqjWkAKuJwi3HNCVr9q6d5KGLH6E+LihyK
         Ug+9Fd2thBPoYEw364+OZIj1RHm0O3WdQjiG+2sx/wYAQKZKdRlKePNN1tXy6RKm8h9R
         xpBTkub0PiJC0oFxKQTleTnbXP+1oIX2/whCQQVWOOfHGa60ro4LoVBT92vETvc7p02p
         BGZXf0IRpxSM+jTrZw5SnOu//hPwTxvkVDeeFIwu6RwkICxbsM+gmxQlY5K679BykY9R
         ggVmXGP5NJy0zNTyfVrBE8b1VVVSlMRFrSQnZsFuNDrz6DqZPF8A0lQ5tH0SpBJUA6bi
         8saQ==
X-Forwarded-Encrypted: i=1; AJvYcCWArIVKz87sP1BwKBXAl2FEO93mXl9D6E/roFhcEmULgurWcaicud6hYMiDdsotxzRmSf1QtJYJplPW9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQTOr3av/PTieyyqA/J5I/SVQTqOzvsJiW9BigPgKLBF1S3P0
	tF6qrgOyyEW20sq8H9ip/SRTQq+kXymSc0Tl8HEUVrLxkeXAcJmzfZt5HfSqrw1Y
X-Gm-Gg: AZuq6aIrl8boQHwV9mkqIiQyTXRd7d/+1HL22SUBw/MPh5/81itC1GoBNU7tn/qRyx1
	wQDhrRScDQBAEZbrSP6wjGkTf0Yed9wDKCvY47xcwaZNE5JhGaS1rIM+ctvQhe2Af9nqK7T4qrr
	q3qZZn5oFoPlz2R0UaX1FvvgDcViuw5+mg5nIMqbkkXGXVCZV6TgmJ0oC4Lv+5Ka92ejLyyUB4c
	EhAHZpnTHsKycRNIRmJQl8zBrBw0FSkoN5qEeU7EZYZ9LtBLpCa4o1Jkqk0APdAq0YJpJGRO7It
	oJolpUxQXxZMI/rKJmz19OilY0qliFEHiSNeGCttls6dH5ea2UcGz8g5+ZArq13rnwamPm5NKXX
	FavAK1JjvyvCQGPqpWbb9T2mmesYOtnXUn+7tUHVn8BhCsE+toS3gUvqWd3EI/+w2f5xK7Owoto
	Brc/Uz0PsV3RNLdFRJhYjNtDeONjdCH7bEaKecjn8Ltkah03va
X-Received: by 2002:ac5:ca9d:0:b0:566:24fc:9501 with SMTP id 71dfb90a1353d-56624fc9a44mr1110747e0c.6.1769079735273;
        Thu, 22 Jan 2026 03:02:15 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5662d297490sm320664e0c.19.2026.01.22.03.02.15
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:02:15 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94803734b11so550529241.2
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 03:02:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWl4uXg60DqpDN6G8rItmJxIHdtu6zqTERNf0U5IZ6xbj+4K1eeoAbm2iGtMQXOQFT3/sva4TOCztlbJQ==@vger.kernel.org
X-Received: by 2002:a05:6102:508c:b0:5ee:a7e9:f14f with SMTP id
 ada2fe7eead31-5f50a9d42afmr3220059137.28.1769079734911; Thu, 22 Jan 2026
 03:02:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118080304.2646387-1-thierry.reding@gmail.com> <20260122-hidden-goat-of-excellence-a43b9f@quoll>
In-Reply-To: <20260122-hidden-goat-of-excellence-a43b9f@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 12:02:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
X-Gm-Features: AZwV_QhoOgi0chLJd-7T2xDzJCkVV-FejdTMGfxiem0V0-g6G9b9g8xnxTjocjU
Message-ID: <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 22 Jan 2026 at 11:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
> > The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> >
> >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings
> >
> > for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:
> >
> >   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)
> >
> > Thanks,
> > Thierry
> >
> > ----------------------------------------------------------------
> > dt-bindings: Changes for v6.20-rc1
> >
> > This series updates various DT bindings for Tegra architecture,
> > primarily focusing on schema validation fixes and new feature
> > documentation for Tegra234 and Tegra264 SoCs. Key changes include
> > correcting realtek,rt5640 audio codec bindings (adding missing ports,
> > clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> > YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> > (introducing CMDQV and DBB clock support). Additionally, it resolves
> > legacy warnings for Tegra30/132 display and VI interfaces.
>
> Same comment as was for Geert, I am surprised to see DT bindings as
> separate pull and I see drivers were alerady merged, so I will defer
> entire Tegra pull to Arnd.

The soc tree used to have a separate branch for dt-bindings.
Hence several soc submaintainers still use that split for their PRs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

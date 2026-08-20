Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4205138F62F
	for <linux-tegra@vger.kernel.org>; Thu, 20 Aug 2026 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250126; cv=pass; b=PHeGEktbdwxc8q8bsVl1x27gQ4LKfye+OTSSrHIuYZfcfNn3EQydcMPpU2/3CdwKQqGixUKUuifu8Eeycp6ucjstn2W4Y1+LqBQqRTWxNABf2bSr3CG4eFOmHhSCYUGSZo24YSWP99CamuVgPQGpPDb61WnhWiVGIRi5IyApgaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250126; c=relaxed/simple;
	bh=3AX7QlKXcaZQ6AZXwrTY81KQmVA2RVSHnE3cMv7kyjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTIKQI9Of8u8Wv+TMKyKatyFrS2M1RRMkzWnvzUPjc9z/fInfBZqWlwwA0VJP9/lOkmqA9qbAHP9aud7rXbp9kQ6VQVOgTrHHa4s7inNbLv2F1ZNZ5h6liX6OIZlItrE2QppPB3hdDHA+VEsCa9Coj9pJ5jdUiXjvbTGoOFCWXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EApx5b7o; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EApx5b7o"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a386a34603so166552a12.1
        for <linux-tegra@vger.kernel.org>; Thu, 20 Aug 2026 11:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787250123; cv=none;
        d=google.com; s=arc-20260327;
        b=KH+gtpuExxyWQUcHHj7qxOWM5HO4bZH91LZ81pGZnM0XzZjR6536CBsRztlu9VkZcG
         vZA23k79OX+7WE4CLLaRiwCUidHjfyuauxO6xJBDpKvMlbc3A4fWSr9CTuwToLDeUuX7
         0oJbtrm565MyiQQ4F5GJtfWN2vSpreCLPBL551uxW6x4g/rswk7mDYmf3UuNuHafbYFv
         8LMKvgWD6B/8bEiy/WLeYCIz+49Q/v1HKFkTo/DtPrjVHZympwGzzxwCXPG+DuiH+PzH
         RCneqP6agZdZNfi3nV5UgUfFDpheCMF4zbGbs97f54xQAatqCFV9AZ4+VdFPDg/WOZ0K
         87zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=itzgnus4jUqXJ8OTiJcGdr9EJaS2eyWfEY+aKox9aNU=;
        fh=y0Hd1qL6xm4+Q8cuwlKlCu2p7+Iz3IhVo7CT3NGkpM8=;
        b=HZBPRCUIfnAjVXtlWyXRYnJiKczEqZWtxiIQy54jClrxWEXTqEPUrVhSSn1uzUkTt2
         t/iP5eVAxG7k/qfJF7ctNL1iTTs676p8Bxzq6T388bVFp+ykrN42Trd3OK7Cph7yhIbl
         jHgid1kdqz+R4OaKVk8gsERskqYoEiAjHY/7EO/0LgLQ5cEcTwTSSj467NRyq87JzFDF
         ddl1fOGdGWCAW1ZRAfFNaCTPGULoDASqd3l/hl9eCrOSAiI21OnFZklz/H51mkv6sQBl
         cbIYpmL3UZRQ4SU2HuUHSB11Q5tNVZcuLkIw2inXr5ZLUJbUSL5C665MSGr12K0ayGlF
         3g8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787250123; x=1787854923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itzgnus4jUqXJ8OTiJcGdr9EJaS2eyWfEY+aKox9aNU=;
        b=EApx5b7oQJAIwcJMxAJnojexzoNz5aBieCM8i1iupK2r6dZrx7LM0GzsKo/bRdgZml
         emwnuLMAYZWIpAySENRQb4SQbzsXtS/+BmyiOLzo11n1A6WWpz3KctmCfwrGdHvgSAJt
         iEjfPqJI3emjeA9oiDONZvvjQJg1bynTl+jNpPgdwVWwnaqoH/lRLVsxuJPSCLPq1Lg7
         5ehnfiu2YcB6/w/Xx9a8qu4zufbiudBgzdU/I0KMQhiSlMLmJcbWHqg04fKDl+pEnrOy
         wF2Xa9jI5OHu8aszkyCMVkeXUglPU4FaLLTQkU44JZx7hg1qKOlAeTzXO+x22pi2/d7V
         8omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250123; x=1787854923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itzgnus4jUqXJ8OTiJcGdr9EJaS2eyWfEY+aKox9aNU=;
        b=UmHaclJgj9IXI2CR14IHOmqFTgMV+jA4qbOPXYS0Y6XD584NjFQYl0PmlbDWLn9SQE
         Ec5RQtermQrUhP/7a4C3eDJAbYtd2yTO03IXVJl3RdhJaz7hkzj2x9XDp1/0zkiym/Ak
         uVV7RJSDdo+4UNMuB0y7DYP2EVA/thqwJrIaFPXhpqugVkhWoqf39pQZYJBGxI4GvG8o
         XFv+wygX4g20j5hY/y/2ysg/tqPBMmlozOttVKeD9T8iqGdRvc6DvuS8pO3JRAEKa236
         g7gVwPpGozk+QAz/HbHrRFBPOGGToqMnaa36wcHsqaUS/ceHf0N73/A8chDxe9UaBiaP
         TqTA==
X-Forwarded-Encrypted: i=1; AHgh+Rpc3Y6xWJ4DiZKhNA3hUmgTtnPBobLxRUcKI6cAOvRvIOw73g0KaeHioHdjvaHBWapejOTP4Mlkx5XrOw==@vger.kernel.org
X-Gm-Message-State: AFuF++mW0odM7EsZMK2jJMCcfQAktMU5jx/iAC4uXjLlThzMfGB2lAZn
	pbElxXUgdu9HFrvsSo4i4dYen71VJtMUx5kH/WGG07c0NbpP7Eylb5Q8TZ37YW2jPgKSIW93Idw
	ZzO1PAOCmLfhfph+Abp3LkULB9UBtsEI=
X-Gm-Gg: AR+sD13AAi5Sz0aEC1prDC+jgUiGCP+i1STlY0fClE5UFFhp/6YDoHqmIZ2N9QIX/pq
	PnQXCIDUW8M7cKLq4fmVzEe3cvRDU1BWkacYtSvZhTI0b/YAp1qhATqxrI+nNTdWxLiS4TuuTIT
	YIUVushXwcZSnlLPUvaRbzi8nbhhua8DcyjL/f7skzJksKe7zT7kjYM/WgOCtuW5BDPF6tclFad
	qqWxIJkwGmcJgVPsOeTyt5To0z1FtWynLpIKmGZbPaudRORFVrFjYcUjihIWYBsOgJOpk2cPUz/
	daUTZXEF0axEf3zT5syrnwjXRpGGHd+U0kNo2IJx2YOlfLQlZiXxaEVed4NZ3f8vGSLsz2g0fgR
	LvCCZhzjcHykr7oKaEQo95CuCeQpjAtQn87QRcL/ckRXo8sNq31c1+Ec1GAzEVUE0+trB0aOj6P
	NB0dnzCZrCzNo/uPl06EaDFYUokL1Cs202fBHWQ/467iMXMH02v9yEu5Q=
X-Received: by 2002:a05:6402:21c8:b0:6a3:5685:703 with SMTP id
 4fb4d7f45d1cf-6a41125bdc6mr5703880a12.3.1787250123304; Thu, 20 Aug 2026
 11:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814205018.39015-1-rosenp@gmail.com> <aoQ7SynywUKcIAaS@orome>
 <DKSCUAP946RH.AXJJ9UJMW9CU@gmail.com> <aobUUhKX4rGgjQzX@orome>
In-Reply-To: <aobUUhKX4rGgjQzX@orome>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 20 Aug 2026 11:21:52 -0700
X-Gm-Features: AcwNN1WVF-hgYrtYMI7-M7s069HOFUOCrZbmrvRyHy9PX9rnw41C4d8dGqW0HIU
Message-ID: <CAKxU2N9-uK1_aLMfW_sfWUyWE+fxB=LVrnjYTO_Ghu00DxZgpA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tegra: ADX: convert map to flexible array
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 3:20=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 01:33:45PM -0700, Rosen Penev wrote:
> > On Tue Aug 18, 2026 at 4:04 AM PDT, Thierry Reding wrote:
> > > On Fri, Aug 14, 2026 at 01:50:18PM -0700, Rosen Penev wrote:
> > >> Replace the pointer-based map allocation with a flexible array
> > >> member and use struct_size() for allocation. This simplifies
> > >> the code and avoid an extra allocation.
> > >>
> > >> Assisted-by: opencode:big-pickle
> > >> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > >> ---
> > >>  sound/soc/tegra/tegra210_adx.c | 12 ++++--------
> > >>  sound/soc/tegra/tegra210_adx.h |  2 +-
> > >>  2 files changed, 5 insertions(+), 9 deletions(-)
> > >>
> > >> diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra2=
10_adx.c
> > >> index 9175598b52a7..d607ba4233b6 100644
> > >> --- a/sound/soc/tegra/tegra210_adx.c
> > >> +++ b/sound/soc/tegra/tegra210_adx.c
> > >> @@ -677,11 +677,13 @@ static int tegra210_adx_platform_probe(struct =
platform_device *pdev)
> > >>    void __iomem *regs;
> > >>    int err, i;
> > >>
> > >> -  adx =3D devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
> > >> +  soc_data =3D of_device_get_match_data(dev);
> > >> +  adx =3D devm_kzalloc(dev,
> > >> +                     struct_size(adx, map, soc_data->ram_depth * TE=
GRA_ADX_SLOTS_PER_WORD),
> > >> +                     GFP_KERNEL);
> > >
> > > This is slightly hideous. Maybe add a temporary "count" variable for
> > > readability?
> > The reason for this is to allow a treewide conversion of this when
> > devm_kzalloc_flex() gets introduced.
>
> Huh? Why not do this right away, then? It's a waste of everyone's time
> to do these two-staged "cleanups". You're making maintainers do the work
> twice for no benefit whatsoever.
I'm not handling that patchset. That's the linux hardening people.
>
> Thierry

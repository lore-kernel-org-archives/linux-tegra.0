Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A531B83B
	for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412554; cv=none; b=s6zYyaVP3nuz8avqNDU1xjfNwDKQF/nsE3ynuuvdSnUK4YWVdKey/DrVIb1oJCdO8f2t8r4yqkOoqE9aef20q0RKusfBWV4dj9HQrPVdC2gv+C7GqGTQmKrHzwzIzrnruwNzA1zQHbD22drayVu5q8eLIVJHOD2J8rsp9ol5qdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412554; c=relaxed/simple;
	bh=JNeksg9S+lB98sqZfvaiYvzh63QDCtUQjEt4efnJmzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKPr22+iqfQfba3IbWEJaO2fMiwDkEEVvW5u2+2VWLt4oLKh6NFTX4Q0WE7YBu8QatezdIDdfQH6NWrNkZ9kwZ0E7mCG9Gjcc36vW/QRujSfyrUy4hsMsgdxoeDxwmOarmZKwsK/sRYZoC26xVdvr1f5vvSdBEtQZ2V6X9cXD3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56f8c77ca6aso326867e0c.2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 00:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412552; x=1777017352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYGvKR169qobRnTdQfak1Kyzy8QQtDe/iStEp2kI73Y=;
        b=IxZgmcjfw5NFfuI/vYoreTneFh+AkBIK6aZhiJpct/QF7s6zKlvov4m0xO1cr3Drmo
         KZHoyvoFlKgzQdxPzalZHPuXCcUSi/4K5sJGL79ng4LiE7OOMjlfXCH3Nck0DsWgKYM+
         9TIcgHO9oNSBD/qYIFc7bbAB1yelLbEEbxpUh4zdLlHtmPbvnpHEnRIUM1Vcr0iY92JC
         Tml4stYFVbPWMIe72cgFTMv1uI9ZEDFTeG8FB8iipm1yWoSg6pQpmucl0GrUzRlwInWS
         FcUd5yDRCEyycdIdQdw9AseiUz58zxXLhHHAzZ17BRFDAZhPXhYuAjw5wB01MgUegnOu
         5PAQ==
X-Forwarded-Encrypted: i=1; AFNElJ//8tVArabvLILUsZ/zLv4ZqAb4aCGLhuphdVhBLE9jOLTPch2PTfYEKlXe3J7gzdIXASyMgbhSNShdBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxlEqk/arYBTMqbCHZx7JTRJzAqGVTHqQ+HXqnADugZC2VNDIN
	A2zhweMz89X7LoC648gHRxKUPuHhS4hOwQfCoCee914mi2LMoYc15ooFAjdGYhfE
X-Gm-Gg: AeBDiet+oAFVJ0ytrnFn2SBa68PO4uBImKjjl0om55l5Mij20X5uYaweZAKA9YsL9pc
	DqDJ3CsWI1gb0L8q51+6pwA4we4AEb7aL3J4lBawY5wyyXJw8cJFpcpkTbSc5c3Ptq+4/Cox7wl
	iuXyr97L4YFCTaNp2q9EFUIMOUw+wApRDyMawQaS9p/JUgAFg/CLR1vW2ezkwu9wDGTspqXgs56
	D0692hW0VjmOGzlNy8EXUCdyuunnNUhx0gfVNMQlxWJ+Zgj0HEzS83O3MXZr+yAGPP/vUr3oXv3
	SJehnH67N/0sz1fy4kOcYczlV+JN8yshB6UyhXEgR25Q8zDmisWrXplD7hetlhqcnOGK+AIONKz
	DV4mm7D8RuvyOg0ZH/i8ipSTYOYAfHIViMydXVd7DnCL3YX72b3xz3qHOasot1UkJje/W5RyzCw
	cQUIafzVt2R9XtPKq98BCPDB7rfTLWKyHh5HLaIlqL97gnKXTkwtUE5suut7Jg3VNA7R7qFmc=
X-Received: by 2002:a05:6122:421a:b0:56d:a755:ec7a with SMTP id 71dfb90a1353d-56fa5a400a4mr808017e0c.9.1776412552266;
        Fri, 17 Apr 2026 00:55:52 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa92f21bbsm433347e0c.11.2026.04.17.00.55.51
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:55:51 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-605def5b800so302292137.0
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 00:55:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+3foph4nPlyyFLtVFNDe1XDXPpCdM8BEsqFTGidhEnjOxdCJNQUKgGHP125Td41pMc4BJAc5IUoScO1g==@vger.kernel.org
X-Received: by 2002:a05:6102:4a84:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-616f4b50373mr742219137.3.1776412551117; Fri, 17 Apr 2026
 00:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416131810.3116408-1-thierry.reding@kernel.org> <aeEm5DavehkPmSgl@darkstar.musicnaut.iki.fi>
In-Reply-To: <aeEm5DavehkPmSgl@darkstar.musicnaut.iki.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Apr 2026 09:55:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxkOeAZqPsVRecOmQV+n=+ey=nFcdduiXvs9LBj-nNQQ@mail.gmail.com>
X-Gm-Features: AQROBzAxAj1dJZMvY5l2s199UA8tSOX5OgUQyonlFdS__wBHgEBXO25Dv2sGHpo
Message-ID: <CAMuHMdVxkOeAZqPsVRecOmQV+n=+ey=nFcdduiXvs9LBj-nNQQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Move Peter De Schrijver to CREDITS
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Apr 2026 at 20:14, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> On Thu, Apr 16, 2026 at 03:18:10PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Peter sadly passed away a while back. Paul did a much better job at
> > finding the right words to mourn this loss than I ever could, so I will
> > leave this link here:
> >
> >   https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u
> >
> > Co-developed-by: Paul Walmsley <pjw@kernel.org>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Thanks for doing this. I think also the m68k work should be mentioned?

Indeed: Apollo Domain workstations, and Ariadne and Hydra Amiga
Ethernet.

Also: IBM PS/2, Microchannel, and Token Ring support.

Peter is also still listed as the contact info in
Documentation/ABI/testing/sysfs-driver-tegra-fuse
and as DT bindings maintainer in
Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml

Thanks!

> > --- a/CREDITS
> > +++ b/CREDITS
> > @@ -3645,7 +3645,13 @@ D: Macintosh IDE Driver
> >
> >  N: Peter De Schrijver
> >  E: stud11@cc4.kuleuven.ac.be
> > +E: p2@mind.be
> > +E: peter.de-schrijver@nokia.com
> > +E: pdeschrijver@nvidia.com
> > +E: p2@psychaos.be
> >  D: Mitsumi CD-ROM driver patches March version
> > +D: OMAP power management
> > +D: NVIDIA Tegra clock and BPMP drivers, among many other things
> >  S: Molenbaan 29
> >  S: B2240 Zandhoven
> >  S: Belgium
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ef978bfca514..ffe20d770249 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26145,7 +26145,6 @@ T:    git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
> >  N:   [^a-z]tegra
> >
> >  TEGRA CLOCK DRIVER
> > -M:   Peter De Schrijver <pdeschrijver@nvidia.com>
> >  M:   Prashant Gaikwad <pgaikwad@nvidia.com>
> >  S:   Supported
> >  F:   drivers/clk/tegra/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

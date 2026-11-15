Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794743666;
	b=pmkr62f8tMIomAYkF8MTnTibxWKTL+OXbT/zLGRzM8Q6Tu+fbKspoABpXdTmfIdCvJdg
	 pMOgdg8nioSWbVen9UdkwzQZJWmOIq66iZ7fkfns+MyfFzRK5SihEm9JZ5mZLYBxarsKu
	 slYGpbZiQW2uA+A4e9mM+lRPHboNRPtQ8mI011SmVMQ/yWD4eL1kTJSsRvGh0mAS6kxHJ
	 8T0GD1YcdLZUamuhP7DR6LHydcQU0kCM7ddAHiwupTdtcrlXBMrhHPJ6sVMwSpGO9nq8Z
	 dIP+S/NMHTcB7/kUxiHaQEOP82VQIkZwa1q5DOaDucWqBGu3NZBZdaJTA+KbEPGCT0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
	b=nBPyUK6IvOsCOKNf1IjxNN399goXUaOyUax/8mCAsIbOm9j8KRH5+tFy9KcYLrv5PW3A
	 eNUm6LQIQPkQnRgTo2DciokHYhPHR9mej/nELeCopK2y1SW2GicngPYLndqiM5wrdFRkt
	 sOkvyA+cXQijGYY2u6oeEUaJ7Q+u11tHBfEBzQuyEKktpN+2WZ91iC8am6ZEVDRfmfwGt
	 zradbxJSJPwEnu27i39XhSVa/4FpkW72YrNQ+k0Fj6Bo9CJrLh2JgsO40SGcSHId+v22L
	 DMkwA9CRck2X7wsReEVTivd9eER0uNSz9G7xwVxn6r3mxzwPGny330S8e0JAsPXMZZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTrBdHJA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D64606A333
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 11:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D64606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTrBdHJA
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so7559185eec.0
        for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 03:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794743666; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjTDAttvKUbeWFpT7dLiPO7z1qxa2uioDJGAtfS5NGhW+rwsjEsO6a2NkuqFUm+AsJ
         0sK3bm8X1mlebcYZmuOMZ0RkpgeTVGwwY8JCfHhPuCNiAlWUL2SUr0dIjiQgBXeXxOfc
         bqzVMIlAw1n1QnGFlGHzVD7gQii8Q/6TqpmgwoebOuU6ZB/b4qT9LDBo6f88JjXylxl+
         R+abGco/fQbyFNzgmAiUxbeugdiAaDwfgLzTmhzml+6uhrxf1WYVhhWvWP/sLG09HKEl
         tBny61nSfuBv61A6SXNS31n4SEbTJR7PIxGBI+7f9ojVOa24BXjq6K3KMjcchv32/fqQ
         exnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        fh=3iHtBPZe4ssgbJWBiHjDdlH5q7jAr3WeCCrVeOWHdCw=;
        b=LEhLSbG4qVZQx49h/QoEY6AmEkoMcedz1aojfGk3AhOr8FSZqAfUDrlL+jrB/AA3r+
         o9i41gQcvYT2g8BgL1gnPQD70fTtMb0PWvGs7KlIEDj2FIJGIvt8MmySUJ42fwxAfqeq
         1BcScLroDG76UU3wnke4HUoAi41ppwJTTEUTeIqq7LHWogA1GIWWpoe2TrrJ/U3iM6VW
         W4H607mLBJON2UH4GYZPKETktRLaqcI9s2lj6va11uouCoqGZ6C+9i6PUJ0aJZoz/+Kc
         aMhlm9d+BIzbXvLxGVprKoYPTcGisfZYj7odSKNKDzuX5SX53Q3gXhttG4WNbAy+a/TM
         HCLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743666; x=1795348466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        b=tTrBdHJA3EGwmoZUxQrkbZUVwQBHP3AVn2M7YykEYWfQzkdbVbo06Dt08bxI7pef9n
         2s5g3e6ZjDuUdLINOz/16cOa2/67Qga+pbtgDTbQFxvCV7/wYiN2HvnbTM9v2KHTKMDn
         lXhXKg70kdruDYacOcw3OrnPpwE9x3GVwE1cjyM4WQkTet3p2ruaVtk4iuD0Vg5W+40t
         KP2+dPxFKTHI5qnPljVlljIzh7r9ZubPmJpP/c23PhesDSTedONJirXt706HnDYtn2+I
         UuhxxKVd9i/wMgFDGMAuCSok9bEAJUAMXM1t5xxd2EobaTIgnXd0jaE5l5G9qIC9Zxxb
         fIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743666; x=1795348466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        b=x9xiq2cYcTgk7JpcSeH5UUvAztWbkld5uaXVuKU/CLcGmC7s6pCvKUi/D2fyHekmN8
         mOfjcr+ouZbX21wScXoh3ycA+bfadcquhQVA3jYOCdJpRzDcpm2RQIxX6V8GTUCqV41E
         4Axwzq2GeRkvt0Z8XwuwRIrkuhHskQgdNHouaVlzqBfPSMeXlkPhF1fTXKWG+kc1z2ie
         dtI9XlwMz3zaGdYdev4zxbMhu5QbKIWedPyYXOqRwrby+FN8j4ILD88ZI17ufi8m9iWY
         RNxaH+K7DgJrOgNo1x0mDN9jZb4EllyMT2ZN5XX5w0qSgPL2wSQVsiFfxcgGAXZB0bu1
         bmYA==
X-Forwarded-Encrypted: i=1; AL+hErEj5duHr4en3ptWg2ccJjD0AQBtMhI5XeJZ2nKoBNvXAr0lv70evF4QmVYnim07UEXz5pGsdJdn3J/Wcg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9D6REUXIDfVvSM0NSXh+ZkkoMlLDeeDnW4xRWXIH4ov9EQ31VT
	Fl9nPtAVlFj13DNg0OU3JISek2BNiIA6cUsIIES/QFhMB4j5ql/Qq3Jh7Asv93JpdxdLJy5VkUr
	vhYeButVwSUy6Q5P832TagDyeFn7CKgs=
X-Gm-Gg: AYBFou3OWFY8mAxpXc8G4MMY5FlaE95rNxKgvi3atP14e9D8CNpJynTlQJ6umzbLucM
	b2RYH0KpZqwt9QyKjZS6N+V24BsMp0L6W+7TM+tmRL8asOuaYR5kFIGTihVJeVx11h+vzU03Lj4
	Mxyh7qyfUnGVHvveR+sfC71gTqQGOkchNe+hlapkN1o57Bt0btKoVt/aNTEGiAw/OH6Rq47fJWB
	BLXYTI/GZdIyFA+dRTs4qNamruUk8MAVvGklPZGV12l0wkL2x1mV35/oUmBu0XF6gcJLjE5yGYG
	z96rwdYBkDh8hFlK6gj8my3POHzilWyM6sGUKTFvg+fqmnJONdF0Zs3LauiYdz8M1W+HEU9QZDh
	gmUvUzLCuzFjE3Xx0WQREGyDjEehU3mPLWkEBQiBqlncE7q4hjP1qnzRcYoIKbEYTX3BkDu+yfr
	a6b7DL28/Q4hxt07nPYMq31IXeWSZdAQ==
X-Received: by 2002:a05:7301:52c5:b0:36c:a281:1bc with SMTP id
 5a478bee46e88-37966a5ba74mr7873015eec.16.1794743665605; Sun, 15 Nov 2026
 03:54:25 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113145708.261530-1-clamor95@gmail.com> <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4>
In-Reply-To: <179474058020.3790083.7531788945003507652.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 15 Nov 2026 13:54:13 +0200
X-Gm-Features: AclHuK-EzmuYPh1U1Wrw3n2IgQZOy9QQQk19QQZyaFRGFCYZ5HQfcbePna83mwQ
Message-ID: <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
3 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are requir=
ed
> > for the correct work of the CSI block. Add CSI pad A and pad B clock ga=
tes
> > with PLLD/PLLD2 parents, respectively.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-t=
egra114.c
> > index ec537efac692..08e425365469 100644
> > --- a/drivers/clk/tegra/clk-tegra114.c
> > +++ b/drivers/clk/tegra/clk-tegra114.c
> > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void=
 __iomem *clk_base,
> >                                            0, 82, periph_clk_enb_refcnt=
);
> >       clks[TEGRA114_CLK_DSIB] =3D clk;
> >
> > +     /* csia_pad */
> > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE=
_PARENT,
> > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_lock)=
;
> > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > +
> > +     /* csib_pad */
> > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RAT=
E_PARENT,
> > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2_loc=
k);
> > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > +
>
> Change seems ok in itself, just a couple of things I'd like to check with=
 you.
>
> Seems both the CSI and DSI can use the PLL D and D2. Can they be used con=
currently ?
> If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> DSI counter part does not have ?
>

CSI pad clocks are used only by CSI and CSI does not change rate of
pad clocks. Saying "DSI counter part" would not be correct, DSI mux
switched DSI clock parent while csi pad clocks do not touch clock
layout of CSI nor DSI.

Same layout is used in Tegra30 and Tegra114 inherits it.

> Also the DSI get the PLL through a fixed factor 'out0' but not the CSI ? =
is it something
> you have checked ? it just seems a little odd.
>

Yes, out0 is a fixed div2 of DSI clocks and that is code reflection of
hardware. CSI pad clocks do not have this setup in the hardware.

> --
> Jerome
>

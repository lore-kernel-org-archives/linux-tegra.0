Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794818607;
	b=lyyg628T6fNkENJHgPkCOp3AHhfvVSKAn4JVm2BGp2mgBVRiPmSaDClzQjmVV8DM3lU8
	 Gm4wKzuDYYY2rwidTcA/M8yLMmFqFliH7BnNdZ7hJEpqyRTEvbgu+RMid7xRGEfyUKXx1
	 FTuQ7lmqdXHsbckAkc2uJt6s5c/jjZjoDdLcQES/7hGAwi8twdaD3NDU7yg37ovq6b2cH
	 fWgryfzad22YvtLSh/Hdx9AOUO9qHPuIiWfEulRC+Zns/rrXSp9vN546WLhW05qGhW6ss
	 fXCZuBdM3kqjaCzZoFtOOuVAxQTqCDyLP+crtmdjnRQ7jrrJcoRDTVOu36mULrVKOgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
	b=HLg+rojNJ+u6T2USnkczbiyBDU3PTBi8g3QMtL5+qrdVz5JmiJ+Llg0G4HGQDTFDowhx
	 +Cb9EqT6IMaAf4PwR5yV2j3deWbhiP6vb1NmWR77VbfAjBzskBRbwEb7QFVSiIO1gNv50
	 GC7ugtiXnMhLFeqIVD+VqUdWG1zwfy0G+KzFTHUi3GhF23d31Qj+iBwdoSs5RKd9XJcdH
	 fK4YLV/eEuq5AU5oC3zpmACH9CyAUMpe9Ny0YtsWneJk75U6f07ZShTTfYQOkolMn3nZf
	 f0J5JfkzjxH0bi0D7Mh3baQtv4x0mmvDmcQodZo8dBOda8sOaCd3ER89SXGQz2tnvEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFoLXRey;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C911606A32A
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 08:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C911606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFoLXRey
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so8672585eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 00:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794818606; cv=none;
        d=google.com; s=arc-20260327;
        b=M2pJ23xCbedmVlV5ZAGiCSMlX0mpsoj94rLaTBQlCVJmEGGZhQkcka5Z9zthWteM8o
         GoPB1y8eVM9elQLqhrI6tOTXl/5UwnVcnuUhMNwTikUKkKCwfXkqOsEwnvRIfhrMKjPP
         uPfgAVzZ47F17nupN7EiERKiMvxjt6S7773p3f+g8WCW6qe1X/nm31ITQoQVrSbsJaXF
         etjSs91R2TsGeuZEBYDdD+eYjtyGy/lkU6uabDuCyjK7wuXGbkAtLWV24a53+Di64HIR
         pEP5cCXvsgcoq9Xiluv26jRQfMYQ20g2kb5+XbrUepL1Z4L7OGY4p/M1Jlr73y/18ixI
         SKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        fh=e3FUq16T4IDhChv+TITqDFuhyb/qN+VLoMcvMYjcZPw=;
        b=IZ+6+MxjyIIBgsZDbXrZKIy1VSOMMk2iSsdbIeqqoyEtWpGOe/HJAD9lG3yBRY10iJ
         EsCRawMKd/5w7FUMRohqdoGWeF0dEbH91V21be44iFIatL7RGkYi1bht3gSd4TeXrZvz
         PlYxiQHQgm1o8/N+UNAa0mONXGd5XXPu9SpoGIIzLYdWIoA+jwzgXBELJTJjYeMJ6uPy
         tZevTKVSczsRn56g6GrIaEkglftoHOHthe7L+rpLHW+3a0p+vgfLw3bZ9jC6P/q1/0JJ
         C63aH6Iw/MAMNlMUrarbY9O34fIr5ywGgbqzsq+3+d9+PI0YzE8XVtyMVtkJ+lD/JyYV
         SYAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818606; x=1795423406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        b=aFoLXReyupk43dXE0Bd8Ij6BK2NiknSHpzjU1u40qyGksAAyb1bLMBlYS0s6NFh1AY
         dPupndtPEV5CcQ8zlesWggleFHSp6R7olXSiJO/2jaHX6dNXjIL/Nctv8liWpvh4lo14
         8aKPlNa22PYGuYtosrzw7gWAVoaVV9tiAIydtZySFSBvKhuIWR2RZKnknmWx95H6ADSQ
         DDUwPCOZGSB9bbc4bNTzxEDs+Gmtb0YnMyaqE2WmqcTLu2vdEjquvLLrjkp21BNAJ0ek
         fAYPIAfEfLo0z3CcBiFhWbmJwgnSrNENJLZ0ieUXzsWh1NwQ2KgwqBnU/Vc/zfqSGHa2
         2NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818606; x=1795423406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        b=sFW6h+aeqHkhgKFsqVwfd8uArsWDgo1DSPYXHvRqrMscynf5mbycsq9AJY47yI/mmj
         fIVviYqZHkj1P9NhpPCIi7KEPffldrtOpgXWrT7svYzHUQKHpOwal7BPiJBCHncskd07
         yviJTApwigQtkt/SB6uc1P3lLgODT9sTrLce4vIuYojtQ+BCW317Bz7hY0hWSKWOOx48
         U105eEvWI8taLfBG2qfHKvtJF83ikySK6lLD9Sx9YVvcJqdhKGY6PDL+TS5ykoyRPXBC
         y45Hwc6oUZPz/5+Cq86XuWFOBDaQkW+gpuQBBkicwcARBL77hKKB2jiz3cgTDakLwdaD
         d2dQ==
X-Forwarded-Encrypted: i=1; AL+hErFy0Zlt9D+XoR17hEaLiP6PHhmK/0jg6mLzsssthduMqk+/jSleBr8Su+tLvgm+OjhPjsF3Vr9ca2o/hA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8DQYF3oms5vR8NYsKMuvs2CEg161kbs9ENm8CvcZl8vvbnSjTN
	LxasOMQzH9Se9LSGJWgbrLwY9gGqPS5/p+KS7HMwdFQqci1UsHqJljEoZl4GdPJCd6IV45Tl56g
	H4WzVCzjVUtUgNQFOklUnR/8aejT4sAg=
X-Gm-Gg: AZFdTZcbBq6jjZ6ybHIJf18SzRmZabwZP5NMXPPYMeTUfKaBh1jPw2Yl0TgJP4PdcVJ
	K/NZNHEt9oBITJNiSLItcw43iE73PJg6CjSHOLL0KTkZ/I9BuV+wtnNRy2htKwRQgV91GMyN3ve
	PEw0nU431vqQWxZKKAcVuUipLcpzeMjdLpddWvmVSSPKIjBD0DfcR1TH4KbKNfQfIcRobV6BSDS
	ientJ9ZY8RDWld24b+qHfjdGxN/jHt3ciUhCDY03HIOEfKZhizp2oALw76cLFog+l/ws5LdZf74
	RWvdcaR3Bx8CyMZCftul984tc3actUjIQV3lkTiGGa9ogkDuPhtwBgPKN67/nLtEofZEPzKXdD6
	tqZpNm+ltRutjkHQ4YJHqXP/w19DMpgsEb3Esi11tMLD6itaql73veU/+rV3XagLn5TZe/V+Kcb
	f40b7ZgGzYErCMy4J56oUVXjj9FXKyH3bB0LC/A7QlDnIGOaehK40=
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id
 5a478bee46e88-37967314a08mr9190579eec.24.1794818606016; Mon, 16 Nov 2026
 00:43:26 -0800 (PST)
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
 <179474058020.3790083.7531788945003507652.b4-review@b4> <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
 <179478265643.13037.17097457582246933781.b4-reply@b4>
In-Reply-To: <179478265643.13037.17097457582246933781.b4-reply@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Nov 2026 10:43:14 +0200
X-Gm-Features: Aa3M54pMEr9UjE1zw6W6dd5jtUGbWeQ0qW9zBZkFj9pK7Jh0wgW3qgyddXi81sY
Message-ID: <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
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

=D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:4=
4 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:03 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are re=
quired
> > > > for the correct work of the CSI block. Add CSI pad A and pad B cloc=
k gates
> > > > with PLLD/PLLD2 parents, respectively.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/c=
lk-tegra114.c
> > > > index ec537efac692..08e425365469 100644
> > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(=
void __iomem *clk_base,
> > > >                                            0, 82, periph_clk_enb_re=
fcnt);
> > > >       clks[TEGRA114_CLK_DSIB] =3D clk;
> > > >
> > > > +     /* csia_pad */
> > > > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_=
RATE_PARENT,
> > > > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_l=
ock);
> > > > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > > > +
> > > > +     /* csib_pad */
> > > > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET=
_RATE_PARENT,
> > > > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2=
_lock);
> > > > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > > > +
> > >
> > > Change seems ok in itself, just a couple of things I'd like to check =
with you.
> > >
> > > Seems both the CSI and DSI can use the PLL D and D2. Can they be used=
 concurrently ?
> > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> > > DSI counter part does not have ?
> > >
> >
> > CSI pad clocks are used only by CSI and CSI does not change rate of
> > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > switched DSI clock parent while csi pad clocks do not touch clock
> > layout of CSI nor DSI.
>
> Ok but they end up possibly using the same PLL from what I can see here.
>
> So if the consumer of csiX_pad calls clk_set_rate() on it, while the DSI
> is using it, it won't go well. The rate of the underlying PLL may change
> since you have set CLK_SET_RATE_PARENT. Taken alone, there is no problem
> with this but can't CSI and DSI be active at the same time ?
>

The clk_set_rate() call for csi pad and csi cil clocks for dynamic
adjustments is not possible. These clocks are used only by CSI block
and among 6 clocks CSI uses it can change clock rate only for its own
clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
design and are not touched by any other driver.

This layout is used by Tegra30 for quite some time and I did not
observe any regressions of DSI/CSI caused by this configuration.

> >
> > Same layout is used in Tegra30 and Tegra114 inherits it.
> >
> > > Also the DSI get the PLL through a fixed factor 'out0' but not the CS=
I ? is it something
> > > you have checked ? it just seems a little odd.
> > >
> >
> > Yes, out0 is a fixed div2 of DSI clocks and that is code reflection of
> > hardware. CSI pad clocks do not have this setup in the hardware.
> >
>
> Ok
>
> --
> Jerome
>

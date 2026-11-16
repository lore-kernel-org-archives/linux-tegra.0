Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824645;
	b=TZXNYCDnWZABq3T3g6sFJV+kNP4dngZ39D3S7mrcQ2tNIcqRApWfIO5VFr7T7oWRdVQs
	 7/0KnlzzeFKWaHOvqgpwvgaDFDmN3NGQHJLNYeqFxcymNcBivKDH0W2DGSt7IET3oKWOI
	 ZL5/sSAnsNlmi+e6Y9E4XPVVDlXUKbHNkmsgqLU9MWTmFqOJ4DDcMLenu4hZlVZ+C//PE
	 csAdSS3T+41/XJEOOpj1/vrLRM6a9H7R5cIqy9K5zYxtNEd5Oqqp8N2yOEUnR6sgoahDg
	 KXbtI75n5+V/7y55JHqRQYh1fErHwXojgbvd3dg4gbNOe7+T0jY2/1i8Ss9kiOPuFow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
	b=rlV91X6hipSWuzZR3n/Kg+XV5zGXxQe240bghfRpTh8NTxKjKWDsAefNahPwXhk5X9ha
	 /lIeO+VKR0R9sa1cxsnkFRVeU/ECRkyPVjV2I3fOoRX71vhl4eIG2HeLX/G19SYLP67XE
	 wBCg0uM4N6dKZ9VgD2tn07h47cpX9bWmAuyUuUMFt4n0bLP0vqzIHw0yRBkn5H2yToBrD
	 oj9mdoU6xP/Abq4UY8Q9BfmCEDT/ib0XLhpKIctfaMtW7PbXnmcMwzLlSSZlwO/wO+v+K
	 Xzjw0X5kMYD9VP0VsYjiAfZROdoAcmukmQkRe9Yq9HRFlF/0kuoJ8tVZeXT59t2IGsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX435Zha;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3665606A32A
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 10:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3665606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX435Zha
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so8827037eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 02:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824642; cv=none;
        d=google.com; s=arc-20260327;
        b=E6QsSZg23P0i8hoULzb/Y7g9JiWSWeRNh4C5ge1BrQUh5KwxgXOGBJd2fjDEodgcnx
         Y4RpSDm7CGEbp12Tu/yuXUwXIG9MU9ej+dHajiOOEUKLiQR4to+UzkLS/aTo37YbpJgr
         9AevvO9JK7ykbKYlR+9Nx6St7/s728jX91lCVL8c5egRZ1r219cdpvORiH+6WPUM22sh
         aoFR4rvH8NrHS8xEE38iPSq57WEZD2xILkmh7Ozm6KppgFHS2/ZE42GNOGRs1VOSDvtR
         TH2ejMIP4V23ExzP+eyEtMYXE6IyArbddmIc9ceT+9GTejAmmVl4IJKtGRRGXWJkk1tT
         rV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        fh=BBh1lBR/WU98aqodlLrfX+3cIZnWpRHqk7o04cv3AIY=;
        b=hrXHzutyvpnOJdrFnDr//cM/OxeSsmQ28h/5ylZIBIYD3X8bVMCUK2vq8ozEbUubMq
         LFe3ByFQwLtFnDuj0byYOaIIxN5ru9wEj7cMJ9fcZyxXFZNB5RruNzNm6UTbCM2IhcRu
         VWBnBZvbhrAUVlrw/7Upc8/tna/fHKeCRBRppTNWByw7afUTQnmcEjct5J8Y/41nvIe4
         DjKoKfP/R8pyBGwo0FSay4Qjccr/glSrXPwXB/dWpSSRVds+BMWzYoYCnCtr1kRFg6Hm
         Od+3u/ZFBPIlaf1mlg1es/zKPBMMc97MNavjuX4GHYxg+ij7rF6+VdJ1hFBk+Lk4u0E/
         T0Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824642; x=1795429442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        b=ZX435ZhasskBrHhsjUgMP8cj896c1igrqorRzLaGT99+Rk0Gxy0oLjQgxiD+VMpKvH
         D4U/tJpsIbzYFrDIoGSW3/RDIYkG+0LbH1+2de59HTrHz6bH8aGzM0nu9Ry7YWcuqrQX
         jjFe3WyoteY5ZsEsJQclpDK/18FEkpjdJ/PgBADOljyIGLYUou7waKJYgwxlHtzQLAQQ
         gaOQMidMuDB/sBsRSiJN5PrLFAYv8GN9IL3MJGgEP+PWSlUy0COJMLIsK27tZtPdkOOQ
         aU2ELLzPlC+ajDK/grAFwSF0Bwf/yHKHGmDd4g5/1GIh/bDbZl2gpu9Jv9a4O3g8+sYV
         Gv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824642; x=1795429442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        b=JvuqYr+clSuookI9TZxlaaEiAe7glbdWXMPGHh08V0injKj3LsX6yxF8aOBA4fx8r/
         nch+9gKBuuAbYnIrjtOdg7f6rM+bWxRqMhJB1ySWKO2Ft4WPjsE8JK53dJwQZl9AMgCf
         KnsO3kZU+nzANd1xjebKPMCYBDqntBlLTZdHaJ4qyueWBBbXmQkSig62EmLJSMDw+Er+
         Fx+LqaNdUbxcBKK7v/TcdAA2GdF3hCIpWQK4TINuNHmfTNd0xYzcwwTaPn3g5ORJv1ID
         XGa2r4GYJ1db8w7/jLtEap94P8MBksoUpt/1oUMF+00Hj5Lp+PESv0e8tUUqT3Q2Kkic
         bcLg==
X-Forwarded-Encrypted: i=1; AL+hErG5IxWpjZ1MOHWP7vmKM54KFjhlzUvwlM9K4MH8mm7BWdPq3PPZiVpIqdXboe/7NNauokvcVRuk8vKZ7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9g6IKC3vxWzDL2rXFY1UwN/SGQgrI9zyf4jJoCuYa7PQT8RKbg
	W4OGSU/7VH+PobPgtXxntbxnVievxcADsDo0NfsWvFIfLVyhoyiBget8yz/iGCt7AgAF4aCPQBs
	DJqYWuU+ffE14lcoV2393N6TSxBC51UA=
X-Gm-Gg: AYBFou2r6cRVSiA+euUmkPHsGF/dhe94G2iZ6LnTlrrozC+qwKwrD7MlIqwaWnxMN0L
	OqUzZEWksfRPMyrV8eal0gpBDkgYjP/EwPAhz4za7XU5YfS9ol7nBttQJsxEDCxXjpLnE08mAxj
	D/2aJDGwkJ8Su6V3V2QEZV19pco/MB2wKtND0mX+mBI7c6lkxbUI49R8ePnV5Z6uOkR0xJlYoY+
	sueVamRdML5jsuisV+0onGuBfQEwaPHP7HoWfle+lNPZagRZDuN5qO9D4OJM2DHGw7qg7hujkZE
	PO099s0WSxxoxPfAc3NLVt95N99xiEApvoUY/DGjGJRY1yw9BR3QvJoTl8vnT3jSOyhQoOw9GMo
	bfxA1In3QdYly2yuAPHWXxBxf41cZijn4cwC7PwjYFLEnGj6gid4xNWu2l05RqeVc+cHEf6FYkM
	ZyAIDhdWFUehWYxaOzdeP9bMr/0LVPEA==
X-Received: by 2002:a05:7300:b0a5:b0:375:f846:5b50 with SMTP id
 5a478bee46e88-37967316379mr9974671eec.26.1794824641398; Mon, 16 Nov 2026
 02:24:01 -0800 (PST)
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
 <179478265643.13037.17097457582246933781.b4-reply@b4> <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
 <179482363653.13037.14387881069650442772.b4-reply@b4>
In-Reply-To: <179482363653.13037.14387881069650442772.b4-reply@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Nov 2026 12:23:50 +0200
X-Gm-Features: Aa3M54omU2sMa-s9Lr8odEO1dEUj9Cu5RuZQ3PyJtArCZqRb5bI6Ga-XTy7PHCQ
Message-ID: <CAPVz0n2OamOweoLJLBvyt2KD+Zuino1ViYTFsSjL3mTA2V3F1Q@mail.gmail.com>
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

=D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:0=
7 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-11-16 10:43 +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
00:44 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > > > =D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 13:03 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that ar=
e required
> > > > > > for the correct work of the CSI block. Add CSI pad A and pad B =
clock gates
> > > > > > with PLLD/PLLD2 parents, respectively.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > > > >  1 file changed, 10 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/teg=
ra/clk-tegra114.c
> > > > > > index ec537efac692..08e425365469 100644
> > > > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_i=
nit(void __iomem *clk_base,
> > > > > >                                            0, 82, periph_clk_en=
b_refcnt);
> > > > > >       clks[TEGRA114_CLK_DSIB] =3D clk;
> > > > > >
> > > > > > +     /* csia_pad */
> > > > > > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_=
SET_RATE_PARENT,
> > > > > > +                             clk_base + PLLD_BASE, 26, 0, &pll=
_d_lock);
> > > > > > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > > > > > +
> > > > > > +     /* csib_pad */
> > > > > > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK=
_SET_RATE_PARENT,
> > > > > > +                             clk_base + PLLD2_BASE, 26, 0, &pl=
l_d2_lock);
> > > > > > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > > > > > +
> > > > >
> > > > > Change seems ok in itself, just a couple of things I'd like to ch=
eck with you.
> > > > >
> > > > > Seems both the CSI and DSI can use the PLL D and D2. Can they be =
used concurrently ?
> > > > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which th=
e
> > > > > DSI counter part does not have ?
> > > > >
> > > >
> > > > CSI pad clocks are used only by CSI and CSI does not change rate of
> > > > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > > > switched DSI clock parent while csi pad clocks do not touch clock
> > > > layout of CSI nor DSI.
> > >
> > > Ok but they end up possibly using the same PLL from what I can see he=
re.
> > >
> > > So if the consumer of csiX_pad calls clk_set_rate() on it, while the =
DSI
> > > is using it, it won't go well. The rate of the underlying PLL may cha=
nge
> > > since you have set CLK_SET_RATE_PARENT. Taken alone, there is no prob=
lem
> > > with this but can't CSI and DSI be active at the same time ?
> > >
> >
> > The clk_set_rate() call for csi pad and csi cil clocks for dynamic
> > adjustments is not possible. These clocks are used only by CSI block
> > and among 6 clocks CSI uses it can change clock rate only for its own
> > clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
> > design and are not touched by any other driver.
>
> This is not my point, and you are not really answering my question AFAICT=
.
>
> Right now you have 2 CSIs clock each linked to a PLL, with CLK_SET_RATE_P=
ARENT.
> So a call to clk_set_rate() may change the PLL rate.
>
> At the same time, I'm seeing 2 DSI clocks linked to the same PLL, without
> CLK_SET_RATE_PARENT, so those clock will use the PLL as it is.
>
> The difference in the model used is odd. If it needs to stay that way, it=
 requires
> an explanation. If adjustements "are not possible", then why set CLK_SET_=
RATE_PARENT ?
>
> If the PLL is fixed by design, then you should not set CLK_SET_RATE_PAREN=
T here,
> and possibly use assigned-rate to setup the PLL, as designed.
>

ok

> --
> Jerome
>

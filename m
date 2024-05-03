Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B61CA62
	for <linux-tegra@vger.kernel.org>; Fri,  3 May 2024 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737877; cv=none; b=orK/0ArnXyhKEfCp2dt8kLAOb3kQM9jshThZdq/yzfmvOFz8qDJFAsF1ZyfNjQtq8rcLSUWH90cRz87lJkuBSrkSjIjrpObUcFwewhTwHXcHRpuJEqarT0J90l3g5iRpmU5FpkKewm4YmrMtPk6ywc8h9Izmr/RQaKv1XqBulYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737877; c=relaxed/simple;
	bh=CmcuBbTVhho6EBimKTWKrm1lTdbe7FzUQrr9f+yUs1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHpalumU4FgDLcdjibJaKI9DclDiMjU7GUMPawnr/LE+4tM0Ka5X3E05NgsEwGjziFe6jDwAmb39svaHMMad8LD3w3CZ/TgPzLTdV8sQCZRCdZjDy1mw9xdcgcxpOZohItihFpe9uTbOPdFN1t55ctGP4D272Zb7hCDAgOKnbYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rv7yhurE; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rv7yhurE"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7deb424da41so315785639f.1
        for <linux-tegra@vger.kernel.org>; Fri, 03 May 2024 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714737875; x=1715342675; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7hPKV3HF7+4pxzh8EgR7k2JkSmFNYuW+tKLwH6I0Lg=;
        b=Rv7yhurEyg+Y1F0KrDTUYvjyiE7TL6am/n8Ba9aamvdxBx+QiNl2dqT9suAZPL0wDa
         jUrHJyoaYNKs7aTDxgrNSHDG7ZpdXDOJ6AqjbNKbq2OygIfWu80oQd1288Be6douUrao
         WusPcORcbhiSbYjUqBXgjD827qnU8Rcv02630=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737875; x=1715342675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7hPKV3HF7+4pxzh8EgR7k2JkSmFNYuW+tKLwH6I0Lg=;
        b=ZBfELA7IaaIgK1dLE4nEJ4wzIeo+YjIFrNoB3iGXwV6SbP2Bnh9N0xYe4lda6uzM2G
         w6uY11b14f6ESGSrCzmw3aFptDR+xVzABUFqqFooXhyGWT/seNTrcYIpJffnMBoQwSJU
         llEzVD/IurzoXSY/RlOHShGqed87ODBGRcWdCHj27ID0d0q66fD/GGWNTjmzFWmD3ctI
         eHO1bNfxmmgHU4Rql5RPuMMg49FpWx5eBmVa68uvBWm46q5zvUiehaJnIeuQ4FavS7zh
         YNgCK98xhWotelqpkG/o9yUewly/PAZe5IkonlVafw0rqgptcg060ZMTuGzzLhiHkjJQ
         TPCA==
X-Forwarded-Encrypted: i=1; AJvYcCVJHjUs6vT3Wq2O7rxw1lwPJ8jbDN+nFVf4zJx9Fgf/78UTyqjBDUTa+C5DSRcZ0vL3fMwaqTU0t+Bbt2moLG873/aYlbGDQMzIPTw=
X-Gm-Message-State: AOJu0YyzMPiZRqBMWGLrAt9UKU8iF3zKxnYYps37/yxJ6ZrJHUEsCcjZ
	rYiUHgM8D7Hq+EkzjEsV3C5KqGGAYRHTEzcWGKd9Ypwz0YW6TQ5T8vnHiCk3SdHYEKiCojjtUKH
	l6Q==
X-Google-Smtp-Source: AGHT+IHqCjJx5gntN/W59qpTExrlp0x2OqdDkQEHN7psnW+l8XaV8TkOMvoxAGsXITmG2bKTCiXNrA==
X-Received: by 2002:a05:6602:158f:b0:7da:6a19:2e2c with SMTP id e15-20020a056602158f00b007da6a192e2cmr3285228iow.13.1714737874927;
        Fri, 03 May 2024 05:04:34 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id bq9-20020a056638468900b004856653a72fsm746242jab.106.2024.05.03.05.04.34
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 05:04:34 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7d9c2096c29so397021039f.0
        for <linux-tegra@vger.kernel.org>; Fri, 03 May 2024 05:04:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXGIrc23GJcR/5PLDpbvJlzZXNNEJUZHrT5gY6tjBj7g5GiasMj332S+xOBFO9974GLYrUQWdyLbAkm6n2GZW7fcdmn6q/zjVjnRs=
X-Received: by 2002:a05:6102:2329:b0:47b:d717:b689 with SMTP id
 b9-20020a056102232900b0047bd717b689mr2266975vsa.4.1714737415965; Fri, 03 May
 2024 04:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
In-Reply-To: <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 3 May 2024 13:56:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Message-ID: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I am trying to get the DS, but
https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is a
dead links now.

Anyone have access to the datasheet?

Thanks!

On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 29 Apr 2024 15:05:05 +0000
> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >
> > > We do not expect the sample_freq to be over 613MHz.
> > >
> > > Found by cocci:
> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> > > index 3e725cdcc66b..1886f733dbbf 100644
> > > --- a/drivers/media/dvb-frontends/tda10048.c
> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> > >                          u32 bw)
> > >  {
> > >     struct tda10048_state *state = fe->demodulator_priv;
> > > -   u64 t, z;
> > > +   u32 z;
> > > +   u64 t;
> > >
> > >     dprintk(1, "%s()\n", __func__);
> > >
> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> > >     /* t *= 2147483648 on 32bit platforms */
> > >     t *= (2048 * 1024);
> > >     t *= 1024;
> > > +   /* Sample frequency is under 613MHz */
> >
> > Are you sure about that? Some DVB devices have very high frequency
> > clocks, specially if they're also used for satellite, so I can't
> > be sure by just looking at the driver's code.
> >
> > Also, we had already a bunch of regressions with "fixes" like this
> > that actually broke frontend drivers.
>
> This patch preserves the existing behavior. The sample_freq_hz variable
> is a u32 so, in the original code, z couldn't have been more than
> U32_MAX even though it was declared as a u64.
>
> It's possible that the original code was wrong.  We have seen that in
> other places in this patchset.  Adding a note about the datasheet is
> also a good idea.
>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda

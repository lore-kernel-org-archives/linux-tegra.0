Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C506D1534E4
	for <linux-tegra@vger.kernel.org>; Mon, 13 May 2024 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715607388; cv=none; b=Kfxsd0UcNBL7A2HjWxU0q7/Yv25ltfmlBSq/EPIFzEdTdHLHrS1NcGvSskCnlBlmCUiYPLRzJyN0yHIOvhOlT1Aj5yQ7hh8qgdQriL53v7Yx+if6S3Nrp+zC2CTKOpFd1wovpymPUCKGpzJFpmHPF8zuwetQznnUIpn0lT/yb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715607388; c=relaxed/simple;
	bh=7xu5WctdtZR/wOb4blrphPM3O51kqNl976gHYaCXAtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgHvtQfbz8bBvA7IEpfym1fywzftR0YxTupZUY1HcsMfrB4VH21kWdnGJrBo1PG/vxCO966w+8yWucIKkWJZ006afBYyFiffW6akPBKwf8KXMgzrlgdw1h9oIQQu9W6BJhec06a+BLlUSv25QoCZWX2G1Te0M4zYL8q6u+TW+0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QwgPWrXj; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QwgPWrXj"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59b81d087aso1094353966b.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 May 2024 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715607385; x=1716212185; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ABNtOh/Z3AIwsdePLSWkzeYb78xrA+zqTZ4Vj4WEmaE=;
        b=QwgPWrXjlcCRjZgI5QtkUOtDZX43h4mKVAovULt/UX6v60LhlI+GFJe+/KFh8ay1Pu
         tes/S52KPw/2T0/82v2VX8ZRjCZKUz2zaSwADt6brXxTWu2S/MLiQ6qFZDoAw5UXbgMc
         A57WnfyuVdSXFKm3oMIDETgsvJqgOwPIWRDv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715607385; x=1716212185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABNtOh/Z3AIwsdePLSWkzeYb78xrA+zqTZ4Vj4WEmaE=;
        b=d649w2Txjod375qt0u0vSudOgtiaajl5gvKkq91/ikQ64wmGracK6oM5KAnWKWSgUY
         Iw7kYbl76gBFSyvXoaglspzM7ytnJ72MLvZSBiqhmQn9kwIGbD9rDdrvcVQvv5bqwRuU
         QOWfGS60MhPODFps6qBwgWt13oNH80gH/oy1Zo39Gn0P3fA5bMz1mVUPEH7/s5BrA1tb
         26CVU7Zp5qfsIgpi6rNHdfn6LuSjPi1eXo6rY/3LPHvlRt/gm6yzz3DLCdN5fsOoZzGw
         kFYF5Y7TSuBI7YybW5KBB1mwK/7tcMJZa8iE7M/q15zmvxBbvlQjiVqFx8SDH7NJesEv
         5acA==
X-Forwarded-Encrypted: i=1; AJvYcCWPAjqvxhoqoHRC5/G/+Q4JM2OkfJ4ZLiw1ZMY3i3ZHocW27OEGRV74EIR+9ekbR5bggM4E7lWgnXCUSCGJ+xPEgAUwAUX/kEEW190=
X-Gm-Message-State: AOJu0YwmAO+asS+qWMzwtISUHt3XXvJyJL84VdDyngYxak2LQSt62hFi
	dPZtrIo+y8UrdzgUgI7BVrL9H1EAPteveIbGduMLWkYMQ7PZksQcEHpLHLWcIX96SCEjgZETAe1
	G/2F2CHU=
X-Google-Smtp-Source: AGHT+IEvHOPgnO9I/3W/PCmFNjcXD6LIvbF5FQE/f/RvitZNxKEHMVz/b8z9DzRQRc6R92RTQGi5OA==
X-Received: by 2002:aa7:d74b:0:b0:574:b114:f610 with SMTP id 4fb4d7f45d1cf-574b114f688mr6192584a12.15.1715607385110;
        Mon, 13 May 2024 06:36:25 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733fff8774sm6070816a12.82.2024.05.13.06.36.24
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 06:36:24 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a5a1054cf61so1154112566b.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 May 2024 06:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuq5yAk3uJKFmFBzLZKis03jd7fzrHfIkSVSVG5tMUwjzgIEQjNzPYllQNojBY8buydXcD/Kf3Ed4Vum10vpDeO/CUZFNmIBBf9wU=
X-Received: by 2002:adf:f8c4:0:b0:34f:5d07:ebda with SMTP id
 ffacd0b85a97d-3504a63111fmr10276952f8f.23.1715607363511; Mon, 13 May 2024
 06:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain> <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
In-Reply-To: <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 May 2024 15:35:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
Message-ID: <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Dragan Simic <dsimic@manjaro.org>, Michael Krufky <mkrufky@linuxtv.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
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

On Fri, 3 May 2024 at 16:08, Dragan Simic <dsimic@manjaro.org> wrote:
>
> Hello Ricardo,
>
> On 2024-05-03 13:56, Ricardo Ribalda wrote:
> > I am trying to get the DS, but
> > https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is a
> > dead links now.
> >
> > Anyone have access to the datasheet?
>
> It's kind of available on the link below, but for some strange reason
> the download fails after downloading the first 128 KB or so.
>
> https://web.archive.org/web/20080907185532/https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf\

Mike, by any chance do you have a copy of the DS?


>
>
> > On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org>
> > wrote:
> >>
> >> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
> >> > Em Mon, 29 Apr 2024 15:05:05 +0000
> >> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >> >
> >> > > We do not expect the sample_freq to be over 613MHz.
> >> > >
> >> > > Found by cocci:
> >> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> >> > >
> >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> > > ---
> >> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> >> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> >> > > index 3e725cdcc66b..1886f733dbbf 100644
> >> > > --- a/drivers/media/dvb-frontends/tda10048.c
> >> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> >> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >> > >                          u32 bw)
> >> > >  {
> >> > >     struct tda10048_state *state = fe->demodulator_priv;
> >> > > -   u64 t, z;
> >> > > +   u32 z;
> >> > > +   u64 t;
> >> > >
> >> > >     dprintk(1, "%s()\n", __func__);
> >> > >
> >> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >> > >     /* t *= 2147483648 on 32bit platforms */
> >> > >     t *= (2048 * 1024);
> >> > >     t *= 1024;
> >> > > +   /* Sample frequency is under 613MHz */
> >> >
> >> > Are you sure about that? Some DVB devices have very high frequency
> >> > clocks, specially if they're also used for satellite, so I can't
> >> > be sure by just looking at the driver's code.
> >> >
> >> > Also, we had already a bunch of regressions with "fixes" like this
> >> > that actually broke frontend drivers.
> >>
> >> This patch preserves the existing behavior. The sample_freq_hz
> >> variable
> >> is a u32 so, in the original code, z couldn't have been more than
> >> U32_MAX even though it was declared as a u64.


I agree with Dan, we keep the existing behaviour. So it wont hurt to
merge the code...

All  that said, if someone has access to the DS, I do not mind reviewing it.


> >>
> >> It's possible that the original code was wrong.  We have seen that in
> >> other places in this patchset.  Adding a note about the datasheet is
> >> also a good idea.
> >>
> >> regards,
> >> dan carpenter
> >>



-- 
Ricardo Ribalda

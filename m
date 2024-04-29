Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA2F3A1D8
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 10:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714387907; cv=none; b=PcMV116iC7DkJXN3VSWAihBBsys/BF5Z+ZYsg0Ns+0HYh+gGwPahzf3z0eNhJ4e9XF6B5pwone23TAFwHTCopsxrY/CZpHUgTCwx21j8TLN0GakcTXQD5qjOYu26hz884q2zKSJGAQH58TBOk8VNk1XJCam5xVUTMnqqBOq7rX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714387907; c=relaxed/simple;
	bh=4OFQmfmBaaiVFMtf3n+9BGYMCu4VhD/PO1uFErhL+cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMh59pEgxBkJCR08Qu9VcjuHvbm7xnPU4G+UimA3CQw+I7keC0pKkvRq5RqUb/g98+CL8PxtA905nLOo8DuquDs06jRcE/du13zl3s6MaqDWKyqVrzmOxE7MmUUjpmJccPFqXmhoDwsqiDS13ToVwrFPSGy0NuBAxe7+SR+3kys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A/QSWlVy; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A/QSWlVy"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7e043f577c5so2121508241.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 03:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714387904; x=1714992704; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BXhEnLpZuSACRtLpCaCHyHe6X1epB7qL3alOjAjU9x8=;
        b=A/QSWlVyyX8g7NZFwagC3u0WSl7hW/jd1RkYaLlcWYaENhoNhqUp/l6TCyMnBi9+7M
         oW85Xz2VRyg/faeQSd5dBqplqPkB/JLs06qaj0d9BfFsZujRwBBHMM5vtyxbrz3LPQKN
         ysYtjdQPP7zgN/GzqQKWMcqGYhv8EyqmfxFPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387904; x=1714992704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXhEnLpZuSACRtLpCaCHyHe6X1epB7qL3alOjAjU9x8=;
        b=iVsNXkmRD6bnaCFRnwjfB1qsQFykpJ/BOBYCZm5WUQFQK/uQWG78zlzHW9YDfUGjSN
         KJmMpKc6VRt3cU4bVBT5tLThjKTzvj0m/NKGpfB37FzvOPVWmgsQhq00XT3m23XmBjcu
         gTOAestK27MLbsR0nqNLtECk4iGtziYyRvUHkPTqtfU5MyEsHzSywDfN53lVA5WDQR57
         Mk7StWjG0/TX6EKMT3xuhp+h/Yhnk0dVozSS4kHd+tg/PcL+UN0NgUI7LK6LQJhJx04N
         H8Bjd20mwSMt2UZ3waswHmPeIFbniiB4ZyNfBxrF46jFuaAVXT8hA1pZ865CJxYsDC6Z
         u7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp+hjz4S8hvnYCVjyIY1eahZ1lyXw7b8K6f2zQnID4hH1jzEOJi3VVGNtioRvOZT76UglmUWT6eWazy9xYuRITShgeEH5SSSZ6Hd4=
X-Gm-Message-State: AOJu0YyBIY0BL2cMuv8a/Fe4EsJrqDMX5kJs6V97cN7RDo+mHPQneDrd
	XTvEwQWoaYkieIBQF/6167Sammvjd18t30vHzqeikFOQwykWtqpD1Xx/2652DNHWVRUMkhZeiJg
	=
X-Google-Smtp-Source: AGHT+IHkEjcKQ1qBWhqnzjN1Lo8demFjVyFoHhFmrCJsFHD81+qfssnuO5RqnjoblgdAmIYYKsRXsA==
X-Received: by 2002:a67:f8cf:0:b0:47b:eb7f:4fd8 with SMTP id c15-20020a67f8cf000000b0047beb7f4fd8mr9898750vsp.11.1714387903005;
        Mon, 29 Apr 2024 03:51:43 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id e38-20020a0561020fa600b00476e73a1243sm4907104vsv.16.2024.04.29.03.51.42
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:51:42 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7e043f577c5so2121489241.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 03:51:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlgMDBm6YEiIH/430qsYrwlVT5FLeattf36/h1pxR/6UsGYfQWXmrSxXVBlYIzrbSpHudGZLJpZufOLTCgwtMH/YTGMjk1PzFACKY=
X-Received: by 2002:a05:6214:27cd:b0:6a0:4d4f:9428 with SMTP id
 ge13-20020a05621427cd00b006a04d4f9428mr14947200qvb.32.1714387880813; Mon, 29
 Apr 2024 03:51:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org> <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
 <ZilMu614pUAzEGTa@kekkonen.localdomain> <20240424184603.GA6282@pendragon.ideasonboard.com>
In-Reply-To: <20240424184603.GA6282@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 12:51:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCucvz=dQYDguzBZ-f95ZP84zuhvoKnmEYoJqAs1YnZ3ZA@mail.gmail.com>
Message-ID: <CANiDSCucvz=dQYDguzBZ-f95ZP84zuhvoKnmEYoJqAs1YnZ3ZA@mail.gmail.com>
Subject: Re: [PATCH v2 09/26] media: v4l: async: refactor v4l2_async_create_ancillary_links
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sergey Kozlov <serjk@netup.ru>, 
	Abylay Ospan <aospan@netup.ru>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Dmitry Osipenko <digetx@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

Your proposal is what I sent for v1:
https://lore.kernel.org/linux-media/20240415-fix-cocci-v1-9-477afb23728b@chromium.org/

I have no strong opinion for any of the two, please feel free to land
whatever version you prefer.


Regards

On Wed, 24 Apr 2024 at 20:46, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 24, 2024 at 06:17:31PM +0000, Sakari Ailus wrote:
> > On Wed, Apr 24, 2024 at 12:55:20PM +0200, Hans Verkuil wrote:
> > > On 19/04/2024 11:47, Ricardo Ribalda wrote:
> > > > Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> > > > is not enabled.
> > > >
> > > > This makes cocci happier:
> > > >
> > > > drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-async.c | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > index 4bb073587817..915a9f3ea93c 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> > > >  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > >                                        struct v4l2_subdev *sd)
> > > >  {
> > > > - struct media_link *link = NULL;
> > > > + struct media_link *link;
> > > >
> > > > -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > > > + if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> > > > +         return 0;
> > > >
> > > >   if (sd->entity.function != MEDIA_ENT_F_LENS &&
> > > >       sd->entity.function != MEDIA_ENT_F_FLASH)
> > > > @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > >
> > > >   link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > > >
> > > > -#endif
> > > > -
> > > >   return IS_ERR(link) ? PTR_ERR(link) : 0;
> > > >  }
> > >
> > > I think I would prefer:
> > >
> > > static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > >                                          struct v4l2_subdev *sd)
> > > {
> > > #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > >     struct media_link *link;
> > >
> > >     ...
> > >
> > >     return IS_ERR(link) ? PTR_ERR(link) : 0;
> > > #else
> > >     return 0;
> > > #endif
> > > }
> > >
> >
> > Me, too.
>
> I actually prefer Ricardo's proposal :-)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

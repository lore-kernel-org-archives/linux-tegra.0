Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509613C66F
	for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 16:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469010; cv=none; b=QgU3L/MoNnGoswzrjVbiPElwk2UMfDsbTXJm8sEnrXHaXW8MMl/pGaoBr7PVrQAE/pXAG/rV+yfsQM8hc2A2X037lD4K8bzsTel4FbrcRmjLH81JvSdWh/XQZSS6mAv5guhKAmonynlN2vW3oDrKairAqNa5hyObxvL94PXfmHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469010; c=relaxed/simple;
	bh=F78xu2buOwEKxHIquyItfHRMF3G7JqzjmbMXkVCfm5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dxi9knWfniHYqrB9cd5uljm7yaXCxYmjZzhBztiUD31rZg9Eugr8JqWTZSBf7N14rqiq07e/zVUWHuIlYHJS3TFvyocBcSdnOQ24QTIu2PYrbi6a+ZhCP9aUZR4z8tGX4yuohEx09/xJ8R4QbWYSqjB4Fve+pwivXEZ8Im17JYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MBmzMMGs; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MBmzMMGs"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-430bf84977dso38950381cf.1
        for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711469007; x=1712073807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W6aqq99DQNeE6Hy7b4PvjAgdtFfco4Dhwzml8Tueag=;
        b=MBmzMMGsFySRkkZabpLNY9UptSwIMQ/wOWop/70sPok6sldBeMVUYzrtpdrZaJAqQX
         9pH8GTjkYsqoXdnVla1eH/JzaDWe7MSRwjkzeFBaDJqEfvfkGof7No2EuPGKNSsTuFQf
         FGzVMtIxkhVL/Yl/hUpFBAexoBzhjKmauwv8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711469007; x=1712073807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/W6aqq99DQNeE6Hy7b4PvjAgdtFfco4Dhwzml8Tueag=;
        b=PRgrYQMTbIdDp/nPaiRHcLpEq84n7SnqDq4tLt+Z/myNS681IYzv+b89419esZw8W3
         CO8ScoMcmLWE7Wu72LsFeKTPk2wyWWzsSpgGKsiv+AI5R66lyIegGIKqz4UOV2Q1LIXf
         WV+gc7ZCNYmLjlrtG5PEKNUhjrn/uPWXc0H8L21xLxEyNkXD8WmrYtv3PSDjAlN0g1gp
         pe53IMI4f1joP/V8JPfOeMxl7TguMpwXWipswvZhx0mk7z6qe2Pf8MN2Ej/7JVcLJO4s
         DnN/ZSdt6fwgCCTpKPSnPv0Ojnceu72KIG7d9b/d2WzKVdSyfSp+hjWy7PLL5/IqVVnc
         QLzg==
X-Forwarded-Encrypted: i=1; AJvYcCWEQLGCt/Vvma923+66WICPEi9G58pfGr7OX6fnCrmGpCiv4PG0O8TkPdN/CG7LlFFpkh/2tagEvnBO8B6ZQSetNClMIeJIysx1JGA=
X-Gm-Message-State: AOJu0YxBGBw1TAwIUEB7nmFjPqspDwplZS40dCE41yyUJ3Nk00o40Ry3
	jpj8e9PzVtIIiO7l2UAKQfILpOsEAwHBMXzg2Yki4TmJPr14D3LvySw26XGOrVN8aGmjNsr+uTQ
	=
X-Google-Smtp-Source: AGHT+IEaAytIk1ckgL+RmYMn2rhl0upq4/V7NL81n/PmC9fOuxEIiK4KOdfn6XwLU2Wdt5zPra+4/Q==
X-Received: by 2002:a05:622a:407:b0:431:2a27:47f5 with SMTP id n7-20020a05622a040700b004312a2747f5mr1796289qtx.16.1711469006689;
        Tue, 26 Mar 2024 09:03:26 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id r26-20020ac867da000000b00430cc9ca5ffsm3780180qtp.81.2024.03.26.09.03.25
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 09:03:25 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-42ee0c326e8so241411cf.0
        for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 09:03:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzlOJn6o0II+drfnpFzotTsRPizBvSHJN4IipgUXdOl9dPE1AGa3QV0VarkIMTsT4NRU8VYbcKX0NGfXLBJn+TA6lN3L2BJy4u/y8=
X-Received: by 2002:a05:622a:4c89:b0:431:6352:80fb with SMTP id
 ez9-20020a05622a4c8900b00431635280fbmr253080qtb.16.1711469005170; Tue, 26 Mar
 2024 09:03:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
 <CAA8EJpoCu5+KPJEeCSRLCgSQmTNxNsVCfP=9e4mtFaqADuuKBg@mail.gmail.com>
In-Reply-To: <CAA8EJpoCu5+KPJEeCSRLCgSQmTNxNsVCfP=9e4mtFaqADuuKBg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Mar 2024 09:03:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4YGNUBRs2yTuEHKswsZs8TQdF8huRhCvtuvqc0R=P+Q@mail.gmail.com>
Message-ID: <CAD=FV=V4YGNUBRs2yTuEHKswsZs8TQdF8huRhCvtuvqc0R=P+Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: Clarify that wait_hpd_asserted() is not
 optional for panels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2024 at 3:45=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 19 Mar 2024 at 22:58, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > In response to my patch removing the "wait for HPD" logic at the
> > beginning of the MSM DP transfer() callback [1], we had some debate
> > about what the "This is an optional function" meant in the
> > documentation of the wait_hpd_asserted() callback. Let's clarify.
> >
> > As talked about in the MSM DP patch [1], before wait_hpd_asserted()
> > was introduced there was no great way for panel drivers to wait for
> > HPD in the case that the "built-in" HPD signal was used. Panel drivers
> > could only wait for HPD if a GPIO was used. At the time, we ended up
> > just saying that if we were using the "built-in" HPD signal that DP
> > AUX controllers needed to wait for HPD themselves at the beginning of
> > their transfer() callback. The fact that the wait for HPD at the
> > beginning of transfer() was awkward/problematic was the whole reason
> > wait_hpd_asserted() was added.
> >
> > Let's make it obvious that if a DP AUX controller implements
> > wait_hpd_asserted() that they don't need a loop waiting for HPD at the
> > start of their transfer() function. We'll still allow DP controllers
> > to work the old way but mark it as deprecated.
> >
> > [1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588b=
b75c55996f61980183cd@changeid
> >
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I would consider changing the docs to say that implementing
> > wait_hpd_asserted() is actually _required_ for any DP controllers that
> > want to support eDP panels parented on the DP AUX bus. The issue is
> > that one DP controller (tegra/dpaux.c, found by looking for those that
> > include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
> > doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
> > this work on tegra since I also don't see any delay loop for HPD in
> > tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
> > optional and described the old/deprecated way things used to work
> > before wait_hpd_asserted().
> >
> > Changes in v2:
> > - Make it clear that panels don't need to call if HPD is a GPIO.
> >
> >  include/drm/display/drm_dp_helper.h | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I don't think this is controversial and I've been involved / written
most of the code for eDP panel interactions, so I think I can land
this myself with Dmitry and Abhinav's review (thanks!). If someone
later comes back with additional thoughts I'm happy to update things
more.

Pushed to drm-misc-next:

6376eb8b9115 drm/dp: Clarify that wait_hpd_asserted() is not optional for p=
anels

Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2851038E5D7
	for <linux-tegra@vger.kernel.org>; Tue,  4 Aug 2026 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847799; cv=none; b=uDX2Wp+TPucSkUrQGLpPMbFVE344sNdeS+q0eoV1TEfW8SAkLTD4DJXTXmqKp5eLymR9iHhPylTeG7hojnB4DXEYAbwDJ0PsDWBKCjaPU9Nezg2B8uMlKGEdYY1Pj8aPi3zj/dGY3TqTRKTBZeDeTVuV3K0pFcdpm0MVGaKzfyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847799; c=relaxed/simple;
	bh=fQ4W0KEfbC8N63G60/7q1UZXWY1PDGu4SJ5By4uKlUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFJGDUNH3M7GtHouFNofXF2exr2OLoWNcomT2J6op1uiClPlgEIwm7PjZmkpEBRlOlkzEgLVpyHwaG2x+p9dQz8fANCLpikxJYgHIx/REgNPe+Fc46l8p+KOLHW2YveTl4riK2toPiIr2K+zc0cT+sHyicHmr3ZExhey4OL+rJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73791ee3612so2323717137.1
        for <linux-tegra@vger.kernel.org>; Tue, 04 Aug 2026 05:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785847796; x=1786452596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBGPEMXGhnDdgHfHxVUKfwNAKxtFiEiLS7I0AAldjOk=;
        b=MacJ7fu+acSJajbndoWY4q1TDJQC/Ewip8wlfobPuasa5kvvKX2yNfiNVNIbNq3FtR
         cMw/QNudQVksAywKExKaseOISGfebcNxROL5VuNCLZEVjSueYnXix4DHLxNN2onnx71v
         Ws9vWmdypY+9YHYwxC0k9K0mKpdtnlI7rSqyueYnHxm9TqfsAcoFO9X+w1J4M1QwjU5F
         ReUJpOK0wv7pa9O4b1k7TpAvCPu9H2/9bZMhaxmMndjYbvnJD0cNN+n3Id+Tn4xIsysq
         DMzDpgxMKnrgfjIRp0FM+fzduomX+0d3DJeVAeXwpt8W9CVMqelq4BQ6FU7ZsRUhS+VW
         V1bA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7nMilrB15zaV3PcTAdOZzGfNn8S9uizhb0h7Fy0TDz/h0x3o7XIVE5/uiuh5EsuDwku3ardc3fNiWJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi3yIL1jL/PvbGld1tIUMa389lIjynGvnUaG+yQMM4lLiK8HFs
	q9HxokruCCGYahRoRNBHYEAhHFxd1Cm8rHO+ktUkwCRNK/lQ/CUFKbuOgi/v8ooT
X-Gm-Gg: AR+sD10t3KoCqc7MWTy8RyY2afWLhZzGXF1VEWC37iYjjdq3yiPx/ji4le+nGYtKMpO
	qoqLDdTISda/zkAbFu75R0e1cHwYJxHUVzKaJIY9Si7VnVznDqEif3PPyKZGr317ymlWGJKn4Fx
	GzXQUQm7D7VnkSpj4MEUgpcPN+krTU8Yh1+XrCqo0Z2fceT8hwNGvtWlgwyjkglJdbDpAZIzniA
	QTD8a15BEe6m/qM6wbuRDKqw4AfNvqXmXohyfJnY5EPhJ8a/Px/BTq588rgGUwvRQgvLQWHlJRZ
	G4Tu+KaT8O+EF89xE/cPX2kttlO+fSKBGufQ7oybtT4+3WkIXXzuoeuTsTB+MMXiBi/Q46OSvey
	Aok0caAr0fQBA+8D3zzsiEh3IS8BC5GphrM0Hw2zLdRQLvgQWCLizaLLuhY+iEKUSkPfNZzMRmq
	Twg9XiLKlREMZodxNg0ZmBqkSbkXFfcZHCaPmAqSBqw8mdaA6uz9WylsxVtixI0U/e5EnXbUDU3
	cLSd3SV9czpWQ/z/7Jk8N7trw==
X-Received: by 2002:a05:6102:4191:b0:738:133f:8d5e with SMTP id ada2fe7eead31-75b2406db04mr10748360137.12.1785847795884;
        Tue, 04 Aug 2026 05:49:55 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-760423db3ccsm285504137.0.2026.08.04.05.49.54
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 05:49:55 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-96935063700so2715139241.0
        for <linux-tegra@vger.kernel.org>; Tue, 04 Aug 2026 05:49:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpK/bUkHZT7HtAi/ADYv6AGruCXiBcB6Nq9baaop63VdBgD2OLB5KGL8akpdk5o8+e4THgDIi8xbq3xHQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2c86:b0:745:1c72:cf72 with SMTP id
 ada2fe7eead31-75b2406f27bmr10567769137.13.1785847794532; Tue, 04 Aug 2026
 05:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526181700.25310-1-leandro.ribeiro@collabora.com>
 <20260526181700.25310-3-leandro.ribeiro@collabora.com> <20260721234802.GA439272@ax162>
 <126e8bdb-9c39-4fbd-ae8a-26a61dd4f3d6@nvidia.com> <CAMuHMdXXbPUkyOy0R0s58ayBK0mFFjZa4BKMUBwsnwr-oCQ08Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXXbPUkyOy0R0s58ayBK0mFFjZa4BKMUBwsnwr-oCQ08Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Aug 2026 14:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3dno+-XD8kHG=vQSue9oZe+H1uAWF0v9ZhqUqrzHF6w@mail.gmail.com>
X-Gm-Features: AUfX_my1DFORQUxVgV1ttAGOeGGrmxibdLdSpELwdogkwifIufYpPCOG_LYxVNs
Message-ID: <CAMuHMdW3dno+-XD8kHG=vQSue9oZe+H1uAWF0v9ZhqUqrzHF6w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm: ensure blend mode supported if pixel format
 with alpha exposed
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Leandro Ribeiro <leandro.ribeiro@collabora.com>, 
	Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org, airlied@gmail.com, 
	daniels@collabora.com, jani.nikula@linux.intel.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	pekka.paalanen@collabora.com, simona@ffwll.ch, ville.syrjala@linux.intel.com, 
	linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Aug 2026 at 11:07, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 22 Jul 2026 at 14:08, Jon Hunter <jonathanh@nvidia.com> wrote:
> > On 22/07/2026 00:48, Nathan Chancellor wrote:
> > > On Tue, May 26, 2026 at 03:17:00PM -0300, Leandro Ribeiro wrote:
> > >> Before "drm/drm_blend: allow blend mode property without PREMULTI",
> > >> userspace would have to assume that only PREMULTI was supported by
> > >> drivers that didn't expose the blend mode property. But now userspace
> > >> shouldn't rely on that, as they can't count with drivers always
> > >> supporting PREMULTI.
> > >>
> > >> Warn if a driver exposes pixel formats with alpha but doesn't expose the
> > >> blend mode property. This way userspace doesn't have to guess. Drivers
> > >> triggering this warning must be fixed.
> > >>
> > >> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> > >> ---
> > >>   drivers/gpu/drm/drm_mode_config.c | 21 +++++++++++++++++++++
> > >>   1 file changed, 21 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > >> index 66f7dc37b597..8cca1dea3b3d 100644
> > >> --- a/drivers/gpu/drm/drm_mode_config.c
> > >> +++ b/drivers/gpu/drm/drm_mode_config.c
> > >> @@ -674,6 +674,25 @@ static void validate_encoder_possible_crtcs(struct drm_encoder *encoder)
> > >>           encoder->possible_crtcs, crtc_mask);
> > >>   }
> > >>
> > >> +static void validate_blend_mode_for_alpha_formats(struct drm_plane *plane)
> > >> +{
> > >> +    const struct drm_format_info *fmt;
> > >> +    u32 i;
> > >> +
> > >> +    /* blend mode property supported, no need to check anything */
> > >> +    if (plane->blend_mode_property)
> > >> +            return;
> > >> +
> > >> +    for (i = 0; i < plane->format_count; i++) {
> > >> +            fmt = drm_format_info(plane->format_types[i]);
> > >> +            if (fmt->has_alpha) {
> > >> +                    WARN(1, "[PLANE:%d:%s] pixel format with alpha exposed but "
> > >> +                         "blend mode not setup", plane->base.id, plane->name);
> > >
> > > I am seeing this warning trigger on a few of my machines in -next. A
> > > couple of those use amdgpu, which I see has already been reported in a
> > > separate thread. Another one uses ast, which I do not see reported
> > > (apologies if I missed it).
> > >
> > >    [  +0.000137] ------------[ cut here ]------------
> > >    [  +0.000004] [PLANE:37:plane-1] pixel format with alpha exposed but blend mode not setup

> Same on R-Car Gen2 (R-Car DU without VSP).

And on R-Mobile A1 (shmob_drm).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

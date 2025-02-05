Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4E72063D8
	for <linux-tegra@vger.kernel.org>; Wed,  5 Feb 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751113; cv=none; b=teHWqcknRdmZ1guoQxJXjmyTAldwt6FdO6sET7asWMRarXwmswn21+TKScmFBlUqcPwvgPZaSRGz7XnRjNG9E31kMbV/VGTe/RHv05ODRISVU1fOyIUsJfmLxFy85Tt6426bJJWmsOGL8PteS6e40Eu7BpFz04EPOGedvXPX9Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751113; c=relaxed/simple;
	bh=1gruFI+7HdVI1xSzSH6eLIaxJ6dSxbAonawjqGn30So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moNiF4qpf+QJqF40EEpYZQswn28wV4PEvJ9prE8gbwr0/sVpc93iS1tgpKDW4MeNNXSF8WckIfRfSa7YwzTVC9p70p/tIYsEJv5kKDB60wDFhCMF79qG5teZ5PEdMl6kXxaAzxlNJ8E9fdFF/eYSJsPBK8bznra7iUL4TrMkxz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-864e4f5b253so1921160241.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2025 02:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751109; x=1739355909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJblTr3fI5rGc7UsLjsm1kwpyQyFTbxsC4o+4N4MhNo=;
        b=GQqZ22Y05HveRNJNklQSskLtkf3HaIyotYt/Kjia1c8XiHZ944juv0Ca65BvmdKKea
         HFdLhCfWaLbIH1ooBMkPH5XPE1KyVlyDNiO/qzmAEnly1mqxOsyA8kpnNRuJXxZowhyU
         6QyKXIxA243/yEi+xvMdssUvz9INVnkQBG41rORiEWKUdVqmEB4qBlCgVxWYCz8q3Hgr
         aXCswIBgbrRxtM0za7b7LvGpOV86XnYjrXVLwEnLVzbPF8ZMDBBxPr74YW78cWprkqCL
         Y4ComMMXqYN9TAhYxCCTSFO+mO6Ee5uyOYheXnueUqierXSCmKNl/KJ+/usOiR7IxzoL
         /Ukg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ2G9pyj9q7RvuUpW8sJw2mByUiB1F5t3pOjzUHXH13KZqA+2rslhRZT0N/YoEIiGpaNxLvXZqhVkKjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5s6jqcIodgrGftfEFPh5fzcsHEOpOxAL6Pwp9undUyuQpaUDt
	GqWIRU8PcY8SNY3g9qn27pZaDWb9JGc57LZpH7NXOUuuYRVsbSxR9+Zh0r2Q
X-Gm-Gg: ASbGncuA7aiooFd3TXIJEzXDQBxrsFJdRPW6pYODyewKHPzBvRzgFL8csRH2tx+p7WR
	vpIZ2y2K1aAdkZxwD6PCXBjsopNJIKXOKeilVZCaPIElqsXfHlzWV3HExbMue4jP5ta1CE3ZGEk
	4I+RElyR4ZgIeEZ80/ZGGHznZCe8UnZEEQ0kRowx9TfnVsJyLOOgcwCBnMWYOOeNvKqwVkVTpew
	QrrYa9dQxqBx9emvAIPfSQoV1FKPj9SjzWUTNO7kO9srRgzTyL+xOHXKuZesNxaheWaUia9mZ7W
	nuvzz2CrL/COSSjUszJUkioBhKZU8vRPNJ5Y7odd8UaS/Qce6jTs0g==
X-Google-Smtp-Source: AGHT+IGKYLiHYPN03umUOtehoGZOpP4BOVEkKm+ToY+nHL2C7SHFEkSMgCe3UM0GaGS8176vDxh68w==
X-Received: by 2002:a05:6102:3f4c:b0:4b2:c391:7d16 with SMTP id ada2fe7eead31-4ba478900c0mr1477708137.7.1738751109271;
        Wed, 05 Feb 2025 02:25:09 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941f13d3sm2326269241.34.2025.02.05.02.25.08
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 02:25:08 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-866ef456dc3so51926241.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2025 02:25:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNuA2f1gptoV/o2vPHaV0yxz6AkP0HVXH4hdsHTyBfDM8lNb1iKQRpBLUGrV63gulPxwWrlncW0WBszg==@vger.kernel.org
X-Received: by 2002:a05:6102:2b8d:b0:4af:ed5a:b697 with SMTP id
 ada2fe7eead31-4ba478e696cmr1586018137.13.1738751108573; Wed, 05 Feb 2025
 02:25:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
 <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
 <TY3PR01MB11346FD535BB442955F43050C86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <wdxol4ua2zjzepvbdqrsybizl6ocpppjb2dmql62rbcmjjyqeb@5z4i2g7hf5vn> <TY3PR01MB11346E21DC023B3972A7A380686F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E21DC023B3972A7A380686F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Feb 2025 11:24:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAe1bNqv2dSeS_7dtEjPy2-P6wY6BcC-uXyhKnO3vU8A@mail.gmail.com>
X-Gm-Features: AWEUYZkz-dtkvYM7QuVXO_NgRTDC_zCKZATK71UYqtJN4-KHBKGZW5SQt3MMYC0
Message-ID: <CAMuHMdXAe1bNqv2dSeS_7dtEjPy2-P6wY6BcC-uXyhKnO3vU8A@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 5 Feb 2025 at 11:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Thierry Reding <thierry.reding@gmail.com>
> > On Tue, Feb 04, 2025 at 03:33:53PM +0000, Biju Das wrote:
> > > > -----Original Message-----
> > > > From: Thierry Reding <thierry.reding@gmail.com>
> > > > On Tue, Feb 04, 2025 at 09:07:05AM +0000, Biju Das wrote:
> > > > > > -----Original Message-----
> > > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > > > Behalf Of Geert Uytterhoeven
> > > > > > Sent: 03 February 2025 11:06
> > > > > > Subject: Re: [PATCH] drm/tegra: rgb: Simplify
> > > > > > tegra_dc_rgb_probe()
> > > > > >
> > > > > > On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_name().
> > > > > >
> > > > > > That's not the only thing this patch does...
> > > > > >
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > >
> > > > > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > > > > @@ -202,12 +202,12 @@ static const struct
> > > > > > > drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
> > > > > > >
> > > > > > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > > > > > > -       struct device_node *np;
> > > > > > > +       struct device_node *np _free(device_node) =
> > > > > >
> > > > > > Adding the _free()...
> > > > >
> > > > > Yes it fixes a memory leak aswell.
> > > > >
> > > > > > > + of_get_available_child_by_name(dc->dev->of_node,
> > > > > > > + "rgb");
> > > > > > >         struct tegra_rgb *rgb;
> > > > > > >         int err;
> > > > > > >
> > > > > > > -       np = of_get_child_by_name(dc->dev->of_node, "rgb");
> > > > > > > -       if (!np || !of_device_is_available(np))
> > > > > > > +       if (!np)
> > > > > > >                 return -ENODEV;
> > > > > >
> > > > > > ... fixes the reference count in case of an unavailable node...
> > > > > >
> > > > > > >         rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
> > > > > >
> > > > > > ... but as np is stored below, it must not be freed when it goes out of context?
> > > > >
> > > > > OK, But it is used in tegra_output_probe() and never freed.
> > > > > Maybe remove should free it??
> > > >
> > > > It's not quite as simple as that. tegra_output_probe() can also
> > > > store
> > > > output->dev->of_node in output->of_node, so we'd also need to track
> > > > output->dev->a
> > > > flag of some sort to denote that this needs to be freed.
> > >
> > > OK.
> > >
> > > > Ultimately I'm not sure if it's really worth it. Do we really expect
> > > > these nodes to ever be freed (in which case this might leak memory)?
> > > > These are built-in devices and there's no code anywhere to remove any such nodes.
> > >
> > > If there is no use case for bind/rebind for the built-in device then no issue.
> > > Or in .remove() free the node or use dev_action_reset()??
> >
> > Bind/rebind is possible, but that's not even a problem. Worst case the reference count on the device
> > node will keep increasing, so we'll just keep leaking the same node over and over again. I guess
> > potentially there's a problem when we rebind for the 2^32-th time, but I'm not sure that's something
> > we need to consider.
>
> Agreed.
>
> >
> > That said, devm_add_action_or_reset() sounds like a good solution if we really want to make sure that
> > this doesn't leak, so yeah, I'm in favour of that.
>
> OK, Will send a patch after of_get_available_child_by_name() [1] hit on mainline.

Can't you already fix the unbound reference count now, as it is orthogonal
to the conversion to of_get_available_child_by_name()?

> https://lore.kernel.org/all/TY3PR01MB1134656CBDAF5FFCEB6C8D20F86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

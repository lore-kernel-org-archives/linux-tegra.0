Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792475957;
	b=cDS8t29Ifi8UMOgxEsTB3VHeU9kjHVyOr7mHGK2rvPeQ34TjamHwr8eo+/IWw03uOBFE
	 SV3+aAGRPTD/BSxChx5zYu8D2jTUE1w3gJe11iLF7rYYKhIuuhNInRtXyeKkcbxbnXh3A
	 oWoWoxaTnCf/sKTZRlEMkY1Ya4Cp1JTj4AjYiYIWRQ2ZbM3Lkt+wwMNoq/wyEJ4ccqIyz
	 UnVpCGbX0mYTkSUQQ2EqDzgmK91vvyBJAPhuaEdhUlvYo5JTxH4PH8lDwXoRvthlF5NGt
	 iANmsJLM1sH8MOwnLz9CyIFuCaqiVJtZjERbnnZN9IfqglLDnX6dlCyEvkSb5HUuMGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792475957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aCg8fph/1fJDI6h7fkyNcd2zVqelb2p7EHJpKPHyiUA=;
	b=Zq2HnjXX5ywdDJjH9ykVKdYixvPq2gapRsk+k7YX183uQZ4471bKw/hchjBSBz9r9EFb
	 UZYBalkuFh5a0rrmHJMURMnp8gNzoPSqNW6aANZfOeugQU2dFWbi0qN6nRPhr5CYBcssJ
	 GiM6QzfAETE4I5jdPnAC1yD21e/8teA9Vhc/7y3rzX0PRNvopDylCyUb/rZtfW1YEzCQm
	 eFaBTW9UF8PbbLzNMuf/lrCbfXE5FIS1Kf0C2YhUY5QPSNAI+jkKzkA2kQkkfe2sQLLAJ
	 NgBapEgT+7dYQJKEP3Xk4h6LtyLtHpBr+ToGNgjo3ptbWIdsZADQ3L/x6cXVwf9zovw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lmr2jZ2B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DC7606A31B
	for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2026 05:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61DC7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lmr2jZ2B
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bccecba199so2673274e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 22:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792475955; cv=none;
        d=google.com; s=arc-20260327;
        b=ekY0IuiysJSij7O1LiyzTaP2T/2OQulKP4v3Z4/Mj9B6kFehtWyIx1jWNgbwLLCl6l
         Ik8tFaNQsn76zIvkXiVLbrlcGKkS9R3vtGXHTEAmfo+9R5nCPVIzWu6l/+qPJzUSFPYm
         LZgRI4JQbjx3zvZ0aO1//Kzm6k3rpOvPPoEW7HpVInhBbyALduGUsIlqzkYlfqQCZhEe
         2BtSEa4SSpFHceQqWXtTGRrGK2QcaDNo0eObAlNfm3NR9Fle3lyikm41MBsN6f+ese8c
         YAtI210nUbtWfdxbd9jTAK+y0uZHxnRaJu7x6fPSbdFgCKW+LgyyjIfgpd1MgOmb7Cu0
         En/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aCg8fph/1fJDI6h7fkyNcd2zVqelb2p7EHJpKPHyiUA=;
        fh=YIGJUQl3hEgIEP5k6hpTvlh82SUqbvFgsp98dtb8Sfo=;
        b=akcUEOS5Yn4YlpvzwnWVVftNuPSGVP6+oq+SQoynW/1uENf4FcE2s/sxBj4NJOfZSA
         R0e5EULS2mgNpa5JzbX1VtHFo3WyDlCYyV5PnNF8R5fPC4TLZQUN/2H0i8sKhJG/kqnv
         NL7yQLNjahRb4BYViQzQb0XPi9qppTVir1omoqmX8qXGe4W8Wz34JbT6IWdUcgyUTstP
         VHKDYkp8S5eBeNuD2ZIN/Elo3Hqgbh11igW/GJcNIwcMEtUdUqpoYkQH2rUn7cHIHl92
         lGvUyx2RkyEGUNGebvhwL3hxCf+NgBXyxoJh91XY6R3NYvwvS5olqB1b9Kk64FaIbiHA
         Hu7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792475955; x=1793080755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCg8fph/1fJDI6h7fkyNcd2zVqelb2p7EHJpKPHyiUA=;
        b=Lmr2jZ2B5nGzZubbHDveW5Lk0pG0LnPLcq4ZJADSym1+3OiTmqLFUdmuZjeP7F+fgn
         BurHWcTuilSCPFoUXF9tFwBDQKkL+ePJlibjdUruDM8rXLD5yKpAyAXL+Ts6GtFdAGON
         9nfLZ1z9GiQZQrymP7vRILd1QlJaGpp+V/huGhwckPKmn8FKDChHYx4DoHhrC7WfAGdI
         zcF4Cq5mcu3UW5OB+m+0qywXyr74ep+AySNYy5Zx1gaFrelDeqKQ5Xyfdn/LNw84yGcy
         +gjGp+GKfNuwgq6XzaX8aJH4fWo51jrtCZ87e0wVvNx6odR4H4cew7pi+wuJ6GdUjrot
         9UKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792475955; x=1793080755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCg8fph/1fJDI6h7fkyNcd2zVqelb2p7EHJpKPHyiUA=;
        b=eV8q0bgpZ/UbTUWhVQlrW5kHzhzbKy8hc9Rom8sIPunWuv+sRPPIntVPC1bBxjEcZc
         kiplzu2AZT6vMj5kj97scIcx+RFBF0D2aKcK9tMpY5yz/Nzlt8+SknvBQA3B5Ui7h/pS
         I6l2c2Aak8sBoMsumQbxKJrzZGsaNNjxj5Nbcg7NETvxceH8Kuxx0mUwpWkipZJ/XHfy
         hCyt3g1VaPCax1AdmMZEbRSS6IGKDY/ooyxxEXedQyijf96OCpCjEGwhOyxDvlov6OJi
         fMDtat8/7NC2F2mASaJQody2kq6zgzR+aj+2klL7AoSVRbZphUgqmYze3dH2Hu0odKTE
         P+LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQnjq2uX2pmnLbjKX7r6+BSVLxlS4tUVjz/O4i+C1LcGTHfmJg5CIF/UjwIuOu6MPQTIy4wU/n96rLRw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5oHxWdiTqNxZG6jTdEm4xaWhcpl+eM8rIbyz4vhjxo4RCuJel
	2mXf+twuctxDbB/T49k/Rw/nOY7QCXguPKxIUFRKbPv0X7A7eFAhuwQx4aL4FKLUtQvI9OokAM3
	uKgk/2dIBWsr6SKghuidq90cwqndRQ/I=
X-Gm-Gg: AYBFou2kWnwj6Ap+sAmA5l/HL29lWWlcJks2dUDOoHUzZgROs1MJTm1z975jY5maeXL
	jQr6N8Cc38rabyMFKP1wQHYTBRi8nw2wDAxB2lDeA8xoC4CTkSR4ad+L6uoKpjmBUKWURUoZDY6
	ZV6QbEDIepxAmZ2vbDj/snXI6wvdQqqlzkqM9Qanv8ioUzc4qEBhUuBW9hMET9K4d5jH3Y8WjC8
	8LoJAMRrDUSawZ1qui6orMcqNN2FZQuPqkVga99kdacMvX7PFtxZWox9NPTDM+wqUEX0LqCtWAh
	tD/2yNc3P1LJ5kWXU3ybKyaIHInuPQLr8XHIa279uYoFHArq6k8Eu9cR/5CpSFQliTLX257Wpq/
	ngMco2VRaHzJAVpkcq/OkVURvmj2TE8raFo4qmhx3pmE=
X-Received: by 2002:a05:6512:401c:b0:5bc:f6b4:96c1 with SMTP id
 2adb3069b0e04-5be50a09735mr3339214e87.9.1792475954919; Mon, 19 Oct 2026
 22:59:14 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-tegra-drm-yvu420-v2-0-512889103ab4@gmail.com>
 <20261018-tegra-drm-yvu420-v2-1-512889103ab4@gmail.com> <HmrilxC8QwiAQGw2IQ1Ztw@nvidia.com>
In-Reply-To: <HmrilxC8QwiAQGw2IQ1Ztw@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 20 Oct 2026 00:59:03 -0500
X-Gm-Features: AclHuK-m8XMWtAb64cQPzzqZx3KIZG_Ohxl4ldySrzNI4kuCiiZ69ozwRbh1oCQ
Message-ID: <CALHNRZ9pTTLTpsKCi7oETcjpxNbZmQxfnC+pvEx4Wezv1_zchw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/tegra: Support swapping chroma planes
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:08=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia=
.com> wrote:
>
> On Monday, October 19, 2026 7:03=E2=80=AFAM Aaron Kling via B4 Relay wrot=
e:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Tegra display controller supports some yuv types, but not their
> > chroma swapped variants. For example, yuv420 is supported but yvu420 is
> > not. This can be efficiently worked around by just passing the hardware
> > said chroma planes backwards. Add a flag to the plane state struct and
> > handling to both tegradc and nvdisplay paths.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c    |  6 +++++-
> >  drivers/gpu/drm/tegra/hub.c   | 14 +++++++++-----
> >  drivers/gpu/drm/tegra/plane.c |  5 ++++-
> >  drivers/gpu/drm/tegra/plane.h |  3 ++-
> >  4 files changed, 20 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index b0bfa946e6979..39c2e920d76a6 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -740,7 +740,8 @@ static int tegra_plane_atomic_check(struct drm_plan=
e *plane,
> >
> >       err =3D tegra_plane_format(new_plane_state->fb->format->format,
> >                                &plane_state->format,
> > -                              &plane_state->swap);
> > +                              &plane_state->swap,
> > +                              &plane_state->swap_uv);
> >       if (err < 0)
> >               return err;
> >
> > @@ -872,6 +873,9 @@ static void tegra_plane_atomic_update(struct drm_pl=
ane *plane,
> >                       window.stride[i] =3D fb->pitches[i];
> >       }
> >
> > +     if (tegra_plane_state->swap_uv)
> > +             swap(window.base[1], window.base[2]);
> > +
> >       tegra_dc_setup_window(p, &window);
> >  }
> >
> > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > index 448f49f3a7d7e..6427155ac4fdf 100644
> > --- a/drivers/gpu/drm/tegra/hub.c
> > +++ b/drivers/gpu/drm/tegra/hub.c
> > @@ -440,7 +440,8 @@ static int tegra_shared_plane_atomic_check(struct d=
rm_plane *plane,
> >
> >       err =3D tegra_plane_format(new_plane_state->fb->format->format,
> >                                &plane_state->format,
> > -                              &plane_state->swap);
> > +                              &plane_state->swap,
> > +                              &plane_state->swap_uv);
> >       if (err < 0)
> >               return err;
> >
> > @@ -664,24 +665,27 @@ static void tegra_shared_plane_atomic_update(stru=
ct drm_plane *plane,
> >       tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE);
> >
> >       if (yuv && planes > 1) {
> > -             base =3D tegra_plane_state->iova[1] + fb->offsets[1];
> > +             uint8_t u =3D tegra_plane_state->swap_uv ? 2 : 1;
> > +             uint8_t v =3D tegra_plane_state->swap_uv ? 1 : 2;
> > +
> > +             base =3D tegra_plane_state->iova[u] + fb->offsets[u];
> >               base |=3D addr_flag;
> >
> >               tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_STAR=
T_ADDR_HI_U);
> >               tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_STAR=
T_ADDR_U);
> >
> >               if (planes > 2) {
> > -                     base =3D tegra_plane_state->iova[2] + fb->offsets=
[2];
> > +                     base =3D tegra_plane_state->iova[v] + fb->offsets=
[v];
> >                       base |=3D addr_flag;
> >
> >                       tegra_plane_writel(p, upper_32_bits(base), DC_WIN=
BUF_START_ADDR_HI_V);
> >                       tegra_plane_writel(p, lower_32_bits(base), DC_WIN=
BUF_START_ADDR_V);
> >               }
> >
> > -             value =3D PITCH_U(fb->pitches[1]);
> > +             value =3D PITCH_U(fb->pitches[u]);
> >
> >               if (planes > 2)
> > -                     value |=3D PITCH_V(fb->pitches[2]);
> > +                     value |=3D PITCH_V(fb->pitches[v]);
> >
> >               tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE_UV);
> >       } else {
>
> I noticed DC_WIN_PRECOMP_WGRP_PARAMS has a SWAP_UV bit. This is already
> defined in dc.h. So we can use that for the hub.c implementation instead
> of manually swapping.

Oh. I figured there had to be something like that in one of the
generations, but my grep-fu failed me. Even more embarrassing that I
ended up using the exact same name. I will update and verify this and
send a new revision.

> Otherwise everything looks good to me. We could also enable the swap_uv
> logic for other UV formats.

Eh, other than asking for the entire patch to be rewritten over the
last two revisions, it looks good. :P And alright, I'll plumb yvu422
and yvu444 in the new revision as well. However, I don't have test
cases for those.

Aaron

> Cheers
> Mikko
>
> > diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plan=
e.c
> > index 2148b0c59815c..757bc552809fe 100644
> > --- a/drivers/gpu/drm/tegra/plane.c
> > +++ b/drivers/gpu/drm/tegra/plane.c
> > @@ -59,6 +59,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *=
plane)
> >       copy->tiling =3D state->tiling;
> >       copy->format =3D state->format;
> >       copy->swap =3D state->swap;
> > +     copy->swap_uv =3D state->swap_uv;
> >       copy->reflect_x =3D state->reflect_x;
> >       copy->reflect_y =3D state->reflect_y;
> >       copy->opaque =3D state->opaque;
> > @@ -319,11 +320,13 @@ int tegra_plane_state_add(struct tegra_plane *pla=
ne,
> >       return 0;
> >  }
> >
> > -int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
> > +int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool *swap_=
uv)
> >  {
> >       /* assume no swapping of fetched data */
> >       if (swap)
> >               *swap =3D BYTE_SWAP_NOSWAP;
> > +     if (swap_uv)
> > +             *swap_uv =3D false;
> >
> >       switch (fourcc) {
> >       case DRM_FORMAT_ARGB4444:
> > diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plan=
e.h
> > index e33a581e6490e..dba5f1b254e98 100644
> > --- a/drivers/gpu/drm/tegra/plane.h
> > +++ b/drivers/gpu/drm/tegra/plane.h
> > @@ -49,6 +49,7 @@ struct tegra_plane_state {
> >       struct tegra_bo_tiling tiling;
> >       u32 format;
> >       u32 swap;
> > +     bool swap_uv;
> >
> >       bool reflect_x;
> >       bool reflect_y;
> > @@ -88,7 +89,7 @@ void tegra_plane_cleanup_fb(struct drm_plane *plane,
> >  int tegra_plane_state_add(struct tegra_plane *plane,
> >                         struct drm_plane_state *state);
> >
> > -int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
> > +int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool *swap_=
uv);
> >  bool tegra_plane_format_is_indexed(unsigned int format);
> >  bool tegra_plane_format_is_yuv(unsigned int format, unsigned int *plan=
es, unsigned int *bpc);
> >  int tegra_plane_setup_legacy_state(struct tegra_plane *tegra,
> >
> > --
> > 2.54.0
> >
> >
> >
>
>
>
>

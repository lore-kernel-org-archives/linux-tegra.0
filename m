Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792483800;
	b=TzU+spn3eoo0joSjPZjMhFd+QuDRIq6gJsoz1cMfxYpXg6Gfy3i7hPAPt7tznlMCeaWc
	 rGCOujlfEgv1mcauigds3ev5LtMAZsBblqDj8Lqtzg4hx0ob/6PvmY2LrklHcEv1LLDMP
	 x+dF4qg2La5TvQyxSRocRXYcS7HjWblxg7PnQ0/KFYT9q1Bby8O4e81l6/TIws6lNMb2h
	 oUeOxyaOx1+FUbjKQLY0l1gOqbWyThivQOxZ7kMLNXs7QBCZSdAHiEzQHxWF+OKEHVdh8
	 fml9YTd7GxMi4hZIChoamCmLXojsW/je0yFwyI097QiLw//lsDB+kmkLXea/l0TXMuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=V6mptVN35vJ98NYii+6LNnGBoOW3foxwKoXliiFVg4k=;
	b=csudtAa7B4M9J2RMGtb3vNGMRJfKSQ8hWoHxATjuaNAVwvQstuRlsV2mn9juI/yvlvGb
	 IIWv6i9qDxyR7f5IkfGCE17qzNzBcrJq77h+EvO60iJSWzskUtRSG12l3+RMOOpkomXoH
	 i07XhRQhUcIACV+BzTEKO6D1iE+qe94CcyDtbWz4TBP4QkLZv+78mRhv+/xHbQweuQHMM
	 l2sHReTcps3KKljj6gYZ2x9BDQ/Ja90luNyQI2Y1K9WELrffvsHRTRNNJizEPWobM6cGD
	 83SptkZKoiTaaUWLOV/BIZefeKMopmkQyYb5Wg7Ef2sLbv1TxosS0DtT1R4y2JIFFdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evb63eaP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E7606A31E
	for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2026 08:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0E7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evb63eaP
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a772ec8389so20846881fa.3
        for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2026 01:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792483799; cv=none;
        d=google.com; s=arc-20260327;
        b=Be0++YMzYN3LKX8fXerxbu4uIMb/GNtRHV6UHoifo9W9VNhrdu9ekkEaVOFE7Zlshy
         KT87Mofhxc58ahL/JwzxUdTJTPbNfFrHCdyRqswRV/6z//B+apspyyBBFyaZLBYl+fw9
         W5pfdZ//SpryE91Xw7oc45JhyLxsuPin9niGPvNE93fTfQqBtcePEMMeAn8VcVRH1sIY
         jz6iAvEHoILb32prkBn4h4q/Q2B4BsZDpWhltOUiCDzB1Odd6OKf7p24KKL11fIxN/Hj
         F1h9y+24Rkly0S73pVVjGV5Us1wxXlNJfNBLA+feKDy/+cfdEztf8kQfNe+m+kIEJm85
         jMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V6mptVN35vJ98NYii+6LNnGBoOW3foxwKoXliiFVg4k=;
        fh=cHxk/NQd16i5Krn3CIf2Gd/1akFzCiY7TOAySVh3Y1k=;
        b=p8OIITCOYuZX5988H7xKwP6loMPqObetONBXS0dZ/Y0bLwLCQlLM79xfSIMGZ6d01B
         4Q0DFuUoUUkwUxA7ZtDQNgt7K8knUH6S9RNGIqqVv1hMzus2NdW77UtiCkK7B02klPA/
         WCsOD7rAnZuRUWcLEEeISCzuyTmCIpm8oflcEZWwy2TkIrLqDkoHzUWKaD93vp44kLjy
         tCX3fmpVWN7vd01RrMXufiaHkLzZ51wHmF4J4JfNGWSRDEgJjcj/pPCUXkttCVNlv0AG
         vC4expWpK2SjNbYK7UGDv1Rm1vA5KWPO/Z7Jhy8r8IY2DowVvROKAwG/ED6yzqSfZnEi
         qnhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792483799; x=1793088599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6mptVN35vJ98NYii+6LNnGBoOW3foxwKoXliiFVg4k=;
        b=evb63eaPhGaFJtlu5jJTkNUzsfxqGmB2jkiQ/CFO6TvwWdV7gZJY/vCF7TWT8KOCep
         WeZdRm8D6AzKEHgKeADaU1S+HiMaTsKpdA/12gGrFQE9JADR5LhbGP++kBhETxLIBdyF
         nu48x67TCzaK8LSpOqvGaRQGR+TVvFMjOrRgG6FZ5OuNUeKAR6+Gscelf5u1SgjY4Chk
         4KgqATQT8iJ9IE5wKQCh3p6zPYIFMRUrI08Cq9wGjepEXE08odUs+YSFA20ChM8KItMn
         hfn9rvGYdrrsQvz1TuDnWPbUS5iku6m41dp1VuVcZqvAArvWSal6tHeKOGodcWJMfGWR
         B2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483799; x=1793088599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6mptVN35vJ98NYii+6LNnGBoOW3foxwKoXliiFVg4k=;
        b=bBBY0r8Z9aii/Mx9vFjVraV0k40y9U6Ens7k1BCXmAwGaI6BBkKF/Cv3evQBysaFnF
         MHV2uHbahOsE5ATnYxl+WdP0+HKWkaPeQAYCvfunpp7AIW59zAiB6bAVoq4xzfifrS7g
         jdYoBdqUF3vs9u9gDx2yhWAqLH2NGVjV8OGb38pcHaDiimYYMzghxBoyt1OXe+gX5zVO
         9IX27hwWDyu+HMJ/G7vualNqUEvEsv9cNhShf3++XdJs4MZXLLgfSnUrWIRYnvA21X3e
         PuyjAFCfL/KKh+XzxX3FgjctmZ7QnsJcQ2DWrYsV3V5pQNZi+8SCRsk5tqQ/giArRsKf
         QS1w==
X-Gm-Message-State: AFq9FYJG1gYAPZxs1F78fy1Yj+FwxDbtsAq5V1HxDioYhQrc/RnuINe2
	3GZFVGultmICJTRP6ECscblC5Ey0zZ5eNmRiPEW6wWh1tpterfMU5uzxgBgKvrxoh7urD12z5B7
	V5DsukRVg51+5Um6UVSzz6KDtElGp+/c=
X-Gm-Gg: AYBFou1B0igFF1F0CSIn4WOBj9kgPgU1uj6+BVZ5PGf3b3AzYGaOBBi/3u+zGQp3rcA
	xJ3ojlQICk70A1mK4gXLhwmo5K01hJ3uD+bpA/zJ7eVhrLn8Q7wJwWkjlE+zmxj+d9FQxcbjw8b
	x47KR5Wi0CdhtcfX+QM9LfTPdiYoTlz343JqqqTCe3axn8RiV9G0btbMUy/sZRbc9tm13qZRqou
	wtw+1i4QP+9XO1x36rXz5xI02LpgavqTez17El9qd+pQL26NfaIsL/8OBv6F/94qq+kVOGijRb7
	D3bWUEaCQkJ5ZHtk2n46FEoLQMJuBpmdB2szoJCd7z51M9okeeEw7WEGTHAQWWLlq+1i67wZjGJ
	aoYpiG4cEXGiGZuJutFmTrFfWQMhkSfp9kjHoRWS1bLE=
X-Received: by 2002:a05:651c:43c3:10b0:3a9:decc:71d8 with SMTP id
 38308e7fff4ca-3ab292e7330mr15305261fa.20.1792483798450; Tue, 20 Oct 2026
 01:09:58 -0700 (PDT)
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
 <HmrilxC8QwiAQGw2IQ1Ztw@nvidia.com> <CALHNRZ9pTTLTpsKCi7oETcjpxNbZmQxfnC+pvEx4Wezv1_zchw@mail.gmail.com>
 <YwDFPLEmR6OpEy_iH5qhQg@nvidia.com>
In-Reply-To: <YwDFPLEmR6OpEy_iH5qhQg@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 20 Oct 2026 03:09:46 -0500
X-Gm-Features: AclHuK9G5flqUwHbZoc27IHAExPyam9IuxmD1uS85V1i11rVUagnEOUPWT-m7-o
Message-ID: <CALHNRZ_Kiqc0VJN+4gDDM0Z+Ns0VO3jCoLUk1xNn1OGjeS2+LQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/tegra: Support swapping chroma planes
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:33=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Tuesday, October 20, 2026 2:59=E2=80=AFPM Aaron Kling wrote:
> > On Tue, Oct 20, 2026 at 12:08=E2=80=AFAM Mikko Perttunen <mperttunen@nv=
idia.com> wrote:
> > >
> > > On Monday, October 19, 2026 7:03=E2=80=AFAM Aaron Kling via B4 Relay =
wrote:
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > The Tegra display controller supports some yuv types, but not their
> > > > chroma swapped variants. For example, yuv420 is supported but yvu42=
0 is
> > > > not. This can be efficiently worked around by just passing the hard=
ware
> > > > said chroma planes backwards. Add a flag to the plane state struct =
and
> > > > handling to both tegradc and nvdisplay paths.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/dc.c    |  6 +++++-
> > > >  drivers/gpu/drm/tegra/hub.c   | 14 +++++++++-----
> > > >  drivers/gpu/drm/tegra/plane.c |  5 ++++-
> > > >  drivers/gpu/drm/tegra/plane.h |  3 ++-
> > > >  4 files changed, 20 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.=
c
> > > > index b0bfa946e6979..39c2e920d76a6 100644
> > > > --- a/drivers/gpu/drm/tegra/dc.c
> > > > +++ b/drivers/gpu/drm/tegra/dc.c
> > > > @@ -740,7 +740,8 @@ static int tegra_plane_atomic_check(struct drm_=
plane *plane,
> > > >
> > > >       err =3D tegra_plane_format(new_plane_state->fb->format->forma=
t,
> > > >                                &plane_state->format,
> > > > -                              &plane_state->swap);
> > > > +                              &plane_state->swap,
> > > > +                              &plane_state->swap_uv);
> > > >       if (err < 0)
> > > >               return err;
> > > >
> > > > @@ -872,6 +873,9 @@ static void tegra_plane_atomic_update(struct dr=
m_plane *plane,
> > > >                       window.stride[i] =3D fb->pitches[i];
> > > >       }
> > > >
> > > > +     if (tegra_plane_state->swap_uv)
> > > > +             swap(window.base[1], window.base[2]);
> > > > +
> > > >       tegra_dc_setup_window(p, &window);
> > > >  }
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hu=
b.c
> > > > index 448f49f3a7d7e..6427155ac4fdf 100644
> > > > --- a/drivers/gpu/drm/tegra/hub.c
> > > > +++ b/drivers/gpu/drm/tegra/hub.c
> > > > @@ -440,7 +440,8 @@ static int tegra_shared_plane_atomic_check(stru=
ct drm_plane *plane,
> > > >
> > > >       err =3D tegra_plane_format(new_plane_state->fb->format->forma=
t,
> > > >                                &plane_state->format,
> > > > -                              &plane_state->swap);
> > > > +                              &plane_state->swap,
> > > > +                              &plane_state->swap_uv);
> > > >       if (err < 0)
> > > >               return err;
> > > >
> > > > @@ -664,24 +665,27 @@ static void tegra_shared_plane_atomic_update(=
struct drm_plane *plane,
> > > >       tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE);
> > > >
> > > >       if (yuv && planes > 1) {
> > > > -             base =3D tegra_plane_state->iova[1] + fb->offsets[1];
> > > > +             uint8_t u =3D tegra_plane_state->swap_uv ? 2 : 1;
> > > > +             uint8_t v =3D tegra_plane_state->swap_uv ? 1 : 2;
> > > > +
> > > > +             base =3D tegra_plane_state->iova[u] + fb->offsets[u];
> > > >               base |=3D addr_flag;
> > > >
> > > >               tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_=
START_ADDR_HI_U);
> > > >               tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_=
START_ADDR_U);
> > > >
> > > >               if (planes > 2) {
> > > > -                     base =3D tegra_plane_state->iova[2] + fb->off=
sets[2];
> > > > +                     base =3D tegra_plane_state->iova[v] + fb->off=
sets[v];
> > > >                       base |=3D addr_flag;
> > > >
> > > >                       tegra_plane_writel(p, upper_32_bits(base), DC=
_WINBUF_START_ADDR_HI_V);
> > > >                       tegra_plane_writel(p, lower_32_bits(base), DC=
_WINBUF_START_ADDR_V);
> > > >               }
> > > >
> > > > -             value =3D PITCH_U(fb->pitches[1]);
> > > > +             value =3D PITCH_U(fb->pitches[u]);
> > > >
> > > >               if (planes > 2)
> > > > -                     value |=3D PITCH_V(fb->pitches[2]);
> > > > +                     value |=3D PITCH_V(fb->pitches[v]);
> > > >
> > > >               tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE_UV=
);
> > > >       } else {
> > >
> > > I noticed DC_WIN_PRECOMP_WGRP_PARAMS has a SWAP_UV bit. This is alrea=
dy
> > > defined in dc.h. So we can use that for the hub.c implementation inst=
ead
> > > of manually swapping.
> >
> > Oh. I figured there had to be something like that in one of the
> > generations, but my grep-fu failed me. Even more embarrassing that I
> > ended up using the exact same name. I will update and verify this and
> > send a new revision.
> >
> > > Otherwise everything looks good to me. We could also enable the swap_=
uv
> > > logic for other UV formats.
> >
> > Eh, other than asking for the entire patch to be rewritten over the
> > last two revisions, it looks good. :P And alright, I'll plumb yvu422
> > and yvu444 in the new revision as well. However, I don't have test
> > cases for those.
>
> These are minor revisions, pretty much cosmetic! :)
>
> If you have access to the libdrm modetest command, you can use it to
> test -- e.g.
>
> sudo modetest -M tegra -s 78:1920x1080 \
>       -P 44@43:896x504+40+288@YU12 \
>       -P 48@43:896x504+984+288@YV12
>
> (the ID numbers may differ) to set up a 1920x1080 mode with two overlay
> planes one with each plane ordering.

I'm still mostly focused on android. If there's something where I'm
concerned there's a difference between android and a Linux rootfs or
such, I'll test against a simple cli rootfs. But I don't have a full
graphical Linux setup for testing. At one point I did try to compile
modetest for aosp, but I don't think I made it work.

Aaron

> BTW, I believe the hardware swap bit also supports packed and semiplanar
> formats -- you can add those too if you'd like or leave them out and we
> can add them later if needed.
>
> Mikko
>
> >
> > Aaron
> >
> > > Cheers
> > > Mikko
> > >
> > > > diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/=
plane.c
> > > > index 2148b0c59815c..757bc552809fe 100644
> > > > --- a/drivers/gpu/drm/tegra/plane.c
> > > > +++ b/drivers/gpu/drm/tegra/plane.c
> > > > @@ -59,6 +59,7 @@ tegra_plane_atomic_duplicate_state(struct drm_pla=
ne *plane)
> > > >       copy->tiling =3D state->tiling;
> > > >       copy->format =3D state->format;
> > > >       copy->swap =3D state->swap;
> > > > +     copy->swap_uv =3D state->swap_uv;
> > > >       copy->reflect_x =3D state->reflect_x;
> > > >       copy->reflect_y =3D state->reflect_y;
> > > >       copy->opaque =3D state->opaque;
> > > > @@ -319,11 +320,13 @@ int tegra_plane_state_add(struct tegra_plane =
*plane,
> > > >       return 0;
> > > >  }
> > > >
> > > > -int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
> > > > +int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool *s=
wap_uv)
> > > >  {
> > > >       /* assume no swapping of fetched data */
> > > >       if (swap)
> > > >               *swap =3D BYTE_SWAP_NOSWAP;
> > > > +     if (swap_uv)
> > > > +             *swap_uv =3D false;
> > > >
> > > >       switch (fourcc) {
> > > >       case DRM_FORMAT_ARGB4444:
> > > > diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/=
plane.h
> > > > index e33a581e6490e..dba5f1b254e98 100644
> > > > --- a/drivers/gpu/drm/tegra/plane.h
> > > > +++ b/drivers/gpu/drm/tegra/plane.h
> > > > @@ -49,6 +49,7 @@ struct tegra_plane_state {
> > > >       struct tegra_bo_tiling tiling;
> > > >       u32 format;
> > > >       u32 swap;
> > > > +     bool swap_uv;
> > > >
> > > >       bool reflect_x;
> > > >       bool reflect_y;
> > > > @@ -88,7 +89,7 @@ void tegra_plane_cleanup_fb(struct drm_plane *pla=
ne,
> > > >  int tegra_plane_state_add(struct tegra_plane *plane,
> > > >                         struct drm_plane_state *state);
> > > >
> > > > -int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
> > > > +int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool *s=
wap_uv);
> > > >  bool tegra_plane_format_is_indexed(unsigned int format);
> > > >  bool tegra_plane_format_is_yuv(unsigned int format, unsigned int *=
planes, unsigned int *bpc);
> > > >  int tegra_plane_setup_legacy_state(struct tegra_plane *tegra,
> > > >
> > > > --
> > > > 2.54.0
> > > >
> > > >
> > > >
> > >
> > >
> > >
> > >
>
>
>
>

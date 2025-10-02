Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495A523D7DF
	for <linux-tegra@vger.kernel.org>; Thu,  2 Oct 2025 05:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759383685; cv=none; b=KWgH+BPw2CEAtyyLGgrXjdd0YjyRr04Gt0Ru5qp+dyTaZguiGWwo/jKJYMm4oSORZ4U7LvjRoTYkAk9Bl5Z8+3fdfo98KBRJtbZxlOT+tD6OvjTeOveTB6TW5bMgyYMKTRS4gulZmvfvttUPj6zi2oGWYPld/yDod/NY9yWA+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759383685; c=relaxed/simple;
	bh=Ai80diU9GPDY7knZLsq6IsnKb4K24eNVuQ/3Dm7XhyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuABFrCAN5g2AuPMz3VWfzxNncs7FeRXvAwdSqJ12MYgE7jgCRvWuizaHvXNtu86K6PjIvE2b4Bbi6j/4HJkEAjrx1ynX22ZlG2SuVChMDS/tS/j7E0lc06wpyHRiVjHO4dp/Q5E1pXI9eMEcT5y4dr6dVtLBssxREOLmbHB5vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHvJgZel; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHvJgZel"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so1096635e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 01 Oct 2025 22:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759383680; x=1759988480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iw/qgubo4TZ1yBojXtnFrrecbLmrkuMUyWqeArG5GDM=;
        b=gHvJgZelF6s25CysQYZTap94EzX0LECgmFGEWFpD1L8PjRSSdJp8DHUCBaqDxDXZZc
         2WjcJ2ngMZMXeXc5Wk3EUvVpqt42gxaGpzrCs7XnJeiDarPzp0iogIlgNVvTqFRc6nlY
         TAvTgUsMaZD+IVNCCdgQWBYgveG4qlpj32yrt+qBkkYyZF0uViwVcG5PNzLIXruZjW+a
         Y4eLt7sUubcnjRjqCMVzElzXGXpj7E7NC9GDJFSqYCH+Y+hNihVcWJ1H0YZpjTSHeqbq
         nP/FYdWBqaJBk1GZ901tSsw52fR2oCWJQrLMAfxqRt6X+PemcESsI5L8OTZbiq7kyeFJ
         3zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759383680; x=1759988480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iw/qgubo4TZ1yBojXtnFrrecbLmrkuMUyWqeArG5GDM=;
        b=UdCGzgxLDZyBAErijo5PSni12AloudW76lTX/uoaG8XZjfAQ3UvuldnPacb3bYJfR5
         Z3PgNoAsBSDvBVOgLOR9wx5WV33fIPoTKzo/feBRU+ceJhSE6g5cPlB0MuL18S7UJI7x
         NliwwvgKFAGNyE0k9qYZjBbT3nXJzWf+zYkvCZzqQ0lcT1tsvjnsAf2bAl2DzjBw6oAl
         wwCmMsCPHbaCahjZMeA2bO0xuBTN4w6vqc7wMgydYsHP/S5As+ObqNCuEIX6N95DCGZY
         Hg0HKWob0VH1rA75XS/ZfHMl7/Fh0dG8HgtomtWlDPtYQqqYtP1sF1JN1uUdmieN85EN
         Iw3g==
X-Forwarded-Encrypted: i=1; AJvYcCU3qfCcLiNz6tPqtOzOvPxBZWbaAeDlRT7D+40TmfZ2wyv5KLW5dhfl6vLKsLiEph/YF3tgtmGhHeq1RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMzZBZoVnvQa8s6J6mWiYsSJjGs7Qm7eI5C/s5orMjfREtFID8
	Ry94rUk/lI/S37JJOoAML+vVIk4fZRjcuY6SGlIx3sY279J4mMlciEKtkLWE+CNjK/mRiyGP/V0
	8J3kPx6pU5+J3z0Q7jc5a8m8CI5WSKg0=
X-Gm-Gg: ASbGncs+5LYySzigHa+4hZMQOLkVqQOYNgOR0pbYznSXJ8WivStYZBUNk1aYAWVvuNS
	i9dLCH1B+gRaRVDCliVvehN5hDiDEMKk68ubntLHOP0kD36EgUEDphHobyhC9xmtkazT927Y3Eq
	2QOFgxFXkMWBdzbUbp6xaB7+C7fkpDak7wcMFnCLs/Uuq9euC2wtmvx/IRwg5Cjf4BqMoQNrPiH
	eqzMlugdZfNi4827f62EqQR+JR6BM/N
X-Google-Smtp-Source: AGHT+IFm/oIsu7qDsX0wfkX/4rRGyXmNcjKCahVY0oyxsCw63+YdrtS8dwwkbketu33GXtMJGpAGQtg0qQ1vRQGYOmk=
X-Received: by 2002:a05:600c:3b08:b0:468:4350:c84d with SMTP id
 5b1f17b1804b1-46e6125ce14mr42980075e9.7.1759383680157; Wed, 01 Oct 2025
 22:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com> <2368735.QZUTf85G27@senjougahara>
 <CAPVz0n2pibxHzZS_s2i6ZzP1FEcUYCuH=aP8oM18RoivF4xY9A@mail.gmail.com> <3665995.U7HbjWM52l@senjougahara>
In-Reply-To: <3665995.U7HbjWM52l@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 2 Oct 2025 08:41:08 +0300
X-Gm-Features: AS18NWAY9WH6L95JzNeP4gxJ8y1IYPL2iVYCINKH0_51pXstYWsOZz_yoi4fL60
Message-ID: <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 2 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 07:00=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, October 1, 2025 4:59=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 1=
0:51 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wednesday, October 1, 2025 2:35=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=
=BE 08:07 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =
=D0=BE 07:38 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > >
> > > > > > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel=
 wrote:
> > > > > > > Simplify format align calculations by slightly modifying supp=
orted formats
> > > > > > > structure. Adjusted U and V offset calculations for planar fo=
rmats since
> > > > > > > YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 pl=
anes for U
> > > > > > > and V) so stride is width * 3/2, but offset must be calculate=
d with plain
> > > > > > > width since each plain has stride width * 1. This aligns with=
 downstream
> > > > > >
> > > > > > plane
> > > > > >
> > > > > > > behavior which uses same approach for offset calculations.
> > > > > > >
> > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++--=
----------
> > > > > > >  drivers/staging/media/tegra-video/vi.h      |  3 +-
> > > > > > >  2 files changed, 27 insertions(+), 34 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/dr=
ivers/staging/media/tegra-video/tegra20.c
> > > > > > > index 7c3ff843235d..b7a39723dfc2 100644
> > > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l=
2_pix_format *pix, unsigned int bpp)
> > > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  =
TEGRA20_MAX_WIDTH);
> > > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, =
TEGRA20_MAX_HEIGHT);
> > > > > > >
> > > > > > > -     switch (pix->pixelformat) {
> > > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > > -             pix->bytesperline =3D roundup(pix->width, 2) * =
2;
> > > > > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 *=
 pix->height;
> > > > > > > -             break;
> > > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > > > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix=
->height * 3 / 2;
> > > > > > > -             break;
> > > > > > > -     }
> > > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8)=
;
> > > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > > > >  }
> > > > > > >
> > > > > > >  /*
> > > > > > > @@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup(s=
truct tegra_vi_channel *chan)
> > > > > > >  {
> > > > > > >       unsigned int stride =3D chan->format.bytesperline;
> > > > > > >       unsigned int height =3D chan->format.height;
> > > > > > > +     unsigned int width =3D chan->format.width;
> > > > > > >
> > > > > > >       chan->start_offset =3D 0;
> > > > > > >
> > > > > > > @@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup(s=
truct tegra_vi_channel *chan)
> > > > > > >
> > > > > > >       case V4L2_PIX_FMT_YUV420:
> > > > > > >       case V4L2_PIX_FMT_YVU420:
> > > > > > > -             chan->addr_offset_u =3D stride * height;
> > > > > > > -             chan->addr_offset_v =3D chan->addr_offset_u + s=
tride * height / 4;
> > > > > > > +             chan->addr_offset_u =3D width * height;
> > > > > > > +             chan->addr_offset_v =3D chan->addr_offset_u + w=
idth * height / 4;
> > > > > > >
> > > > > > >               /* For YVU420, we swap the locations of the U a=
nd V planes. */
> > > > > > >               if (chan->format.pixelformat =3D=3D V4L2_PIX_FM=
T_YVU420)
> > > > > > > @@ -332,14 +321,14 @@ static void tegra20_channel_queue_setup=
(struct tegra_vi_channel *chan)
> > > > > > >               chan->start_offset_v =3D chan->addr_offset_v;
> > > > > > >
> > > > > > >               if (chan->vflip) {
> > > > > > > -                     chan->start_offset   +=3D stride * (hei=
ght - 1);
> > > > > > > -                     chan->start_offset_u +=3D (stride / 2) =
* ((height / 2) - 1);
> > > > > > > -                     chan->start_offset_v +=3D (stride / 2) =
* ((height / 2) - 1);
> > > > > > > +                     chan->start_offset   +=3D width * (heig=
ht - 1);
> > > > > > > +                     chan->start_offset_u +=3D (width / 2) *=
 ((height / 2) - 1);
> > > > > > > +                     chan->start_offset_v +=3D (width / 2) *=
 ((height / 2) - 1);
> > > > > > >               }
> > > > > > >               if (chan->hflip) {
> > > > > > > -                     chan->start_offset   +=3D stride - 1;
> > > > > > > -                     chan->start_offset_u +=3D (stride / 2) =
- 1;
> > > > > > > -                     chan->start_offset_v +=3D (stride / 2) =
- 1;
> > > > > > > +                     chan->start_offset   +=3D width - 1;
> > > > > > > +                     chan->start_offset_u +=3D (width / 2) -=
 1;
> > > > > > > +                     chan->start_offset_v +=3D (width / 2) -=
 1;
> > > > > > >               }
> > > > > > >               break;
> > > > > > >       }
> > > > > > > @@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegra2=
0_vi_ops =3D {
> > > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > > >  };
> > > > > > >
> > > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > > -{                                                    \
> > > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > > > -     .bpp     =3D BPP,                                 \
> > > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, B=
PP, FOURCC)      \
> > > > > > > +{                                                           =
         \
> > > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,        =
           \
> > > > > > > +     .bit_width      =3D BIT_WIDTH,                         =
           \
> > > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,         =
           \
> > > > > > > +     .bpp            =3D BPP,                               =
           \
> > > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,             =
           \
> > > > > > >  }
> > > > > > >
> > > > > > >  static const struct tegra_video_format tegra20_video_formats=
[] =3D {
> > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > > +     /* YUV422 */
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > > > > > >  };
> > > > > >
> > > > > > Looking at the code, BPP seems to only be used for the line str=
ide (i.e. bytes per line) calculation. I think we should just make it 8 for=
 the planar formats (possibly with an explaining comment). With the current=
 code, we end up with 'bytesperline' variables in places not being the actu=
al bytes per line, which is confusing.
> > > > > >
> > > > > > Actually, we can then just make the 'bpp' field be bytes per pi=
xel as it was before to avoid the discrepancy with Tegra210.
> > > > > >
> > > > >
> > > > > No, this code is actually cleaner and in sync with what downstrea=
m
> > > > > does, Tegra210 bytes per pixel is confusing since it totally negl=
ects
> > > > > formats with fractional bytes per pixel, it is impossible to set =
there
> > > > > 3/2 for example, which is used by YUV420.
> > > > >
> > > > > According to downstream code bytes_per_line =3D
> > > > > soc_mbus_bytes_per_line..., downstream directly name is bytes_per=
_line
> > > > > and soc_mbus_bytes_per_line returns width * 3 / 2 which is correc=
t
> > > > > calculation (12 bits). Meanwhile for planar formats Tegra has 3
> > > > > different buffers so with offset calculation plain width must be =
used
> > > > > (which matches downstream).
> > > > >
> > > >
> > > > If you mean use of BPP by VI, I can propose removing bytesperline a=
nd
> > > > sizeimage configuration from VI entirely and leave this to per-SoC
> > > > fmt_align function which does this already anyway and guards every
> > > > time those values are referred. This way there will be no instances
> > > > where "places not being the actual bytes per line" comes true.
> > >
> > > Without trying myself, I'm not sure what approach is the cleanest. In=
 any case, the downstream code is just wrong (or incorrectly named), so we =
shouldn't defer to it in this matter. I don't see a reason to keep the valu=
e '12' either if it doesn't serve any purpose (admittedly if we changed it =
to 8 or 1, 'bpp' would be a confusing name for it, but explainable with a c=
omment and improve-able later) I don't mind having an if/switch statement f=
or the planar formats to use a '8' as multiplier instead of '12' if we need=
 to keep the '12'. But the main thing I want to avoid is a bytesperline/str=
ide variable that isn't the line stride in bytes.
> > >
> >
> > I am proposing you a solution, handle bytesperline and sizeimage in
> > per-SoC fmt_align function.
>
> Ok, I think that sounds good. It's good to consolidate the calculation in=
 one place.
>
> >
> > 12 represents amount of bits used per pixel, 8 for Y plane, 2 for U
> > plane and 2 for V plane, total is 12. "but explainable with a comment
> > and improve-able later" why then we cannot use 12 with a comment? this
> > is all arbitrary. Downstream is not wrong from this perspective, you
> > don't take into account that YUV420 is planar and it uses 3 planes a
> > whole Y plane and 1/4 of U and V which in total results in wigth + 2 *
> > 1/4 width which is width * 3/2
>
> Yes -- but AIUI, the only thing the bpp value is used for the bytesperlin=
e calculation. When we add the special case for planar formats, which doesn=
't use the bpp value, then the value 12 is never used anywhere. We should a=
t least have a comment saying it is unused. (At that point, we could just h=
ardcode the bpp values in the fmt_align function -- but I don't mind either=
 way.)
>
https://ffmpeg.org/pipermail/ffmpeg-user/2023-June/056488.html

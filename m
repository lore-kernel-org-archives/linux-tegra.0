Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D36248F6A
	for <linux-tegra@vger.kernel.org>; Wed,  1 Oct 2025 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759305612; cv=none; b=GFYVQ73H7wudOLwTRo2IFh8jr7UWwA1gQyNu+znSENm5V0TUcrrwTtnA4OM4VXkxppl5X6hdJ6OxQ0ue6hfyd8fBHW7kIjwETCZZ4xBBoq8HTb51q5TSRVKCGyH4LTCXLs/Xf52wsROVB9l8TGilF3SGJNT0Dl1YGJW5BUzeOuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759305612; c=relaxed/simple;
	bh=wuUqFF309nz/clCCJyERVSGrY3Se9GNG3k5oDUfh5NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANEy1YFBds/drHEtIdGbNEP4CIMRSdO8GFvsfDEkl5RNeXrJlA5+iSVbgGdxaU9YfmvaMQc7oLOJ4FaEaAG8rAMzzU3Cjo4kpSG4jWXwOF1WnkhB6MhKPcHkf0MMaJYnvEyxEMu+3N04tnArAZCB9/t4uQV7IMwNciAPbcMMLwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dz7OD9dV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz7OD9dV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-421b93ee372so1632238f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 01 Oct 2025 01:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759305607; x=1759910407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgvIhudJPWmmbWLRWY3wSsTAkk+PhaMEZeeL7UN11p4=;
        b=Dz7OD9dVMbmIjqYN3sANS+OzBloiLXRfqF0sKPh8/+BpLqAB/PoaHFJjD9OELwruJV
         WclDxscq230Wp4jXXV7zFo+vTj80YAfSKFI7bypj6MK6xPnpyJCqb9ZeFxCcRTuxdqLk
         KfpEGHRf2weM0lDzbf6mPsHMrDb4rza01vRZemsaLkAzaF0qqp6QpEkbAeaPqsqsEXft
         637D12VRP0PF8kaedSYuOdfQVGDZvp1/ANKDiQMuGv46Qu1EEDeBKHG0mqYAVyNnxPOE
         6SThfzyoVWTHTevZIfOtL6m8aIHlEYzCRgWeW1s0FVnxtY/UALjS+jvQShKar2Plndcd
         uInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759305607; x=1759910407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgvIhudJPWmmbWLRWY3wSsTAkk+PhaMEZeeL7UN11p4=;
        b=eZkI40Xu4L0zE071Y2mLJf3P5jdPrjxNjCdDhkY85LZXy5CNkyXCjswjHf0X4y4Ltk
         aK78mWsYvRs6wzhNdQ7hOAuSce5PpbTV7nzZIuo8BIlDQZyIbBW7AEJwGn2AwbkwgToK
         wKOToTP4WB7w9U1ULNrA6h5MdUVhet39G4uRfUyV7TE5k6czG2RC4fkGlO5JEq1txX2m
         TiBsDoBGtfeyOimSj8R482kZKPvRNm64Aig7ROTwuPp7oPBtwI+Pw85ZsRF/GLH9qfUa
         M3PCYQUcoFgJd5mldjin2yNXE2lO81mQsI5F4kNetiXlQH7sL7kZeKe/OxIUwIGRGDWf
         Y4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCURjsvuZXjhziYnujEMXPG1/+f/quQk845rLMREec8V9T+Z5Pjy1B1+rNQJBCXlv4sqoUPyZiFU8vbANw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGQpv7hGeT6TCV0P6vNto2E0sccHbkJyVYUnh1zTxPpPn4ovbR
	Xp1defvocOpF1NE16PDWV2C9gx8WcBt8dn0Y1vXHV/8/oCnPwec3eKyo1cKOvh9Yx46YKAkNUeO
	AafJrI9hjjxMVWrkAxFlTYAFDyxjjYMw=
X-Gm-Gg: ASbGncurrmmSV4UxVa6QmKa9wjBeyMRA0CeuCqM7N4UlL1fgCZiJ60lV7eyJdioNqi5
	hPIYQnPZEUtxXbKWMQm+rEbhQu/N2kemJ+x0yIRNVG7Uv7ufToOkciyXMpBba1AxkkFhG3+0RvC
	gxLVOHL3ODBRJN5vYsJlvgerI1JTJGqtZjmn6sB/z/w/brtqAfyFp7IKt0cvnjx+VAoKyLW6thp
	OHfO+tFtJLOCWMW/XwWTwynpz5ii/Q7
X-Google-Smtp-Source: AGHT+IEts4aRS1BO8nAXriOkt4I9SxEvvg7R/qEIOy7/ouiuBhu5T7Gq5rXelG1LxyUQL2bgowrpZjpcR+lnlZbahyg=
X-Received: by 2002:a05:6000:2504:b0:3f5:453:77ea with SMTP id
 ffacd0b85a97d-42557821a3amr1754149f8f.58.1759305606332; Wed, 01 Oct 2025
 01:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com> <CAPVz0n2CRV8d1w1hp-60SQ_caBTFyJE8tJaWerwyEuZHD1p_Nw@mail.gmail.com>
 <CAPVz0n3-VvtjHDPKoFiipYQFx=Xq6hph8WW=xa2UaC7iDf1MyA@mail.gmail.com> <2368735.QZUTf85G27@senjougahara>
In-Reply-To: <2368735.QZUTf85G27@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 1 Oct 2025 10:59:55 +0300
X-Gm-Features: AS18NWC8gPCcqZlFeljfn-mUHnB1_xEKqf6p2IcGCjSYer2-1Jw0uJU_jBBnIZw
Message-ID: <CAPVz0n2pibxHzZS_s2i6ZzP1FEcUYCuH=aP8oM18RoivF4xY9A@mail.gmail.com>
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

=D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 10:51=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, October 1, 2025 2:35=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 0=
8:07 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE=
 07:38 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wro=
te:
> > > > > Simplify format align calculations by slightly modifying supporte=
d formats
> > > > > structure. Adjusted U and V offset calculations for planar format=
s since
> > > > > YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 planes=
 for U
> > > > > and V) so stride is width * 3/2, but offset must be calculated wi=
th plain
> > > > > width since each plain has stride width * 1. This aligns with dow=
nstream
> > > >
> > > > plane
> > > >
> > > > > behavior which uses same approach for offset calculations.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++------=
------
> > > > >  drivers/staging/media/tegra-video/vi.h      |  3 +-
> > > > >  2 files changed, 27 insertions(+), 34 deletions(-)
> > > > >
> > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/driver=
s/staging/media/tegra-video/tegra20.c
> > > > > index 7c3ff843235d..b7a39723dfc2 100644
> > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pi=
x_format *pix, unsigned int bpp)
> > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGR=
A20_MAX_WIDTH);
> > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGR=
A20_MAX_HEIGHT);
> > > > >
> > > > > -     switch (pix->pixelformat) {
> > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix=
->height;
> > > > > -             break;
> > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->he=
ight * 3 / 2;
> > > > > -             break;
> > > > > -     }
> > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > >  }
> > > > >
> > > > >  /*
> > > > > @@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup(struc=
t tegra_vi_channel *chan)
> > > > >  {
> > > > >       unsigned int stride =3D chan->format.bytesperline;
> > > > >       unsigned int height =3D chan->format.height;
> > > > > +     unsigned int width =3D chan->format.width;
> > > > >
> > > > >       chan->start_offset =3D 0;
> > > > >
> > > > > @@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup(struc=
t tegra_vi_channel *chan)
> > > > >
> > > > >       case V4L2_PIX_FMT_YUV420:
> > > > >       case V4L2_PIX_FMT_YVU420:
> > > > > -             chan->addr_offset_u =3D stride * height;
> > > > > -             chan->addr_offset_v =3D chan->addr_offset_u + strid=
e * height / 4;
> > > > > +             chan->addr_offset_u =3D width * height;
> > > > > +             chan->addr_offset_v =3D chan->addr_offset_u + width=
 * height / 4;
> > > > >
> > > > >               /* For YVU420, we swap the locations of the U and V=
 planes. */
> > > > >               if (chan->format.pixelformat =3D=3D V4L2_PIX_FMT_YV=
U420)
> > > > > @@ -332,14 +321,14 @@ static void tegra20_channel_queue_setup(str=
uct tegra_vi_channel *chan)
> > > > >               chan->start_offset_v =3D chan->addr_offset_v;
> > > > >
> > > > >               if (chan->vflip) {
> > > > > -                     chan->start_offset   +=3D stride * (height =
- 1);
> > > > > -                     chan->start_offset_u +=3D (stride / 2) * ((=
height / 2) - 1);
> > > > > -                     chan->start_offset_v +=3D (stride / 2) * ((=
height / 2) - 1);
> > > > > +                     chan->start_offset   +=3D width * (height -=
 1);
> > > > > +                     chan->start_offset_u +=3D (width / 2) * ((h=
eight / 2) - 1);
> > > > > +                     chan->start_offset_v +=3D (width / 2) * ((h=
eight / 2) - 1);
> > > > >               }
> > > > >               if (chan->hflip) {
> > > > > -                     chan->start_offset   +=3D stride - 1;
> > > > > -                     chan->start_offset_u +=3D (stride / 2) - 1;
> > > > > -                     chan->start_offset_v +=3D (stride / 2) - 1;
> > > > > +                     chan->start_offset   +=3D width - 1;
> > > > > +                     chan->start_offset_u +=3D (width / 2) - 1;
> > > > > +                     chan->start_offset_v +=3D (width / 2) - 1;
> > > > >               }
> > > > >               break;
> > > > >       }
> > > > > @@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegra20_vi=
_ops =3D {
> > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > >  };
> > > > >
> > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > -{                                                    \
> > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > -     .bpp     =3D BPP,                                 \
> > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, =
FOURCC)      \
> > > > > +{                                                               =
     \
> > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,            =
       \
> > > > > +     .bit_width      =3D BIT_WIDTH,                             =
       \
> > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,             =
       \
> > > > > +     .bpp            =3D BPP,                                   =
       \
> > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,                 =
       \
> > > > >  }
> > > > >
> > > > >  static const struct tegra_video_format tegra20_video_formats[] =
=3D {
> > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > +     /* YUV422 */
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > > > >  };
> > > >
> > > > Looking at the code, BPP seems to only be used for the line stride =
(i.e. bytes per line) calculation. I think we should just make it 8 for the=
 planar formats (possibly with an explaining comment). With the current cod=
e, we end up with 'bytesperline' variables in places not being the actual b=
ytes per line, which is confusing.
> > > >
> > > > Actually, we can then just make the 'bpp' field be bytes per pixel =
as it was before to avoid the discrepancy with Tegra210.
> > > >
> > >
> > > No, this code is actually cleaner and in sync with what downstream
> > > does, Tegra210 bytes per pixel is confusing since it totally neglects
> > > formats with fractional bytes per pixel, it is impossible to set ther=
e
> > > 3/2 for example, which is used by YUV420.
> > >
> > > According to downstream code bytes_per_line =3D
> > > soc_mbus_bytes_per_line..., downstream directly name is bytes_per_lin=
e
> > > and soc_mbus_bytes_per_line returns width * 3 / 2 which is correct
> > > calculation (12 bits). Meanwhile for planar formats Tegra has 3
> > > different buffers so with offset calculation plain width must be used
> > > (which matches downstream).
> > >
> >
> > If you mean use of BPP by VI, I can propose removing bytesperline and
> > sizeimage configuration from VI entirely and leave this to per-SoC
> > fmt_align function which does this already anyway and guards every
> > time those values are referred. This way there will be no instances
> > where "places not being the actual bytes per line" comes true.
>
> Without trying myself, I'm not sure what approach is the cleanest. In any=
 case, the downstream code is just wrong (or incorrectly named), so we shou=
ldn't defer to it in this matter. I don't see a reason to keep the value '1=
2' either if it doesn't serve any purpose (admittedly if we changed it to 8=
 or 1, 'bpp' would be a confusing name for it, but explainable with a comme=
nt and improve-able later) I don't mind having an if/switch statement for t=
he planar formats to use a '8' as multiplier instead of '12' if we need to =
keep the '12'. But the main thing I want to avoid is a bytesperline/stride =
variable that isn't the line stride in bytes.
>

I am proposing you a solution, handle bytesperline and sizeimage in
per-SoC fmt_align function.

12 represents amount of bits used per pixel, 8 for Y plane, 2 for U
plane and 2 for V plane, total is 12. "but explainable with a comment
and improve-able later" why then we cannot use 12 with a comment? this
is all arbitrary. Downstream is not wrong from this perspective, you
don't take into account that YUV420 is planar and it uses 3 planes a
whole Y plane and 1/4 of U and V which in total results in wigth + 2 *
1/4 width which is width * 3/2

> >
> > > > >
> > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/sta=
ging/media/tegra-video/vi.h
> > > > > index bfadde8858d4..5cbc0606ed6c 100644
> > > > > --- a/drivers/staging/media/tegra-video/vi.h
> > > > > +++ b/drivers/staging/media/tegra-video/vi.h
> > > > > @@ -281,7 +281,8 @@ enum tegra_image_dt {
> > > > >   * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
> > > > >   * @bit_width: format width in bits per component (for CSI/Tegra=
210 only)
> > > > >   * @code: media bus format code
> > > > > - * @bpp: bytes per pixel (when stored in memory)
> > > > > + * @bpp: bytes per pixel (when stored in memory) for Tegra210,
> > > > > + *    bits per pixel for Tegra20/Tegra30
> > > > >   * @img_fmt: image format (for CSI/Tegra210 only)
> > > > >   * @fourcc: V4L2 pixel format FCC identifier
> > > > >   */
> > > > >
>
>
>
>

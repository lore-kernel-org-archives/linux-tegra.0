Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792775432;
	b=JnA+GMBD0TQRpWTFcd7SUuYzMv4A6uNkVAOfiBKMssGc7Zk6CDePtlElqKT8ODqtOnM1
	 BCKNyTu+lv2kJxESa3XKWK2FfMB4J0/RPI+i1UTV4UgOTWTW2fB/bhhgM9TnOvtgaf5mn
	 C0ZoOMDByX/RnSTjmPfZIOnY3wN8SaC71T1RHsvq+ERozKv3jhwxuVeMLSLpObMY6R58d
	 lqlAM/S0tiVHAPewItNasfRexE/52EBoQ0SrAPVA34LOjxdB6/OkVFTkxrVGstF6HfN+S
	 oIK+saafXPHlLJQdoowwSdb/j8ydHTiz2UayK0UousDw0wNXqn7kSwPXL8SIqWNCMZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pj8A3rSmJmNvzPlzPefmcAJjoKNzu926Z64+RZduhAM=;
	b=GIR7d+u2a1MAW5JaE6XKyCRkazLMCVPaEfuqwgTZZ4F0L0WECbuBbn/QxyKjg++6R4PO
	 bsE+NXC0rDTZbNBoK7S96kf1Hl9D96ZTobxPKZ3oygSGNBTeEnZPnOj/ManNBKw+nus5S
	 8lVisDGPZDWio7kypERZ2acLUyb2XjmiXHKd+UTeAa7GfNuHdkmePcrnQJ60CQwb7I3r9
	 5fzJIuNDkZ9BLVnA5T9S+cqZSAWpskRrtaS/G34M605X6wjbxQto0L/eXGQs7tcF+fq52
	 EYBqzbMX3RqyoOcuchh7z1NwEcdwJ6gMOje5je88L+7sVaOvHZI6tIEgwHINVfIIiCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gPjmpRsZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C59B606A31B
	for <linux-tegra@vger.kernel.org>; Fri, 23 Oct 2026 17:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C59B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gPjmpRsZ
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso8582031fa.3
        for <linux-tegra@vger.kernel.org>; Fri, 23 Oct 2026 10:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792775429; cv=none;
        d=google.com; s=arc-20260327;
        b=hvaIKdmmKvOvEnuebEyzgRX4v0wCTVfKvyfmFa7I1vfjAPEQO3bZ3eGLHMxxWH+Gyt
         HC0IPRBVAhgagjtx3ppkFCfHcJP5Mrqyk+0hgOcNhvH4Gna4cfpd5WQeEzbtIf4ekKLg
         blXVKDc+PZUQyXxHTUkhCf71Okk0C0tJLyx4xeu2KBvWo5MdevvSPfbAXP8TCiXmB/o7
         gMALY/Xqo6PDV8Ysq7ASTWFJSF8Kr7yrjcvIBGXmRgyhj7is9gAFGuYBUGI36A7NqWXj
         kARzaTg2FqRI6EXApxfP7hP9M1xzJwk19meGuwBKIMzRQHdkrqeCfM6vzg1YVnId/4zj
         b5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pj8A3rSmJmNvzPlzPefmcAJjoKNzu926Z64+RZduhAM=;
        fh=rtgj+ppye3dvdKQEah8xI+ARE/Eqq1RNu99mCCRfqrI=;
        b=Q0PJd09I20nLriojQjRL5gzanYNVVcT/EHpwTqz64RPiFEthnVUU7ctOGbaNDNeFVa
         1P39E+58PPQwDzi6ND9I05sqHJzZTLBWMW/ktuHBVckJpl3UbQ/C77S+2/w4VAm9EN4x
         ianMgPyVHa7HMmUOobO2F0JwKQ2Br8fdoeoirBHISkvdWvnRsARyCmhoncjXeNZfm2mf
         P2Sg/fDg7lRxFeZ4vdrnyNJxz4cui+b3CBpWRIiuFOqkHb21YoMDSRcNQ71Y2irvqCmG
         s3+RXArKgUe3un4NIKWeFwlBAh4mqUOAQwUkKvdWMOe9pp/kLTmG5Kfh2NzjDHk5lqXG
         ggkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792775429; x=1793380229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pj8A3rSmJmNvzPlzPefmcAJjoKNzu926Z64+RZduhAM=;
        b=gPjmpRsZXPFANVVc9LHFlbKjrDCznsGMpsXYE+IZ1oJaItMDkTdO5kBse5bKfUN12J
         sDZPCqptS9QN3f7VFBfjPyeMIBNixKl6EwGEgNSXSH8xvYJ6x8pjf86QnUHjvzcBkkq2
         yBwMYi/Ti4fgpSKzn8YNOrRT8lPNde2MUJMdO7q3NgZNgIBdWRsUwnfSyQ5r/2+xHKDg
         R83UzejZhRIZVR0GrKlO8Oru9CO+AOkLqdRTspItGc+wrZEhmb2WWu0tN4OcOTW3R4kn
         QIF0gIcFAZ03Jm+wGmgDGvZWA0Q3+SoyP2AReCI/jsPhaWcLLRgUBaL8h27D/0u99/E8
         7T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775429; x=1793380229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pj8A3rSmJmNvzPlzPefmcAJjoKNzu926Z64+RZduhAM=;
        b=gTVrCIkYozh+NdgGKlwUYErB4F+6p6UFC0uD3PpNfNFy6yncJpu7aJpdF12Hqt9ob5
         N52sjAIDYagWdSDpQTwtAx5iGV74Fg+JazHhEA0MSiQ+50TCCCeqGSNjdsP82X/cVw5o
         wtQBM9bryXNnYb6QJZ9RHz5AkNC51pmxJsZZG2N3jYwiyX2fp5hLyXYCuQXW/250NVXa
         +iPVhvyMdN08jcCYOo4IeQmLsBRPxYbasKjI3AbX22roTDnTZWfRvhrcLb7Kg0fDVesL
         ygXd7BlIAazuSY+6h5gN0s1UMRNt6n09Hv1pP4EfW9F6AaqVWXCv6QK0bVz5CSqZLECq
         7UqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw873c9in285EZrZSt8/6PD/6foah/bcRRz2VRAk4oFDvB+x9SKHy221uUJMgd99dTkPbKkIgrcUIzIFw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL6stfUiPWAjW+uIXuEo6G9lNP8/JGy27fGTQcrO2Usto3KVtXp
	BA9C3IqR35ZPdAZHMCgie6RS23N55dHndyJs2ZetheKrV1vYqMLrHkTWa1eqX2oFarykCVBJXsA
	HDhWw6V40iv7TL8FODatbFFkLeewmJpU=
X-Gm-Gg: AYBFou3kxq6y0vdA2VgIdK5mPVLX5yUbUrPXXrg6XQYtgPSLF3J5T6IRDBJTUwsJ97e
	/GUDGCvoZ6eADTlkkTv9W8O5nJwwz8hh+1RGjEjExzm9ShMoC8wZd4G+XLYl+ivuibArtjOfQZ4
	jnBKcPLpxBHgB+xNKqeCBuRSCfrPM+axrikvHJBJ3S2Q4mF7AVmWwu5RP+Jri8HGRSg812ubFMu
	nv6JLdseDKmzRXHg7YP85nCLOqMMfs03+tatBBGhyFKu19KVgD52kfWW9Zv6lOQS/sLoHv5wo6z
	7ISeL8eAJ/1dkB4KeiO/cL+GQEiw9qtjiP58+6yw6Psp6evpJNSgc1Xfm8YD1wvqYxoUIHAZX27
	tUx5MG8b1N2NYyVJy6EewqYjMiLk1X4pTjTWba8LVE2luCIFPljqqXZ7y4jQXSXAvNC9BkqmaCn
	1V/ZM+f31877hQ38m0mtbsDYIjW7X7Yb32McDVm3c9n/wYoA==
X-Received: by 2002:a2e:bc03:0:b0:3a9:d407:41f6 with SMTP id
 38308e7fff4ca-3ac6637e917mr7554071fa.26.1792775428982; Fri, 23 Oct 2026
 10:10:28 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-tegra-drm-yvu420-v3-0-7f19a834ba98@gmail.com>
 <20261020-tegra-drm-yvu420-v3-2-7f19a834ba98@gmail.com> <T1504rPqStSSyO9jl0by8w@nvidia.com>
In-Reply-To: <T1504rPqStSSyO9jl0by8w@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 23 Oct 2026 12:10:16 -0500
X-Gm-Features: AclHuK_EWEzi1LRHTLo8d432RWvCE3Or3aR7BVm1bRRWxd52gg2ACpR1Zr921BI
Message-ID: <CALHNRZ8TeQ-MdnDrtDG1b0s3phrO2gega_Kj5bCxFL75o4rTrg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tegra: Support YVU formats
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:10=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Tuesday, October 20, 2026 5:10=E2=80=AFPM Aaron Kling via B4 Relay wro=
te:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > YVU420 is used by AOSP for video playback among other things. YVU422 an=
d
> > YVU444 can be trivially supported in the same manner, so add them as
> > well.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c    |  7 +++++++
> >  drivers/gpu/drm/tegra/hub.c   |  2 ++
> >  drivers/gpu/drm/tegra/plane.c | 24 ++++++++++++++++++++++++
> >  3 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 39c2e920d76a6..be913f2609077 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -1282,6 +1282,8 @@ static const u32 tegra20_overlay_formats[] =3D {
> >       DRM_FORMAT_YUYV,
> >       DRM_FORMAT_YUV420,
> >       DRM_FORMAT_YUV422,
> > +     DRM_FORMAT_YVU420,
> > +     DRM_FORMAT_YVU422,
> >  };
> >
> >  static const u32 tegra114_overlay_formats[] =3D {
> > @@ -1309,6 +1311,8 @@ static const u32 tegra114_overlay_formats[] =3D {
> >       DRM_FORMAT_YUYV,
> >       DRM_FORMAT_YUV420,
> >       DRM_FORMAT_YUV422,
> > +     DRM_FORMAT_YVU420,
> > +     DRM_FORMAT_YVU422,
> >       /* semi-planar formats */
> >       DRM_FORMAT_NV12,
> >       DRM_FORMAT_NV21,
> > @@ -1349,6 +1353,9 @@ static const u32 tegra124_overlay_formats[] =3D {
> >       DRM_FORMAT_YUV420, /* YU12 */
> >       DRM_FORMAT_YUV422, /* YU16 */
> >       DRM_FORMAT_YUV444, /* YU24 */
> > +     DRM_FORMAT_YVU420, /* YV12 */
> > +     DRM_FORMAT_YVU422, /* YV16 */
> > +     DRM_FORMAT_YVU444, /* YV24 */
> >       /* semi-planar formats */
> >       DRM_FORMAT_NV12,
> >       DRM_FORMAT_NV21,
> > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > index 5a86f8260f136..ac4542e54d7dd 100644
> > --- a/drivers/gpu/drm/tegra/hub.c
> > +++ b/drivers/gpu/drm/tegra/hub.c
> > @@ -51,6 +51,8 @@ static const u32 tegra_shared_plane_formats[] =3D {
> >       DRM_FORMAT_YUYV,
> >       DRM_FORMAT_YUV420,
> >       DRM_FORMAT_YUV422,
> > +     DRM_FORMAT_YVU420,
> > +     DRM_FORMAT_YVU422,
> >  };
>
> Well, I just tested this and it looks like the nvdisplay/hub.c based
> display controllers don't support planar YUV422. So that's an existing
> bug in the driver but I think anyway we shouldn't advertise YVU422.. :)
>
> Could you respin one more time and drop YVU422 from hub.c? You can add a
> patch to drop YUV422 as well or I can follow up with one, either way is
> fine by me.

I can send a new revision, sure. Dropping yuv422 from nvdisplay seems
out of scope of the series, though. I'd think it would make more sense
to make that standalone with a fixes tag so it can move more quickly.

Aaron

> Thanks
> Mikko
>
> >
> >  static const u64 tegra_shared_plane_modifiers[] =3D {
> > diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plan=
e.c
> > index 757bc552809fe..79ef5fc1b3678 100644
> > --- a/drivers/gpu/drm/tegra/plane.c
> > +++ b/drivers/gpu/drm/tegra/plane.c
> > @@ -433,14 +433,38 @@ int tegra_plane_format(u32 fourcc, u32 *format, u=
32 *swap, bool *swap_uv)
> >               *format =3D WIN_COLOR_DEPTH_YCbCr420P;
> >               break;
> >
> > +     case DRM_FORMAT_YVU420:
> > +             if (!swap_uv)
> > +                     return -EINVAL;
> > +
> > +             *format =3D WIN_COLOR_DEPTH_YCbCr420P;
> > +             *swap_uv =3D true;
> > +             break;
> > +
> >       case DRM_FORMAT_YUV422:
> >               *format =3D WIN_COLOR_DEPTH_YCbCr422P;
> >               break;
> >
> > +     case DRM_FORMAT_YVU422:
> > +             if (!swap_uv)
> > +                     return -EINVAL;
> > +
> > +             *format =3D WIN_COLOR_DEPTH_YCbCr422P;
> > +             *swap_uv =3D true;
> > +             break;
> > +
> >       case DRM_FORMAT_YUV444:
> >               *format =3D WIN_COLOR_DEPTH_YCbCr444P;
> >               break;
> >
> > +     case DRM_FORMAT_YVU444:
> > +             if (!swap_uv)
> > +                     return -EINVAL;
> > +
> > +             *format =3D WIN_COLOR_DEPTH_YCbCr444P;
> > +             *swap_uv =3D true;
> > +             break;
> > +
> >       case DRM_FORMAT_NV12:
> >               *format =3D WIN_COLOR_DEPTH_YCbCr420SP;
> >               break;
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

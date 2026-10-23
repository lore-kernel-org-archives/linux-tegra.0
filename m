Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792742831;
	b=jf3N7W2NLWo3gTNUCJDvolx3aiMI5iZZvUs0wgsZhk5xp0MBo4LPmYsuklhrHUlkSDvh
	 OrHKeK3NOFov/OLbNQXJPCgeLuwJKWZSC7O/GAqSOCXpe4WRBQTutMq4/nZkqydewvkAF
	 xekdzMTtzExbeDTxs4axcH3vtB6v1TjmgSjnAVdhCTG0JUW1ca5e7unK+PWi48FeFM/YL
	 wVi2dEPzOsFRzFkcktrsRTpos3475UORXCxF9XqVgHOcNj0dcVui3TUR3qxhGW0bfiVS7
	 wlO112NnsAW2luk/8twK6r3Avm3H7Bo9M8Bj18QghHQoLKgEfv5LmMOeOZs+/0NquGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NnvImXqrDQ/+gM4kxWTSIgQWWDlFGoCxyR2kWQPVQtg=;
	b=zu4EE+3Qb++l6j3edGt1/5qPFoAgeffiUiArbZpovFiv+aSaP44zV1ctgUo2W5gIsUzZ
	 R3gM+L7/PeXiG7j5+n8omwX1syaiTGWGiks1LNTa/tOZGa6ixvf0jb/XKoqBiL/qlSsxW
	 E3O/yExQxbqtwLk2hq3kFEPlP1Xog40tsU/LO83/YXFIxyYdI2ZeOtJW9p6g7nbbuNMp/
	 y64f6JsNcejEnLwMTkMjMyljr48QCXo76PoxBXtSLiW4Y0cSe7NbdSJxheVOhvp48eVvy
	 FervcKJVkNdDHMzHOx2mSzAagUxXSmXPUP2KfQwBo7vQlqmqMMw9t1J7njNR9WffnIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgBrPVzq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC3B606A31D
	for <linux-tegra@vger.kernel.org>; Fri, 23 Oct 2026 08:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC3B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgBrPVzq
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35829219da8so1946863eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 23 Oct 2026 01:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792742830; cv=none;
        d=google.com; s=arc-20260327;
        b=L9yHpf73JZldfBjnJoazvXrLkzWKsKyMjDXiTfUzGmT3isnmRcxi7SYrCdAjm91Kh1
         s80BIT2EPsdvcikZ3A+NWxuRZ7SW99LOlXPOO+Kq9oQgY1gbpS/wQz8YM9bagwmXP/vQ
         xKPUFQq+wHm7DW82xcPFhEdQTEfclBqqI2CL/qdL1jCHcAhx1geL5N3uRMk8X7mLb7jI
         GBm8oBwhtBRmxzRyhM7G4SSuvblcdWZ2PG6HDsDw8VNYVurdxMLq3WnUbEsyMBuBBPiD
         clwyUX8QugkKCIYK+dplSYGeHZoXjKDFpdMTxcsw3Q+WDzfl/B5jUZBPRQz/vrkg0uQ5
         NQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NnvImXqrDQ/+gM4kxWTSIgQWWDlFGoCxyR2kWQPVQtg=;
        fh=dFqO5hiZvn2Q52iKcbQq3MmNbNCb/0F9c6hJtR1ko7U=;
        b=SDK9/1RGfj987JQAaoFXPvGC5MYIbm+5Tlu8IfbvvxBO+yXqVhom/TKh41mGlIoyAH
         HlUOGdfF1B/eXKpZgFE7v0OE1bhiZ99ggtGA8Ad07mPxnHWcKSYNDHDKgfcPJUGPjLmE
         T0hfHZpaevVa5fgwob6IjqKHtglP2zDbvMvgNjrvbW3F1Dxt5dtTxbIx1q7m/+Z2tT5h
         NGOk5h8H2dlkJZH6jOO7PG9vvj9NaSXq1SWNUaTxooSu7Gzk1FRWVMGBQf1d+EHf4QHe
         zKRU0w4vJ88Ic8fkduNJLCwtmR7g2r1OWeFyJNItfU+ZMNQP5Sg49TC+1VXQLKF2LWzl
         IQVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792742830; x=1793347630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NnvImXqrDQ/+gM4kxWTSIgQWWDlFGoCxyR2kWQPVQtg=;
        b=jgBrPVzqsjDVKizM/9Djt4MRH0wUPhoMdeMCRHaXlJuEMyNSRwMOuh9WWoQ0zFtlzH
         xvX/5FPQSGvX3f8bn3U/WW4/hIAuSS7KjxdgNEfKcPv+eK/YI17hYcAKLIgci7NWND3S
         nf5xoAPu9FgRcpRGzNdehU8yzALLhiIaTk/YNaNCtgZSjt3WmNHDQRYToUHsYAZDzuht
         juvhQUB2q+yaennRu/MeDT2QBZVbE74ms80e7b/Kd33M7Hr3YyyR6Gs4GORlWuokLYHr
         vm8H6E28N+/Z4AP2oUtepgaJ+Ajt8HpJ9/3V+6wvChW8DSLrwM31BR4XMwCk38sHTeKO
         b3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742830; x=1793347630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnvImXqrDQ/+gM4kxWTSIgQWWDlFGoCxyR2kWQPVQtg=;
        b=XRdAmCbPshkX4AjGjLg6Tm9m4pCQNO+uEN5pbO4TGkqJAQQ3MVmouo2njkzwyEXYEP
         kRJs07mAqWGFZublGdG2kXC+DfyZppoEGsXrhtqRSjLW33FEevvoiUAJYJ9pxgnmXaEe
         lHfHF3wGVCCzpUbZ8001twtiizhy6N3JLfOHJDEs+dsnYpqf2HUaV2xe6N8G3ppcc+cv
         dx7pz1qiPrb6/0kZW3YJj7wDmNY4E/D3vIYUJYyd8/F9zWggVk8QrGBVv5t3rncIfV6w
         jS/og9cG4k9kvgLTVJ5AaE5fq8qZnRB+KYWGtCQI5Qk00YrnP0OFe4yH6FVt4nvMJ/ZS
         OeUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQQzUVBtrf74BI9ZHqnt16KgHGpYAnJHxNzMnnqB8+vZLFYj6BXLHiDitHeQTUGBoGc50vMPyVU6wPeA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKBj4EH7MmswjXgpZUbzuF3YD38CMtne39w9UywRL4u7Al6V4p0
	xSUsgxPp0knFhri3PxMYBWUycj+W+mNSq69jjdXChKM1SjliB3mSjZL9GXSxu2MyWZrWYACGr5x
	wfJLY/uOlR6y2FzlZ7MHxnbgIHgWir5U=
X-Gm-Gg: AYBFou0akQy4Zll16z269O8DRuDPU1eN9ZhBHqOIO5Vi3ib8cdha3ZF14YZyWfHlh3g
	bzzUo+6ktbdxmaEAw/VW39fPTBwUwP0xbqvp0J1EUAwEySdXNEyFEpmn6K/AhH3VwOqOtHs8mNA
	dds68WMq7SQd9pZcuhsnF7Lj6AtI3fUvLBZs2pYFTugXZFGMLWjXsoSVCazSJUYjiRHWu+r5UPU
	jRvZzDeK5ZvlHkUmc9L1oU7p3rN71ng4HNUuDY1gOEuWTKntvlxDx0ewhaffpFbX4LbUawgsb0u
	p+cKq2PbtsQUiXadBy/L07LEyNHDy6Fhb5y6YcSKBC6HtSG4FlLy52ZgzlhgZ0OM0BO6UiDA9GV
	336bgVjXPTgC1aXNGNgKh3EkqN+KmYFzphN3MIACG2mqnxbk2DQm612n+iiQMKbNsikKwYw==
X-Received: by 2002:a05:7300:ff43:b0:358:c5c9:2661 with SMTP id
 5a478bee46e88-369d9825511mr1710525eec.10.1792742829641; Fri, 23 Oct 2026
 01:07:09 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <20261022132259.240717-5-clamor95@gmail.com>
 <Rqw6Z6zYRbyIFoTAHJtpuw@nvidia.com>
In-Reply-To: <Rqw6Z6zYRbyIFoTAHJtpuw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 23 Oct 2026 11:06:55 +0300
X-Gm-Features: AclHuK_5rggW1YEyeeWCARrgxFz7VynuFiVi0IUrlR8AYmBGFbwzWkAjfApMGS0
Message-ID: <CAPVz0n1dRyoMXNJe4ewY_3YQcaKFXQ08ROvNJr4=HRz4UDBeHw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] drm/tegra: dc: Expand available registers layouts
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:1=
4 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, October 22, 2026 10:22=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Expand existing DC register definitions with additional fields in
> > preparation for adding the 8-bit CPU interface.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c |  3 ++-
> >  drivers/gpu/drm/tegra/dc.h | 49 +++++++++++++++++++++++++++++++++-----
> >  2 files changed, 45 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index b0bfa946e6979..5c67928bcabfa 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_c=
rtc *crtc,
> >
> >       if (dc->rgb) {
> >               /* XXX: parameterize? */
> > -             value =3D SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
> > +             value =3D SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
> > +                     SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
> >               tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
> >       }
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 0cb0515968b35..7005df32f485f 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define DC_COM_CRC_CHECKSUM                  0x301
> >  #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
> >  #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
> > +#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
> >  #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
> >  #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
> > +#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
>
> Please update the existing defines to use BIT(n) as well, and align the
> define values (incl. the lines around here that are already there) like
> elsewhere in the file. Also, currently it's hard to tell which register
> each bit define corresponds to, so I'd like some comments like ..
>
> /* DC_COM_PIN_OUTPUT_POLARITY(0): */
> #define ...
> #define ...
>
> > +#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
>
> Please move this below the DC_COM_PIN_OUTPUT_SELECT(x) define.
>

Sure, I will refactor this header in a more readable manner.

> >  #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
> >  #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
> >  #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
> > @@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
> >
> >  #define DC_DISP_DISP_SIGNAL_OPTIONS0         0x400
> > -#define H_PULSE0_ENABLE (1 <<  8)
> > -#define H_PULSE1_ENABLE (1 << 10)
> > -#define H_PULSE2_ENABLE (1 << 12)
> > +#define H_PULSE0_ENABLE                              BIT(8)
> > +#define H_PULSE1_ENABLE                              BIT(10)
> > +#define H_PULSE2_ENABLE                              BIT(12)
> > +#define V_PULSE0_ENABLE                              BIT(16)
> > +#define V_PULSE1_ENABLE                              BIT(18)
> > +#define V_PULSE2_ENABLE                              BIT(19)
> > +#define V_PULSE3_ENABLE                              BIT(20)
> > +#define M0_ENABLE                            BIT(24)
> > +#define M1_ENABLE                            BIT(26)
> >
> >  #define DC_DISP_DISP_SIGNAL_OPTIONS1         0x401
> >
> > @@ -451,12 +460,26 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define BASE_COLOR_SIZE_888    (  8 << 0)
> >  #define BASE_COLOR_SIZE_101010 ( 10 << 0)
> >  #define BASE_COLOR_SIZE_121212 ( 12 << 0)
> > +#define DISP_COLOR_SWAP_BGR  BIT(16)
> >  #define CMU_ENABLE_ENABLE      (1 << 20)
> >
> >  #define DC_DISP_SHIFT_CLOCK_OPTIONS          0x431
> > -#define  SC1_H_QUALIFIER_NONE        (1 << 16)
> > -#define  SC0_H_QUALIFIER_NONE        (1 <<  0)
> > -
> > +#define SC0_H_QUALIFIER(x)                   (((x) & 0x7) <<  0)
> > +#define SC1_H_QUALIFIER(x)                   (((x) & 0x7) << 16)
> > +#define SC_H_QUALIFIER_DISABLE                       0
> > +#define SC_H_QUALIFIER_NONE                  1
> > +#define SC_H_QUALIFIER_HACTIVE                       2
> > +#define SC_H_QUALIFIER_EXT_HACTIVE           3
> > +#define SC_H_QUALIFIER_HPULSE                        4
> > +#define SC_H_QUALIFIER_EXT_HPULSE            5
> > +#define SC0_V_QUALIFIER(x)                   (((x) & 0x7) <<  3)
> > +#define SC1_V_QUALIFIER(x)                   (((x) & 0x7) <<  19)
> > +#define SC_V_QUALIFIER_NONE                  0
> > +#define SC_V_QUALIFIER_RSVD                  1
> > +#define SC_V_QUALIFIER_VACTIVE                       2
> > +#define SC_V_QUALIFIER_EXT_VACTIVE           3
> > +#define SC_V_QUALIFIER_VPULSE                        4
> > +#define SC_V_QUALIFIER_EXT_VPULSE            5
> >  #define DC_DISP_DATA_ENABLE_OPTIONS          0x432
> >  #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
> >  #define DE_SELECT_ACTIVE        (1 << 0)
> > @@ -493,6 +516,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define DC_DISP_CURSOR_POSITION_NS           0x441
> >
> >  #define DC_DISP_INIT_SEQ_CONTROL             0x442
> > +#define SEND_INIT_SEQUENCE                   BIT(0)
> > +#define INIT_SEQUENCE_MODE_SPI                       BIT(1)
> > +#define INIT_SEQUENCE_MODE_PLCD                      0x0
> > +#define INIT_SEQ_DC_SIGNAL_SHIFT             4
> > +#define INIT_SEQ_DC_SIGNAL_MASK                      (0x7 << INIT_SEQ_=
DC_SIGNAL_SHIFT)
> > +#define NO_DC_SIGNAL                         0
> > +#define DC_SIGNAL_VSYNC                              1
> > +#define DC_SIGNAL_VPULSE0                    2
> > +#define DC_SIGNAL_VPULSE1                    3
> > +#define DC_SIGNAL_VPULSE2                    4
> > +#define DC_SIGNAL_VPULSE3                    5
> > +#define INIT_SEQ_DC_CONTROL_SHIFT            7
> > +#define FRAME_INIT_SEQ_CYCLES_SHIFT          8
> > +
> >  #define DC_DISP_SPI_INIT_SEQ_DATA_A          0x443
> >  #define DC_DISP_SPI_INIT_SEQ_DATA_B          0x444
> >  #define DC_DISP_SPI_INIT_SEQ_DATA_C          0x445
> > --
> > 2.53.0
> >
> >
>
>
>
>

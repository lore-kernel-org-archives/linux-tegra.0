Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795852439;
	b=LThxT++SDIaHpNp8jdvILr0bbsJbltuusIb+fO3KqhzeLsqs5RlqqjggxY4k7pcK6EeI
	 owlZelm1XspIa/VwIOy+g+q0xAay0eVaacnVSMS+i3g5VNlQ4423JdT0uQc/yUsVRh9TA
	 TJrxF9nm1mcrzrH4FfqPQLOv0dSgrfOH995Ip9tcDsR8Evqy2fkcIR9qwJbLlYhaXa1Lc
	 YnpcyadiTJ5SxN4lR1GPGk3qA9itp1onLoX6I6JeHNza55P5fSRLlDbAjY1i1oiol2/VY
	 b4y681ndFgAW7HfMkg9Kz/ktgZHb9VNPHs/FSjiO4d1Wr+KvHTwFLIjAhAxuYv6KmvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3E26Yt2ovRK5OMZtgqMHVcJ89/Y9SO5NO/MzyS43R8M=;
	b=j79a37+g2NnvRPGxjzELWWz9pHwqnBjZMrr1ODWb+puRESMred9kOx2BencdPhuaVVmO
	 MprZkm97AXG6z3nzJllTF9tV4ija0EV2wWitx9zEg5xBKL6qpE+0I+qiacl0Mx3HbUvGK
	 +8LeLM6V2nAoFVOYOW2owx+VUs7YWm3AK2hnjg5Ca2WVSdbMEy1o7bUYWehqTMTFlqJZx
	 AtS0vOw6w33Jt+wA9+4y83nq5p59dvROyiwkvSwAwdFZtKF+rLisS/X3wAz8mGqk1ZtYt
	 hbhJlBbAfqapOtjAKN8jg7SsQlS2Fq8IkYXvKjRevb9jf5zFqRrggE6YLrx+UZEQPzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qExf9TJx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F861606A31C
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 07:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F861606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qExf9TJx
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386cf1041cdso6420261eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 23:53:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795852438; cv=none;
        d=google.com; s=arc-20260327;
        b=opVdzsXLIcDBfRKO0adZNz8rW9nl/ew6XGuvxSPt+sZ/0jqnapRyyaGxeqMP70qG7B
         unTHcm4pRILzCAgaUrT/jTx2t5nUfPGVKoOf7eXkQD+UPgF2P7cwe85fTOAyWNe2EkNh
         y6pZCZxJY3VPMIz1OaI8NQ8/ONpfkEhNpgSXaRrwyYG26orqdjl5555OwVY/Rsb3xSnL
         m4Mlby6Vqz7qA2W7TzSCEgunu2u/kfamMEQcI8NwUhsrA88AtAW/4ET57sPRDsbLcSVr
         Tk/cMBjgGMIhNJ3RV1bTt5mKOQLxzAoz8yBqvz8sjcpmTlRpmzp5EAFkLYASqa8Fm9+K
         8h4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3E26Yt2ovRK5OMZtgqMHVcJ89/Y9SO5NO/MzyS43R8M=;
        fh=zlKprQIATvaNAOE6CzW0Kvus0yixgy7GhhwMeZYcdZk=;
        b=YivYFfZCCGsNDmSLI9fhFNzjUky4cmPPDZPod/v6uIzXu53K+T1dhQ0mVxB87ZvGjf
         VcXqttM/20vgPtxE/7Bs/Cr6nKYqUIWhvFmbo/vzzXk0BvrMbFDX8PGWHrbxp4Cayx1M
         WvR37Qmz6g/4P6WRtIQTGduQeojdYhIdJxt0RRm2p59xrwguPdUbwMZc1/twpijXi8LK
         SIAXyau8phB/K0nEI6OiafF+cmlMoNfFZ/5LkxEi54pvaC6xrEPLf7jdQTDKK3ayFHnE
         YRpxog2Fya6aO3xR1K2UlW71d0SsYfjD3RZcOhDveIM5HJE7JwwfPeTWB79K8ElVp/Ay
         t5EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852438; x=1796457238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3E26Yt2ovRK5OMZtgqMHVcJ89/Y9SO5NO/MzyS43R8M=;
        b=qExf9TJxnKnYb0m4nXD+GmPW8ZrvTA/Gle9qpS109JJaq/HNYLDAUCOTxf/gMd0zbO
         Mxg8ZOdotQkkjO/mf50ji5FTOYmThh6hOmvGE7jidSGNzNpeez6ML9iPW1FPTBy6l55A
         D/Ip6oWog4ykJKXcl2q5PCt5KsEysE06HBZ1ARoSLgkseakuJvJx3Q+JK66wdaHvLR54
         iW4YOPpsRu6zA8NWtynZPWekjaQEzr0WkPo/uDTBNoU2YBzpScbMlkTkAPNCNfKOd0XB
         4MkDCpZWd8RKjA8SJAy8bShpLkUyGfL6ft4hfuXUEp/QJWX5DwAlpcNRuhIy5cjoXpVF
         /8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852438; x=1796457238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E26Yt2ovRK5OMZtgqMHVcJ89/Y9SO5NO/MzyS43R8M=;
        b=SOgFW5hw9o5dGHYdEqrHWo314i/aSInhD/xOG5r3wpmYREyypod9o/vGaTa4c2TguV
         mFeLCHcscEO6A16E/XOxWbvZGbKF+BUwZB/KWLyL3EVjo1QmLpAwhNV6B1SUeK3Cp/dF
         Dfmaas8TiJw2m0UPhPdrtfJgF7UcVldcIfK4Po7pBgeIb8hO3JvaQRedIqg14qDx4Tif
         GxhrdRYtt+lVFKUMUvS8aQKcO03WzqsSiOeNy5IZBDb+7a+zmJzi+ES4eqy3KOjsjQG6
         WZGYweFTZ4UBd1XjdKhXGFQzvajqgOYJZHR+LeU/boHqFvhqWeW/kGHt2bWOsz8JG7j3
         0LsQ==
X-Forwarded-Encrypted: i=1; AL+hErGP7MOZfZQE7oxfzENpgw66KTO9Ew6BRGzaCQQdXPwctYULuXeRssPSzPHLKTfepMLeUXtLdP7BeyrtbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8eJPPir/eWqHGmCkDpdoe9OdemEPtn6pv6kzK9UnoVxwyVQXJS
	i3gqnknlDGZVbuA+r6GS1kidZ3DKK06ZU1e57w8FMlHXB1IBJSv3r1I7fmV71Dz34tkel4O0Oed
	JZ/l9ZVqGKZHNQpgWssNpgT8oGHsZxjo=
X-Gm-Gg: AZFdTZdNImYxAJmSHimPOLxLx7A6B8Zwhdf07yiRxijvzXaso456OuZDPOguDZOu4pQ
	EpgBZX+VxHBuW/HEZ1bcbkSHtkqgTA9DYA4WOicORmnW7nTQ/HgdeYKLX1xoVJbeUWAdsCJh2Bo
	QWJyJ+kDjCsIvJ+BDDjquhKlgLN7BVIc4m9wNyumoWAAkroAfpqiuX6ZrtXAyVlRC5B2pBmLEvB
	ILlfp3KjJI/F9of0+CsHuL3bxuoLJSBKbQ/aYEXzhWCKnZy2lVRxJb4jBrWXbdqZXuEtt+QXout
	cl7E8MBu8A72IyzRw43t5Q4MhzCbJEoiSHzPZJilcFqE9t7h9tdCv6sa2//c+avYJ6q5KGcM5cl
	FKIuSvT8xMrl3mL4mLcdKgwwGIjjYSPosGezqGAVKuDpO7x7eCEJATH3X/l3w3yNV1yK+5EIzfZ
	Ptyfe9Q/MTDEJHsJLcUuCgBzBUktF53Q==
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id
 5a478bee46e88-3860b999354mr23606691eec.40.1795852437505; Fri, 27 Nov 2026
 23:53:57 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <QEeSnm4uTjq24quMQBzlfQ@nvidia.com>
 <CAPVz0n2xxEG5vR4X_dZeyQfN9TVSCBn+2uW1wY7Z+P3N8BhNqQ@mail.gmail.com> <TYDAsh0fQ52x0yM4_wAp5A@nvidia.com>
In-Reply-To: <TYDAsh0fQ52x0yM4_wAp5A@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 28 Nov 2026 09:53:45 +0200
X-Gm-Features: Aa3M54q-zu7VNZG7RQnUkD49ZZ4GXHDbs3pfd4VbGKumQK7WmjGiO3UixS-hPEM
Message-ID: <CAPVz0n2no09Dkf_+wBf_f0dejHxCkLtnjB-Tu-PKjn5PMQHuTg@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 28 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:2=
8 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 10:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
14:35 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Friday, November 27, 2026 6:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 08:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wro=
te:
> > > > > > Parameterize configuration based on bus flags passed from the b=
ridge or
> > > > > > panel. The list of supported flags includes now pixel clock pol=
arity,
> > > > > > display enable (DE) polarity, and data alignment.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++=
++++----
> > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegr=
a/rgb.c
> > > > > > index d48d498068ac8..faecd6f94359f 100644
> > > > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > > > @@ -5,6 +5,7 @@
> > > > > >   */
> > > > > >
> > > > > >  #include <linux/clk.h>
> > > > > > +#include <linux/media-bus-format.h>
> > > > > >  #include <linux/of.h>
> > > > > >
> > > > > >  #include <drm/drm_atomic_helper.h>
> > > > > > @@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct=
 drm_encoder *encoder,
> > > > > >       struct tegra_output *output =3D encoder_to_output(encoder=
);
> > > > > >       struct tegra_rgb *rgb =3D to_rgb(output);
> > > > > >       struct drm_connector_state *conn_state;
> > > > > > +     struct drm_bridge_state *bridge_state;
> > > > > >       struct drm_crtc_state *crtc_state;
> > > > > >       struct drm_connector *connector;
> > > > > >       struct drm_display_mode *mode;
> > > > > > @@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(stru=
ct drm_encoder *encoder,
> > > > > >       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_=
state->crtc);
> > > > > >       mode =3D &crtc_state->adjusted_mode;
> > > > > >
> > > > > > +     /* Get but flags from the bridge state. */
> > > > >
> > > > > s/but/bus/
> > > > >
> > > > > > +     bridge_state =3D drm_atomic_get_new_bridge_state(state, o=
utput->bridge);
> > > > > > +     if (bridge_state)
> > > > > > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > > > > > +     else
> > > > > > +             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE=
 |
> > > > > > +                         DRM_BUS_FLAG_DE_HIGH |
> > > > > > +                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;
> > > > > > +
> > > > > >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_e=
nable));
> > > > > >
> > > > > >       value =3D DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
> > > > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIO=
NS);
> > > > > >
> > > > > > -     /* configure H- and V-sync signal polarities */
> > > > > > +     /* configure H- and V-sync and pixel clock signal polarit=
ies */
> > > > > >       value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLAR=
ITY(1));
> > > > > >
> > > > > >       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > > > > > @@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(stru=
ct drm_encoder *encoder,
> > > > > >       else
> > > > > >               value &=3D ~LVS_OUTPUT_POLARITY_LOW;
> > > > > >
> > > > > > +     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > > > > > +             value &=3D ~BIT(PIN_LSC0);
> > > > > > +     else
> > > > > > +             value |=3D BIT(PIN_LSC0);
> > > > >
> > > > > I think this is the wrong way around: SAMPLE_POSEDGE means that t=
he
> > > > > pixel data is sampled on a rising edge. That is, it should be dri=
ven on
> > > > > the low edge so it's ready for sampling in time for the rising ed=
ge.
> > > > >
> > > > > LSC0_OUTPUT_POLARITY says that the value "LOW" (a bit confusingly=
, 1)
> > > > > corresponds to a data transition on the falling edge, i.e. sampli=
ng on
> > > > > the rising edge.
> > > > >
> > > > > Section 31.9.6 states this a bit more clearly: "an active low pix=
el
> > > > > clock means that the data changes on the falling edge of the cloc=
k, to
> > > > > be latched on the rising edge".
> > > > >
> > > >
> > > > DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE =3D DRM_BUS_FLAG_PIXDATA_DRIVE_=
NEGEDGE
> > > >
> > > > Should I replace with DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE?
> > >
> > > No -- with the current code, let's say
> > > DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE is set. I.e. the panel tells us t=
hat
> > > it will be sampling pixel data on the positive (rising) edge.
> > >
> > > LSC0_OUTPUT_POLARITY will be set to 0. The TRM documents the value 0 =
as
> > > "active high", and "means that rising edge coincides with data
> > > transition". That is, the display controller will change the output p=
in
> > > state to color data on the rising edge. So the SoC pins will change
> > > state at the rising edge, and the panel will sample at the rising edg=
e.
> > >
> > > But the pins will take some time to take their new values, so this mi=
ght
> > > not work or could be unreliable depending on all kinds of timing
> > > factors. So if the panel is sampling as the rising edge, the SoC shou=
ld
> > > be driving the pins at the falling edge, that way there is time for t=
he
> > > pins to settle before the panel samples them.
> > >
> > > So the value written to LSC0_OUTPUT_POLARITY should be the opposite o=
f
> > > what it's now. If that breaks the panel, either it's reporting the
> > > incorrect DRM_BUS_FLAG_PIXDATA_SAMPLE_* value or something else is
> > > incorrect.
> > >
> >
> > This may/will cause regressions across multiple panels and devices.
>
> Looking at the panels we have, if we retain the previous behavior when
> neither PIXDATA_SAMPLE_POSEDGE nor PIXDATA_SAMPLE_NEGEDGE is set, then
> we'll retain the same programming as we've had before.
>
> Actually, from what I can tell, the change in this patch will change the
> programmed polarity compared to before the patch for the panels/bridges
> on the Colibri/Apalis/TF700T boards, which do specify SAMPLE_POSEDGE.
>
> So if we flip the logic around, and default to SAMPLE_POSEDGE if neither
> is specified, we should retain previous programming for existing panels.
>

so default to

+             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+                         DRM_BUS_FLAG_DE_HIGH |
+                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;

and this remains same?

+     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+             value &=3D ~BIT(PIN_LSC0);
+     else
+             value |=3D BIT(PIN_LSC0);

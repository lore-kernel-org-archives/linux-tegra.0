Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771043;
	b=Fcn7WuvzkLtc/b0tH7plvEOLgwIkVjbooRNhz/TnOVM3CZEUJ2of63UVVKZ3MDvoEdg0
	 pW2NJ2bhfCYZhg/la++64tZvnzS+0oc6frk2WeYzzgBlrMHSNzVKEkNTE1X5UoYAxrOWm
	 p69qQlL98izneHhX31l8K0yoqQ2FeTj7hN7Y8xzPVLyhNhw1zCf4r2HCy3N2rwuh45Ewu
	 1IM4+8JydpiDkuuYq/wfRbve4WOq18Mop1fRpuPInAppVnNRKrjSAt0WVXcFRzSIGD6E+
	 fxLqSiGJlbrwDI+WzLqfx4Ewf3Mn43hgu/Q6r3jlDTnKmmeYlatVpU88SD7JR3t83Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dDmS8NtuQmnyXQ7IeezSes44I1C6AREbPMXt5vLaR3Q=;
	b=meC+bfqvzoryLJqRWydHW1WY2hhkXXUY0fd5GknR2zqoEWg0Xo9/Z2MyeN/RERJnIm8L
	 6yFmEA39KDSPu4JekJthcOtPLqpPLZ0Q566+zEn0lxByM6jjL8Ob3TpUbHvG8Hc9xvBD+
	 vnk1E1AxXVZVi9Jp5wRziycILurzwbyODbnXaPQ7qix3ASDZy1SSeiceJSlAWA+1K53pj
	 s1K1ahZU0QC1vq950uTIVZH1PQ/9uck9S+pGbOGB8SPWYaJqrV4Xn4Bl493AWj0AlW8H+
	 Y1k3AjGaqLxiIWAZo9nC9HzCtyUvhXBsbt576bhmDSZrel06mboguA05XA+rUTmQjqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p7S/4zG2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D918C606A32D
	for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 09:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D918C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p7S/4zG2
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8938482c88.1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 01:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795771042; cv=none;
        d=google.com; s=arc-20260327;
        b=MzvTzb0X6gngNxJ5OjB+gENWb9vo+45a7rhzOglPrKGW4WwiAwlF3iu8yysoI++EsM
         /a/mRtI1idiIDix53F0+7hlzrAgm3ouExBfG/LUdoxoYtM7cwmHuB9jgYTLWGcn45NOv
         j9+HwMzmEKNOv34BmN33AcBGX2lb6cWVTxzGTvd+HsVw9nhGl5pD/+V8fRHxK4JUKrMz
         5Lc7uB8vfppbPfH8GZLVHhPxC5x0gkignmVUxhk1nEI8/ZprfCHF26KNln1RcyYcFr9p
         uoukb8G/VXJRzjbmFTTdREDGsN494paG9/heYPn7DC/DSrayTfQuX0RRMBGTCwuR5AX2
         ce8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dDmS8NtuQmnyXQ7IeezSes44I1C6AREbPMXt5vLaR3Q=;
        fh=5viMD9gYp4uVjnNYfIFWixxT9ZxmTq7XvKcvfIgv4n0=;
        b=iJV0bysxeYkXxuNSLdAUYypsRmj+QtNSjsPEBUyiWfZxuUJei49nlOpfwgzdJEj8ut
         KATWUZLLDQ3As3pT6BekOaYa2cIscvjQoOINroI5m4KFuf2UdCKt3b2/9TYDQYCzhuJw
         VuCVflfhPXrPcH8CPYI+t7ZMxidLh0DEaBNtHn0auBx7jWxw+W6LFASbPIwSBqFdF/6T
         4DHGYXY/JwjCQGWvqIols605GU3tugDLeEUWLkeka80OUwNyV1TUjWNLlmmN/mi1MjiQ
         lP19zAT7U3Clqg2wcK1z7tqGR2F7tRXBN9GQwYpLgy4MXYOr0m00+UhWxkafflBkPB5e
         ajCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771042; x=1796375842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dDmS8NtuQmnyXQ7IeezSes44I1C6AREbPMXt5vLaR3Q=;
        b=p7S/4zG2/9Vk7qIZlkePdvyYBjqaCx7iIudYfN7kYJ9HMdfGushB110AKBrt5cx/+S
         koJ54vduwPXf1Pf2paSidym4TwXao3i64k1LpeOfgz2pzw3jQLsk7fwn/ElJwiKuh+rg
         z+TScOyn7e1hsy50LewlH+jS2+AvmY4fVmZBtLuvZvz4QcfmhL4+/twl8alRC+1RE1Zc
         vc8sGZJ69za0pjzCPJOFeTUbXD7n2pZ3PUUZLynu5349sW62ERvSLNj+XY9j2MSbV32j
         Q3NfvpneXVtdoD9BDA3RctB99PVOoT+vfXrZZm77HWAoYJdp5oY3Ig7I1d/el12gi4p/
         cbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771042; x=1796375842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDmS8NtuQmnyXQ7IeezSes44I1C6AREbPMXt5vLaR3Q=;
        b=ZgZ75prYkgL8zZQYPl1UJZrocJ+BILYvYrp3U0sHgXHDZBD4QXxcRPgE/E1Hrbypb/
         NKc2cjygoIXsXM0dds3vJjE/M0dzwQ/pxKgZXkzfKl6U/KKIh+2RlfSXLwDSHhtTD5PS
         hTNetLPQRhZ+CQS58Neeugf03SoWWoeTVPUksp/b4nCIrycKrIX+L8afr2BBw19IlGYN
         747g9Um+QkhUSBNipY1DSwob45NfycF4qobIS1jOJcxltpIOOFC1TTpP7RdAVxAWbFgl
         IRxfrS9RRwHBXYZpA9K/iey83m7BXi8PoxdkNvVkfgjmGaJV8sCghOCcj3lLRZonM/oB
         Io/A==
X-Forwarded-Encrypted: i=1; AL+hErFl1UBvDi2lMUZUy7OOdwIZDsK+aQ29pHhWHuLru60TdobN/rwP5/amu3wS7EbYdD867/d/hlGa4gZU1Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NLB/FYHhXq9BVlFWHJG+y9o0V55xDG5CAoQusMNcNLR4LxI4O
	W6wUJ5oi9vw4VW4+aA+VBZ4FiJ572yjl40Jm2FEl9B+U8D36O5v03VahP7AjfxAIEKBmJc9lOru
	GBXh2snQbt5d4ChtTI80E6HuAhKAdgwAgBA==
X-Gm-Gg: AZFdTZdD0ZP6fvInqXWYGFfgi1JtCdbittKoVgvYsxQDBcz24xKZADDheoVGi2ZEujO
	p925mtOi3PwauThQIKLG7mfE6QkIMxuBFqDyTegtfrBc2+3I5w5NrkNomMDdaqxukvMWClS2OYf
	F9zwWaEwWJap9NM49Om+cBT2MCvTei6zMjEEeOrka4hRCiGcZ1SP2ZKj5/hNZcS+3uvioNX7US/
	1NCLejS8aomv+d+bOv3EuaidLKYbpDRN8GqYOhEcbQLbxLTLE/IOQf6tWuZAPbP1Lh2i992Ua2Y
	KE9uZk5x1SZ2EW3zFctuQw//BuI14G/BtT9fB+8dUatqtgE186LRfa28tUwm2Qp39JXfdx2VuyN
	RfoEPmsmuS3mcN6QeZG06vaIcGjQ5LnDJ9WNIVnl0WLRFweBKlJbkaAaTpjThmCp1Z59fNzy6IM
	gB34u8h0viq+dAUVPYnify922vMgYXbBI=
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id
 5a478bee46e88-3857093f077mr35542915eec.21.1795771041860; Fri, 27 Nov 2026
 01:17:21 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-10-clamor95@gmail.com>
 <mxfdX1kqQz209wWYqFOofg@nvidia.com>
In-Reply-To: <mxfdX1kqQz209wWYqFOofg@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:17:09 +0200
X-Gm-Features: Aa3M54qIl8HPODfyZsvmpYkFJItC2sR0jtJsUw_xe1x-dhhaz3Ej4xd6HUaecRM
Message-ID: <CAPVz0n1ZoMfPWKXSbLENDh9f8qxZbdbnvLxbiLxo8fZS-u5Etw@mail.gmail.com>
Subject: Re: [PATCH v8 09/12] drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 07:2=
4 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Switch to using the atomic versions of the enable() and disable()
> > operations.
> >
> > This is required for acquiring the next bridge state without causing
> > crashes, in order to properly set up the encoder.
>
> This is a bit vague. I'd make an explicit reference to RGB needing
> access to the bridge state, which is not possible with the non-atomic
> functions, and then explaining that DSI / HDMI / SOR are converted for
> consistency.
>

Noted

> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dsi.c  | 20 +++++++++++++++-----
> >  drivers/gpu/drm/tegra/hdmi.c | 20 +++++++++++++++-----
> >  drivers/gpu/drm/tegra/rgb.c  | 23 +++++++++++++++++------
> >  drivers/gpu/drm/tegra/sor.c  | 18 +++++++++++++-----
> >  4 files changed, 60 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 6d6adc485e51e..cd61070072beb 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -855,7 +855,8 @@ static void tegra_dsi_unprepare(struct tegra_dsi *d=
si)
> >               dev_err(dsi->dev, "failed to suspend: %d\n", err);
> >  }
> >
> > -static void tegra_dsi_encoder_disable(struct drm_encoder *encoder)
> > +static void tegra_dsi_encoder_disable(struct drm_encoder *encoder,
> > +                                   struct drm_atomic_commit *comm_stat=
e)
> >  {
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > @@ -919,16 +920,25 @@ static int tegra_dsi_prepare(struct tegra_dsi *ds=
i)
> >       return 0;
> >  }
> >
> > -static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
> > +static void tegra_dsi_encoder_enable(struct drm_encoder *encoder,
> > +                                  struct drm_atomic_commit *comm_state=
)
> >  {
> > -     struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted=
_mode;
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > +     struct drm_connector_state *conn_state;
> >       struct tegra_dsi *dsi =3D to_dsi(output);
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_connector *connector;
> >       struct tegra_dsi_state *state;
> > +     struct drm_display_mode *mode;
> >       u32 value;
> >       int err;
> >
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(comm_state=
, encoder);
> > +     conn_state =3D drm_atomic_get_new_connector_state(comm_state, con=
nector);
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(comm_state, conn_sta=
te->crtc);
> > +     mode =3D &crtc_state->adjusted_mode;
> > +
> >       err =3D tegra_dsi_prepare(dsi);
> >       if (err < 0) {
> >               dev_err(dsi->dev, "failed to prepare: %d\n", err);
>
> The function also uses encoder->crtc and tegra_dsi_get_state. Should
> these be changed to conn_state->crtc and to_dsi_state(conn_state)?
>
> Similarly for HDMI / SOR.
>

I must have missed that. Good catch

> > @@ -1059,8 +1069,8 @@ static const struct drm_encoder_funcs tegra_dsi_e=
ncoder_funcs =3D {
> >  };
> >
> >  static const struct drm_encoder_helper_funcs tegra_dsi_encoder_helper_=
funcs =3D {
> > -     .disable =3D tegra_dsi_encoder_disable,
> > -     .enable =3D tegra_dsi_encoder_enable,
> > +     .atomic_disable =3D tegra_dsi_encoder_disable,
> > +     .atomic_enable =3D tegra_dsi_encoder_enable,
> >       .atomic_check =3D tegra_dsi_encoder_atomic_check,
> >  };
> >
> > diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.=
c
> > index e8c4347f09e69..a78279810dd82 100644
> > --- a/drivers/gpu/drm/tegra/hdmi.c
> > +++ b/drivers/gpu/drm/tegra/hdmi.c
> > @@ -1166,7 +1166,8 @@ tegra_hdmi_connector_helper_funcs =3D {
> >       .mode_valid =3D tegra_hdmi_connector_mode_valid,
> >  };
> >
> > -static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
> > +static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder,
> > +                                    struct drm_atomic_commit *comm_sta=
te)
> >  {
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > @@ -1209,18 +1210,27 @@ static void tegra_hdmi_encoder_disable(struct d=
rm_encoder *encoder)
> >               dev_err(hdmi->dev, "failed to suspend: %d\n", err);
> >  }
> >
> > -static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
> > +static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder,
> > +                                   struct drm_atomic_commit *comm_stat=
e)
> >  {
> > -     struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted=
_mode;
> >       unsigned int h_sync_width, h_front_porch, h_back_porch, i, rekey;
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> >       struct tegra_hdmi *hdmi =3D to_hdmi(output);
> > +     struct drm_connector_state *conn_state;
> > +     struct drm_crtc_state *crtc_state;
> >       unsigned int pulse_start, div82;
> > +     struct drm_connector *connector;
> > +     struct drm_display_mode *mode;
> >       int retries =3D 1000;
> >       u32 value;
> >       int err;
> >
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(comm_state=
, encoder);
> > +     conn_state =3D drm_atomic_get_new_connector_state(comm_state, con=
nector);
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(comm_state, conn_sta=
te->crtc);
> > +     mode =3D &crtc_state->adjusted_mode;
> > +
> >       err =3D host1x_client_resume(&hdmi->client);
> >       if (err < 0) {
> >               dev_err(hdmi->dev, "failed to resume: %d\n", err);
> > @@ -1460,8 +1470,8 @@ tegra_hdmi_encoder_atomic_check(struct drm_encode=
r *encoder,
> >  }
> >
> >  static const struct drm_encoder_helper_funcs tegra_hdmi_encoder_helper=
_funcs =3D {
> > -     .disable =3D tegra_hdmi_encoder_disable,
> > -     .enable =3D tegra_hdmi_encoder_enable,
> > +     .atomic_disable =3D tegra_hdmi_encoder_disable,
> > +     .atomic_enable =3D tegra_hdmi_encoder_enable,
> >       .atomic_check =3D tegra_hdmi_encoder_atomic_check,
> >  };
> >
> > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> > index 227a178f761bd..d48d498068ac8 100644
> > --- a/drivers/gpu/drm/tegra/rgb.c
> > +++ b/drivers/gpu/drm/tegra/rgb.c
> > @@ -90,7 +90,8 @@ static void tegra_dc_write_regs(struct tegra_dc *dc,
> >               tegra_dc_writel(dc, table[i].value, table[i].offset);
> >  }
> >
> > -static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
> > +static void tegra_rgb_encoder_disable(struct drm_encoder *encoder,
> > +                                   struct drm_atomic_commit *state)
> >  {
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_rgb *rgb =3D to_rgb(output);
> > @@ -99,12 +100,22 @@ static void tegra_rgb_encoder_disable(struct drm_e=
ncoder *encoder)
> >       tegra_dc_commit(rgb->dc);
> >  }
> >
> > -static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
> > +static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
> > +                                  struct drm_atomic_commit *state)
> >  {
> > -     struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted=
_mode;
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_rgb *rgb =3D to_rgb(output);
> > -     u32 value;
> > +     struct drm_connector_state *conn_state;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_connector *connector;
> > +     struct drm_display_mode *mode;
> > +     u32 bus_flags, value;
> > +
> > +     /* Get mode flags */
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(state, enc=
oder);
> > +     conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> > +     mode =3D &crtc_state->adjusted_mode;
> >
> >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
> >
> > @@ -201,8 +212,8 @@ static const struct drm_encoder_funcs tegra_rgb_enc=
oder_funcs =3D {
> >  };
> >
> >  static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_=
funcs =3D {
> > -     .disable =3D tegra_rgb_encoder_disable,
> > -     .enable =3D tegra_rgb_encoder_enable,
> > +     .atomic_disable =3D tegra_rgb_encoder_disable,
> > +     .atomic_enable =3D tegra_rgb_encoder_enable,
> >       .atomic_check =3D tegra_rgb_encoder_atomic_check,
> >  };
> >
> > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> > index ebac9068b670f..45a9ea94c4355 100644
> > --- a/drivers/gpu/drm/tegra/sor.c
> > +++ b/drivers/gpu/drm/tegra/sor.c
> > @@ -2203,7 +2203,8 @@ static void tegra_sor_hdmi_scdc_start(struct tegr=
a_sor *sor)
> >       }
> >  }
> >
> > -static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
> > +static void tegra_sor_hdmi_disable(struct drm_encoder *encoder,
> > +                                struct drm_atomic_commit *comm_state)
> >  {
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> > @@ -2244,13 +2245,17 @@ static void tegra_sor_hdmi_disable(struct drm_e=
ncoder *encoder)
> >       host1x_client_suspend(&sor->client);
> >  }
> >
> > -static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
> > +static void tegra_sor_hdmi_enable(struct drm_encoder *encoder,
> > +                               struct drm_atomic_commit *comm_state)
> >  {
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       unsigned int h_ref_to_sync =3D 1, pulse_start, max_ac;
> >       struct tegra_dc *dc =3D to_tegra_dc(encoder->crtc);
> >       struct tegra_sor_hdmi_settings *settings;
> > +     struct drm_connector_state *conn_state;
> >       struct tegra_sor *sor =3D to_sor(output);
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_connector *connector;
> >       struct tegra_sor_state *state;
> >       struct drm_display_mode *mode;
> >       unsigned long rate, pclk;
> > @@ -2259,7 +2264,10 @@ static void tegra_sor_hdmi_enable(struct drm_enc=
oder *encoder)
> >       int err;
> >
> >       state =3D to_sor_state(output->connector.state);
> > -     mode =3D &encoder->crtc->state->adjusted_mode;
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(comm_state=
, encoder);
> > +     conn_state =3D drm_atomic_get_new_connector_state(comm_state, con=
nector);
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(comm_state, conn_sta=
te->crtc);
> > +     mode =3D &crtc_state->adjusted_mode;
> >       pclk =3D mode->clock * 1000;
> >
> >       err =3D host1x_client_resume(&sor->client);
> > @@ -2657,8 +2665,8 @@ static void tegra_sor_hdmi_enable(struct drm_enco=
der *encoder)
> >  }
> >
> >  static const struct drm_encoder_helper_funcs tegra_sor_hdmi_helpers =
=3D {
> > -     .disable =3D tegra_sor_hdmi_disable,
> > -     .enable =3D tegra_sor_hdmi_enable,
> > +     .atomic_disable =3D tegra_sor_hdmi_disable,
> > +     .atomic_enable =3D tegra_sor_hdmi_enable,
> >       .atomic_check =3D tegra_sor_encoder_atomic_check,
> >  };
> >
> > --
> > 2.53.0
> >
> >
>
>
>
>

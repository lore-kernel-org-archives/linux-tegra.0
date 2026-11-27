Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771315;
	b=DBSKakc/AkkXYmgncPC+5fKm4s/JHCqZlDP4jMmjFslGTcCcwlzqG0SvfcJIa/N8Xd+g
	 u/VbTs9JDQlSaJ+PzHEWtdLADVG3oTrWRk9/e3rfUqv4jFZ1/qJt+hVDnLAXyEfjNMjaM
	 20p9X3cv/e84I+bBkRVDrGaZpPCKG7anXZf8vX+86DZQEXsGaHxb68bwgjH0MmvGWoEsk
	 SkDHUlk4SA5aGE7aeEdOmw8kbHenNnZgIK6q8F+XJ4qSbI4OeRoSA2BIUiBNxwGpBltme
	 qZGq3HNxbnXiCt44+xOxWAf9enLhXYPtXc28WKPMxum7Oa5A9Szb5YL501I/LkyTdOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
	b=jX7HMfcRca+Sh/kSdbQTWZic25UQYTvpmHqEviwXWwar4Ys0G1Qwxk9UQ/emu6FmIAwi
	 CNhG2id2gsfXH3lAX3/+m89xWLFdJ2ftZRmG2kI5CyAZ8sfbJYlt4uP6rOfSWbALG2S6E
	 f34h92jjERV2d+O7vq/D45EHP9hzv9LFYDeuu9ELdpljq9jBaFYgQ7pKl4qIC+FUnirKb
	 6CRSNKrHhbUDX5Qy6+Y/Adm7sRhrKBfSxwi7CTcvgfTP7KrgIwGoSKrs19Uwkaqb2s8mC
	 Toygr3qIbyNtwmHIQAEdkxVBowJis69q4TqA+Mz4ah+f4aU/iAhN3psVoG02GYGMrLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Db4rXmoK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2964606A321
	for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 09:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2964606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Db4rXmoK
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386d1859e1cso2197051eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 01:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795771314; cv=none;
        d=google.com; s=arc-20260327;
        b=SRPhjKWEt1df2BZpQAx97ljz9ftP1hzDOgdJnFa1CX4Ts1hGXrIAIdhFvJFm0umMG3
         Wi6uuPRWYIcAsg7fQ8IpDANTCmsnPhZDZ2iZ9JcsN+nhcVHX/Yug3eZw1GgemhGaJVBv
         InZ0LlrDI0E+gjewtbkjP7FqZnADelE/YLBLsRGqEtZsFlT897i2kTfcF7pT3G9QSa4H
         7npBMSGFwXII9z2f+KUiVnvuM878N4n43Ds0Di3Y7l6UvEyUzZSlSorBMKgzNnBjdoSR
         KuiHlVVjshPApGu0ZTBXwt/gxUR+izAdhEEhgG4GYc4ip5PCf110TRuBpONbG04A5QTP
         yZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
        fh=nGEqdZN/5Vvna00vKkX5Q0cT2CwZfNDtwkoTj9AVya8=;
        b=hDgAsB+MIfWEs90one7BxnDp4j8aup31RzcCZBw56FAinYVwVfWE66WRyGp5hyZ6I0
         hCJDpT/+fDgY/rCaai2mWS8qpimM6fq+BGXsI7ueXMSNadVov8OvccOvYF9LbxM/VB/L
         ivVItMcWx5NtGJxaqF8372RzLERyTpIyjclhjEtbO+LdkDmDYRxeR0i9nx11bbl8EsVX
         JI6XzZdlg+woTT8e0Wiq1Whi8M2iwHgScddfmMMwnKlHo5zvgOqZ48CDeVP4eYzgRD9I
         05ACL9HhqgUr+iDslCu9NViin9DBU5aO3SKoOlfaIeQU4y3kk9hIFvJ71j7kHzKBeR7s
         BoPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771314; x=1796376114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
        b=Db4rXmoKZRcliDEDP8BIj49W67I5o1jlMhpiIMdBYulpofHZDKjqiALfNz7rvLeeyP
         TN4FKyPxCi1lEK5eWxGzaKTw/O0PcYG2PsGeweSc68Sf/jVStA9qIZ5z2QQmCTyXS8Zy
         CsgAc5PBfBOtDOY+iY6aHufIATlpMVKdc71RzvmsTdkmsNeJt3Q//K87qDiwAMH1knJw
         kW/EWLSVRLVAIda84zt7gHAByzyPB9ewmaFYCUTPusqiKH0R+MnEkSecPs29oRa3mPvz
         H6TcVgsm7r1VyvF3rb4eU3zXSeIZtSTdcuSaoBPasNuQvQwTla+TY8hteC6RC+dBYvce
         k2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771314; x=1796376114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
        b=jVK7NJPPHF2OPZY9ZFJepd8o3RiU0jkpoUei9SmVtPy8b0uFGYEQ1rrDlbd54H4s2n
         8iUv2dRKMVuuo+TDhG2VRZmWpyey4CCM0ILhizZ2/TgmkErTzxfZMJhuJL5lQH9tSvuy
         v6Y3W/Jz4tBYM13GJE1uyPkeDMe3CTgzPfRIFUFQ/oimDH7tgBp+bz9LZLfhhcdkoeoP
         hLdm4/hZO7RUA52HDzRP2mb7t0WthPlZII42YWPyJPUvwAwN4VDVxLeNMLqCAdeyErK1
         9X6z8XG94BWirrEaTUi5lA4um4v8DiaWEG9GhAAep2sJcHrlik6wb5+ty6Li5OSzF5lT
         +ADg==
X-Forwarded-Encrypted: i=1; AL+hErEq7KBrqC3qhw1cU4ClDq4t8VazPuuLjzRPwwjrjmEmWh6PTYuzYvMiKbZqhLKK68ndo/L7eExAORflpQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ivy8iLUCe82Zo4utb8jmKT2Pq6zso2pg3z8C4xBv+oW2G8MwG
	TlzQsQY/M6/ZFNgdeylMtfiOl3nVWxsZGUyjtG5hj5uYrD5jNTLGduHEA8sLaLNhX/Qa79ZSaSw
	zcB3rZ3lXtuJgRRau+VyuLWAil2OBr9w=
X-Gm-Gg: AZFdTZdlj+9IKP39ncd8FUc125j3VDHuRNQ2jQxSMlw1Cy5bgHWL/v/i5ztetSqTHLa
	2uBDPWre0XFNkRGzeOXzyw8Re4zEwc3I6PPl6DiHx0EfZuejwpbP/TG4/E05XudI4EFm7lKR+R3
	8eyGtuaac6ftGIGwwLYZS1PhmTrG+VWr31CV5X9hJEr1VudjrFXRevl4TXHzE//54kGY+wl0wPE
	+FYjrNYcB8KMrkE6Fe7kO85jm4hKwpjKmBDc9t8bNk5/0ujmwMxe+TJuNfb19LlC+6GPECR80Nv
	NzD599hk70BLF5s5nWI00QuM5BSSndH8Dwu4huEuihDQ/xhi0rDV2K+Tl6OTZkFRIC7s25CnxAZ
	Y1tezlTClR13nv1eatT+1QyeBoa8vBJJBMYDqr2HE/eAQOGnNt0pFMLPbSPC/COJ84wg4w4V6HR
	DRwDiU48JXOx3zwOC+JiEArRej90XyYg==
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id
 5a478bee46e88-3852ea8d7d4mr33082873eec.23.1795771313759; Fri, 27 Nov 2026
 01:21:53 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-11-clamor95@gmail.com>
 <XPGRUNopQCaIq1yDhISpSg@nvidia.com>
In-Reply-To: <XPGRUNopQCaIq1yDhISpSg@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:21:42 +0200
X-Gm-Features: Aa3M54r9PD-vpDJoY894sGmJ09TY6pWekwcQ8wsOPcIm9P2nFgYst_79Ta6LzYI
Message-ID: <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
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

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 08:2=
2 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Parameterize configuration based on bus flags passed from the bridge or
> > panel. The list of supported flags includes now pixel clock polarity,
> > display enable (DE) polarity, and data alignment.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++----
> >  1 file changed, 35 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> > index d48d498068ac8..faecd6f94359f 100644
> > --- a/drivers/gpu/drm/tegra/rgb.c
> > +++ b/drivers/gpu/drm/tegra/rgb.c
> > @@ -5,6 +5,7 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/media-bus-format.h>
> >  #include <linux/of.h>
> >
> >  #include <drm/drm_atomic_helper.h>
> > @@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm_enc=
oder *encoder,
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_rgb *rgb =3D to_rgb(output);
> >       struct drm_connector_state *conn_state;
> > +     struct drm_bridge_state *bridge_state;
> >       struct drm_crtc_state *crtc_state;
> >       struct drm_connector *connector;
> >       struct drm_display_mode *mode;
> > @@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct drm_e=
ncoder *encoder,
> >       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> >       mode =3D &crtc_state->adjusted_mode;
> >
> > +     /* Get but flags from the bridge state. */
>
> s/but/bus/
>
> > +     bridge_state =3D drm_atomic_get_new_bridge_state(state, output->b=
ridge);
> > +     if (bridge_state)
> > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > +     else
> > +             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > +                         DRM_BUS_FLAG_DE_HIGH |
> > +                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;
> > +
> >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
> >
> >       value =3D DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
> >       tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
> >
> > -     /* configure H- and V-sync signal polarities */
> > +     /* configure H- and V-sync and pixel clock signal polarities */
> >       value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
> >
> >       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > @@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct drm_e=
ncoder *encoder,
> >       else
> >               value &=3D ~LVS_OUTPUT_POLARITY_LOW;
> >
> > +     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > +             value &=3D ~BIT(PIN_LSC0);
> > +     else
> > +             value |=3D BIT(PIN_LSC0);
>
> I think this is the wrong way around: SAMPLE_POSEDGE means that the
> pixel data is sampled on a rising edge. That is, it should be driven on
> the low edge so it's ready for sampling in time for the rising edge.
>
> LSC0_OUTPUT_POLARITY says that the value "LOW" (a bit confusingly, 1)
> corresponds to a data transition on the falling edge, i.e. sampling on
> the rising edge.
>
> Section 31.9.6 states this a bit more clearly: "an active low pixel
> clock means that the data changes on the falling edge of the clock, to
> be latched on the rising edge".
>

DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE =3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE

Should I replace with DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE?

> > +
> >       tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
> >
> > -     /* XXX: parameterize? */
> > -     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
> > -             DISP_ORDER_RED_BLUE;
> > +     /* configure DE signal polarities */
> > +     value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
> > +
> > +     if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> > +             value |=3D BIT(PIN_LSPI);
> > +     else
> > +             value &=3D ~BIT(PIN_LSPI);
> > +
> > +     tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
> > +
> > +     /* configure DATA order and alignment */
> > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > +
> > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > +             value |=3D DISP_ALIGNMENT_LSB;
> > +     else
> > +             value &=3D ~DISP_ALIGNMENT_LSB;
>
> DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to check
> here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB/MSB
> bit ordering in a classical way, instead:
>
>   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
>   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
>               R[7:2], G[7:2], B[7:2]};
>
>   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
>   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
>
> I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> panels depending on the layout. So the correct value depends on how the
> panel is wired to the SoC on the board. Hence, I think we should
> describe this with a new property in device tree under rgb/dbi or
> endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> document that this means the above kind of wiring - not all RGB888
> panels use it.
>

Ugh, why is this so confusing...

> > +
> >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
> >
> >       tegra_dc_commit(rgb->dc);
> > --
> > 2.53.0
> >

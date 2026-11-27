Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785674;
	b=4fwe6ZAqWfHgytS4weKRkZWI8NrkXi6GmR55Jdcy1EUGPw8/pFSqZX4wi9XUwAofwvvl
	 j6D/hUEN3rXqfuDZpiHF+KNeWRkcHslIPlcEOVkCuhqxaSZNhrxbE6eW0Zkv8Hn6zAJra
	 eO9T+FEwn0s9Fby+mCihTtnGaQ4RxX+tz8bxWSsY2FA1AwCoA95wMHtdl5TJDuIgVJXMX
	 fr/U/57bUwqmQaMEhaDxJN5e8uyi4Z8NQe76xPvMO81KANMj/L7LEPP5TwO6whwoKuXqY
	 VfdGRtcVuxN+gzD4LRijZo1d7jNjslTl4q4a5t4KMOKokWfyVeUZXp1PFfN/K93wJzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
	b=tn2wrm52hJy1Md37al7qglHSIuejXo23kRXTeehHc/dD+C49biz60rW0VwZdtJHhsyUm
	 givBaTZEovyE3GslYyA1QKJI0DXE+VguJi4dJYGzp2Z6Oud3Snm/B42yT+zwQHCYu1q1C
	 N8ytOaHhhVjoGDtmyILEjc2NBWn5eYhHbKvvG4XhstMLBhsVfmcdgjB3l4UYHLqjf+umD
	 h6jl4heCRCbThkX/GA65TjlE64TIPQRO5cJwLJHARj6VOwcFqqZprY/50HkZk6OSsTjGR
	 Bh0EwUI4jiUfclYxL+RCBLvVAHPRMKlHQ91mGMt8rl0eDedUy//BzOyU1oy2D+p7cgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HFQU6E/Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF43606A31E
	for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 13:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF43606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFQU6E/Q
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386d1859e1cso2368239eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 05:21:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795785673; cv=none;
        d=google.com; s=arc-20260327;
        b=pteQirx2oKaIpEs6UNuwuQGYAtbYp0jpg02nzu9w8Fs0ZTdxvBx8OsJXDRNuBGcc94
         myFQNQo5EIBC1Rpiw3olu6RcSrDLnc8rO7bdjo1HLLvhL4qPad2j0pl6POWu7f8gik0d
         B/bVbdJyq5VBmcvZrb3wmc1pbg6Sm2MFBmhNAEZe8Qb3vTdpPmM/3SrhMvLHWtM4c3Ix
         NJ/yN/A8zkSvdyVMjguHhw9d0nFDZ80Yr/6/sPE09e/6vLWBsyvXtvJXJOKiDt2GQy98
         saJY0awZVjRYwS77IInDSxQ5a2F6F8GlPpi0fkyOKbExwhGJZ+ZMkpoo9hcHC72QtRV/
         92Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
        fh=D8K6//7mlhUlP4kpLKf9niHLbtKw8D0BVn0rcxCFjOA=;
        b=jr9lpsk4oKzAgrr/heo/a0n20BB3ElBn3qdE+tHS9xuHp6x0Il6yUK9WTyLI3VFfn/
         qQGYYVxIwYIXDP9BV0Oq3o9Gnd23GB+8hG3NstHZtIodKt9DV9KBWnAwMG1cMfaBM06C
         2vGIO+YZogCSskht/7CRsld/ZDExb5hquvgkeSbZfvUNpXn2/yUmxnKqCWe4v9dCHeix
         xYBCAMs5flzpyV+Vp6II/gS2vpy1rl/rgbSn76I8hmsvzeYTYMdMLZAUt5offw6G/9Cv
         p8U1+mijCAPpj4b/tOMd1229Kd1JZBNmTFACnx+FQG2kopE/sr6DmYRq/ug7u/HDm1bQ
         2CGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785673; x=1796390473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
        b=HFQU6E/QtvmBDmwLiDq9kncfd3FKte+jfI7n3fsgpKrU+ujHcifftF3NYaZBdCJdQH
         OK4kfsInbBbGoAgA5CTZV9ia1gTMWToM4NqB4nSh0LHN2XxREa8Cpq4t1HMzC3+2IpSq
         9KNb8hGyxna/08v9lqKFbJ/Ya9M5uiUWpJWCMDpsjz0V5Rf8UShGJSXe3Ovb8nia8X7z
         7r/3tM9hVsGdixiM1KQHinV2Vb0N2Z+jSEgtZ0XOW+LRAjfUnn9rsT+3ObOWGFF0XhyM
         6zDHZwBMwDn0oWLBZFKhzd7/RLn5xFEX+Ynjn/ECjWoLdygu2nYmv2asT16ADGuXeg/Y
         3Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785673; x=1796390473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
        b=lsB93r2inT3KmTMSAmHmyjIyaV/wUAJGokw5UsBCJTsSdAvtZFbJwCJDJ9CSKjDDi4
         Bix6T0EvobZNpRu2LMqvJBOeBXxwZKPfOeVNRGYfIr5OkRBwaqxXGowQ3J3ROIBcVLcD
         pPthnO2kPy2i2u8Omo6UHUC7dr8G9AZvsdRcA5GQGqt/WN6GTuiFAUGRYCuOiRueCIBA
         mbwgCRLi8yJVAdl0VuZmNKbKuq8Bwjw+hVikMahC3h5Q35U2cghN1zvX4RKzeSySSWme
         XSp0bJEolMeXRQMkNKkVLmQIbrVh7DsjmDX7gXeevgx0gy5Y0zuQ9JufIRRSoCqBMhzt
         ZReA==
X-Forwarded-Encrypted: i=1; AL+hErGLPTuxS2Wey7QVUjdiTrXnQktQvAwiU3KRWndfqRSk8B0L75gTfZP+a6vwLokoo7t4/dFAsx97iR2T7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NWfU//Hra/VGiNDLP3mFXW0bqdCmT/K0wt3VzsEjMZXQpBtUq
	k0Fq+YG/P7uTMdXGRkoDgI3d7CwEUlhUe0kXJPCOjdYc8Dd5SYEMlU+CIQHGsGkgPolu8ZukbzZ
	iZsNVao8Z4e/i3fwV60U75Wjli3YEOl8=
X-Gm-Gg: AZFdTZdSQoThBJy1QDTzHhob1V0rr6RBRd1K0RDtD+LAQC7Rfu9XSwddqh6a43hAzrr
	1bzvynMtdgfLgw1PAP1BsD7nZszx8Qfn1tSSvc7NSsV3V6Q2jAgeu9RENR7cBSKC0bHu9l0H4Iz
	kFQTeB1TZ3fqyhFm2+z+T5eCvOWwlgyhGM1NQwjin/tCV5Enxn+/qP2hj87HFPga4Vn7NB4oTNi
	fOBXvMrkUUcEpUDIyXAFD4EuwFqlCDMvp/1+T8cd+/nmgHsEZQO5Hn5RxjnV973n+UCeR8ZISrA
	t0gszVnE5p8+KW4ezL5BNXYGRSrwWuK+cCauWF0fc5ufy34Vcv81XtcKF00Zib2Db5D+PFU7z2A
	ci3cw78Dl6Rf4LXnvUAMq3BPdJMEcNCevW9MMXOr5tbqxX5rgqoLL+bQgjpjwMODsBtcMqBapRs
	kf5RRNq1NXM4J0VlUndLtIcp4ALJR2cw==
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id
 5a478bee46e88-384b3986edamr24820513eec.7.1795785672262; Fri, 27 Nov 2026
 05:21:12 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <XPGRUNopQCaIq1yDhISpSg@nvidia.com>
 <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com> <QEeSnm4uTjq24quMQBzlfQ@nvidia.com>
In-Reply-To: <QEeSnm4uTjq24quMQBzlfQ@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 15:21:00 +0200
X-Gm-Features: Aa3M54q49lQTvJf3rTm0bm2TUGaSnY3ikhfCBwYj5e-cBK25rEq9w8C0KAb2mko
Message-ID: <CAPVz0n2xxEG5vR4X_dZeyQfN9TVSCBn+2uW1wY7Z+P3N8BhNqQ@mail.gmail.com>
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

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:3=
5 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 6:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
08:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Parameterize configuration based on bus flags passed from the bridg=
e or
> > > > panel. The list of supported flags includes now pixel clock polarit=
y,
> > > > display enable (DE) polarity, and data alignment.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++=
----
> > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rg=
b.c
> > > > index d48d498068ac8..faecd6f94359f 100644
> > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > @@ -5,6 +5,7 @@
> > > >   */
> > > >
> > > >  #include <linux/clk.h>
> > > > +#include <linux/media-bus-format.h>
> > > >  #include <linux/of.h>
> > > >
> > > >  #include <drm/drm_atomic_helper.h>
> > > > @@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm=
_encoder *encoder,
> > > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > > >       struct tegra_rgb *rgb =3D to_rgb(output);
> > > >       struct drm_connector_state *conn_state;
> > > > +     struct drm_bridge_state *bridge_state;
> > > >       struct drm_crtc_state *crtc_state;
> > > >       struct drm_connector *connector;
> > > >       struct drm_display_mode *mode;
> > > > @@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct d=
rm_encoder *encoder,
> > > >       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_stat=
e->crtc);
> > > >       mode =3D &crtc_state->adjusted_mode;
> > > >
> > > > +     /* Get but flags from the bridge state. */
> > >
> > > s/but/bus/
> > >
> > > > +     bridge_state =3D drm_atomic_get_new_bridge_state(state, outpu=
t->bridge);
> > > > +     if (bridge_state)
> > > > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > > > +     else
> > > > +             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > > > +                         DRM_BUS_FLAG_DE_HIGH |
> > > > +                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;
> > > > +
> > > >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enabl=
e));
> > > >
> > > >       value =3D DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
> > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
> > > >
> > > > -     /* configure H- and V-sync signal polarities */
> > > > +     /* configure H- and V-sync and pixel clock signal polarities =
*/
> > > >       value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(=
1));
> > > >
> > > >       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > > > @@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct d=
rm_encoder *encoder,
> > > >       else
> > > >               value &=3D ~LVS_OUTPUT_POLARITY_LOW;
> > > >
> > > > +     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > > > +             value &=3D ~BIT(PIN_LSC0);
> > > > +     else
> > > > +             value |=3D BIT(PIN_LSC0);
> > >
> > > I think this is the wrong way around: SAMPLE_POSEDGE means that the
> > > pixel data is sampled on a rising edge. That is, it should be driven =
on
> > > the low edge so it's ready for sampling in time for the rising edge.
> > >
> > > LSC0_OUTPUT_POLARITY says that the value "LOW" (a bit confusingly, 1)
> > > corresponds to a data transition on the falling edge, i.e. sampling o=
n
> > > the rising edge.
> > >
> > > Section 31.9.6 states this a bit more clearly: "an active low pixel
> > > clock means that the data changes on the falling edge of the clock, t=
o
> > > be latched on the rising edge".
> > >
> >
> > DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE =3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGE=
DGE
> >
> > Should I replace with DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE?
>
> No -- with the current code, let's say
> DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE is set. I.e. the panel tells us that
> it will be sampling pixel data on the positive (rising) edge.
>
> LSC0_OUTPUT_POLARITY will be set to 0. The TRM documents the value 0 as
> "active high", and "means that rising edge coincides with data
> transition". That is, the display controller will change the output pin
> state to color data on the rising edge. So the SoC pins will change
> state at the rising edge, and the panel will sample at the rising edge.
>
> But the pins will take some time to take their new values, so this might
> not work or could be unreliable depending on all kinds of timing
> factors. So if the panel is sampling as the rising edge, the SoC should
> be driving the pins at the falling edge, that way there is time for the
> pins to settle before the panel samples them.
>
> So the value written to LSC0_OUTPUT_POLARITY should be the opposite of
> what it's now. If that breaks the panel, either it's reporting the
> incorrect DRM_BUS_FLAG_PIXDATA_SAMPLE_* value or something else is
> incorrect.
>

This may/will cause regressions across multiple panels and devices.

> >
> > > > +
> > > >       tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1)=
);
> > > >
> > > > -     /* XXX: parameterize? */
> > > > -     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
> > > > -             DISP_ORDER_RED_BLUE;
> > > > +     /* configure DE signal polarities */
> > > > +     value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(=
3));
> > > > +
> > > > +     if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> > > > +             value |=3D BIT(PIN_LSPI);
> > > > +     else
> > > > +             value &=3D ~BIT(PIN_LSPI);
> > > > +
> > > > +     tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3)=
);
> > > > +
> > > > +     /* configure DATA order and alignment */
> > > > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > > > +
> > > > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > > > +             value |=3D DISP_ALIGNMENT_LSB;
> > > > +     else
> > > > +             value &=3D ~DISP_ALIGNMENT_LSB;
> > >
> > > DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to check
> > > here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB/M=
SB
> > > bit ordering in a classical way, instead:
> > >
> > >   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
> > >   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
> > >               R[7:2], G[7:2], B[7:2]};
> > >
> > >   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
> > >   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
> > >
> > > I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> > > panels depending on the layout. So the correct value depends on how t=
he
> > > panel is wired to the SoC on the board. Hence, I think we should
> > > describe this with a new property in device tree under rgb/dbi or
> > > endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> > > document that this means the above kind of wiring - not all RGB888
> > > panels use it.
> > >
> >
> > Ugh, why is this so confusing...
> >
> > > > +
> > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTRO=
L);
> > > >
> > > >       tegra_dc_commit(rgb->dc);
> > > > --
> > > > 2.53.0
> > > >
>
>
>
>

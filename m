Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2435D515
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242565; cv=none; b=mpz+nrlnM3nQ2hDp+gsfqLrCFHIMMTxeKZ7OlqNiBU348p3OkKoAhjMi+n7VJcwt7BSBegXM4as1iouSUGUvVR/tchaV+CH1DdDL0nphJlgn3oY6piHF18RBLqoprakUM2eDDT1UI1lcIKgbTyo3E2y8W000JBQPQK/1IX+cr8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242565; c=relaxed/simple;
	bh=rmwyO9zRp4kD2rqR5LNaTJTRO8hwzlF7oOof50A1D1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjXx8iuJuFgbaGjASUH7w3SZZ1JcL0vuE2tsVl6G+hwgSFfbo964t1eblWUxtJUJ0PxxDKNxGYvicR4hHSOriOcCvPakf8TQa3285B0+wYFyGty3SfQhIdJNyF21LGCL9MKPxBADFl0VkVaLcWdsPz63IbRKy8yuL7WvczsvhFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LHz1FKpK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LHz1FKpK"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so6184620b3a.0
        for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 07:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759242562; x=1759847362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL/Mc8iUtyo5W2s1qkd1yXvd0NCSK6cLxiT3Omi/7eQ=;
        b=LHz1FKpKSZ3WzZ/ElGX/4bkeUpoaUmgFnBgihKr/6gg2QrlsVrq2fNwz9l0AOoXRci
         1jX8vi91iM/MsJPAgREbtWrXCB+/WdS4/vbB2c2EmsrJUKcxDuElQn85AzRngO5TPxsv
         LCeO6lyyqdGmEAm6QxhT0xbcRz9PpVKs0Z4gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242562; x=1759847362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XL/Mc8iUtyo5W2s1qkd1yXvd0NCSK6cLxiT3Omi/7eQ=;
        b=fdfmeCaD1M9FH2sTTTR99hRp9nJ5W9y7zKcSwccU/cQm7SEOHuRp4KkuO2Q7m7JuB6
         YnzGcJCbPbxVIjvIW5oxmFcdEeS6BzLpqR6EQJOuaymhHNGhFeFm6uujnWTNhuprHrMk
         Ka6O9IWAPnGN5fMNRx+z0jm2xD9Wp6Z0qlFw8MPMccWXc4KXQEAdakgNAPOWARDspvH1
         nYN2jp0GVIr1oFKSzMwGt0LdCjjSsktq8ehRjosN67/BTdT/ZydcHsvU/rqX0e5CgY7c
         1wR13UpFC8fPsMkTUo/QFWmUc3AWF+poVnoddoa2W0GKJbhDf/SITxlB2yvvFHC6iCjl
         judg==
X-Forwarded-Encrypted: i=1; AJvYcCW2I9pw6QSDcn72gW2rNEPwAbC608MEkeOOc4r62yhBD2npkXRbIAib1cz01M9l0wgGNmOBwzBFr5y71Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYySDEN/Hq4B9A76MbKIG+Ug3On1D+lxfppe6CNbFquFh1gmjc
	9IWiF8afFUrJZXz4Xy8etahNV85n4yzsvULPWdLSKLkVnm/jWWwyFUXxYO+Kf4KKU7weX4emHbJ
	jMrA=
X-Gm-Gg: ASbGncvUvaW7Jd493HGM16cbEhH1uN82BcmN0vwLSzvXrOxJroSFanHA1d/idsc99UY
	28/SeVbmwAu3sOzWqbxVZPd2SCdPr+iEuPDcHq4Q4RqwLuBam2dlYy/wY8cTFGQNxs9hjNKkGXc
	q331ZJ2+M9zuL4qXEJPkm8v+ftQwqQPB9I6L5pDKEOh+dom+WC6NzSJ+2E65o4c1Nch1wljD7HR
	aGrAuTl4GqI7B4wVUy5JY3fCcSALWU8oAGlpTMnzBO1OudIQz5wNOxuUbEWVbSiADqoJuW3XKVE
	zsVSRO0Zs2B1PnozXSCfXJ5wqQFosRjr5UQHioZRmVIuI0UF57wMmpsFtQK1G/Dr7o1kk/rpTeD
	Yo+4fJWvzW3nA78q5xb49zr6RWudVPnpEJEc1Cn/HXOkzXCPazQtyMtvAlshvn2q8aa/gKYhnz7
	h1h6L4ommxXgfBFA==
X-Google-Smtp-Source: AGHT+IFKqNQrit/wzPljffrRvwgk/i2xq2Vn2AGYCM5jsGomlffcW5fVTeah3DXUZ7xQKr6OZF7bIg==
X-Received: by 2002:a05:6a00:10d0:b0:77d:b0cf:ca14 with SMTP id d2e1a72fcca58-780fcec0932mr22808805b3a.22.1759242562462;
        Tue, 30 Sep 2025 07:29:22 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b23634sm14020600b3a.66.2025.09.30.07.29.21
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 07:29:21 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27eceb38eb1so72671065ad.3
        for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 07:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdnMf+C6ZwwfXbgv83E1qVyYzzfVTACdkJ4YckPui3y17HdZxCNgxy41k3E1ov9bz4EndttjArGR1mpA==@vger.kernel.org
X-Received: by 2002:a17:902:7088:b0:24c:965a:f97e with SMTP id
 d9443c01a7336-27ed4a29dacmr180245305ad.2.1759242560525; Tue, 30 Sep 2025
 07:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com> <20250929142455.24883-3-clamor95@gmail.com>
 <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com> <CAPVz0n2Prw0ZoQhrodobmSpAu7XV6aX=NV=2ee0RwL3H5hWARg@mail.gmail.com>
In-Reply-To: <CAPVz0n2Prw0ZoQhrodobmSpAu7XV6aX=NV=2ee0RwL3H5hWARg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Sep 2025 07:29:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XD=L=otnj+YsQ1qEtrO_+wBD-ZYpDNmickcD1tb+6OoA@mail.gmail.com>
X-Gm-Features: AS18NWBKEeqzCuUPltq0hFLhhfC7TR2NA7onkkxdD9X53tjrGMLTsb8gFsFvIps
Message-ID: <CAD=FV=XD=L=otnj+YsQ1qEtrO_+wBD-ZYpDNmickcD1tb+6OoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] gpu/drm: panel: add support for LG LD070WX3-SL01
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 29, 2025 at 10:13=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> > > +static int lg_ld070wx3_unprepare(struct drm_panel *panel)
> > > +{
> > > +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> > > +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->dsi };
> > > +
> > > +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> > > +
> >
> > Maybe add some comment about ignoring the accumulated error in the
> > context and still doing the sleeps?
> >
>
> Isn't that obvious? Regardless of what command returns power supply
> should be turned off, preferably with a set amount of delays (delays
> are taken from datasheet) to avoid leaving panel in uncertain state
> with power on.

I won't insist, though IMO any time an error return is purposely
ignored a comment about why can be justified.


> > > +       msleep(50);
> > > +
> > > +       regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->supp=
lies);
> > > +
> > > +       /* power supply must be off for at least 1s after panel disab=
le */
> > > +       msleep(1000);
> >
> > Presumably it would be better to keep track of the time you turned it
> > off and then make sure you don't turn it on again before that time?
> > Otherwise you've got a pretty wasteful delay here.
> >
>
> And how do you propose to implement that? Should I use mutex?
> Datasheet is clear regarding this, after supply is turned off there
> MUST be AT LEAST 1 second of delay before supplies can be turned back
> on.

You don't really need a mutex since the DRM core will make sure that
prepare and unprepare can't be called at the same time. panel-edp
implements this. See `unprepared_time` I believe.

NOTE: if you want to get really deep into this, it's actually a bit of
a complicated topic and I would also encourage you to add an
"off-on-delay-us" to the regulator in your device tree (which only
works on some regulators but really should be universal). This is
important because:

1. The regulator could be shared by other consumers and they could
cause violations of this.

2. The regulator could potentially be in either state when Linux starts.

3. The regulator framework could adjust the state of the regulator at
regulator probe time.

The "off-on-delay-us" handles at least some more of those cases,
though I seem to remember that at least a few of them still have rough
edges...


> > > +static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
> > > +{
> > > +       struct device *dev =3D &dsi->dev;
> > > +       struct lg_ld070wx3 *priv;
> > > +       int ret;
> > > +
> > > +       priv =3D devm_drm_panel_alloc(dev, struct lg_ld070wx3, panel,
> > > +                                   &lg_ld070wx3_panel_funcs,
> > > +                                   DRM_MODE_CONNECTOR_DSI);
> > > +       if (IS_ERR(priv))
> > > +               return PTR_ERR(priv);
> > > +
> > > +       priv->supplies[0].supply =3D "vcc";
> > > +       priv->supplies[1].supply =3D "vdd";
> > > +
> > > +       ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(priv->supplie=
s), priv->supplies);
> > > +       if (ret < 0)
> > > +               return dev_err_probe(dev, ret, "failed to get regulat=
ors\n");
> >
> > Better to use devm_regulator_bulk_get_const() so you don't need to
> > manually init the supplies?
>
> So you propose to init supplies in the probe? Are you aware that
> between probe and panel prepare may be 8-10 seconds, sometimes even
> more. Having power supplies enabled without panel configuration may
> result in permanent panel damage during that time especially since
> panel has no hardware reset mechanism.

Maybe look more closely at devm_regulator_bulk_get_const(). Really it
should just save you the lines of code:

  priv->supplies[0].supply =3D "vcc";
  priv->supplies[1].supply =3D "vdd";

...and it lets you put those names in a "static const" table in your
driver. All the timings of when regulators are initted should be the
same.

-Doug

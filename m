Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0617BB21
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 03:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759202072; cv=none; b=krSvHnaaHxrIfgFbXVbCgD9dZFk0U0MpYhDNVjzFHymbZYpuv+X1oDHz/SBCSsn5AdkiS0azvI1pbvzpuVoHI36kVnDLZa1Q9xcgoz2NHFbjVI+UgbiT1qCxTJaq+eya8HTdVpYFhMQgDnOu0bSumm5t+xWavHyPhe7b3lyQ6KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759202072; c=relaxed/simple;
	bh=1rGZa6T+nKU9H+9k5FkFiJZWT4Z/x2RL52Cr/CliJfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCN0VAcaBi9Obsj1ox0zVxb/HzcGbhvRmF1Jz86N4XIB+i4CVl+GIfA+joRHbl1G8aoerczhAas9Z3dXYJjEXC0NndetBZpaOmuaVzWGjXcwzotZie+TKzjRz1j+nnOd1EbVepzfZZevcgTg2geWtAEndbIuwe7BWoYbt2o6hzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PxCNNqkA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PxCNNqkA"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-78127433a32so2422641b3a.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 20:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759202070; x=1759806870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psH8ce2EGDVOVWJJv98yedDgFcZ/vr9lSF0MkEmVn80=;
        b=PxCNNqkAzE1T/nU7a8BMPdQEYwlaldJeBit/71suljnMDe34GrOGtL/44o4T3XypOw
         i5F+ENJ56kZfP0HqZUruE7MigXw49w66cQfcL7EAMTzw9+48BHuEb+8eBBRFwWW4GTKz
         13Jif39Ww0KuJ2KygOtAryBBFgX3n4VmWYgAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759202070; x=1759806870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psH8ce2EGDVOVWJJv98yedDgFcZ/vr9lSF0MkEmVn80=;
        b=pgmY+OP2thyjZme9utxK9T0RTX/p75RH0t30MmnVrwygSFX7Lo1+MhbrYISF3CYTCW
         VKXM688yakYC5pbUk8Kd/K6eohWCoCDfsGGawmGUse5g4DKuTiCDy6mpYFVhDx2jVvYG
         dTArCwYN/a8MijsF0igs/N67a3+IT+PqVKrGCmrg70Vye4aIYXoerDwsLrE7UhJhqdNZ
         rr9COvul7jzGyJLhzAdBLgXYCDqmu3Yf32RFs4ipeZVxAtY7kRGff0mmxaLMszWg6F33
         i5WOddKxzH9NNBBz6ppAW/AuNeiF7U1XFS0PEZeyuDt8rp52FEXXWC9/obxSuiURsqWR
         MA2w==
X-Forwarded-Encrypted: i=1; AJvYcCXeoArWEuJqpFCJLx5Jr6JBxojt5kBdZLlQRWUwWMkreyIK5C8BJw/AvlJhvJwXEP9+oj5SPnTbx1hImw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOkUGED2uR6PsqVXNAt+wVWaY7UMtB1bRjJR+mBLSU9qJAwky
	SnksCrJcEUhzYkcY27PxwjxS9MgvCqKFgakuLz2oi72Qy79LpMz5klDT3n8jx2I6BY29DBcFl/J
	UGsc=
X-Gm-Gg: ASbGncvYy3i3Zt7ZAwisQLb0t9orRFFcZnDqQiDbN8qzaXItTKABNHfwCXx7csJzSwE
	I3y6KSE7XCrjz2zHUo2ID/SBQDkhzOIXx6a2hgZuEmS+pOwj/YkqD3HJ4k5fvxi8O6MchB0sLmH
	4ynoC1bbHXy9EELfG0GLKc1vn2oWGY+XTBWZaVHi0Q7hfZDaaVO3qbWMnLHb+099hAc+Y8r3GT2
	keY9CesUeVQh7bAaaNVUv4kBwujQC1d6GKytvIjGfqfpDbM3N7ZgxbaQ88+E/84hjU5G155Gbps
	0hPUwq5v0NCeOEg3kMziiaNwF66+BVlf3swkZGIS62qMKxRjjFtCl0w/2yaOYRO157nOa8Nmfxm
	MBcHNBEsjqheLyzEUrJRbevJqmjbp0yQbDTi/Iwih+wmkD4wZWacQKkO4bJazilU5UsWH/l1sTk
	u+8S2/wIEda8t401XJi1x8H9vJ
X-Google-Smtp-Source: AGHT+IG5ddqfmifi5VByaek61GRCoRBitgX4pW6S8Z4zylqmqiKVQsSUQvi7rN7mfypTsbBeOen6Dg==
X-Received: by 2002:a05:6a20:734e:b0:2ca:1b5:9d4d with SMTP id adf61e73a8af0-2e7bf478afcmr25167395637.2.1759202070064;
        Mon, 29 Sep 2025 20:14:30 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com. [209.85.215.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53ca107sm12350467a12.13.2025.09.29.20.14.29
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 20:14:29 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b523fb676efso5287972a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 20:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUizo+UzYjHWzMZK1WkpG+R3E0Lfv3MdOBdt/iQBMUV9ExxUoNaYiBrpLq8HEuNfI/AHXB15ru+klVxMQ==@vger.kernel.org
X-Received: by 2002:a17:903:1209:b0:27c:56af:88ea with SMTP id
 d9443c01a7336-27ed4a60a90mr164034935ad.60.1759202068865; Mon, 29 Sep 2025
 20:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com> <20250929142455.24883-3-clamor95@gmail.com>
In-Reply-To: <20250929142455.24883-3-clamor95@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Sep 2025 20:14:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
X-Gm-Features: AS18NWAj5Q6YXwI8UEKn83gnNL36khKZ6enBt8j4y4L77Jpu4EeJviWpKmgJt1I
Message-ID: <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
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

On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> +static int lg_ld070wx3_prepare(struct drm_panel *panel)
> +{
> +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->dsi };
> +       struct device *dev =3D panel->dev;
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->s=
upplies);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to enable power supplies: %d\n", ret=
);
> +               return ret;
> +       }
> +
> +       /*
> +        * According to spec delay between enabling supply is 0,
> +        * for regulators to reach required voltage ~5ms needed.
> +        * MIPI interface signal for setup requires additional
> +        * 110ms which in total results in 115ms.
> +        */
> +       mdelay(115);
> +
> +       mipi_dsi_dcs_soft_reset_multi(&ctx);
> +       mipi_dsi_msleep(&ctx, 20);
> +
> +       /* Differential input impedance selection */
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xae, 0x0b);
> +
> +       /* Enter test mode 1 and 2*/
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0xea);
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x5f);
> +
> +       /* Increased MIPI CLK driving ability */
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x68);
> +
> +       /* Exit test mode 1 and 2 */
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x00);
> +
> +       return 0;

Shouldn't this return the accumulated error?


> +static int lg_ld070wx3_unprepare(struct drm_panel *panel)
> +{
> +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->dsi };
> +
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> +

Maybe add some comment about ignoring the accumulated error in the
context and still doing the sleeps?


> +       msleep(50);
> +
> +       regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->supplies=
);
> +
> +       /* power supply must be off for at least 1s after panel disable *=
/
> +       msleep(1000);

Presumably it would be better to keep track of the time you turned it
off and then make sure you don't turn it on again before that time?
Otherwise you've got a pretty wasteful delay here.


> +static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct device *dev =3D &dsi->dev;
> +       struct lg_ld070wx3 *priv;
> +       int ret;
> +
> +       priv =3D devm_drm_panel_alloc(dev, struct lg_ld070wx3, panel,
> +                                   &lg_ld070wx3_panel_funcs,
> +                                   DRM_MODE_CONNECTOR_DSI);
> +       if (IS_ERR(priv))
> +               return PTR_ERR(priv);
> +
> +       priv->supplies[0].supply =3D "vcc";
> +       priv->supplies[1].supply =3D "vdd";
> +
> +       ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(priv->supplies), =
priv->supplies);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "failed to get regulators\=
n");

Better to use devm_regulator_bulk_get_const() so you don't need to
manually init the supplies?

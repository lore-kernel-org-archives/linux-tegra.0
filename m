Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973558;
	b=B5YaXET5YA36aM/X8fciCrHS4fwMG/RlUztYd+U8qZEJob3WxlgphJCHhgJblye53uxe
	 EG0EpBIt4IDFPuwARLQCL1UKVc8NPmNUIZlu8QVosYMRqWWGy8rtubGxrGTEdhJimUF7g
	 x85ET0KA47+NclMFIh2ZEg07qfp8Ni7R6YYjzgnvZz5qgCbGxfo8WrIj8VJU5OYZRePnU
	 dznPq8oodwsDlud4OkUpjRE8tx5GMU09UZluf4e91Ln+JgoQba5j4f79y5FkwfH4/4b1Z
	 BJl5mvxUYXwgeXprltNHmDUtNOMrTXKmb8nb8Hg5iEQOUPScciKV42mgAHFf8A1tfdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
	b=cYs7NTApfoYxyGKONkF22HiH/uwQ4FtRvqyL8mytwQisQcy3m40XoDvPJCgVuL/yYCTP
	 q4tl0eb2LYS1VkwriAhOE7FGUJUh9yrbTP+qL8LlZ7SP+uIJtq9RLsRpC091F964NlAQj
	 UVt3e0PZggvTYraXVZPGmJbuLvHRLIi0JNGZtzzY4DTKBVwSNbP1v50b78/+FtvNGpiJP
	 Prb/lnC7NBxoKs8s3IspenAcRHNx+d25/kTBFz4dumnL40SgycqdJ91YwT5rN/LHyQ8qC
	 +fZqzBascDO4gOUSfyJ7XMHuMcchx4mqE/HOgJFtv0NsHvOwMkfo/+uk4FZ3To2Takw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+QYVG9r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6AE6082BD6
	for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2026 13:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE6AE6082BD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+QYVG9r
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so1239006eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2026 05:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973557; cv=none;
        d=google.com; s=arc-20260327;
        b=bPZkLfM5zX3qAttkU1h4fsllqkfJ1n4/DcVbzBThwxQ0XAZDPkDuGibKsVtN9ClLoH
         HbnboYkDdEl3RrkCwK1aApqYskG6FjmOz/aPkap6E9Y3BX035cTLpOnN7DEiu7sTQxEV
         xqp2T/mfWbgw3y06GcT5tApX751l5f105GuXQ7IjGnXWopOOWAgR6RmRKK0j598AqpIL
         kxUz5fWZfw4DXfjD5IvMe5kkvr5jWtfRG8+9OSU1uW1jb5aJkhq0YYSjiSOVI5b3uwFW
         hMNKIoqvg8BM6VAyrgxLNk79j/U+Hsy3Tt136Y4QlsGJlqSfMCA9SBd6Rrhd1xAPvUZd
         VdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
        fh=/EGIqNFE4/5g31NpUsWWMXa/K/sIgfPBP2QQbA1q6Ts=;
        b=Y+T5SqBpY275Ln+02PV5k/j6cQOMxEZd7ym07LiaWIOUex0fYJeD0l+fI7m7cJ3/1/
         uhSIuQw1Rn17Ca5iqISkEp/KeMkCSEgJJ/sqW4v43IQIURAOM613uht1MfLk/hm+w0N7
         OsnF7TvfQd8v3+kl2tclfwbv6rtbDNgPtJvvOMGsAJO2lEYZImWP/FIfKrXr/NInPhN0
         2B1OR6ETWQU8vuuNeOEgYrxYgqt76sWMj4pOzw0VEZ2U+tGw9Mf9ULsad4HCWD6NHVBG
         TM/VMtoDGWb9kd2d/iKioiKIeINIbbOzJsp6YKzmIWEmGfJtPBhtvUTV4UMojfSXrGBE
         1tvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973557; x=1794578357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
        b=j+QYVG9rxlB9SEyj9nUeuS7h5AS2Km4bZWAburYtmvGchkPIuMmdD+23vuXJ4luImZ
         xXfC0+LF7Wq6pIf9bB+0QOc1DQ9Gcg2EVnV+A0Qgl/4Ki8vu5E9MqcZ50WbZbNvWXNBc
         v6q7VIxMcVYIF6kgUmr1baCFL0fswtAF/h/3rT2OC4ZZXOaJMs4ZOmV//xpCVIvMmQew
         g9x+Wrw+zIGEhdUf1dmp2zOWA5oMbUOGRWeqyUxbmACCR7e4+O5c+lDWQptUXn5LadCj
         L/iVYW2GpUUdM5s+RLiBSQelRxB65Uf0PsBgWnmeQz8/u5d8yN5TRJunR3Ev/pTGJUDz
         /h9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973557; x=1794578357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
        b=PhTflj9Pu5M5n8fiS9lq2Mm8BETznbhLyaX1ZAyvRLl1WtWwNCsyIVMrHY5D/fLeCD
         LhVRXjMtX71UrFKcy5ShcTwDTrOQ5bwXBG28QV2pr0olQeckT+OdBa/7yzMTNltuFSjR
         T4HRIlH7Md3S3UodVGGbolubA1RcpyL+sLLXr2R7Kz8dRFFES9b+Lq7WFZTDuA6lPkPi
         TVJ1ZRRSGWkijL+AXn15fe7rzk7nihkA/C0FgdTYbaLmdrmQH7H8YvbgIIptU7DB0t0x
         ToqUaePhmx6uCMM05SnEzMp2tFEtZN6qDaHadK9bV+svNW86/S3e/QM6iU0uTYKsAChl
         s8Jw==
X-Forwarded-Encrypted: i=1; AL+hErEmyVHwfOU0m31cwqRwKTTikqQ0hlMh8knYI78z/WVdeiKlBX32z9RP/AgqT6jJxcvR8GlUsStNlfHdzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9FQu0+PQoxWgNxuGlo3OrFs9vZKK6o0HsLIt4Ie+Ky2yZVSuHs
	OZcYQU7ToxQS8kVa/jA+HN1Gb0ghgYOyR084pee6jsQXQ+f3j4Pd+jMSu3agz+OJsKKHPML5yIt
	abRXnlnynFlHQDjuE/uFMP5/GfWSYffiS3Bas
X-Gm-Gg: AYBFou2NS75vsi69aE+Ax/7Bl7vvMXNatXKwLpjPC/SOnOsJOntBG1IpDUj2YXLcfZ3
	x3Gqbmta5SkPIoDq63BxKT+c/pM8EKhXYi7tdglpRiFh1cuAqpMT361NKm+1rG+lWeMGb+0i8e3
	ReJCkB+gds3/rvzWflT7xmyCVimodG/chQA2i8aXL767hbhUXaM2pH9NO4ysqa2QsFF7k9g0UZA
	26IyqOKbhUTN8DYoY5icwNWr0q/StrxLGTJyD0At5/KrkE55KfLYX8eskDkueA/ugi7muocBYq9
	W3fPUdFSzfIfr0i2hEVnWut6s5G4nu9oq1qMcJIGR3XnTF6g/Mw0H8lfV5dUO0i2F+TWzSr/CZ6
	tZ10Ud93loIRxbyCxeHuiPEYI8E5F04oEy7SC3HdJe0a0DSPYBzjZUMj9o+k62b9mPOWtKuliCP
	m55YV01fn1qI7p3ecczZTvxKkrFAYB9w==
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id
 5a478bee46e88-36f75b1ffd2mr2981710eec.18.1793973556636; Fri, 06 Nov 2026
 05:59:16 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-2-clamor95@gmail.com>
 <au3NWsXz-hg2LNr_@orome>
In-Reply-To: <au3NWsXz-hg2LNr_@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 15:59:05 +0200
X-Gm-Features: AclHuK-j0iaOa56-THlEL2TIjiQTJ3K-OFRxGt-N5L_ts2vcZPaUDw3mRDwDbl0
Message-ID: <CAPVz0n3_oRz8aMr1W=8K7dnHhM=vuGpHjpq6+=80oXiFj5wfSg@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] drm: Add MIPI DBI bus support for MIPI DBI Type
 A and B
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:14=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:01PM +0200, Svyatoslav Ryhel wrote:
> [...]
> > diff --git a/drivers/gpu/drm/drm_mipi_dbi_bus.c b/drivers/gpu/drm/drm_m=
ipi_dbi_bus.c
> [...]
> > +/**
> > + * devm_mipi_dbi_device_register() - create a managed MIPI DBI device
> > + * @dev: device to tie the MIPI-DBI device lifetime to
> > + * @host: DBI host to which this device is connected
> > + * @np: device tree node associated with the panel MIPI DBI device
> > + *
> > + * This function is called by DBI host driver to create panel device.
> > + * It automatically calls mipi_dbi_device_unregister() when @dev is
> > + * unbound. It does not automatically free passed device node pointer,
> > + * it must be put manually.
> > + *
> > + * Returns:
> > + * A pointer to the newly created MIPI DBI device, or, a pointer encod=
ed
> > + * with an error.
> > + */
> > +struct mipi_dbi_device *
> > +devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_host=
 *host,
> > +                           struct device_node *np)
> > +{
> > +     struct mipi_dbi_device *dbidev;
> > +     int ret;
> > +
> > +     if (!host || !host->dev || !host->dbi || !host->dbi->command ||
> > +         !host->ops || !host->ops->attach || !host->ops->detach || !np=
)
> > +             return ERR_PTR(-EINVAL);
>
> Do we want dev->of_node to serve as a fallback for !np?
>

No we don't dev->of_node is hosts node, and np is panel node.

> > +
> > +     if (!of_device_is_available(np))
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     dbidev =3D kzalloc_obj(*dbidev);
> > +     if (!dbidev)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     if (of_node_test_and_set_flag(np, OF_POPULATED)) {
> > +             kfree(dbidev);
> > +             return ERR_PTR(-EBUSY);
> > +     }
> > +
> > +     dbidev->host =3D host;
> > +     dbidev->dbi =3D host->dbi;
> > +     device_initialize(&dbidev->dev);
> > +     dbidev->dev.parent =3D host->dev;
> > +     dbidev->dev.bus =3D &mipi_dbi_bus_type;
> > +     dbidev->dev.release =3D mipi_dbi_device_release;
> > +     device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np)));
> > +
> > +     ret =3D dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->dev), =
np->full_name);
> > +     if (ret)
> > +             goto put_device;
> > +
> > +     ret =3D device_add(&dbidev->dev);
> > +     if (ret)
> > +             goto put_device;
> > +
> > +     ret =3D devm_add_action_or_reset(dev, mipi_dbi_device_unregister,
> > +                                    &dbidev->dev);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return dbidev;
> > +
> > +put_device:
> > +     of_node_clear_flag(np, OF_POPULATED);
> > +     put_device(&dbidev->dev);
> > +     return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
>
> Don't we need to of_node_put() here on failure? Otherwise we're leaking
> the reference that we obtained inside the device_set_node() argument.
>

This is fully repeats device_register logic of drm_mipi_dsi.c so
unless DSI framework has leak, this should be correct

> > +static int mipi_dbi_drv_remove(struct device *dev)
> > +{
> > +     struct mipi_dbi_driver *drv =3D to_mipi_dbi_driver(dev->driver);
> > +     struct mipi_dbi_device *dbidev =3D to_mipi_dbi_device(dev);
> > +
> > +     drv->remove(dbidev);
> > +
> > +     return 0;
> > +}
>
> Might as well make drv->remove() return an error and propagate that
> here.
>

Have you even checked the code? remove() callback is and should be void.

> Thierry

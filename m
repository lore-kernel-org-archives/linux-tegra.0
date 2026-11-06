Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973659;
	b=jn+h5hR1V3CmL3f8mFev0E3/UqytoOpRT7HLho/sjXzt1Ev2nRETmE+XVl3MtXiVtGE6
	 Au9jO3O3nRXG1EfE0n8mre66UsEP8ymz/MwH1qFMa0v/NtSZ2O6GVINN4S2hTnl+CiTRV
	 F9HmK9u6P55R98rA5KZ2edMGBissTfbtZs0aopnA18iJrNYDfPoeoj39q8Hkf+9OLULO0
	 uEVdKS1TalcHoXVj+9yoduLT8yiKUgLc/nBuRQOG/vZ3Wi7b+34rdOwfkvMels4nETr65
	 FVsSuHaNfRNupThe2MW7kV1raIcBZc19wryQifojugiDaXpMt+uMZzhwwJ75qiYdOyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
	b=Miiday6kzk2q/H6W1h1fT83vGc7C2VgZ/YpHevX0mNjqCFN3dWYcUn/FWakdPS12PpCk
	 5hcqeYhGCt8bDGoeY35i61PXzcSEfRW3MxKuRWc/vypFdi5WaOd+ti8D9LWHvGRdpQ811
	 rnM7izVMnxiiWK1SrQeAYERBM37jRnyKZU1L9T1uJ4SXKFdFc24RGI4an6QWg/OgOZXTj
	 +FcSUwcRoREv7j/fxRrLbfBkGx34BtlYiVP7mzEltCoMsw1OWvirnXcuiw1Y/Bvbw484W
	 dn01sxKIUlMMXZlTlOUgbQwwiH1fXDZxztizdpgWHP0XmFLL77FGucTaTMyl+cxtZXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drLmfIWH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEADD6083604
	for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2026 14:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEADD6083604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drLmfIWH
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so981644eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2026 06:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973658; cv=none;
        d=google.com; s=arc-20260327;
        b=M0Y2k3dvvVApHutq/sUXuzwxvTO2Uu40qczOClSv+7/4GtinfauAa6pXO4B+IlAYA1
         BJWRsfCqSN4Y2mCkSPmsuZgUKgP3oEbCm9MBhfPii0JtsGurVUB+GEa7YrYRUUUeGy/l
         zg2NIG6Yusb1C9cHaM7soic/e6+3NyfrqyXrkhoIUtVybvbWEiRQEAB2/iVwXX+A6bKd
         lVo6CnffUtiPrr5x2VnQdP6okOuLZQwhz7cpOUqey/0U6oizp/qov3ZMANIOCm9JT04c
         8HL3YuotTm8mWnYp+cKPM5L+Bm3aAeQGI27IvgzdrRJ1ObDehtI1MAtJ+ufsZZd4g64h
         BE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
        fh=eAHVsFe3CvsYL42VFtm477opuY959+tP08ZPe/c56ZY=;
        b=D+UEsnFrEHTrfB2GmTwMZQdVTby4oRFC8YF34hBZD22/U54OARUu8BCzDl3tKHIBm0
         vsjvDJqOu9qZXKp2Awgn+kTNBlcQj7Vo9BlFSJTprOl1Ui+apdCe/lmKBURZrXxstA1h
         XUCJhYV2mJS6nZbySAI9Sif44d+rEZuiE1QcItJF8Z1Oux6toJcMkSndbb0iVI0WkpOA
         iSDRrk68/LdTl94SzUXQWI64gIqVsTi5Wb1thjYHSRkVH29tk1MPoY5CUDPUWTEa3N9c
         7UfSxYJf4M9VpWFSRbTn2Gjb+f0J18Ib5BUKTNimLcikVKPbtq/WzsVZ42VVv+P/78c1
         1+zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973658; x=1794578458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
        b=drLmfIWHmNjFGJ2okFI3PDhzqmHAcfqsnySCB7rw/W77UUOkFX7xuxvwiZ5dr3gkfQ
         ztkUF3fm7nJvFCzkaIfyDudOv83rr53y2R1qEPGn99UQj/EhIQwvyWaCMcs5STLKiiV0
         sCNZoLu/wV32Gbsj5/rGC12wMoMBD9qDm1ZwpnLbhkDgrdk0X9EheOsOYv014/usY9IM
         60dcmbj/dPxJfmDHTgBauLdOT8MG7RvGYwBl6k1iTtOppp4PYdPene3mLMhqzxuJnQVW
         Flecu/xtDjM2s53a+FC9w3DckwihaVuKdW24PlQa2GnbKde31u+s/csLHwhnkQP1ZDXu
         +h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973658; x=1794578458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
        b=TZTvk1JOEXR7V4FQPVIzl0VKHEMAivIMH9Lcdzwl06eMxSJeZ766hmH9RxjyQs92pr
         UXSdHfslZtavz5elGyxyO2L8Kow97wc9qbSNnV43qthQMzJ3C/VDwGKODJEWTgIm2Br3
         d8y6UeR1Rn3SiFF1pNwOFwhD5VkIAybr2LuMRiVQ9e9Ysb8CXmwxeKkUGok9wWF/IbAL
         I8Z6s9utLCTFIMCp7/Nm5TIApHtrG9Uw/fcku+Bv+mHKEicnKq4eg7ksmDUaFbgs3KI7
         6DExbiqkBe5S4vrKHOES4jJoj1y1m8erYmSK6NdYEIshddoJq9C8r72vRsLcZFy6rjQl
         eoUw==
X-Forwarded-Encrypted: i=1; AL+hErELUVX5u746b08pkILIVZW9Rw2cUnSjv0IUnlxB//PeI3EHbZ522AWsMOqnJGXylGdOrw8SN2PMyHlR2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KTc7E3K9vjuhc549uu49Y+j7Zwyz29xpfgwlrIjU/jnwV0avg
	SATLw+25Uo0tJ6c/TPDAC21wQqovY/xiD1GGykLl5oOeShiHDeKA83pfLcQVqyAoyTtUHxJe1fb
	RaAlw3pD9HanTXK+5TCvD1/Cn1soth0Y=
X-Gm-Gg: AYBFou3zwqOk/vp/z/GyHH+3VANkIM3JOxrNBmy9VaeG1Xk86EOWrRQ7O6F8Cpumld6
	ZSWuORNjlF0f21wuplnvLfUFEfiNghG/gC6iXVsKn+lDRhMzFW70lhPWqVtRisBAP8d9l89NLfS
	kNW9KvBBQ2Dmnfdp6SXWK93Dq0bxVYPxIPco01hF6A0UPAwVT1RiVyH7qBrZHflMqDc9mZPVZNF
	eDU0HTpaAfMvnWLaNXOkILVNsgTVHrzL1/ZZA75cRfSxBDh4WEL8DXUwaoknOmb+YMk+S8YNrWO
	5o2CIj4m7xFc/xU8DQTtYul8rOiI7i5zJLuYit7OS+qZqXnlhGO5ss2m48Wfvbfkv41CbGpK0iC
	inD+P03MzpskBtwUU2Ek2eq2SSvo73yb1F4p3TL5+vTb4kIlVAKgUQkzhaNFfSAnBs4gAaskL3I
	8nVwJ15FgJZOlUmDeZTOxOvhn7J3xy2w==
X-Received: by 2002:a05:7301:c88:b0:36e:1fbe:357a with SMTP id
 5a478bee46e88-36f75443c1cmr3326733eec.13.1793973656931; Fri, 06 Nov 2026
 06:00:56 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-3-clamor95@gmail.com>
 <au3TcHXFt5Yhs_V8@orome>
In-Reply-To: <au3TcHXFt5Yhs_V8@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:00:45 +0200
X-Gm-Features: AclHuK_Yq17ZZfT-X8-aPL0HIpgqp80MKKwHsNn8Kpc_N4CDrvvxE70OSsxRMSo
Message-ID: <CAPVz0n0ngn4nf9uTOsM6OKB9jgTnJN1FrPp0UyeHwuAwoL5_tA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] drm/panel: Convert Hitachi TX10D07VM0BAA to use
 MIPI DBI bus
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

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:19=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:02PM +0200, Svyatoslav Ryhel wrote:
> > Switch from a generic platform driver to a dedicated MIPI DBI driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 167 ++++++++----------
> >  1 file changed, 78 insertions(+), 89 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/driv=
ers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > index 83c2af1be9755..d5d7ba2096608 100644
> > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > @@ -14,6 +14,7 @@
> >  #include <video/mipi_display.h>
> >
> >  #include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_mipi_dbi_bus.h>
> >  #include <drm/drm_modes.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d=
07vm0baa_supplies[] =3D {
> >
> >  struct hitachi_tx10d07vm0baa {
> >       struct drm_panel panel;
> > -     struct mipi_dbi *dbi;
> > +     struct mipi_dbi_device *dbi;
>
> It's somewhat difficult to exactly see the difference between mipi_dbi
> and mipi_dbi_device. Maybe that should be explained better in the cover
> letter of patch 1? Or the documentation added in patch1.
>

It is already documented in detail in the drm_mipi_dbi.h

> >
> >       struct regulator_bulk_data *supplies;
> >       struct gpio_desc *reset_gpio;
> > @@ -36,13 +37,12 @@ static inline struct hitachi_tx10d07vm0baa *to_hita=
chi_tx10d07vm0baa(struct drm_
> >       return container_of(panel, struct hitachi_tx10d07vm0baa, panel);
> >  }
> >
> > -#define panel_dbi_command(priv, cmd, seq...) \
> > +#define panel_dbi_command(dbidev, cmd, seq...) \
> >  ({ \
> >       const u8 d[] =3D { seq }; \
> > -     struct drm_panel *panel =3D &(priv)->panel; \
> > -     struct device *dev =3D panel->dev; \
> > +     struct device *dev =3D &(dbidev)->dev; \
> >       int ret; \
> > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE=
(d)); \
> > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SI=
ZE(d)); \
> >       if (ret) \
> >               dev_err_ratelimited(dev, "error %d when sending command %=
#02x\n", ret, cmd); \
> >       ret; \
> > @@ -54,10 +54,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_=
panel *panel)
> >       struct device *dev =3D panel->dev;
> >       int ret;
> >
> > -     priv->dbi =3D dev_get_drvdata(dev->parent);
> > -     if (!priv->dbi)
> > -             return -ENODEV;
> > -
> >       gpiod_set_value_cansleep(priv->reset_gpio, 1);
> >
> >       ret =3D regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_su=
pplies), priv->supplies);
> > @@ -79,123 +75,116 @@ static int hitachi_tx10d07vm0baa_enable(struct dr=
m_panel *panel)
> >  {
> >       struct hitachi_tx10d07vm0baa *priv =3D to_hitachi_tx10d07vm0baa(p=
anel);
> >
> > -     panel_dbi_command(priv, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x=
03, 0x1f);
> > -     panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x0=
3, 0x20,
> > +     panel_dbi_command(priv->dbi, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x0=
0, 0x03, 0x1f);
> > +     panel_dbi_command(priv->dbi, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00=
, 0x03, 0x20,
> >                         0x00, 0x00);
>
> The majority of the changes in this file are s/priv/priv->dbi/, so maybe
> just make it so that priv =3D priv->db and keep the changes to a minimum?
>

I will consider this.

> Thierry

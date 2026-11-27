Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770622;
	b=j1tG50O5MLa6Y52cpcQwuSaTJYRZGXNyBfilSo8ad5HNE8R4jgZQ1nm64gxvsthKjAcj
	 lD2HEy5UzBYiefvelT3UklJ8Xtm4TrGRSfBpupuWcHiTuvbxJwjGn6rqawenojkBF5HY7
	 skNXerrtlLAMzDtxRDxdhxhi7+K3bRBhXLuOx25y+UszukYARYgb0BQ+JLQAyM0Ebzf+U
	 cLzRXBZqcEoTeC7YL59qAYqUBU8efu+MVSCkjMXIJlbcn3Tps1ae4SC1wRxvqphbKvzkr
	 VWFvei/WC+rc4WgL+8XyeBALVpfxKDN8z9NA72Xf4/zGwzffKsGQIs0CSFHlMOz0BDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
	b=49Gt40/OgjDM+EuJVFKbZvEOLRq57SPL+3JShEeUaS0TK2TfCZfGshE//4tOMpsa2cop
	 DGh0BoBaRFoF2S2BpeGd/4q5jUd4lDxX4G4hDWCJtbU7oLRPI38unCNCOhfjBS+BCYvuU
	 6/z4exafZ9sVjmmhadhDFd/7jUSErZZjjHs7/dnx1IF7U7l/76LQGwoGXkt8KXKLg6u8G
	 myH3vSCT5p3yYIKuoL3inaLQJGxrA785/jZ5a4jGf7btuPHZab7+hxXiOBgYmK3LSCsy0
	 OjbwHTu+pNWKYFFNYGz3+bb8kPoAKTNViNzfmzgiKIDQzzaQMykxIYKmmlGYS2m4SIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+ASaesM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33809606A321
	for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 09:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33809606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+ASaesM
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386d1859e1cso2189136eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 01:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795770620; cv=none;
        d=google.com; s=arc-20260327;
        b=KNTlhcQIxQk11YiE4KafzuCy4h1wqQLKa0O5YO0/vW0dsMEz7Eurk8htIxov4EgmpW
         aIIufqyScEqWN5jWVU+UlXUTwFCncT+lVK9H+d+qp6yKLx/i25KfXBnVqaPyVAwY56+p
         m9FsMTVZzJEPb7u8qc9xRKLyeWSp/fTo3bbZkThz0j28vq2XHgBz4fE6e1MwRV3F7uzT
         B32iZN/0BxgumgWC5wExA5HA0ou0gcq9VhqHA+MP7Uiw0LBlvsq9OpgiwIAzK+ZP9v/l
         P8oGzHD9WBUegN1/UI1FNITAU9NcsJQjSmapckHOnOEVYA6dkgPGy3eaeF9tjsE6YmkU
         oBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
        fh=nwq+hXtg2DsjThKRPliNiPYbWLELxBES2aFkb3hBgCE=;
        b=RUtRnDqDj4T9CaXeh+/itLl/Wq/0fxPUdPCSRu1/QodydbA5xEDrS0/YnEWFKvmf4M
         SGScvfSnTKtH/ee/f5KFtXRscoTEvLhBNY/7a8q7/K5iQtIQPpn6NWlV+foaehJHvZWZ
         yvUP49rPzaMDZ9hakPTLqVjVSf64G5spcRKoAhttO4lKIjTGKWRqKOKEaiPdW/LQv84M
         +cvFlnIrj/CcZ4vhEFSEZL0CjQx4x+8RybHMWGOhGMjO/TE8/XjqUDcYs8zS8Wr29q6u
         A8WnsqCsEVG71l6KYab/UhmLBMozGwKXdnPOsovfvfL3G6tybz5oZ7B9a/iH3Lxw6yYa
         JmSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770620; x=1796375420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
        b=C+ASaesMaG8sC0jROZY8oTB1Syewggehc0t3fKW5tvM8R64+d6YV47sO3dHY5oW1kl
         XmeOUkTGBKZui/vWZV3pw6PbSImO2oWhBZEoua95m+Uj6bEQwzQPfK8mAr+yJIc0nxIA
         3t+mqwlePrggszdszBfVx6kYjFYqhPHMvqp3WrF7mipWdQOKToVl38/P/eC5SB0a2H+s
         qHpTRinrzmxMuGEdNCM+EtuZEEezMPkKtWeDskKvbztNbro71czf1RFFs966BWSl+9aK
         bWoOCrQnR8zNwclhqV/m47MmEvmqBb5OpUgnZ+giN8gHGvcflJzmTip8+H+Dcrf2S+KS
         ZZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770620; x=1796375420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
        b=XwIJltoHoMpRTyVfljeA2pEv3HSdaN42/fy5sHRpn07jIJ3EnqL7qHJclcxWq9XAN4
         TRM24wpsJc2JDLcd9YBUzP2009UBaelWQNy7GIz1440sh8/Eal/MghzWTIypp80cXJ8M
         f77CgTG/rzXf/0qbXacTcKmPB2Uvzow/MpxtnPL7BOax9T71q046dgTYuwU3Xwh6kPOi
         KAxnGj4iKH8D9Kn6oYMtRF0aN1mvN7bSlpDJQyfLscOIK45GiDaexi+QPy9EDfSodwy+
         2PnwOO8BQcwH6wmQIwJAvfTYDYuWBadfE97Ion5OUGa/AsGH6WmKwcIuHWdLej4NNBIl
         53PA==
X-Forwarded-Encrypted: i=1; AL+hErHwvrVK8UBfvt9En7AaMRMe95tu+gjRlD1gY/FWeA/oL7GcyCRj5rbIswbRTqnCKGSUdDn55sBxuWcE5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9gj+BmV7dyrYHOkG/6S9QmVsr2gqpsJ7qTVctfR2U0Qm3G3jOr
	kGU0wUxI/RJqAvcUACcRnXwLnozYkv/C9ha+3uha9uYXlFzA9YqForAh28AlSkdYfbGDMRNTLey
	oJ1b740+805/OJMy2abTyZNUBSQ60iPM=
X-Gm-Gg: AZFdTZfPnz3/stizbtOvqjUDYy1QCwVaU4r9KTbBsjpSCNaZzyNE+l5mWijz5KXyMI0
	WlX+F4rKv9IGOHEoWER8ZJxNLivDJ0yfwfpM6eT/8oE6HnBu7Iu29V0qKJaALcFBqzp7sCeXjZI
	lfIlMq2xr1qmbfbKraNE7lvYtS/zoprOilx3AhkRN1kaxfB1V5rE6HE5Qx5uBAfzp6snLFkZtXf
	v4JfVaElpMsHDKPgAbJife4jMojKHVU9gaIpKts7RR9g8Aq5mJ3WWgmhoxQ6S8wb97wfNxDudco
	rW8kCsem/ekiWd+L2JSlQWjOgiuNVmkL9EaN9/dt4weX5b9ApOQ6T++bGToM4zoZisZG4+CE4/Q
	rIlGkcCtE40WV57kMgC0BIyAXCBEzHTej+zBcpYpGhqYja4jlPsWtT/qEFNBiBJPQlUHlvI9Byk
	ZKFeHpF571fJuXwH9W9n8e3/1x/8i/sYvyRXkIz7O0QoFDX+ppWaI=
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id
 5a478bee46e88-386668523cfmr22742277eec.12.1795770620255; Fri, 27 Nov 2026
 01:10:20 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-3-clamor95@gmail.com>
 <hlO8KiQKSi62yShZAIyhpw@nvidia.com>
In-Reply-To: <hlO8KiQKSi62yShZAIyhpw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:10:08 +0200
X-Gm-Features: Aa3M54rkyrHWlpK4-CIwvCUcDLkbHyRjNHzHood9SyBQos7xlCctA1vsn6y0klI
Message-ID: <CAPVz0n0Qyekm7qUyCVFMTDSuVSw=1my4x-rgiafp3+mQ_sgk3Q@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert
 to use MIPI DBI bus
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

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 06:2=
3 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Switch from a generic platform driver to a dedicated MIPI DBI Type B
> > driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 25 +++++++++----------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/driv=
ers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > index 83c2af1be9755..318ece68b7806 100644
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
>
> You should now be able to get rid of includes of of_platform.h
> (replacing with of.h) and platform_device.h. Agent says drm_of.h and
> property.h are also unused.
>
> > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d=
07vm0baa_supplies[] =3D {
> >
> >  struct hitachi_tx10d07vm0baa {
> >       struct drm_panel panel;
> > -     struct mipi_dbi *dbi;
> > +     struct mipi_dbi_device *dbidev;
> >
> >       struct regulator_bulk_data *supplies;
> >       struct gpio_desc *reset_gpio;
> > @@ -40,9 +41,10 @@ static inline struct hitachi_tx10d07vm0baa *to_hitac=
hi_tx10d07vm0baa(struct drm_
> >  ({ \
> >       const u8 d[] =3D { seq }; \
> >       struct drm_panel *panel =3D &(priv)->panel; \
> > +     struct mipi_dbi_device *dbidev =3D (priv)->dbidev; \
> >       struct device *dev =3D panel->dev; \
> >       int ret; \
> > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE=
(d)); \
> > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SI=
ZE(d)); \
> >       if (ret) \
> >               dev_err_ratelimited(dev, "error %d when sending command %=
#02x\n", ret, cmd); \
> >       ret; \
> > @@ -54,10 +56,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_=
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
> > @@ -243,9 +241,9 @@ static const struct drm_panel_funcs hitachi_tx10d07=
vm0baa_panel_funcs =3D {
> >       .get_modes =3D hitachi_tx10d07vm0baa_get_modes,
> >  };
>
> Unnecessary semicolon here.
>
> >
> > -static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
> > +static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbidev)
> >  {
> > -     struct device *dev =3D &pdev->dev;
> > +     struct device *dev =3D &dbidev->dev;
> >       struct hitachi_tx10d07vm0baa *priv;
> >       int ret;
> >
> > @@ -264,6 +262,9 @@ static int hitachi_tx10d07vm0baa_probe(struct platf=
orm_device *pdev)
> >               return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> >                                    "Failed to get reset gpio\n");
> >
> > +     priv->dbidev =3D dbidev;
> > +     mipi_dbi_set_drvdata(dbidev, priv);
> > +
> >       ret =3D drm_panel_of_backlight(&priv->panel);
> >       if (ret)
> >               return dev_err_probe(dev, ret, "Failed to get backlight\n=
");
> > @@ -272,9 +273,7 @@ static int hitachi_tx10d07vm0baa_probe(struct platf=
orm_device *pdev)
> >       if (ret)
> >               return dev_err_probe(dev, ret, "Failed to add panel\n");
> >
> > -     platform_set_drvdata(pdev, priv);
> > -
> > -     return 0;
> > +     return devm_mipi_dbi_attach(dev, dbidev);
> >  }
> >
> >  static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] =3D =
{
> > @@ -283,14 +282,14 @@ static const struct of_device_id hitachi_tx10d07v=
m0baa_of_match[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
> >
> > -static struct platform_driver hitachi_tx10d07vm0baa_driver =3D {
> > +static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver =3D {
> >       .driver =3D {
> >               .name =3D "panel-hitachi-tx10d07vm0baa",
> >               .of_match_table =3D hitachi_tx10d07vm0baa_of_match,
> >       },
> >       .probe =3D hitachi_tx10d07vm0baa_probe,
> >  };
> > -module_platform_driver(hitachi_tx10d07vm0baa_driver);
> > +module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
> >
> >  MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> >  MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel driver=
");
> > --
> > 2.53.0
> >
> >

I agree that your suggestions are ok, but they are out of scope of
this patch. They would require either dedicated commits or can be sent
as followups later on since they do not cause bugs.

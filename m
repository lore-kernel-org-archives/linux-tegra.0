Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795784921;
	b=g9mFAdwv9v1bjL8cFGri9lLOyhdwawdpbZ8nF9Nm7Zckyp5PM2bi047OPFblAG1bibvl
	 0G2e4o8FJRxvvUPts6A1ttuiVJOR3DbOSwdZpOqs/4AE0eezeGXCf104ujV+3Fc9qurn0
	 4FzcKQJcSvZrdj0RiSjazwmE2zspn1IYbLePaD8k1FvbXT1Fxa/850KDYZW7UkkasHn6L
	 ZRu6+HyQxGbBdTmzYoonkPBUWYPR3tWnc1KGjCbb1aWspNYM1XHn70Sp5HkyP+vNf4wkC
	 71GDUF9BzjaSRVBlqNHOeoT2pgmAwfZz1Myg/y1I2z+TfO98Lw0J+ydVrF2d3vZOGQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
	b=bJLe3If4BC9y5wKXlBSTjYNC04S2d+UpP1x4Uyl13C26I/km9whlzMw8QSkXrgUyrD5x
	 /m7/UpE4TVX+alq8I7xiYv90IA51d939svJr/Fsx5B3VSvGq6fP7BLjhtpdVHyy2aUMap
	 ViYlI8JAcJsUytECTRu6YAtZ2dS0FkvbMx0qNzOqyWUg4yQf61gWlOp9r4WdkhJmKUyfd
	 XKcnId5hKGvjhOUx1CDsR8p4NbRabo1QNPUhXIR+eTiiuoyvmEduDctSmFMrjUbyuMy79
	 wqXhaZ8H7anQyC03rEJZXk5nT7RBUcynpzxMMYxkSJ5p7MHRYDEIGvnNBSIbAxxvnDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chi5MtYr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2FE606A31F
	for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 13:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD2FE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chi5MtYr
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3863db981d4so11361005eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 05:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795784920; cv=none;
        d=google.com; s=arc-20260327;
        b=HS/kCZ+YtjBFp67sMyklujus2M++sh6nizccuc7TCorK8DTqfI1J9w5OCIxTC2nHrY
         J6r35f5po19gs4uCT2xc2otA6pI0+vBDzoPVJgm8XopecQtf+avhoVPOMuVlY6qwKWou
         QCTL+0eSQr2CGlOJgUJJummAyoYhDfJZ+W2dV0pG9GuFfggLGpoJtggw1gRSH2JhS4ZY
         Azs3mZ8l+vuXnIWKZbg5t6cE2F+yEMIXil+Y887IJRJkf8cpRAxagNtDbkLLDAaGFPHH
         Bl7RiSWIgZ5CnJKHE1prbe+ySjH4BEEu/GKjmevnqMD7DKi3pCp2+ewjobQ4kiYn+xn4
         HhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
        fh=On3IuveDePhqBGhRSVRBdSgHzeTqK76gWiGOsunAfmY=;
        b=MElfmqnN/7rHKj9pQ80ousuuENmWYQq9FsFPsqy+WIijHb1/e3eP6S/cam7KqDOg1/
         hNjAFapEOTyaO6v1VEj5nzXauWiycgEMGfHPVIiw/3A1gWdp6+4hr7D9T9UvVPUVVk5A
         ZPhUEnkv8HzSNJXaWSTaBlWmHRen2xVomV7RCPBg3stkygGVGRjukl9WE4H/RWgpTlMH
         K+/Bpm/bLF2Uc/L7Eq5RfmpsGU7JpNHu3c9EQ6GDdVvMpIU1app+t2muS0YO6BC+ZL0U
         JDouhO0qKINIcQ4hDjMxjTliWf5W6jA2RA+1Ye7Wq0OWOH9ovrk9vKMM7k9UO1AUCGM5
         T08g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784920; x=1796389720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
        b=chi5MtYr3koVFYMUEYFb/9Z33Tg5jvqNFv7PQiVYP6JtHQogg71xigG6+9IKUkLflg
         5tqXonZxZKCkPH7LxzxdtM6eT0IjqnV1tNiKt6S/wqjgcVPvklq2RPIPm10uVPKTjS5f
         vgBQ7ihJ6JxXsHRy+TG14neqjBL/5CWUhbW5dnzciv0/SQgdXH4jHo8+3ZbhVgTe3jnC
         NGdYvemtb1U5RQDiqiCJ+0iIM2aQt4Z1YzhvIOx4MfLGYD6OpXoUM34mXC80iizWZ01X
         xw7wTF8k91xdsblalCvkUSKdLNlC7qGCgU8XGuwGjwXJVM+S1N8o+VXIpSGYS0oveZcu
         NOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784920; x=1796389720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
        b=uiC5QdC79LU2VG0ZEBPvOxnUXiMjX0G7GtIiQB4PhKglFtKuiCegYVREmRoUZrS8DZ
         rcaW+OHO9khibWf0IcF2Xqz3U8YTgKoBVIjAYDgNodrdgqSSee3ZJekzSdydlDiVz9EF
         cFF9/YUyC5Nk5J98+Y5mEfQYk7IffV0fzaKk9Shru4zfF8xN0OBTkW/eEQxLyeP/2wJW
         5rHOVMntneLlJeC2f5TV/gXYTe8FOqjyMGoh+//tQg5kozhu5gOILmBjjxwMozoYK47T
         sjHefpGYeSQ6qezDLr0/zFDDL+b1b3YYdoEbkPOtru2BGGdM1deXmKaDAZsAh4CWjRAY
         2Qaw==
X-Forwarded-Encrypted: i=1; AL+hErHSOU27cMSQsf8TPSXR4Y46Ouu3Xgo9v+YPC7m8AHr22LcoBnUBo5csj4eZetn+enIzN4Yf9uBv6GyqVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0fkqKxMnIKwn08e+FSNmsDdYle134WWTHD2dxqOBuUD90/O6/
	YM5Rb4tNNPJEnxo8yVsJWcAawWJHmxPh3So4FN01JErmV1x38Vphhz6G7RsZZDQ3099TAKTzUdV
	+oXp2+s7XjQM5onohvvnxTMvqXgI/jd0=
X-Gm-Gg: AZFdTZfjUoEnYCpNVh3oYy6ApT5Ra7NQ4jWJgg02AeY6zgHeZzCEvEBuWRQIaE/1o85
	cL1BH61bDEnFMtdJGBV0mqtLo3OxHm1TXsqQpz9822IF+gZadTVbtFqslfGjSILljz/5Wu6TtyD
	QCRSfoA5o6XXQP4C4DAx9tm8gIMuzI53Okk/PgX9qWcguEtDTIqQE2EaNruWlvz4f35/ERLaHTW
	OPHbM7qpOqVADy95fd8Z+dRKZpV+FIcn+ZAkZT53mfEMAxrfLlpC9cGmJ4PKwzQviyQz1XUyMYR
	1VADhw8UtvgtWgzjhx46VWvipePBidPkJE3Fkz7VfchEjbWowr4bckhhzpNcoLdW2TuQMac/QRc
	eAxyTS7PBKHQTDtRM+7rIMGrSMR6DLtQSgekPG7CWB6dCi2ZPzMXkSJ+HfXNGDLvbTkix5HIvYj
	VSj/ObLDxsI5tt2NMvTp01JHhmHJB5vYo=
X-Received: by 2002:a05:7301:10c4:b0:386:d310:4c1c with SMTP id
 5a478bee46e88-386d3104c52mr9700616eec.21.1795784919819; Fri, 27 Nov 2026
 05:08:39 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <hlO8KiQKSi62yShZAIyhpw@nvidia.com>
 <CAPVz0n0Qyekm7qUyCVFMTDSuVSw=1my4x-rgiafp3+mQ_sgk3Q@mail.gmail.com> <uQ14beL2SOumMxaLqMFc4w@nvidia.com>
In-Reply-To: <uQ14beL2SOumMxaLqMFc4w@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 15:08:28 +0200
X-Gm-Features: Aa3M54qgDXor0Xf9K6XHdCJ3yIc8SRM3BWawDQskrGgi0w7vMixGfnu5GIJLqUQ
Message-ID: <CAPVz0n3hT2qGag=CzH6JimHpWVqTC-B1p=7n5U9SPP7UHyeGdA@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert
 to use MIPI DBI bus
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

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:2=
0 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 6:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
06:23 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Switch from a generic platform driver to a dedicated MIPI DBI Type =
B
> > > > driver.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 25 +++++++++------=
----
> > > >  1 file changed, 12 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/=
drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > index 83c2af1be9755..318ece68b7806 100644
> > > > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > @@ -14,6 +14,7 @@
> > > >  #include <video/mipi_display.h>
> > > >
> > > >  #include <drm/drm_mipi_dbi.h>
> > > > +#include <drm/drm_mipi_dbi_bus.h>
> > > >  #include <drm/drm_modes.h>
> > > >  #include <drm/drm_of.h>
> > > >  #include <drm/drm_panel.h>
> > >
> > > You should now be able to get rid of includes of of_platform.h
> > > (replacing with of.h) and platform_device.h. Agent says drm_of.h and
> > > property.h are also unused.
> > >
> > > > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_t=
x10d07vm0baa_supplies[] =3D {
> > > >
> > > >  struct hitachi_tx10d07vm0baa {
> > > >       struct drm_panel panel;
> > > > -     struct mipi_dbi *dbi;
> > > > +     struct mipi_dbi_device *dbidev;
> > > >
> > > >       struct regulator_bulk_data *supplies;
> > > >       struct gpio_desc *reset_gpio;
> > > > @@ -40,9 +41,10 @@ static inline struct hitachi_tx10d07vm0baa *to_h=
itachi_tx10d07vm0baa(struct drm_
> > > >  ({ \
> > > >       const u8 d[] =3D { seq }; \
> > > >       struct drm_panel *panel =3D &(priv)->panel; \
> > > > +     struct mipi_dbi_device *dbidev =3D (priv)->dbidev; \
> > > >       struct device *dev =3D panel->dev; \
> > > >       int ret; \
> > > > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_=
SIZE(d)); \
> > > > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRA=
Y_SIZE(d)); \
> > > >       if (ret) \
> > > >               dev_err_ratelimited(dev, "error %d when sending comma=
nd %#02x\n", ret, cmd); \
> > > >       ret; \
> > > > @@ -54,10 +56,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct =
drm_panel *panel)
> > > >       struct device *dev =3D panel->dev;
> > > >       int ret;
> > > >
> > > > -     priv->dbi =3D dev_get_drvdata(dev->parent);
> > > > -     if (!priv->dbi)
> > > > -             return -ENODEV;
> > > > -
> > > >       gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > > >
> > > >       ret =3D regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0ba=
a_supplies), priv->supplies);
> > > > @@ -243,9 +241,9 @@ static const struct drm_panel_funcs hitachi_tx1=
0d07vm0baa_panel_funcs =3D {
> > > >       .get_modes =3D hitachi_tx10d07vm0baa_get_modes,
> > > >  };
> > >
> > > Unnecessary semicolon here.
> > >
> > > >
> > > > -static int hitachi_tx10d07vm0baa_probe(struct platform_device *pde=
v)
> > > > +static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbi=
dev)
> > > >  {
> > > > -     struct device *dev =3D &pdev->dev;
> > > > +     struct device *dev =3D &dbidev->dev;
> > > >       struct hitachi_tx10d07vm0baa *priv;
> > > >       int ret;
> > > >
> > > > @@ -264,6 +262,9 @@ static int hitachi_tx10d07vm0baa_probe(struct p=
latform_device *pdev)
> > > >               return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > > >                                    "Failed to get reset gpio\n");
> > > >
> > > > +     priv->dbidev =3D dbidev;
> > > > +     mipi_dbi_set_drvdata(dbidev, priv);
> > > > +
> > > >       ret =3D drm_panel_of_backlight(&priv->panel);
> > > >       if (ret)
> > > >               return dev_err_probe(dev, ret, "Failed to get backlig=
ht\n");
> > > > @@ -272,9 +273,7 @@ static int hitachi_tx10d07vm0baa_probe(struct p=
latform_device *pdev)
> > > >       if (ret)
> > > >               return dev_err_probe(dev, ret, "Failed to add panel\n=
");
> > > >
> > > > -     platform_set_drvdata(pdev, priv);
> > > > -
> > > > -     return 0;
> > > > +     return devm_mipi_dbi_attach(dev, dbidev);
> > > >  }
> > > >
> > > >  static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] =
=3D {
> > > > @@ -283,14 +282,14 @@ static const struct of_device_id hitachi_tx10=
d07vm0baa_of_match[] =3D {
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
> > > >
> > > > -static struct platform_driver hitachi_tx10d07vm0baa_driver =3D {
> > > > +static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver =3D {
> > > >       .driver =3D {
> > > >               .name =3D "panel-hitachi-tx10d07vm0baa",
> > > >               .of_match_table =3D hitachi_tx10d07vm0baa_of_match,
> > > >       },
> > > >       .probe =3D hitachi_tx10d07vm0baa_probe,
> > > >  };
> > > > -module_platform_driver(hitachi_tx10d07vm0baa_driver);
> > > > +module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
> > > >
> > > >  MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > >  MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel dr=
iver");
> > > > --
> > > > 2.53.0
> > > >
> > > >
> >
> > I agree that your suggestions are ok, but they are out of scope of
> > this patch. They would require either dedicated commits or can be sent
> > as followups later on since they do not cause bugs.
>
> I don't see why the include changes are out of scope. The platform
> driver was including platform includes but now it's no longer a platform
> driver so it shouldn't include platform driver stuff. The rest are minor
> enough that I think they can be included as well.
>

I can remove headers, sure. Regarding semicolon, here is a bigger code frag=
ment

 static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs =3D =
{
    .prepare =3D hitachi_tx10d07vm0baa_prepare,
    .enable =3D hitachi_tx10d07vm0baa_enable,
    .disable =3D hitachi_tx10d07vm0baa_disable,
    .unprepare =3D hitachi_tx10d07vm0baa_unprepare,
    .get_modes =3D hitachi_tx10d07vm0baa_get_modes,
};

- static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
+ static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbidev)
{
- struct device *dev =3D &pdev->dev;
+struct device *dev =3D &dbidev->dev;
struct hitachi_tx10d07vm0baa *priv;
int ret;


>
>

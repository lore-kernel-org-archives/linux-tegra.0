Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973684;
	b=jNR6xED9SIvWeQet7+JFTc36ID9InG45OIzrpCqx4KYcoKkK4ceb5yhmY/llEqKbUSCU
	 C9pLgpgLAYtJm95OuH+rY7DvmMW5d179SjqfspceGqjdBcn7SoRmFc9EXpIOup1DtbreO
	 DsPzGe2ee8cw6doul5PIKWwOH9BbKyaC8yYZIUlyz7hrWfxhi4EUmxllfBcszsb2DsxtF
	 c+9q0x8olWK/Sbe6mZ59RVZANMDq7KfhSbayI3iU4HAVcb3B+bdOOmBeRY4zNDhLX4suq
	 BhONfC+0kC4RdAMPNVW+xFNboTM/vHFHbEoUsp/R6J3/d69MjHmoVHt0uOPxk+BjtWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
	b=PGZ+zX/HIkdxSI5UK5tt2y93qTuUcxc2eQBpA7s0ZTGJujf5sQ49lUPHSVDRi9wfeZmM
	 3L4WJ4TLJULSzmJ+fjCzFlyVFMuTtpz7rmNrZNp97X7zdF9WmKIP+CFejfZG3Vt3vo2Sb
	 6K31Yi+qHRP17q6qL/Z1rrPanIMlyKzSLVHEtRCjDbGRDgjP0IUw/McAFypPW9TDA5RvQ
	 FaWr0i2ilyq0A8QQBxfH6ZPTGgw2JZ4uERmfG0t2KO1VaVHDBAVhs7SeXNXWTC5IfCnXM
	 W8HtAwSqWjp63wbcw6hRBQADsSkZpDzGi/VSl+0Ezg4ABt2cM5tdef/VhCA64LYDMrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL4eyxbM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C58606A330
	for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2026 14:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C58606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL4eyxbM
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37000e7234bso1436679eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2026 06:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973683; cv=none;
        d=google.com; s=arc-20260327;
        b=Oh25do2ob/oOLo1dcvORngFKJ/yr1Qm1qfizI1DSmRDRix2TD/qShGfDlLEa3475JO
         eA3u8+KFfI2C8p9tbJOMEZ6SV4dW65hoFKdqaC3Ovyg37nVMCCSmE/0uRfzzrkuF7TWv
         bGWuZvHivU7sdqfU/hVg+TLW/Za5ioaOrDt7lsz2gkAAlXervhwLv6pUQHa2nyUo8j4v
         4kS0kpCcHKqWQkaqLBAvQXWm76hphbYdZUB+qGUnVg3bV6tLYvIhVTksf2cWb+BYrj8U
         T0kF+0KKAVzjREJV4zhsIDKUVpGJslmPcf+H/yyz7tPXoh3yzZLGKqak4D08drLY7nOD
         58xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
        fh=jmZKFusS5Odp0OoTgrx+rKnym98IO43h4PH81zTj/9E=;
        b=QbjVg0LB300umWO8JO+6w0Bosbp37mcNyqh/R7vNR/zp/qG+3dbazYV373Gc5w6hoO
         j+I56jYO16CB67XLrP+6WqBMgbiMhxXa+cSjBXXbLG01ntVKYpcR5sgFlJmuy5rauDoo
         FERXt5EigwMBNkFDMAwLO6P7xD271BIZSqkgjkiSD/9L9XzY/Iqz/VtiASBENqBCMYjM
         +Cfxxz+TF9dTNIcMi+c44N792o7o08VNZp+KOynpaLZFMzazCe07AVyM5WEK/b/S7WaU
         IVJz6vFHJrSzC/TtWVlAikfd458Xfs+s+d4Wws30OnFm+I3Q6T3JWrSmLq6lJUmG5G3f
         Wlcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973683; x=1794578483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
        b=AL4eyxbM6ObsEeaa/2gazaSA6gok3iVwFeDJ35E8/pILPVLYgobruozBObA/E0Ggq5
         hgif8S8hZbEx6Bf3cNzY1Tf49lnz6zSVH2vYhKsCcXtuROB4SwwgNXynTcRx1UY8rXWs
         ZT8iGvsq1xD8mxC7xx7CJk9mXQ/QVDZpVdFxRcVhb+An9UbIfIHTryosu7EUoC55bce3
         UABoSch8O7ZkCBkxTYU07zOzKyzE/1uizzOd+nMoCH9YBaHJhPaz4lbnc9U/Cwo5LzJH
         NCF0QgV9ITR92fjzJdEuhrtNdzwbNBDNocuomHgP4b8dlaY3ZJocLbuZQpKtLwsdKCjt
         dOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973683; x=1794578483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
        b=A3qq2AMs2KshvCPS2J9RF0szbNDB1da9O3DoUEt9ant6uKaZqdm3R3yfmG+DPZUcwA
         dIUH+4E0pnt5r05/7Z8uKiCFLHt/eotKGAMmF30wA3ki1vDbpqr3iWNIOJUNSGez90GZ
         1v0KZrPIeJuK0LYD2riPI6+jIm39D3XheRss6Wu7RfuRalxQpWmatolTo03MqhlfqxiG
         jW2DbirJSpUmdyyFFuPQANT6eCQhQjdFm+9imQsuUwD2kfQ6b6WpRGj40GE0OpF9Z9iX
         9j7VE1E00I4ghhrSP7UBkR6pwx+Lq097jCHpKC9IIY9FDkDv9LujGgDB1orj/btK6GlB
         XfIw==
X-Forwarded-Encrypted: i=1; AL+hErFepI0oZitcF273HN5cvAyaEjDrcFJVWQtgw5NVTwB2Bch3S/Va5lQIMu+2DSoelMqNe58hPoeXNT0quw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+JTA/h2cHyBjeDbL2fwqvqDcwbxQC3x8yCAdNEvmGpWUmJlhqp
	qIFPQXvawxZIVBkxe1QumY+83OdG1woUh4x8j5Z3+JivMkEJVsXVfxAzZLGd7RuzJpAytaSzBq3
	234e9vhoeZBs3Z6EHlvuhiJMZz3W5iIrnpQ==
X-Gm-Gg: AYBFou28nr8vhe8eKn1gKpGVNYDF7S80uOZsfxMv1bTLkrYPE71Kizwb54F0na9NqFu
	NKO9ZZ3ck8uw6o27QIhjEFStezaRsLcLKtmVZJH8pgwez0efI8OJAqTTJ5PLjdyzuxirZtqe9Jf
	MpSoX7pKCwtVFTJOWjz3eWH3JU4PWcgGaig9zZhbIpG7vctsiBepqr1niCtaM03dff0fOQPCNNq
	BnZOXrhi10ItAw3FgyNPYn2/DDa0OJWst+LEiXPaHdGNhV12DYqFdmqJi05eXJ7+wYiaH/PyGlc
	fX5fDGhjjwh2InUvAgFBVp/URIIbqjECpsJUPcHGItW5kpRl45NyfFb68qBt/1qX2XiVhxH94yE
	temr4oIfOb5b2wUxm1Lct8qiySPvCqiNUOA1oGVwS6Oko2rhbMvktdknWWChLBFlltAWhWgzkft
	P8hghPhSeVcJA2OmqWcLmfRriBCr/77Q==
X-Received: by 2002:a05:693c:26cc:b0:36a:3005:aa65 with SMTP id
 5a478bee46e88-36f7611ec47mr2929151eec.15.1793973682246; Fri, 06 Nov 2026
 06:01:22 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-4-clamor95@gmail.com>
 <au3UDDpLUmeIOwEH@orome>
In-Reply-To: <au3UDDpLUmeIOwEH@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:01:10 +0200
X-Gm-Features: AclHuK-xODZ4BK6vgyhpVlnU3a_5DM9XqVLo8nBuS_cQ27Qs1NsbBJmpnu-OR1w
Message-ID: <CAPVz0n04Cuz8d+8m07oMVBpLGwcfVyMDu=uv=_U2zjoFVpfULQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] drm/panel: Convert LG LH400WV3-SD04 to use MIPI
 DBI bus
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

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:23=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:03PM +0200, Svyatoslav Ryhel wrote:
> > Switch from a generic platform driver to a dedicated MIPI DBI driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 103 ++++++++++------------
> >  1 file changed, 46 insertions(+), 57 deletions(-)
>
> Same comments as for the previous patch.
>
> > diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/dr=
m/panel/panel-lg-lh400wv3.c
> [...]
> > -#define panel_dbi_command(priv, cmd, seq...) \
> > +#define panel_dbi_command(dbidev, cmd, seq...) \
>
> This probably also applied to the previous patch, but there seems to be
> no reason for this change and the related changes below.
>
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
> [...]
> > @@ -177,14 +166,13 @@ static int lg_lh400wv3_get_modes(struct drm_panel=
 *panel,
> >  static const struct drm_panel_funcs lg_lh400wv3_panel_funcs =3D {
> >       .prepare =3D lg_lh400wv3_prepare,
> >       .enable =3D lg_lh400wv3_enable,
> > -     .disable =3D lg_lh400wv3_disable,
> >       .unprepare =3D lg_lh400wv3_unprepare,
> >       .get_modes =3D lg_lh400wv3_get_modes,
> >  };
>
> It's not obvious, and also not documented, why .disable is removed.
>

Noted

> Thierry

Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA99F207DF7;
	Fri, 18 Jul 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830138; cv=none; b=gN/7QwOrUn+yIyPEQvmwX5ONUgDNLoWHiGHyDgYLQVAjroKudG81um96L9GWj/0h2UoPskx/pS9Jb34xKDPvyCHd3Pw8+tN070xcyBkTea4N6WqpY+suCLYV/30lR5ZtE0064ngx5AI1xInypseey85zjydqiykYOI2DZ42RG80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830138; c=relaxed/simple;
	bh=DWQo4N1aIu2PmUq7o9scvFptocvEhoz5JQitCz8agcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEQTL/PV29DsWvET5n9s9lR6Pol6EkCDNRAKddYau8OzXAUjZpFu9khQmkxgiiwnr9icXZ/2ByoNT9oERmNTJCH86xx45KrATlPxr327YI9/KOH2aln17weYxOYBKT6rDEYckAYUBCn/5fdBaKZkQ+Y62CmdKmkzKz1VyDNQVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBnvwskM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBnvwskM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a53359dea5so852518f8f.0;
        Fri, 18 Jul 2025 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752830135; x=1753434935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtFKEM0q0llnqDb5hBHfHcNcA7ogog7O4+RwpSiUi+s=;
        b=DBnvwskMX1T1ms1uQcaXyc53kUfJdsOj8AyQtpRuV6ZFWOcHeAqL3iPK+dJdxH8kGs
         rHitzCN+ufWGB5OxJRl0NiCdJq0ftPqEkZ2r3xRX0b3ZDTUoW+pyfAWQorWW6CEBUh81
         hQtvPGvp31ILpK5ujP+LzcnvCI0NiBmbYIRKvWmVWUW2umne1WKKL9ifHfCR5XeRR+KZ
         NWHqvYBaZujU+bIUFBjfmoEJH9v9PwKAOGaqecAQYWC+wyTLT8YbScjl2w7n0Gh5xc4i
         oRUoZ/1UPv06TX251241LlucSWOlkQxncOpISkcjVzUVamCq0pj26CInR9HsOLZ72FKg
         c+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830135; x=1753434935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtFKEM0q0llnqDb5hBHfHcNcA7ogog7O4+RwpSiUi+s=;
        b=oNNWYfnrgGj/S8LfCxIEdUNNYy+dIgHcimvzm4DlT0cHWxPk7l9ockHVjLBh09ybtl
         JjcCe5rtSwL/sDmwGOc6MOIcw1lMf+3j9g6eEEA2CVSz3NXDUo49XtEB+THMXtvZJSKi
         m4BtjHbcNBeP3oIIIvEeXMCd2emMYZQfRs4sePGnmW6bL4ZvGdah9sAy3NP3mvYbXvOB
         hq2zU/C5BvfLz7THLLt3oGNhdioZNsdA7WrE9cqGqq1xUeXNHzFWbNyRKTNZhtYotZDF
         HGfzCa2O6fkDtgNKCpX0sYW4azG9gHmYXukdnZsm0FZxIbG80AB/Zo6zpSMwsmuFNcw3
         jVRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+LLtocAefZwVMrESAnHMFFqIdKunldGm4LsbmMStMBBUeUDNBmWoLhZQk9OtFTDgYtL7xuWBYwo7WZAo=@vger.kernel.org, AJvYcCVJGSgfxN0WhzGrezhrh1aOwraRHwvyaCQrQu3O8AN487y7w03jVjKBapEBFFAdhaXRXUJPg8G7MQytUkfB@vger.kernel.org, AJvYcCVnd3tuljKquATj0xJRcKGzaYhWnOkYsQhx0INwDoo4JCbX8Rp5jkj4CplK2eCv6CdMcK70Gj5NQnEH@vger.kernel.org, AJvYcCX9IeyGjEB5EzGIjC68fzbld19LHySCa30n43R2TsT8ZIDIFPcyK3XyBNXkA6ijD23OLra9ZlevxaVM@vger.kernel.org
X-Gm-Message-State: AOJu0YycGFXX30Kvl7ThxQ3E976sLajnIXtAyV66mbFfy3UkJDvEtKnr
	tjk/mJNE2ie8xHgHygVrbbrcl8i+LEbjSv8g3JXOT1eAi3YOOP8oZipgiB4IvoLBaqeHlBz2Ewu
	xVuh5OvDOegS8HtJJ1FYcujhlwhHHiWg=
X-Gm-Gg: ASbGnctjLxVRoJWTXIwo1H7vXjyaPX6yvXPcZ12G7IzyxcpooFR9Q4sJfvK0uzYM26U
	4FpqGzUDgIoGLbWawy8RWPxasZOVROio+pOwMfeXGZKEsx3dVVfl481TOIq5e8EffyyKkNHv08g
	yGzYcELhRV/vqCoywwo1uJ7w+wA3d20Ji8UfSbTrgVAPkC15zWeVtu22vVaxMZH5zz2GTx6EgM1
	rO2HhUz
X-Google-Smtp-Source: AGHT+IFbFV/WrZsVNGTKMIaUnj6VoATdarIKZ5rDIIhGNdW7534p06n1o9brwUTM4SAlEo/IUifRVz1oMt5xHQPbmc4=
X-Received: by 2002:a05:6000:144b:b0:3b5:dfc2:f0ca with SMTP id
 ffacd0b85a97d-3b60e53ea17mr8129767f8f.40.1752830134898; Fri, 18 Jul 2025
 02:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717142139.57621-1-clamor95@gmail.com> <20250717142139.57621-6-clamor95@gmail.com>
 <4191623.PYKUYFuaPT@senjougahara>
In-Reply-To: <4191623.PYKUYFuaPT@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Jul 2025 12:15:23 +0300
X-Gm-Features: Ac12FXzUeU9Uj9u7cxHHp6Dd6Ir5coldcVfWX0e7hBUUrkEw0TkP5z-Dt_8EOsU
Message-ID: <CAPVz0n3W1yhrOsiYmYecxtPeYdZiK2_UY7vVc2tiYbYwfWPp7g@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] ARM: tegra: add MIPI calibration binding for Tegra20/Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:01 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add MIPI calibration device node for Tegra20 and Tegra30.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  arch/arm/boot/dts/nvidia/tegra20.dtsi | 14 ++++++++++++++
> >  arch/arm/boot/dts/nvidia/tegra30.dtsi | 18 ++++++++++++++++++
> >  2 files changed, 32 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > b/arch/arm/boot/dts/nvidia/tegra20.dtsi index 92d422f83ea4..521261045cc=
8
> > 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > +++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > @@ -74,6 +74,16 @@ vi@54080000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             /* DSI MIPI calibration logic is a part of VI/CSI */
> > +             mipi: mipi@54080220 {
> > +                     compatible =3D "nvidia,tegra20-mipi";
> > +                     reg =3D <0x54080220 0x100>;
> > +                     clocks =3D <&tegra_car TEGRA20_CLK_VI>,
> > +                              <&tegra_car TEGRA20_CLK_CSI>;
> > +                     clock-names =3D "vi", "csi";
> > +                     #nvidia,mipi-calibrate-cells =3D <1>;
> > +             };
> > +
>
> As you say in the comment, MIPI calibration on Tegra20/30 is part of VI/C=
SI.
> We can't add a "mipi" device here since such a device doesn't exist in th=
e
> hardware hierarchy. We already have the VI device in the device tree, so =
we
> need to use that.

I understand your point, but embedding MIPI calibration logic into
VI/CSI driver will bring up another lever of unnecessary complexity
and excessive coding. While approach I have proposed preserves
separation between CSI and DSI and reuses already existing MIPI
calibration framework.

>
> A driver for tegra20-vi already exists in staging/drivers/media/tegra-vid=
eo.
> We should aim not to break it. Perhaps bring it out of staging? (At least
> partially, but then why not the whole thing.)

It does not break VI/CSI, I have a WIP CSI implementation for
Tegra20/Tegra30 which I hope to submit soon.

>
> Thanks,
> Mikko
>
>
>
>

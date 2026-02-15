Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02317254B19
	for <linux-tegra@vger.kernel.org>; Sun, 15 Feb 2026 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771140042; cv=pass; b=e60c2rBjzwNJes9liyI2EEAWnR0Gxa1DLq0wv0f1qhdj2AQbdzQJ/+aXb7NiH5fRlWm8fEsEEe6Yh++HbVvTRXXtauUefT2dWUDog1LecD8rPSwCoYfl08uPJEFpWYTPSmm21v83TrfA5pzs+24DWZcximw/ubiLCwlmoYvGkKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771140042; c=relaxed/simple;
	bh=zH4HBbbxg7c5SpB1wbJ9DMfeN1jn35YMQAtU8Uamq5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTJpNaBCuqDtkQqEAAWZeIYbu/dI5oupzUHFeZ3O60prd/+85Z+3X3UqtIaDYRAfqiWdR3IDR9xzcgNK9v846S8JhUfOnOjwOVU8BsUExfepPU/6x55BXBU06LpcqttRnhe1Kyr+tTGWRI+n8q6US9R+5yI8PXoKWpRdBbKl0Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jw2zn2dd; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jw2zn2dd"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so1610764f8f.0
        for <linux-tegra@vger.kernel.org>; Sat, 14 Feb 2026 23:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771140039; cv=none;
        d=google.com; s=arc-20240605;
        b=ehHtOB66ug7ljiieBXMJuJxMWWVWwM8VBAYzo+LfuXhcBiyM2EjD2+6vdSlWAT/+bV
         2uVTXCq0PztPJWxRz+s6D8ijHTin7EEd7yuWRjPbbY4lU7czkEjNtPlywKsteRkhjWsd
         ZoJTbMbqM9IxfbVDnltL+PY7Sgg41sblMtmvzS+Lj4fk2QFw+QTpAMhFKGqssPQRKhlk
         I5rfbsb27b4O2XO5hUk0r/bVEWiIbcy8E8QbYciKxO+O60BTznSp580BbB+U30rg4aZ2
         kS/SJLu7a9f/92rTUrlU0oYFcQJFLDzMcWDVglrzSsEXviwozvTk8SiJFazSCPLbIrCP
         g/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zrl8aWdaaVOiH5RwKkza6kCyl+a95ccxt2cwlIZXNr0=;
        fh=m8x7/9W4VvpzbESRCufIem40bLyr+SbX69scdRHdQtA=;
        b=gMko/FiM23UdX15APaNy00m3cJsrG2Rt+KFGTFeFkIYEJDdVDxzeD09yHRqHepyrbo
         kvU4T1tYBZ1AMOTjwL3IlqDRfK1cFqmKfPlJzjt6i8TJ1DzfrCq89r+gaDPzxe01lJh2
         aV1uAMwI70ftNAH0nXl4ao5bxsxlNLqzwV7Hr3wbkNxgFLbazlMOyxked/ffx6qkzcb1
         W7imp6LydPLEXyWg3NsnJmWkyQpYQCU/WY15CE4nLAMfzPRv1/f2Smu2HWqOWsdDL/eZ
         3QM5NlAzi0hTepqIlovenOsnCaUOeHf3J8a9Yb/hfVp7KlikgKOuveGNCfaz1U//QM8E
         HVjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771140039; x=1771744839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrl8aWdaaVOiH5RwKkza6kCyl+a95ccxt2cwlIZXNr0=;
        b=Jw2zn2ddDnQ8gsVEysucpao+XB1JKeSR/7Dsiur2TmnoIzWfQvgp/iZIQAbASrhKK0
         b7MIQ76Z1327PyR1HwdHgkPWOXU18ewkd6fTFN2llGGpXum90BUFXmnW8WcCcZ+ZeYGY
         BjZ5zdIF69SooFUtMRbupdTbCMQlFp8kACbBs0PTnZiOzo3bnRqSZpk/loTkfRRsZKXJ
         E+A+NRDwZRblstZeirrR+wzSyIAyl17xfevfL5Plb9cJkrJCSthOifSazFVsA+EpQ3Di
         FcF89MCSGatjTb/ONuGCdKAMCbjyDLh2nnEUKY8PD7eS1BvSn+tHULkVA2drbOTAQ/tf
         Rtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771140039; x=1771744839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zrl8aWdaaVOiH5RwKkza6kCyl+a95ccxt2cwlIZXNr0=;
        b=Um7ioKaNthm8Oqa7qA+vg7j2ijH6pQJFraeoDxyEdVBLKMgZhZcy1+UvlNQT7qUUKd
         ZF5JK/35JSKbKVZecEz69ZiymQpoBH4kBeaEhzeGr/Be/YteYWPi3z9KjG18vDJrt4nb
         LHPCZxrEOVK0bmUjinM9MRmngfCbUsBNRdrn59yeS3E7mCfmR+HTEzxXgvYZMyC5wbJM
         WqrRB6tLWNow74FNhLyvaTsG4ayER+G3hwBTCMBBsaPxAobw4tt7YICZ/6gxEJNEZlZB
         3Gm8oDL3HEE/5/UZOunLBC64Q4XGWhov3uRzuls0m5gP3TSpgjeGTEvAz7PR+8gzJv4d
         pXlg==
X-Forwarded-Encrypted: i=1; AJvYcCWo1RwKy2mimrnOOa5SMkSmijgQMUjd3t9kfsUwaS3d3N3fYBzXFgFQVXMc7nuY3UfoVKpVwKon+ugPDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSuemb9mIFBsZIpsR6CrAH8pQKcth0uVgixCho8Y4YmXUhMdaV
	zqroVi1PTb5YUot5ubZ/Naj0MEsUrRevb5PF9CiHr1sedWAuyCRFlEDZSb4YdfiPtFa9nXl3F2v
	tX1fLDL2mJ6Ey3nomTyyLtlvqq54brz0=
X-Gm-Gg: AZuq6aI/NmO3e9KVBSg3iyamnpTmgOJ3wCMg2giMJ5GwQc59gZOwMf1sEiUbfuVT2mB
	z4LpHRon6DLpU6A9QFejBzL55XeWiQJnLmjvQ0f1KabsIDv4Ed0nEZufXq0YrEOIpXOq42PHGqF
	Y+L4kEmeEyZoAGWyK64NdXmUMYg8+qK7MTaM3r72CxiaPxU1bAZ0EiauPjMSNsjG7MZObMcH5OC
	XyiM3DPnMnT4LIT894w44A8FDffDTLWq0I9Dq2TFvsv3EHKvE4QMdhCEiJH9v37eDwatch90kaq
	a5AhE14H
X-Received: by 2002:a05:6000:1843:b0:435:e3bd:5838 with SMTP id
 ffacd0b85a97d-437978dd2fcmr12170774f8f.25.1771140039258; Sat, 14 Feb 2026
 23:20:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204060627.4727-1-clamor95@gmail.com> <20251204060627.4727-4-clamor95@gmail.com>
 <10344542.CDJkKcVGEf@senjougahara>
In-Reply-To: <10344542.CDJkKcVGEf@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 15 Feb 2026 09:20:27 +0200
X-Gm-Features: AaiRm51pnGpJ3XDXTbcvtaOsnyvgv9p2WlCbpT_dV5xTzz18pENDfpMLAaczCh0
Message-ID: <CAPVz0n20hHAf9tFqUNYSO18rvvPbbY5nyVRB-KpiKD2ih=Vfpg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Douglas Anderson <dianders@chromium.org>, 
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:15 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, December 4, 2025 3:06=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Adjust panel node in Tegra Note 7 according to the updated schema.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  arch/arm/boot/dts/nvidia/tegra114-tn7.dts | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/=
dts/nvidia/tegra114-tn7.dts
> > index bfbdb345575a..75fbafb4a872 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
> > @@ -43,7 +43,9 @@ panel@0 {
> >                               compatible =3D "lg,ld070wx3-sl01";
> >                               reg =3D <0>;
> >
> > -                             power-supply =3D <&vdd_lcd>;
> > +                             vdd-supply =3D <&avdd_lcd>;
> > +                             vcc-supply =3D <&dvdd_lcd>;
> > +
> >                               backlight =3D <&backlight>;
> >                       };
> >               };
> > @@ -101,11 +103,10 @@ smps45 {
> >                                               regulator-boot-on;
> >                                       };
> >
> > -                                     smps6 {
> > +                                     avdd_lcd: smps6 {
> >                                               regulator-name =3D "va-lc=
d-hv";
> > -                                             regulator-min-microvolt =
=3D <3000000>;
> > -                                             regulator-max-microvolt =
=3D <3000000>;
> > -                                             regulator-always-on;
> > +                                             regulator-min-microvolt =
=3D <3160000>;
> > +                                             regulator-max-microvolt =
=3D <3160000>;
> >                                               regulator-boot-on;
> >                                       };
> >
> > @@ -325,7 +326,7 @@ lcd_bl_en: regulator-lcden {
> >               regulator-boot-on;
> >       };
> >
> > -     vdd_lcd: regulator-lcd {
> > +     dvdd_lcd: regulator-lcd {
> >               compatible =3D "regulator-fixed";
> >               regulator-name =3D "VD_LCD_1V8";
> >               regulator-min-microvolt =3D <1800000>;
> >
>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
>

Hi Thierry!

This is the only remaining patch from the original series. May you
please pick it or should I resend it?

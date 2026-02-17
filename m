Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5E31AF17
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326396; cv=none; b=INffiQ/vQNyJJDuoRAitHnq6k7kXOBrqJUpweTuXi33rRHjiDRiVnTYKCUvVF6VWAIcW14+SI6lBeSChnYcqIlNQ5SE7FHt7Sq1QQgDA6KRlyn5cGuo18gzUlIjOcgo1xvWHapsfvQN8g7q1eq8VQfcpOQkMf++FKore7lu0A5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326396; c=relaxed/simple;
	bh=r+EggPD7wOShkp8YPQaACe9GAgiS2RAP+AMG/TERowk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=CmVzvcMPKw7n9Z2BaE0TCET/pb5B9rczIRVR3KcEfJLSkkD+Mnl9iU+bAtr68zbReSpCsJlfiVhSQXCYi7/x5klfV5klGOOzh2774KSRaFV9BcekRcrztWxAYhzY6vrkrr6eh8qGxsQ5Gz/dRPrHSigUcjg/FycaJRfbUDZvayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQkqd7HO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQkqd7HO"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65c01595082so2498540a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 03:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771326394; x=1771931194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8lEc5xzFe2JfewkM3XcVcd3+y1q4x0K1q5cHfsFpVx4=;
        b=aQkqd7HOqGV/NIOKu5r79sF31fr+AZgxFjbHojS1gBCp1QmHd0lfLZaZDJxWi7X3qW
         C0AxtInazxfoE0bvmIGsNWW/bSfJ2+fcqqnXacnYy1vPpopY/Foh0YQjy4JUyTWVhGgx
         mb/Y9pWDndy02sjYg7QlHeuG9Wubo7MDFE7Z3xYHVx61yw/Qbks7DcR4Tb0szoXFafLP
         rUG7VgCB3jL343pFneN8LUeG2RAGxT3lbuItGsIq8p9MkyedGhAkqHhPMYzTlBF/93Db
         D18W+67syJCWoB+BVm9ejVwG6AijMB8SYU9bIkwvuhgX/zAaQenbM6oExuiGRVrp9TXv
         QSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326394; x=1771931194;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8lEc5xzFe2JfewkM3XcVcd3+y1q4x0K1q5cHfsFpVx4=;
        b=xTGwDM02hUZqR6oga37IoSSF99+lzr8Dpe5Jb4gBmNhbsYrrPDDBRDDshypGdA/V6m
         0/6epHVfeCfOJAUf4wguf6CJF1rw9qy66PPvVi/IwUvP2T3+nW/ZO4DoPR+5s5PoECWB
         OMDYy9eKees1fnWIkAgxtJmlE7cwip527UwM1XFfeWDlxgpQt2aQo9+JjImo0ngk2N/m
         YCecjMsJuT6jfO4lgYcaoOf63zeBs7O4m0y1VoiKACHj1Wmd8UqzC1LXPJbkYW5Zr3nE
         zrxP1vdB3yL/v8x/RPUbK6Ve2ae5Ovjs8RD/yy/7rTLs9i0BveYiKFpd0qkOXo5r7eR3
         oyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVozmnBpmEf8jdAulW8uI9a8VMVzS6mu/hgkyav6anZAIk4XDGIE+kQpuTsWjC+UBbOHvvxq4529Xx2PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQlKqhRcXysp0R2MAQMmjO7XSWJQoifudIwzG7cSHKz9BM6zYn
	14QzTFUydeYQg5KDByDyDNO45x/KjSFQNodN86X+iKSHb0OU/XrB67M7
X-Gm-Gg: AZuq6aJG9XM/OKwjNzZJdUKKxIlfLm4XqelgMqQ4K0YleUCW0MOUSoF4Ipcg8JtXqtc
	88DjL+rm21IY/VplFOwoV/dPt+p7YSxgDofUkeVEW4gBnReWkgZskQM1YIg9Ej3oePWtkkVeOG6
	+njQTOZCnOtzqwytidTqPcPWJ6G8fGVeVLR4aEE9kc7HtX4aMa/0Fr/mKBYZv39wsr4X2sIjpX7
	9BKMiawuX6GLIBIM4rm1qrZjZgVVEDLQxK2X46AgaabXWyrGKkwn1JJOQf/Mv7OgVS/A7dcpAs7
	6+jRF6DJSfYGjoAIUmxx6UNZHSl4xzqBhlDDPGPC9zh3A39hSA6rBGxvpjaK9ABD8Dxxe6Zwemd
	URKog+qQwD7M2wL/yOwzaQRtDV53H/fWoNQd9mxtto1wNLh/J9Z7ZsN0ZD6Ex3LRJeAr27VWdot
	2f/QVvlj+0DvRSn4jzW0fNzFwvb0nEvLY=
X-Received: by 2002:a05:6402:40cc:b0:65c:972:707f with SMTP id 4fb4d7f45d1cf-65c0972752dmr3331588a12.10.1771326393840;
        Tue, 17 Feb 2026 03:06:33 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.63.129])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f137dsm2248870a12.27.2026.02.17.03.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:06:33 -0800 (PST)
Date: Tue, 17 Feb 2026 13:06:32 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: Thierry Reding <thierry.reding@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
User-Agent: K-9 Mail for Android
In-Reply-To: <aZRCamxP5JfS8OsO@orome>
References: <20251204060627.4727-1-clamor95@gmail.com> <20251204060627.4727-4-clamor95@gmail.com> <10344542.CDJkKcVGEf@senjougahara> <CAPVz0n20hHAf9tFqUNYSO18rvvPbbY5nyVRB-KpiKD2ih=Vfpg@mail.gmail.com> <aZRCamxP5JfS8OsO@orome>
Message-ID: <58C37053-93EF-4EDB-80E3-C066DD6E3964@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



17 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 12:28:06 GM=
T+02:00, Thierry Reding <thierry=2Ereding@kernel=2Eorg> =D0=BF=D0=B8=D1=88=
=D0=B5:
>On Sun, Feb 15, 2026 at 09:20:27AM +0200, Svyatoslav Ryhel wrote:
>> =D1=87=D1=82, 15 =D1=81=D1=96=D1=87=2E 2026=E2=80=AF=D1=80=2E =D0=BE 09=
:15 Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5:
>> >
>> > On Thursday, December 4, 2025 3:06=E2=80=AFPM Svyatoslav Ryhel wrote:
>> > > Adjust panel node in Tegra Note 7 according to the updated schema=
=2E
>> > >
>> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> > > ---
>> > >  arch/arm/boot/dts/nvidia/tegra114-tn7=2Edts | 13 +++++++------
>> > >  1 file changed, 7 insertions(+), 6 deletions(-)
>> > >
>> > > diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7=2Edts b/arch/arm=
/boot/dts/nvidia/tegra114-tn7=2Edts
>> > > index bfbdb345575a=2E=2E75fbafb4a872 100644
>> > > --- a/arch/arm/boot/dts/nvidia/tegra114-tn7=2Edts
>> > > +++ b/arch/arm/boot/dts/nvidia/tegra114-tn7=2Edts
>> > > @@ -43,7 +43,9 @@ panel@0 {
>> > >                               compatible =3D "lg,ld070wx3-sl01";
>> > >                               reg =3D <0>;
>> > >
>> > > -                             power-supply =3D <&vdd_lcd>;
>> > > +                             vdd-supply =3D <&avdd_lcd>;
>> > > +                             vcc-supply =3D <&dvdd_lcd>;
>> > > +
>> > >                               backlight =3D <&backlight>;
>> > >                       };
>> > >               };
>> > > @@ -101,11 +103,10 @@ smps45 {
>> > >                                               regulator-boot-on;
>> > >                                       };
>> > >
>> > > -                                     smps6 {
>> > > +                                     avdd_lcd: smps6 {
>> > >                                               regulator-name =3D "v=
a-lcd-hv";
>> > > -                                             regulator-min-microvo=
lt =3D <3000000>;
>> > > -                                             regulator-max-microvo=
lt =3D <3000000>;
>> > > -                                             regulator-always-on;
>> > > +                                             regulator-min-microvo=
lt =3D <3160000>;
>> > > +                                             regulator-max-microvo=
lt =3D <3160000>;
>> > >                                               regulator-boot-on;
>> > >                                       };
>> > >
>> > > @@ -325,7 +326,7 @@ lcd_bl_en: regulator-lcden {
>> > >               regulator-boot-on;
>> > >       };
>> > >
>> > > -     vdd_lcd: regulator-lcd {
>> > > +     dvdd_lcd: regulator-lcd {
>> > >               compatible =3D "regulator-fixed";
>> > >               regulator-name =3D "VD_LCD_1V8";
>> > >               regulator-min-microvolt =3D <1800000>;
>> > >
>> >
>> > Reviewed-by: Mikko Perttunen <mperttunen@nvidia=2Ecom>
>> >
>>=20
>> Hi Thierry!
>>=20
>> This is the only remaining patch from the original series=2E May you
>> please pick it or should I resend it?
>
>No need to resend=2E I can pick it up, but it won't show up in linux-next
>until after the merge window closes=2E
>

Fine by me, thank you!

>Thierry

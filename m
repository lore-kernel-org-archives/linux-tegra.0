Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A542FB0B9
	for <linux-tegra@vger.kernel.org>; Tue, 11 Nov 2025 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762868113; cv=none; b=Ws94cxRRAlDZ2HGM0/rU1MdwjGkjWLWm4r/jcteyVumatcTKuwjNpqrc05yZa7Q5kJ4RFn4+4by+Z8hZ7RzJpVpJk2bFH5SSZmNy/3f41gpeDr70rtr1NYLNevd3fmoo9kc/cU0Et5OBP5goavbtZs8j3qXcEpJwOlTJwONiY90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762868113; c=relaxed/simple;
	bh=44f+GGBR2oWTuYZdNolnAn15TPhOowpsnt5jgSu+WJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVZtar1l6avXOeFFOdVO/XAFfhHNxMnYXytzmcn6YRMLDq03peCeco25QMFVwwVAlH2t7iUakgh//M5wz4reJMO9SQe1bYLK4JsQOqTIigv/M/Gy8FsKcbGrIhih1Hg/6tkt925UOZW2fh/8p9SqL2+N7loP0AOg5K9j4d16cTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TogU5/CQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TogU5/CQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b312a089fso1712391f8f.2
        for <linux-tegra@vger.kernel.org>; Tue, 11 Nov 2025 05:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762868109; x=1763472909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zh7RVlz9/fn4Pl4MaeRlvONIISFdEg92t4/EjrGZ5o=;
        b=TogU5/CQKt3gFVpr3F5BucXjKpkgWAK5iPWPCtD5c+SGKmBXceOa3pxwlp6mGeju8Z
         VkjaBrzEyP84kS/jKc630hRoTAHvWMiXg4jYqz16kjp1oLOM5JkT2u8CQ7v/zxH4u+2p
         aPmEs9BxjT8kdmgBtDULJfiojnrmsO8koRiqbMAAvnA4+7cDbHTnGqbHHsUAgtGiaCdl
         TOmlLtDue9102u3ob0RiyJckKsJ4Qa3sU6+2QtcWcjwQREn/km4n5eQVE0Fp469PIWu3
         wd83UwFhJSqpu6e3D/DqOrrLIJ+XSixoVoSdl3fj5DgYODk/FJ5/YZp10D2YBQkPqueZ
         9gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762868109; x=1763472909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0zh7RVlz9/fn4Pl4MaeRlvONIISFdEg92t4/EjrGZ5o=;
        b=Vh8DLzySsdNI7+yQW70hT85ngSe/CIuN1tNpFGZVitbKfhkrK520sQ9M9YMGTfwTaL
         MgXq9skyh/YdfCLIgH4q1F6bI4vwpK+Vp7b+aSyZdJDjrqmbt/EiiQ8rm6l0zQfmG4AC
         lovOazv3jIKjZUdKJXAYl25fwTRGOUk3PEvbgWci+Nophc0Oxy9HMx4s9QWO2m2UTYi9
         58BnUch4J09n3zpOC/3FPFhNfkQCHxUDbYIyJup/atsGLApSviKLyRgtFX0C0BnrP+4G
         7amFrpa8otn/mhZ7ueBNMIAcuVrCIXKO92+evSvANjzGwQTtGSxzumdVBvbvxFHfDODv
         ay3g==
X-Forwarded-Encrypted: i=1; AJvYcCW83qQrrpyHnX8+05uf9e9+xt5MDacBsF/47eLRbU90cT8s6BoF2+yO+sHLN2UP1NW06vPLdUEpKGNMjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5jyewzzcGcSBOUZgrSbefMAaLgBobP67ZDGJajX0p/RxVEvN
	fQVSsgPO7Qk7JNg8/Uhy1zi8zElh64XsfSknDzyXfpJmNLiCtbZYge/FgzFbxtH66TP8mxQ6aqw
	snb5nUsTQWcmhU6yR5PHYqSNavJll2JU=
X-Gm-Gg: ASbGncuJzqG9kLbEnHzi1iQ0WPadA37FpRBfR/XRV/cWcWi6dyIYH/pFGnC7q4IKoPD
	19U5Txvtj7kOvKXuZaIaXfEYZeM8lDGAP/IyPUMWYqsJVONWfsZGucj/16gPUz3HUXS+XRyyosj
	n+mSCBKAhqQOWdeSKw/BCJUEDyYjrioyVJ0d24S85Z+fRMTwjfKOOK52ZuDbQMG1EHZb7b4Sq/s
	NZK8hW75LIup4uwNz2VNDtQmxPuQutK5LA+U6sohws+aP80VUt82sYGGaEcUw==
X-Google-Smtp-Source: AGHT+IEtivyRqo5lmF9BZUpAcCnMPsflKj+Yv2TwjeYH2DfqbpxfoITaNpUO+HHZcDmnNtTIfPFQUG2YLx/3HTHTlHw=
X-Received: by 2002:a05:6000:2507:b0:429:c54d:8bd3 with SMTP id
 ffacd0b85a97d-42b2dc3ea86mr11789923f8f.53.1762868109221; Tue, 11 Nov 2025
 05:35:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915080157.28195-1-clamor95@gmail.com> <20250915080157.28195-2-clamor95@gmail.com>
 <3455911.aeNJFYEL58@senjougahara>
In-Reply-To: <3455911.aeNJFYEL58@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 11 Nov 2025 15:34:57 +0200
X-Gm-Features: AWmQ_blV6d3G7hE5fg-sUlAJ4jm_DAmDeF4LDT7xiVBDSmfK9MhRSP1-jMuZj_A
Message-ID: <CAPVz0n3qXBLEVDKDDc6DRrN+WFiAdeL1wDaA94DkdST7NoRXyQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] devfreq: tegra30-devfreq: add support for Tegra114
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 11 =D0=BB=D0=B8=D1=81=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 10:5=
5 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, September 15, 2025 5:01=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Lets add Tegra114 support to activity monitor device as a preparation t=
o
> > upcoming EMC controller support.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/devfreq/tegra30-devfreq.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra3=
0-devfreq.c
> > index 8ea5b482bfb3..d976077d4757 100644
> > --- a/drivers/devfreq/tegra30-devfreq.c
> > +++ b/drivers/devfreq/tegra30-devfreq.c
> > @@ -980,6 +980,7 @@ static const struct tegra_devfreq_soc_data tegra30_=
soc =3D {
> >
> >  static const struct of_device_id tegra_devfreq_of_match[] =3D {
> >       { .compatible =3D "nvidia,tegra30-actmon",  .data =3D &tegra30_so=
c, },
> > +     { .compatible =3D "nvidia,tegra114-actmon", .data =3D &tegra124_s=
oc, },
> >       { .compatible =3D "nvidia,tegra124-actmon", .data =3D &tegra124_s=
oc, },
> >       { },
> >  };
> >
>
> Looking at my copy of L4T r21, the EMC count_weight should be 256 on Tegr=
a114, while it is 4*256 on Tegra124, so different SoC data should be used. =
(I haven't checked if anything else is different)
>

You are correct, tegra114 seems to use 1 EMC clock per transaction. I
will move and expand comment from tegra124 entry regarding
count_weight to include info about all 3 supported entries if you
don't mind.

I have a question regarding tegra_devfreq_device_config to be used
with tegra114. From tegratab kernel I have, existing
tegra124_device_configs configuration seems to fit tegra114, may you
confirm this? Or, if L4T r21 you use, uses different values, may you
provide those to fill up tegra_devfreq_device_config for tegra114.

> Cheers,
> Mikko
>
>

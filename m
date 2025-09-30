Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12F8305968
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759244378; cv=none; b=aGVbaRv8dO69i4fdGsw08tUYp9lOvEAxRhZpW+BafSPTYFdc8p+ujk+BBYarDxMgNfV09mH+eKWeosxm3gJVBgFOb1Gi9YZ70xf+l8nSDLdhSO2N8pJi4Pr6sX1w4IrEUo6swxfrnLvSlINp9xPOT/p9TO1gb77wB7tZVtV5nl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759244378; c=relaxed/simple;
	bh=ChfNU9FvF2cIQ/RryZeB9UnFuqodq6HvJ8lwY8BZ/AU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ff0hCqtVzsOJUGpNV1cif0+siW54MNqmJH1hHgFra6EYQSS/s9NUqOjt6mtArn/rfui7Z7C1kd50HhJ4cJV2/zwv26QGyDCHFu006/AxaBssrla9erc7h5nhrbLF1DCpAR/1aqmQOktLGYV0covYzlf/1mC3kt5QgGnkC4mIZzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ma0Hh/fy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ma0Hh/fy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27eec33b737so63340065ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759244373; x=1759849173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSc3erqR+m9Cq3XMrwel4zg9jxga5W34DHU66LfGEqk=;
        b=Ma0Hh/fy1dKmUeqC/jYdYvZDB1Mn9UBQAEVuhsqA4F+NZDeonprT1IaQD2DVgGSrXy
         ENEveklwiV4xH5O4hmX7PPsCDJ14VYRPpTjj7jSphVk/+K5ijPcsZSPICxR8UzdVrVj4
         EMt59PRRetU8rT6uW9ZkQu8yW2TvuWebwSaWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759244373; x=1759849173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSc3erqR+m9Cq3XMrwel4zg9jxga5W34DHU66LfGEqk=;
        b=B3oSZ+fyoEaETIUhuIhb+sAciUpHKma8gXcPrucZ7pIsKiE/gU3p9fadQ0odxcNMnx
         t/lC/UQ7iI3qIabQWSgYBt6TobnWzSBhKkLcZ/8MviKLJ0MMGdIO+vifgygF1QU64gd9
         SXxUXNGcrVtDBpNbFem4/QT35jNP3sutHHDDslAe+X/KOPX/RupTEEcYVSITollUQV2e
         5HXFr19d9fdwenWL6VscBfeAGMrSljbYEU69PM9bFzPzCOKTR7aMKxPAE9VfP5tFFcSX
         Mz63EAhCXkHnRV5re9h1EqOl6GXNIZ+h73qN6CPqdM/nPLI1pE2RpCKyustIaGmw8OrV
         ApQg==
X-Forwarded-Encrypted: i=1; AJvYcCUtIqHkn184rgXQ3ZN79x8+YhAQb4bq7aL4kUS+QW4VnrzX6dKOg121ECbBamPRcasfEtK14MunFgBZ2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR/hO4GCYALgAdk6Rr2xG8YEhlilx4VbNrdBkt82Qhg1ZEXUSf
	38NgZwZqI3w0xmpsLfTdjR5GWOAhZ4oQLvnsPd4CHVkg3ovk+HJ1i4FliYpD9DAxc6lBymOvZR6
	IhS4=
X-Gm-Gg: ASbGncsDGGuTWpqk2Mnz2mt1yFNPfGMpyAH+nhM9rAIbv1j5j8TXxN5WfuBhDa1gPfo
	g8rGDlVdEbqKV/UHh2vnmD/YsHLruh3TguRjXl2jyYCzYkkqYS0buiqku3lau6F3/1JM5E1V0Ds
	5spl2d9an6vMyTljzbhoreKJnvSx2lo8P1J5UV1udjVB+Ewj9csYTKIHhqEI7TRpcLxEuOGDkZH
	AODV8STPdSdIQDOe5zJofdGiHSBWQb/hXfcmgDWRPvjIWawyP94Ycu/6dhzOER3uOzir1Dqvkse
	RSJZ0eWXZA5F4KW8Y11oPh/qSNxecJf5bfpeBgKDmgFKrkVLYVhSEhSN9qUXOAAEcn4XVNXarqi
	i38Qnov3uhb3HV1eTCFXXZP0STlKaGUApRW9EJ9Ckw+36AwN0xG2TdDwDNcI5VEAEaXFdyTZ6qN
	xgOjmYCTiQTHVL/vNgaXPVhX1X
X-Google-Smtp-Source: AGHT+IEYJBxUQ1QfOkFjLdG+AWGNlr/dDdNvw27KYJjGIB+xYd56gy9Eq4PMHwKhfkmUE1bz4YfI1A==
X-Received: by 2002:a17:902:db01:b0:265:9878:4852 with SMTP id d9443c01a7336-28e7f2c2b4amr627275ad.15.1759244373128;
        Tue, 30 Sep 2025 07:59:33 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6886c9csm163110785ad.88.2025.09.30.07.59.30
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 07:59:31 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27edcbbe7bfso64723325ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 07:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeTKCHBhiTnzi4aJ+tuKnRufNx2fB/n5Rf5uRpcKsG+80bWY55hu+6Ow2tXXFE/aucdTSHwAGJEx2e9Q==@vger.kernel.org
X-Received: by 2002:a17:902:fc8f:b0:267:9e3d:9b6e with SMTP id
 d9443c01a7336-28e7f442a78mr193225ad.51.1759244369479; Tue, 30 Sep 2025
 07:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com> <20250929142455.24883-3-clamor95@gmail.com>
 <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
 <CAPVz0n2Prw0ZoQhrodobmSpAu7XV6aX=NV=2ee0RwL3H5hWARg@mail.gmail.com>
 <CAD=FV=XD=L=otnj+YsQ1qEtrO_+wBD-ZYpDNmickcD1tb+6OoA@mail.gmail.com> <CAPVz0n1y86mKKvViG9dVN4gkqkbsjcZrFraTtKQ+Tvf4DBJCVw@mail.gmail.com>
In-Reply-To: <CAPVz0n1y86mKKvViG9dVN4gkqkbsjcZrFraTtKQ+Tvf4DBJCVw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Sep 2025 07:59:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzVGE88k6kmN+BxO_SV4H9JDM=96E1Mco3K2mofRbnGA@mail.gmail.com>
X-Gm-Features: AS18NWAy2O8-X47mCuul_Hv6w1Ke6zCRmOjrUq428DdWDjkLHW5ffnJ8B6LXgeQ
Message-ID: <CAD=FV=UzVGE88k6kmN+BxO_SV4H9JDM=96E1Mco3K2mofRbnGA@mail.gmail.com>
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

On Tue, Sep 30, 2025 at 7:48=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> =D0=B2=D1=82, 30 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 17:34 Do=
ug Anderson <dianders@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hi,
> >
> > On Mon, Sep 29, 2025 at 10:13=E2=80=AFPM Svyatoslav Ryhel <clamor95@gma=
il.com> wrote:
> > >
> > > > > +static int lg_ld070wx3_unprepare(struct drm_panel *panel)
> > > > > +{
> > > > > +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> > > > > +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->ds=
i };
> > > > > +
> > > > > +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> > > > > +
> > > >
> > > > Maybe add some comment about ignoring the accumulated error in the
> > > > context and still doing the sleeps?
> > > >
> > >
> > > Isn't that obvious? Regardless of what command returns power supply
> > > should be turned off, preferably with a set amount of delays (delays
> > > are taken from datasheet) to avoid leaving panel in uncertain state
> > > with power on.
> >
> > I won't insist, though IMO any time an error return is purposely
> > ignored a comment about why can be justified.
> >
> >
> > > > > +       msleep(50);
> > > > > +
> > > > > +       regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->=
supplies);
> > > > > +
> > > > > +       /* power supply must be off for at least 1s after panel d=
isable */
> > > > > +       msleep(1000);
> > > >
> > > > Presumably it would be better to keep track of the time you turned =
it
> > > > off and then make sure you don't turn it on again before that time?
> > > > Otherwise you've got a pretty wasteful delay here.
> > > >
> > >
> > > And how do you propose to implement that? Should I use mutex?
> > > Datasheet is clear regarding this, after supply is turned off there
> > > MUST be AT LEAST 1 second of delay before supplies can be turned back
> > > on.
> >
> > You don't really need a mutex since the DRM core will make sure that
> > prepare and unprepare can't be called at the same time. panel-edp
> > implements this. See `unprepared_time` I believe.
> >
> > NOTE: if you want to get really deep into this, it's actually a bit of
> > a complicated topic and I would also encourage you to add an
>
> Please spare me of this, I have enough stuff to work with and have no
> capacity to delve into depth of drm any deeper. In case this panel had
> a reset I would not care about regulators too much, but it already
> gave me too much pain and caused partially reversible damage to itself
> that I am not willing to risk.

I won't insist. It's not much code, but it could always be done later.

-Doug

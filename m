Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2D749EC7A
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 10:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765305; cv=pass; b=CnYHtCVGKwk6xgCFPZLoXIUlRazDc29hk6p1Dp7bUhdC/l1jrdyWzbcO8YUCQnCw94tt40Qhp9wiOPHfZr0f0BzN5Oj6KSs4smpocGL9vMfWN12PBn1TWQk1NAVMaIFim8VVNHOvtdkThn7kaQzB04iqm5MWCldjrfYe1Cpdtks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765305; c=relaxed/simple;
	bh=Xq3N2ANyfb+Xloxo9AydxI9XEgKscgcw1LYegzbSXnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oA4T6zxjrkVMpgz2QBVnYdtRNp4TKh9/Gx2cUytjNwdOncBrLMqeimNgQLU2BTR6fLobJMjD4wgwNGe1ecz3ghPaPab7VV5nBMeiZ6UKdIJ1M5AssEBJeRqsPOQv2fqJlIqyr7jdfnVDjx0J3GC/1XQj+qv6DKniPBtO8stbS5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsF8hbIW; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsF8hbIW"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342773d94a7so3218905eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 03:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765294; cv=none;
        d=google.com; s=arc-20260327;
        b=aN8aARdg+5hVf4nH0At54R7DulUf6WuPtavqgU123UiriG1z8GPxV8zEUSdmQ7PeiM
         wtlNp01tR4Tu6TiU22R6a5uWOPD4L2Jzahjm/OXXInWb3jPDyYfMmfNh17DNBEbFeMEH
         VB4/mg22PZcRbzk7AEXflbM/Z3ThP1sKCESdoAmw5phFyuAKN41iX1D/+Hi0iU76qlkU
         7dSac0KYtnhPTBEr/h7lByUJ8Q76AfvrjUaRJTpjTg7P93TtCHBsrwxPIQ08B8pNi18A
         MlRpsXVnwSC+impEq028GAanqAGPFAmnwC6xChcSyCjauwwHqF2smF8rtYDbUloBHjxx
         1Vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzwGy8l1+YM8qJ7FQ+1mOaVfQljvGUnBphrwb0sFzIw=;
        fh=EZmOYcYYrkhYecPbYABS1Tb0lL8dp/Hsl8ORywovQ20=;
        b=psfDC248T3beRUqsshxQcQBose9k4QcZmr7xvdLgNpre6q7VhiqaojKd4HkEMMdL4B
         apUYOnz2FHqtPJ6//VP1ImAmeDkZZWUWU/2PsQPf68eqHQKLgB0hanmtaMq+slF0Yon/
         Xm3u+HheZbTSF3ksEviQuXYbkemAInVl4nqDrXM/66+Kjb5/WFivYGFp5pzHCWw1+SIu
         laV4fErVGcHYrG86x2zo20LVpojiPU2tPt6/9yG2PRPu1CMYyMcEu90i6d9ngSk7ZbXt
         Go0pGf5jlG7UBHAC95RvE9cV+EKgcpBoDkSQj+l8QccYtH+c/2kHvfFPu+aFMVrS19Fo
         V8Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765294; x=1791370094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzwGy8l1+YM8qJ7FQ+1mOaVfQljvGUnBphrwb0sFzIw=;
        b=TsF8hbIW1wCjRIaE1hxC8EltOeQXMMzpqgPXV2bU0nnvx+Tf/4GdlEB81RvTNXR/yS
         jEBvPXrQoQr5B0/f6jaMROpj2A8VS5iJzOh0/JBSGgyb5EUUeWr4fwC8IHY0OSgwK4GN
         UW98f6TS3At3O3F3UQhO4nyR269M3KuP0oeuk33UObOHvjXr4lMXTzXpJqhK2hW886iu
         RIubJ7BmIpqkclSK5yylILIyKeS9QX8AWbTmeU7wtxX0Xp62e6ZM1EqX6A0yrUqSXMoP
         5mTRmv9+rA2BPmzgbkPV0U36fAQZQQDRQKTAK+7bpvAUktlIIDpRSbdxWVfHOK4LKuzA
         RUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765294; x=1791370094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzwGy8l1+YM8qJ7FQ+1mOaVfQljvGUnBphrwb0sFzIw=;
        b=u/sl01mpANJ2wqxgEHSV0o+7F+p/bKW23IAOgqR9B16Y8f2x7cYVL6i36vQJB8shw4
         66YqqBFcMRsjS+IJ7NLs6btcVr9EGEZSC8VqbFhzfhnCb2IWOVL9+mFrtybzNdwYauRp
         VelX/iZORWVSVroEQRO6wmP1l5IvgoFDkssCQs0fwqjAvaWjtb/bPBbQSR4QpVpTAf7o
         nD9ckukOQ4e3MgSP7U+qSaxiwBmoHaagQgNfoSW1Av6QmZoSOECPmPvf/amtuPbkBhmP
         VrzFg7FWXY+lfj+TzS2z932JlLaMUuFfo2pMIxsqDnTjL1v8/VsgcJazklif1aEXhH7w
         lYEA==
X-Forwarded-Encrypted: i=1; AKwUvBxXF9JAJV2G7GlKW20EIVl30XuR58BkWL79oM2fMYNET2shFC6phCS6JLKD+mydP86tyJVlSjRlvq9+nA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLckpUseFwLYwmQU7PNwwaTVP/2OPOgL1loYKqC9DG34EcefnRk
	zM3U3rgDydTkT2GnunKC1X2SwEuU4LV35TeU8/OH5O+ESbfJHjTgfldAzQys3N2YhN65tuvdVJ2
	4iMdzB91QKZxOes+fpF+ecg5JVbkSC/U=
X-Gm-Gg: AYBFou2YoX+9IRb8TRYQvAIsjr8xzR49P9k+e4qAApHStRjrT8K3qzrHFOJaaNiXyiP
	NfNAJ9UzF+c9I+lyha01Fmftz0HUcEFG2peH2gnX/ZHvLyAqHOT6nvdV3SBY8yqxxcu8/8/gvpx
	VVWatV0Adn0oEHMb6JSQFTKohChrr7k1WmteXVBKIOuGFIKHiR6+60U+d5qpCAiP++jHuh2APMU
	L3T2P6eVTJWZdF4Ps9gJpIQTRwSNxZE0KQlBLtl6ea7ZD9BMNtcij4maGxvZbNhAlDgbrYROq4n
	sOezXguOp3QnLMA17kB5TaejI22YCG1Sqbl4JQAXOl7wOCIqrV0JN+L20Ayu0EvAPvSGE+AOJjH
	l5nxPBlsrBP38
X-Received: by 2002:a05:7300:8296:b0:34b:7e89:997 with SMTP id
 5a478bee46e88-34cdd69689dmr1294076eec.38.1790765294291; Wed, 30 Sep 2026
 03:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-7-clamor95@gmail.com>
 <arzNgbx465QIKYdX@orome> <CAPVz0n2QdSWL8=KBXnsQQkdNEJ9m6HSQ0+6mJji_RHZ8QgXN-g@mail.gmail.com>
 <arzilGz4akKvRF1K@orome> <CAPVz0n0-baCzHOXjWLOCLjv8fb5GbE9a2v=8tBYr3RgHkEu+qg@mail.gmail.com>
 <arznE4HKl9r_mPX2@orome>
In-Reply-To: <arznE4HKl9r_mPX2@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 13:48:02 +0300
X-Gm-Features: AclHuK-qGc3Psoay8x3hInLmhZCMxpDiJ3bmtWhyIJMqMqR4y3RvUdbuIDV09gs
Message-ID: <CAPVz0n2A8oU_yRFQ_u_YkXSa5x7PtK8sYZ_p2P+GNcphq-bP-w@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/panel: Add Hitachi TX10D07VM0BAA and LG
 LH400WV3-SD04 MIPI DBI panel driver
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:43 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 01:34:19PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:23 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 12:08:41PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12=
:02 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > On Wed, Sep 30, 2026 at 10:05:35AM +0300, Svyatoslav Ryhel wrote:
> > > [...]
> > > > > > +static const struct of_device_id panel_dbi_of_match[] =3D {
> > > > > > +     { .compatible =3D "hit,tx10d07vm0baa", .data =3D (void *)=
PANEL_DBI_TX10D07VM0BAA },
> > > > > > +     { .compatible =3D "lg,lh400wv3-sd04", .data =3D (void *)P=
ANEL_DBI_LH400WV3 },
> > > > >
> > > > > Why the detour through that PANEL_DB_* enum? You could just pass =
the
> > > > > panel funcs pointers directly via .data here.
> > > > >
> > > >
> > > > Passing API/OPS via .data is discouraged.
> > >
> > > No it's not. We do it all the time.
> > >
> >
> > I have had some controversial experience with MFD, with passing cell
> > composition. If DRM subsystem allows this, I am more then happy to
> > pass panel ops directly.
> >
> > > > > Also, looking at the enable/disable sequences these are in fact t=
wo
> > > > > different drivers, with the only commonality being that they happ=
en to
> > > > > be used in the same device. Rolling them both into one driver see=
ms a
> > > > > bit odd.
> > > >
> > > > I did this to simplify maintainance. Both panels are used in the LG
> > > > Optimus 2X. My assumption is that LG switched one to another at som=
e
> > > > point, hence they share same timings, controls and supplies, but
> > > > differ in en/disable sequence. Additionally, these are the the only
> > > > DBI Type B-only panels in the kernel, from what I can see.
> > >
> > > That's just one more reason to put them into more of a generic driver=
,
> > > which would allow people to find it and extend/improve it as needed.
> > >
> >
> > This driver cannot be "generic". Both panels don't fall into any
> > category of being "generic". They are grouped solely cause they share
> > same timings, controls and supplies (only these 2 panels, other will
> > definitely differ) and are used in the same device. I have no problems
> > in splitting them into 2 distinct drivers.
>
> The driver can still be mostly generic. And I suspect that the panels
> might have different names for the supplies and controls as well, they
> just happen to match in schematics or sources that you used as reference
> because they are for the same device.
>
> My point is, you can keep a lot of boilerplate in a generic DBI driver
> and then parameterize the things that aren't the same across them. That
> gives you the best of both worlds.
>
> The reason why I objected is that you have a very specific name for the
> driver file and the second panel doesn't match that at all, so it's
> confusing.
>

Noted. I will split them to remove confusion. I assume that schema can
remain common.

IMHO creating a generic DBI Type B panel driver does not wort it,
especially since these panels are more like non-simple DSI panels and
always require a dedicated en/disable sequence.

> Thierry

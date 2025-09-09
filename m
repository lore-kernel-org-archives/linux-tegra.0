Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26F7263E;
	Tue,  9 Sep 2025 06:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757400343; cv=none; b=shD0UrPJehzC2HGTp/EFZJTupbI65BGwZp27oy7h9DTUT0tchEgO+aYkalP4QziDzWOkjrxzvbUqML+Eoq1bR2FK6d9Hm1FrvSfd4lrR1MNRGRoWM0ix+DI2Uf+KPKFdQsgrGI/W0zBhQhl7ao15g6XBK6bySrxh+S8RaTvKWQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757400343; c=relaxed/simple;
	bh=c+1ehdd+8N66l95N/Q+fuTsgvbjN0WNAF1sdZEAjwYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvhKx1s/hpF9iy84rtcor0jf9UuDCgzJfm9cA8g2hOSRP+uvCFcndgBtFaZwbP8EdeOXobXdXwaKUkoUPpOcEUUS4dqRyMwNdtsP4OR4Kr/PM2NUGVS8dz7UAQxxey1uIieTFdADJB9veaZlw3Ts2FuFPUagcgOn5dbbjdsLITk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M8+l34Mo; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M8+l34Mo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EB5F81A0E36;
	Tue,  9 Sep 2025 06:45:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFE3C60630;
	Tue,  9 Sep 2025 06:45:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BCA0102F278B;
	Tue,  9 Sep 2025 08:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757400337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c+1ehdd+8N66l95N/Q+fuTsgvbjN0WNAF1sdZEAjwYE=;
	b=M8+l34MoEkgGknKQan9JbXuLxsAHbbfLMrX9lhOin7732JbDPvwFas8RcRnigWEcn2wuQw
	VtKlcK8WjnbfNnhepYUSd2Cae0MTX94OUkkO4SrYMfn+W7yC2F/d3pAQBniLY5NqTVz1fB
	6RrPUwnRaSP+HFQkoWMDCF17o7cf4yCmnS7nUOpTZJegrB2KnK1R7FwiF0MCjergD/HL8x
	IczudxJeJ4Mhw8oTBJsn0oVyjBsSvX/dtHwbppYm/+09mDTv8Gk65wEtN9FGZFw1P7xAkK
	RAlUjnfzpNbjqyLxLPi0pZEhR5Cjfc2ajOtiY62DIMsr+OhczBfp2mBOUsK3Nw==
Date: Tue, 9 Sep 2025 08:45:21 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter De
 Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko
 <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 13/19] staging: media: tegra-video: tegra20: set VI
 HW revision
Message-ID: <20250909084103.60de1cd6@booty>
In-Reply-To: <CAPVz0n2m4U-7G14Jhnsm41qsj0FVo39bdJ=f8kAm=+uxZyM0xw@mail.gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-14-clamor95@gmail.com>
 <20250905180837.35547304@booty>
 <CAPVz0n2m4U-7G14Jhnsm41qsj0FVo39bdJ=f8kAm=+uxZyM0xw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Svyatoslav,

On Fri, 5 Sep 2025 19:11:06 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> =D0=BF=D1=82, 5 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:08 Luc=
a Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, 19 Aug 2025 15:16:25 +0300
> > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > =20
> > > Tegra20, Tegra30 and Tegra114 have VI revision 1. =20
> >
> > Why? You should mention the reason in the commit message.
> > =20
>=20
> Because TRM states that Tegra20, Tegra30 and Tegra114 have VI revision
> 1, Tegra124 has VI revision 2 and Tegra210 has VI revision 3 (which is
> set in tegra210.c btw).
>=20
> > But I don't see hw_revision used in the series, so unless I missed
> > something you should drop this patch.

My point was rather that the hw revision is not used in the series, not
quite about the value itself. I was missing it is exposed by MC, so
this is fine.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795241025;
	b=XeGwQ3icfxO1QgDf98ZsuPkfwh9YbnAg67+nfpWVfrNHKOMErNXeovL2vnb6Y0T2udKZ
	 n19SqK2jXXOIm8EvblnbeiPgYMJdLuNmO65djv3zwyJJrTo4BSn5chTlx8zmCRkMpE8wQ
	 k3VXeqrYqZpUySWTPYmpT/cFrWbsAryi9W0oZ8G55aR7rETfSXtyo09kgImx0TjnJbi42
	 DtQh7byqcLLJtp58L/6d6FVmxQScOWTHufnLLd0jfuNAA0Sv32lZo5pUw5VFDU2RkbYWy
	 YZAHoJCo7TKqB5E/CdWAWp9yYthPUBMurAz8U9Am1GjH2qpe3J1jas7qOHzUUnOBWSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795241025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
	b=lhw1ndGBaUoog1eV3FntXRdgkDNKO6CHzCb01lpcrN1IA4lE6KUXjL/5ul6yVDdpesFO
	 lYwNlaUjuOsXNb/4EursjgrTpn3i3OTGBoQlvwSqZAyk5TUuo0FmI9kT0EX34dnkRfDP/
	 ohey/lYjrwvOhNEUQm3f5Z9Q6sxNackagi7fodQfDSBBtCw89UJKxSWllzC63AUg74Ohn
	 /697pd/RgDcHaImAOKJv6/tDkwMTqUT0gIp+jzRS9i8p+THGxNTtqeEPOYahbozMZz6fh
	 YQRKQgl1qKtiu8cRYH89ok2apjyaK7w/OpkimsG71SU7sBpwY9umQA1pBIhPISMxgBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkncotie;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76310606A33D
	for <linux-tegra@vger.kernel.org>; Sat, 21 Nov 2026 06:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76310606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkncotie
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a315ed211so1848859eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 22:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795241024; cv=none;
        d=google.com; s=arc-20260327;
        b=fqVt8mmx81mvDzy7lTWdtzJWB/mqu/ERjU0Rj/oDKotxOzTwWsqMqBHConnw9y3b+b
         Zv/6t3mphKZ2P0aoQUWrkTgoYh76r01V0DO9K5y8BKcHR1oFyjG3RdAxIMB66482+Ww1
         rJIjapCV4Ickaai6+JT6S3MHtr1KULFhPIRDW8Ymn+XzbH25Zb/s6/PK4awfo3KiZCNQ
         dmYJ6mc6wkCKI9KVk51kHAPJaWsjsfAxYsDY3fsa6kfOh2JlSyXe+RzLDwc5xFzwe8vv
         RleE9HWMu/ytG1WrN6OqNz7+uvaKo80WJRsBziuTdWkKkhK6KoRIeTz5UPPBswvovrlW
         y6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        fh=ubRjxTH1jj8Ee8f+BSTj7PZNtVczGdfzW0hs5zdSOCE=;
        b=jrq+OuYM9bbZYPLL8a8IpHlLZWOE8k0Y4zmQnDQbDDiaV6JFiYXjERPz45U8PPZnRD
         2YXiuM7wBH+ShCc3nI6qDazNRpv9gzmUiA1RWMo9CK6yYnLyeVi5hcU1IWsxrYXCIzxT
         ZtU37VDqDY1I/CKaaM4SGNGTtq3QwbEe17c7r8Ym1EaR+/WP+3ZyOOYb/bs7snBOl1Xn
         7BSZoaBpn9jEVQ0Yss47inOOPoj6/CxGiMPhhTZ1qq1Rx6UQXb4Jz57PyDIsKiQ2gneb
         ohv7Z3T+Cs/hIu7O752efUYm1yJ3FMPiATse42LFENoI9g4VPqa2+eBOB0dtcRWKwoqc
         IbZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795241024; x=1795845824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=fkncotieei3fyS8dWHzQm7M/AiGBj/CRGEBjdC2UYG1K6VO5O9PEVGFKKay9ckmx2z
         zS1y7h/y5IxeZ3c8VwbcVrRA3fVJQZM0IhChkXi1Jcf6wHM4gdrHWTdnteCJFFq8zo0w
         n8BTRduL63yAAFof8sanDkZWtT5UVPZsL9GrIebedHVQ7AXGV9w6BEEZqgblcJKX5xjJ
         jJZqdlB2de/PLQzCNejdlU18JJJVQQ0yNkz49Ypy9sabDWehPHpH2m2620BjUoL8UfGg
         5xugqW/nCm6pmHsgiOEnVtzjfSpmhpGmvx1U/cQXyj+xMuG0VuxXmQFXV2b7dI17fZZU
         ZCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795241024; x=1795845824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=EN3p1hJMZNY/Au4at0lX2C6EaBNAcPQ6UnO6zQdRrpzhzz6Y/OrypuoREHc+m74pd9
         AzVmrdeUaf8cEG823CR2cJighYHpBXQIwvi6a5fUlKTUnePax6m2YC5imtaHNjHcFN/t
         DfPDo5/IkWoysUEUXnoz7M9o6glKN8lLvtfsHERKwkUSsPJw+K+lMuNiBQOd+6hliV6J
         +qpgfKfTit5o7KGetpsguC+00gj5BQ6zoqIWKzkjwRgWrHF741g2JBdvThpmYen1TS2/
         Xl22+vrtfm0qIxCAXN83vd4CjXBc+7iZmwrbhPQ6q9KoBNtZJas9Ampo5PEaVXKkP2i2
         rcEA==
X-Forwarded-Encrypted: i=1; AL+hErGkrTXIRnzblG0Br9/dQ0wupvmUcr4Cgrg789VcVljfilnCigS8ac43YZkyCN13IGnPzP4z+PG5oMnsIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/moiaxyMecjvwWtxV+9G1WYtqLNxSbjt5a3VtSP3UNNWitsanV
	hrHnZfT8HbO3rEpii9h964wMcCxoaOZZxr1knS6OgKAugCUqG2x7/0PucP3QoM7KbUVWdilJp5p
	ZUScq9iMm3ZDTko6L9E+I8pdb49JGWP8=
X-Gm-Gg: AZFdTZcYDQfSy49GZ8vWnVR8RgG73EdXb+NTP/lcrpwT2GkBvRrJRk6o/sgLRj40DgD
	S6ZdBmYOir4PfBC/nyAuYvZQo3YSxmQkhs1aeSsDXgUuVZvA2Ug3atqyzI1i0LEWAiySw5SKTK8
	jrL/1M99j3+advURONpSadsNFmd3PJhikafXRpWHU/3HUmpi0NUTWuQdO1kf2pqcWvB84Nh3W8D
	Sv+jhPr1yYcA0yuJC3uD4VJabE1esFtVy4EoS2sbbgkIhXIjno/9IeBXnvuNAfBeJ3DWCcssgci
	7vVbT7UPE/mIvoO481Rw2hx4/sM3hTyp9hfbZ4u3GEPMBBGb0WIi+jV022HrpJrLHMf1rgLpZBo
	o+z4ZKe6xWIM4oIqH/CpRGv5hAbrO2cPDL0yQ6eD7yu5A4HFtaCG7Gzcdpuq3dD91Iu3eNuGjCL
	hQGBIDjNP6iiHZGlVLbRbaz0iFawe2Aw==
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id
 5a478bee46e88-3856c6b00fdmr6323139eec.2.1795241023623; Fri, 20 Nov 2026
 22:03:43 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-2-clamor95@gmail.com>
 <20261120143147.GA2466366@killaraus.ideasonboard.com> <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
 <20261120213116.GB2472094@killaraus.ideasonboard.com>
In-Reply-To: <20261120213116.GB2472094@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 21 Nov 2026 08:03:31 +0200
X-Gm-Features: Aa3M54qOnB5G9GXqLIL-lPBYx8eezPpq659tGJ_BSKM-GqCEY4niHx2BKUlkMTw
Message-ID: <CAPVz0n0h6xd4DbnpNTW63agospeJFqoV8vnkPYdzB3NmgVRM5Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 20, 2026 at 05:31:17PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
16:31 Laurent Pinchart =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > > > The Tegra Video Input drivers are mature and developed enough to be=
 moved
> > > > from staging into the media subsystem. No other changes are introdu=
ced.
> > >
> > > The driver should at least be converted to be MC-centric before being
> > > moved out of staging. I haven't checked if other changes would also b=
e
> > > needed.
> >
> > Does the media subsystem deny video-centric devices from even being
> > moved into it? I have not seen this restriction imposed; could you
> > please point me to where this is stated in the media subsystem
> > documentation?
>
> There's a consensus that devices that require control of camera sensors
> (i.e. "MIPI" cameras) must be MC-centric. That's not documented, we
> should probably fix that.
>

Yeah, stating this in documentation would simplify things.

> > I would like to convert this device, but that may take quite some time
> > and may case regressions if not done carefully. This patchset apart
> > from moving to media is mostly fixes to work correctly with mt9m114
> > and tegra114 bring-up which is quite simple and straight forward
> > change.
>
> Converting to the MC API will require some changes in userspace. That's
> why it's important to make this change before destaging the driver.
>

Noted, I will most likely drop destaging for now then.

> > BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
> > to your liking, Sakari seems to ignore it.
> >
> > [1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gma=
il.com/
>
> In the review of v1, I wrote in my last message
> (https://lore.kernel.org/linux-media/20260721103845.GJ50424@killaraus.ide=
asonboard.com/)
> that the issue seems to come from a bug in the VI driver. Let's continue
> the discussion there.
>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/media/platform/nvidia/Kconfig                           | =
2 ++
> > > >  drivers/media/platform/nvidia/Makefile                          | =
1 +
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  =
| 0
> > > >  drivers/staging/media/Kconfig                                   | =
2 --
> > > >  drivers/staging/media/Makefile                                  | =
1 -
> > > >  17 files changed, 3 insertions(+), 3 deletions(-)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Kconfig (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Makefile (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/TODO (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra20.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra210.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.h (100%)
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
>
> --
> Regards,
>
> Laurent Pinchart

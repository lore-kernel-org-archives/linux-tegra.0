Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188690;
	b=zB/kpLuQ9bRGuo/mJHwsEw4JGOdMdN6FQH63uHXW4+NRW+FMdIu2QJgsa5wBKZuU2UHJ
	 i8dQyoNLtj11XpnM64D2VzUTUXVZmMjlk4FF/YLHD5ZLc7fh7sYwZRaMEdiqjOe0gR/1X
	 I2/K0EAlXViZyx+dDzkhPa0m4H53L6eD8cRjZBDFbDFDXmsO1W4Oh5G5d4MM/AHrCMsgP
	 tfTihyn3OnusZlDuNZMYkhFpEph23rKe5y4wnlVLgs/nlBCs6dm+5l7lmRUrLEqEuH7iZ
	 9Njb8pOgRjzeV7Ij8hz/gLLg+Z7WXSc8EChR1SjusqTs9VaaslEmh3JxLceBDYnCDNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
	b=coKs/JWdDjbQ22Kj+4ZdTat+2QqMgQpGw+9A96Z4q3rx0A4TnpD1/0Ju9PeiEsd4I6To
	 hhdnk/bNf6pipYqrzSuh7Tfpfp3X0RAwjLd1IPyctikR41rLZVoakj1nCNmPgVGbsO41x
	 fgWxdW9vld75e0JbSxdBe6gbV4X2CkCu/DCqxpWZ9UvNa3/47YHXquqF9LI3YjO8OUUnn
	 lMLm4lqsVduhKRiD8XtIMSZ5WydGWCWJY//qMtrApnp/tGG6JuEYeaOyBfvJeua9K/BEy
	 mJEnT7pQRWlU/irhVd8Bmq4GVx/lwqREbR7onq1w1OW6HNcP5g49I56+hpqa9T3oqAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYiUfnZS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99101606A325
	for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 15:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99101606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYiUfnZS
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3712b6d9843so970993eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 07:31:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188689; cv=none;
        d=google.com; s=arc-20260327;
        b=RCssuZpKgP0XmzWbL1P/wVAPFSUr8/MsDmHUN5GsAnSQGAFtn0aXYo7mvng80o+QeO
         a3LFZhC9auTebGiA2DxiRl30fCvktAObOBTXAkAfuuw8CQm1dRdeBrTo32tBZK2LPI+4
         KrDDflsYpyXKYsogR6iolr8OQrbLuB1C4CWiHK50lQts1I+/xVdzIPcJoxmCxgrGfBpe
         3dqae4m8Frr1895Z4NwdAlGgz+ksssWVhsnLY+n4h69iLMkZAR/moQ/0VsthGViRq2Fg
         4GNaj59Azqc+yecwBDkq00eqVbV+3N1LwVpqIyljv3Nwuv0OVnFJ7ebnJ09v/Kg0iHDJ
         vOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        fh=CR0m5UwEJA+IXBfMi4zlkMi+7lKeOURR2HBvpb8jFk8=;
        b=Vi60Qdo7vxg1FBM8ORA7lPBHCl/QZPfRch+eMAsrVcy0q/4Uw1ZAVeNGwKH2J/SG1z
         pHOv7vzVEUYBL1LGoYSokC1nq1phBWQZXn1+42sKdiRDoWDjY4mGzkqU0w+DNa2iNc+B
         RAksGz4s+oPz7PSetgX+z4avVKaGngndEDbOGyNB9kRKFY/K6dMbUyHRrkm8eRPocxJ7
         Yaf+8t2tZgxh56/qAMrYqFIqGfEhjNBdkJ575cFbY2tEP94GCRdlKwbmISLs+HZWMh+H
         WtBJAN4zVXT0FbHA+IIF8Gq9Iw12O21BNaaiwe4Y9FJKyaID+Wrjxt9HilGoM/3d2v9o
         0tHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188689; x=1795793489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=rYiUfnZSuaoielxLAtDf6tRtT09b3z0BbTf3Snshk09+yIK85WTu2JSCR8wJWNFFyE
         BONIXUlNMREfqT8nZtaskrOX9zSYxi5AXvSf30rqFA66oJ3LYHi7J3Mvj5THz6yVbEDE
         iK5wnp8bWy13CPECQBGqxn+SElETm1hRIy5Qam6OqXUD78v+dd6R5PcUnhTiC4ynJ+6T
         ZwdF3ery1c9v5wDocw5m2zc0VAUoNmiEaKySbXM1G28Z5oMGiNN++MUS0Fq9qykbeQuj
         AIBkQy/5BAYptgfXI0Au85iL2L2BqDxHptajlHv8Jnbkj6e3aibZBPHiotbwD8DmFSVd
         qCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188689; x=1795793489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=FjwwbDCaFeHy+cNTwxkx1RG+QhGcMFULU2dci45iHU6zeaF3U8Anllf5tP1mECJr1f
         da/TuZIGEune9ptCxlKtFq7DGcI+QXqCuZJItY0WmNLinLMEfq0zuiPaTDaZ04n89a4z
         Venx6K2gLAe/xmjlQbT1aWBz6dPsG7+SDNyUFAAtC5M58anqQVHRgPyIR9itaisczDaw
         7JFFDSibzwu8vPsgNyEaoJj09HfWMcoWclI9w/GsAHmWKXsxFpNyVELtxWV4rB+EKmtj
         s7Y/RkcuSRNKH8svWuM8PjrayvuRxNMOnJJ7k1U+PzthiSy1E+416Q1Q5mP264uqIobi
         H5MA==
X-Forwarded-Encrypted: i=1; AL+hErE8WW3sxFvpjR1fccJwYmkZC/i+yiXWg9l0qJOefHB5BzH/IPIoHU+OOSaGeuSs1oTO29aE1J5yXd6PqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GTFxxkHtprf6CXsPHMalAbjuxqhR4Ugu6RirSlYtU6Hr9I8KB
	kIocAp0NUIAJHrZhszqvpdFRAh0PObh4rVypgxkW87wxFmGCIjPyZIC/QLMt2yD+ugtTRcj7r9Y
	Kj6mEg5Ob69tRawcYRKELQCOCk2fZfmM=
X-Gm-Gg: AZFdTZeZiJcRJnlvyztDAy20/giYHqi+eQ8mZU+6P/II8JDuOFIe4P6VmB5VUlWKmZg
	XG6qikhQDNDTQ2Jc31w+vv98h90O3p9Bfs0j5eykx76/LbPLF7lOT0B7i9ptXV1NDgar9w8GodM
	HK1+uXePvWCZ/Qa5uY1tfOfhB98ia+wuEj7Ym9PUqO/pCaUI8srYYmsybn1mhX92/bGxGqO4soS
	ga8c1ww6Zk6Kk8ToVKHhPixPFErFSyyAGFm3S9VixZvtM3p/4DzTF46P0IApERqFjAD8eCHWfb/
	PDVues9AD0WT544S8u+0nhOkqcw6vY571X0l9tsqDLpfme0HIcN7Kzp9zofFggObyprsaQhv6KE
	kqts2Da4rkNyZuibeNPDzju23VrLJcSMBVp3KRsw0+5tJxRbk5Ac1rHLl4Vq8HWW/m1HBa/u/NY
	GD1HUfic3bQNmHjSo8YWTH58nvfMyBZIdXE1QQg9JbN5tHMXc9fOs=
X-Received: by 2002:a05:7301:6408:b0:383:1bfc:f1c0 with SMTP id
 5a478bee46e88-38570f27a56mr3129077eec.32.1795188688670; Fri, 20 Nov 2026
 07:31:28 -0800 (PST)
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
 <20261120143147.GA2466366@killaraus.ideasonboard.com>
In-Reply-To: <20261120143147.GA2466366@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 20 Nov 2026 17:31:17 +0200
X-Gm-Features: Aa3M54rmNUuNZyda5qhpJslp9i1jTMK9Hg275DVhPVt4wZMMMc9yhIUe9r0PTkY
Message-ID: <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
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

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > The Tegra Video Input drivers are mature and developed enough to be mov=
ed
> > from staging into the media subsystem. No other changes are introduced.
>
> The driver should at least be converted to be MC-centric before being
> moved out of staging. I haven't checked if other changes would also be
> needed.
>

Does the media subsystem deny video-centric devices from even being
moved into it? I have not seen this restriction imposed; could you
please point me to where this is stated in the media subsystem
documentation?

I would like to convert this device, but that may take quite some time
and may case regressions if not done carefully. This patchset apart
from moving to media is mostly fixes to work correctly with mt9m114
and tegra114 bring-up which is quite simple and straight forward
change.

BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
to your liking, Sakari seems to ignore it.

[1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gmail.c=
om/

> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/platform/nvidia/Kconfig                           | 2 ++
> >  drivers/media/platform/nvidia/Makefile                          | 1 +
> >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  | 0
> >  drivers/staging/media/Kconfig                                   | 2 --
> >  drivers/staging/media/Makefile                                  | 1 -
> >  17 files changed, 3 insertions(+), 3 deletions(-)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Kconfig (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Makefile (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
TODO (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra20.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra210.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.h (100%)
>
> --
> Regards,
>
> Laurent Pinchart

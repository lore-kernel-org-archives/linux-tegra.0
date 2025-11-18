Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FBD2D7DF8
	for <linux-tegra@vger.kernel.org>; Tue, 18 Nov 2025 07:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450211; cv=none; b=AausPf8Wkj0zbTT54w5F1DQPtuVgwGU6JI+MuenlyHAxczaUUEnhkmyGzFHxbrG/lp/ikebnVD61QEhWlZvdbB14pZgtoO2bbFtX2Y8Vlzx8jkwN7Fe4eLV0SsBiDWdv9oIFPA71NXGy4bZvb4K3L3TEGAEYDP38JTbBWA9FeZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450211; c=relaxed/simple;
	bh=q0yJJiKn+zBrJd/u9eWfOIOO7+WxsjyO1+iLD/6tDPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHqAfCcytTvKVn72at5sQGnw4tvwFauQAt8WvoJ0pTG7QrVWBk0AfdkiaiARxatNWGp6KkxlD+Ss01H3nhPAC3VxExgtfH+fEixU4dQt6WrC4LDtFTSSOsntSebrRTG2K7FOh1KC72WKH+I0Tx6+ZmsXnYENDuopPT6E7bUTVMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4t/2FgM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4t/2FgM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47796a837c7so17924275e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 17 Nov 2025 23:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763450207; x=1764055007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KTXy4LYc+3eURkyFEtAu5JtRy+tCU0zvqdQk5bTLU0=;
        b=R4t/2FgMTUTR90N9SzH5jIksYlYDJAlh7aH7COqLT8bhG5Goq+TNvCiYHooM/YEXiD
         oUcyIk9e6R7Ux0sIw/xifhYgY5NpDu7Sx+HAz6l+zOqflD+gPhWDJrLvgcLDx8G3e/og
         mcNPzQ6mk0C22bmSFUiPdYXykvhsejic75MeIHWTYc/0A+CN1JeWysaqEDX3JCoLKAV1
         EM/JZAQxaLzbj9w5p9cpCgYmBKwYfF2eVR5B5jF3fZlg/Af+yyZgB/x9abbRt5Xseywy
         9LWnH8FS1vGuTFyUPUrOvBlzMAIX0Zxxhl0eu2zOWHalKOTDAEZkx1gEvLhqJmcXk3OW
         za4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450207; x=1764055007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/KTXy4LYc+3eURkyFEtAu5JtRy+tCU0zvqdQk5bTLU0=;
        b=LbeA+BVOkvvo14hMUaI+VN+brLZSt8SjVfANoNHLpo2TM2WJjP94c2Mqz9eYk6R5Az
         PzfB9iZi33NtzkwgWJ2Br+vQj3OqRs5yazNvVE29TDd+vw+hzKPNsq+4ubq1NsWiDzDC
         M9jS8Ui9+zpIaO9UFBlU8NnIM/oA5NE7wJyhuHZiS07Snn+EtnNQuPogoCYgy7gfJ75L
         RsIcMX3MRpI2DYbx43h4LTRzBcoUAWlA7e2VnC49JslMbOBvuFMaFu9LTH5RaR3a4Jth
         EcYlYAkBIvl8KhWtp59RAbFehMXGndxcFjFClGMWKKKSlIkr2fAqAzhqMyTkA/q2w3eU
         /ULQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuO3ICKjzMZdNLITSKxcl/pVw/54RYJLUmbv24bnjzOijM7kvTKhaCfgonAgDXIZI2yHU01gyCnfgTfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv7ooa68u4F4N9c5M8bkaGTZGvRqSOos4B1c7hw/Hqk7W+wTna
	U8w5yLH8AkkgyLTT4/U7NVJ19QclTxSt7iqReB7u8j+rWJOCWCbocPl8mJcO8YniOi+S/qpEjFt
	wDUNGkQT4hzakn0giW2npH/K0SkDGoHY=
X-Gm-Gg: ASbGncsI0DTh+65ojVHgJgrJ8knsy6dFW4sRrWUUCdd8CTwXPlfkszHN3FnUNNlA2tY
	XviulvaDi5Fao+tmw7bFDdzcOKBXdexpE9Z20Xsoydxu1xho2mpVGvlV5IYJLkQmyyGe5LPinCh
	JriZRdoacnAnJX1sU2X+TMuA13Uszw2Bkj7Vx262Oy1qgAT/zoEdbYDZlrWLHhZWzqVuWPrwY9s
	6hjuLxFHBoR86Cj8q8SB7OnIpMAZR/ihAMfV86JlrdXpazgt7Jr439Jji6XqgzgJrmFG1gTwze5
	htESlqI=
X-Google-Smtp-Source: AGHT+IE8eWHTzx3ciz5rS3jZUxmLAR3nOWJrIZLlZT32SvvuGpdP8yMosOXzwXWHhwq5spIUyYIVyvJj9viWhF5Bm9Y=
X-Received: by 2002:a05:600c:3587:b0:477:79f8:daa8 with SMTP id
 5b1f17b1804b1-4778fe7e760mr152755075e9.17.1763450206831; Mon, 17 Nov 2025
 23:16:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022144930.73272-1-clamor95@gmail.com> <20251022144930.73272-3-clamor95@gmail.com>
 <mzapp3ekwj3xdzqjjwkwn2hdfunf75fnd3wwxfsr5nce5guhoa@k2dgiw4sngrd>
In-Reply-To: <mzapp3ekwj3xdzqjjwkwn2hdfunf75fnd3wwxfsr5nce5guhoa@k2dgiw4sngrd>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 18 Nov 2025 09:16:35 +0200
X-Gm-Features: AWmQ_bkV8027WSudecPgIokkxJAlJtxrZFbDhKQAoi57jFryZZw6HtTknmXqldw
Message-ID: <CAPVz0n0fkMYV-O4xWTBELd6HtKR83wrs+DS1wTVDOXdWuAK2OA@mail.gmail.com>
Subject: Re: [PATCH v5 23/23] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 17 =D0=BB=D0=B8=D1=81=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 13:5=
6 Thierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Oct 22, 2025 at 05:49:30PM +0300, Svyatoslav Ryhel wrote:
> > Add support for MIPI CSI device and calibration logic found in Tegra20 =
and
> > Tegra30 SoC.
> >
> > To get CSI operational, an additional syncpoint was allocated to serve =
as
> > the CSI frame counter. Both VIP and CSI use an existing syncpoint for V=
I
> > frame start events. That said, the frame capture function was refactore=
d
> > to reflect the addition of the CSI syncpoint, and the CSI-specific
> > configuration is guarded by the presence of a passed CSI channel struct=
ure
> > pointer.
> >
> > The camera capture setup's configuration was reconsidered: the first tw=
o
> > writes must be done before tegra_channel_set_stream for MIPI calibratio=
n
> > to work properly; the third write was moved to VIP/CSI-specific functio=
ns
> > since it must be source-specific; the function was placed after
> > tegra_channel_set_stream so the initial sequence is preserved and expan=
ded.
> >
> > CSI configuration sequences were added based on downstream 3.1 kernel
> > sources and adjusted to the existing video-tegra framework. Although
> > Tegra20 and Tegra30 have the same set of configurations, they differ by
> > the number of clocks used by CSI.
> >
> > Dropped the software syncpoint counters in favor of reading syncpoints
> > directly and passing the incremented value to the polling function. If =
the
> > syncpoint increase fails, the PP is reset. This change should prevent
> > possible race conditions.
> >
> > MIPI calibration logic was registered in CSI since Tegra20 and Tegra30
> > have no dedicated hardware block for these operations and use CSI. Thes=
e
> > calls are used for both CSI and DSI to work properly, which is why MIPI
> > calibration cannot be contained within CSI. The pads passed to the
> > calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) an=
d
> > DSI-B (4).
> >
> > Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/csi.c     |  23 +
> >  drivers/staging/media/tegra-video/csi.h     |   4 +
> >  drivers/staging/media/tegra-video/tegra20.c | 620 ++++++++++++++++++--
> >  drivers/staging/media/tegra-video/vi.h      |   2 -
> >  drivers/staging/media/tegra-video/video.c   |   6 +
> >  5 files changed, 608 insertions(+), 47 deletions(-)
>
> Sorry, didn't realize that this was supposed to be part of the earlier
> series that contains the opsification since it shows up as separate
> patch series. Admittedly the numbering should've given it away... Thanks
> Mikko for pointing that out.
>
> Anyway, most of my objections remain. You can implement this here just
> the same even without most of the extra churn in the prior patch. No
> need for moving things to a different header, just keep adding the new
> ops stuff to the existing one, which all drivers that need the
> calibration functionality already include anyway (including this). Also

So you propose to bloat host1x header with more mipi calibration stuff
just because someone placed those functions in there, instead of
creating a dedicated mipi calibration header. Even though mipi
calibration has NOTING to do with host1x, in case of Tegra114+ it is a
dedicated hw block not connected with host1x at all, and in
Tegra20/Tegra30 it is integrated part of CSI and not a direct hw block
on host1x. Having a dedicated header for mipi calibration seems more
logical then continue bloating host1x with unrelated stuff decreasing
its maintainability.

> no need to split out the SoC specific bits from the mipi.c file since,
> like I said, it's not going to grow anymore and can just remain as it
> is.
>

I proposed in that patch to separate mipi calibration framework which
is used by all Tegra SoC generations from SoC specific parts used by
Tegra114+ if form of dedicated hw block and Tegra20/Tegra30 as a part
of CSI. This enhances maintainability and improves transparency, while
you propose to squash everything into a single file making it a
maintainers hell.

> Thierry

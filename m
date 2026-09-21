Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857EF492E33;
	Mon, 21 Sep 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991253; cv=none; b=OZxk/0u0F0fyCIPoCRpA+otyaGIhlBybnlRl2G3ZiImjeVbewLAch2taGS7yL1sTmSb6zXmgfKswDFVfohSAAYb3wNhzJULDOjDwptunmgj+zMSqgu7eLbXx51wYS9v6tAPcQDks7aF6+EbRClK+mmDotsmNsncxObrl8Zxb6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991253; c=relaxed/simple;
	bh=qmpUOmKs6PKVaPVV0s9S0z0dGUgMiyJ0TdqyIRY/7yk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FkvBx8G3+jWeJNdoGUHoY9/gASo41zvVOJ3yRUPXDLulFqkiZ9f9Ia0us2c4L+9C7Dp0U2vI+Vv2hQ/jrdHJ7p8TEja9P2kEwWGaB6a+FS7Jliys1V7krzCZsXCh8cV4Ekbtl2ykeRtTnO1kabYthPpssMin7RfVdtgLJ4ICKAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=STAYvyZS reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="STAYvyZS"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AF0D153F;
	Mon, 21 Sep 2026 13:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789991141;
	bh=qmpUOmKs6PKVaPVV0s9S0z0dGUgMiyJ0TdqyIRY/7yk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=STAYvyZS3Aymp7Zn28ch0K0a7KGfKQzDkEA12l1J+zOjdIrg8q+d1IW9DQl5bRnP7
	 yQJi/lXMeI5RjKmAzjSMAFR6oEJk2ecB9b6TmbcPbTzHnkpdkWviRb0Njx80+6QL6e
	 VEkJQvyNd5qsD+BxigcRfJQH1GUBgk3C7VOvo93Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <arEVs0FDleyHeeLj@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com> <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com> <20260921073538.GA1466037@killaraus.ideasonboard.com> <arEVs0FDleyHeeLj@orome>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, Quentin Schulz <quentin.schulz@theobroma-systems.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@peng
 utronix.de>, Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Quentin Schulz <quentin.schulz@cherry.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thierry Reding <thierry.reding@kernel.org>
Date: Mon, 21 Sep 2026 12:47:23 +0100
Message-ID: <178999124332.1723501.13535584681937232110@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Thierry Reding (2026-09-21 12:33:54)
> On Mon, Sep 21, 2026 at 10:35:38AM +0300, Laurent Pinchart wrote:
> > On Mon, Sep 21, 2026 at 09:07:01AM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven wrote:
> > > > On Fri, 18 Sept 2026 at 12:55, Kieran Bingham wrote:
> > > > > Add a new dt-bindings/media/video-interface-devices.h header that
> > > > > initially supports the Orientation types and convert existing use=
rs
> > > > > throughout the code base.
> > > >
> > > > Just noticed these are already in since commit 6ab5acfb8dd38729
> > > > ("dt-bindings: media: Add macros for video interface devices") in
> > > > media/master (next-20260903 and later)?
> > > >
> > > > > v3 collects tags, and fixes the typo, but drops all hunks that do=
 not
> > > >
> > > > [...]
> > > >
> > > > > v2:
> > > >
> > > > Interesting changelog order ;-)
> > > >
> > > > [...]
> > > >
> > > > > v3:
> > > >
> > > > [...]
> > > >
> > > > > -v4:
> > > >
> > > > [...]
> > > >
> > > >
> > > > > -v5:
> > > > >  - Definitions now accepted in linux-media, rebased to get conver=
sions in.
> > > >
> > > > Oh, you say so here ;-)
> > > >
> > > > >       arm64: dts: renesas: Convert to new media orientation defin=
itions
> > > >
> > > > So it's been safe for me to pick this up since v5?
> > >=20
> > > No it's not, there is a hard dependency.
> >=20
> > The whole series needs to be postponed by one kernel cycle :-/ It's not
> > urgent so it's not a big deal. Kieran will have the priviledge of
> > rebasing and sending a v7 :-)
>=20
> If all platform maintainers Ack this series, they could go through the
> media tree where the shared include was already merged. Alternatively
> the media maintainers could provide a shared branch for everyone to pull
> into their platform trees.
>=20
> But given that this is simply replacing a literal with a preprocessor
> macro, maybe not worth the extra hassle.

Indeed, I'm not personally worried here. I thought that because Sakari
had accepted the main patches these could go in now, so I refreshed the
series.

I don't really care which route they go, or when. I'd rather not have to
re-re-rebase again in two months ... but I can cope whatever :D There's
certainly no urgency here.


--
Kieran


>=20
> Thierry

Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F6B42B301;
	Mon, 21 Sep 2026 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976152; cv=none; b=B3HxzCiD6wCN18Qv3bpmzpewVL7ZTFCOqPQIdv1dvfOnIjScPfrDmlpf6fKkrJYa+JPZuhaZD4+aiw4/vtWwwpawzem0F2v6owMdUXZm27jvfonE0lKjwnnqI1dxA2DjEy5v4fQ6HEfszj/89Rzh/psncZlQeA+XaS8vbCkpOJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976152; c=relaxed/simple;
	bh=EgnOCBnnJ5SOs0ufuZFAwGK3a5ufdWOiG7rFGmgMKeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCSLaizLCkvvEqg4I2J7u+z5WxnSrosvc7V0kq09+El5aU31CNYqVutVAwfDkqt4S9M5YrSZLn2txM92gClExVhg5aWFY+X6qc32+VOS85+DraBlshZOWlk2UD5Wd24QNJ/qCUSNB0OFTHz7nk1HnCrTB7wk/VUbX6f95kwJwNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NYJnH9ji; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NYJnH9ji"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA348C36;
	Mon, 21 Sep 2026 09:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789976035;
	bh=EgnOCBnnJ5SOs0ufuZFAwGK3a5ufdWOiG7rFGmgMKeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYJnH9jiYSuPY+BwBDdOisWoegG0YGvrWBJuC91+Dqj36D8Ei+WW6V0hr2WdRLzA4
	 ceTiFTS1Dko1IjjTrFjG3vY0NRiNYl6eVDHf1tdYPmY6GvW9EDDxObEKF12Kxkr7uO
	 cfiq2l+XPxObD84mFWWDFi3fAyfeni8e6gtQ0o3Q=
Date: Mon, 21 Sep 2026 10:35:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	David Heidelberg <david@ixit.cz>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
Message-ID: <20260921073538.GA1466037@killaraus.ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
 <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>

On Mon, Sep 21, 2026 at 09:07:01AM +0200, Geert Uytterhoeven wrote:
> On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven wrote:
> > On Fri, 18 Sept 2026 at 12:55, Kieran Bingham wrote:
> > > Add a new dt-bindings/media/video-interface-devices.h header that
> > > initially supports the Orientation types and convert existing users
> > > throughout the code base.
> >
> > Just noticed these are already in since commit 6ab5acfb8dd38729
> > ("dt-bindings: media: Add macros for video interface devices") in
> > media/master (next-20260903 and later)?
> >
> > > v3 collects tags, and fixes the typo, but drops all hunks that do not
> >
> > [...]
> >
> > > v2:
> >
> > Interesting changelog order ;-)
> >
> > [...]
> >
> > > v3:
> >
> > [...]
> >
> > > -v4:
> >
> > [...]
> >
> >
> > > -v5:
> > >  - Definitions now accepted in linux-media, rebased to get conversions in.
> >
> > Oh, you say so here ;-)
> >
> > >       arm64: dts: renesas: Convert to new media orientation definitions
> >
> > So it's been safe for me to pick this up since v5?
> 
> No it's not, there is a hard dependency.

The whole series needs to be postponed by one kernel cycle :-/ It's not
urgent so it's not a big deal. Kieran will have the priviledge of
rebasing and sending a v7 :-)

-- 
Regards,

Laurent Pinchart

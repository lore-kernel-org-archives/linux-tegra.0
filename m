Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14372C21F4
	for <linux-tegra@vger.kernel.org>; Tue,  1 Sep 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247291; cv=none; b=roJKzOVqK7EfnhofsKRl07dnBFhOg4GSuomrn+oJW9WnC/l7BwBDA9ddh/w9WYN7FzKm+i5vNz6BOWl8CWI82XSB/reW412UOk8lu5EP9uR/X/u69i0rAC4SEPyuSBFm0BP9VcIcJG3h/GfzwnZE1PW8VCKx9SskJzbol/V+GBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247291; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfNB/h1Jizy/qHt0uUF+Ryf3OShrkXDyLTPwzSdZYAUhcHp1CPIo18CkacWXpomTIsEHSLoW4/f0L00f52TE964Fsup6Kvg2A6aSfQD2aK/B9Yt3AYjCf9dUHNELHuJDARtzv4SGa05AQSxy4CZUWV+UVlxK8MzqyG+gMS3CLOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90cc372d6b2so40761406d6.3
        for <linux-tegra@vger.kernel.org>; Tue, 01 Sep 2026 00:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247288; x=1788852088;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=k9XdIIHruGIpbvo25N9+1fBl1eRUqCz/BnEoac8njhFLr6sHktVfuqy9RbkmkVfHaA
         YtRBCTEHd/zOwNwamURbGRpfKuiy6Z414DJdF/DXdx40ysuSHqgAO+Sr8CXV+Xtca5lc
         Q4OjND65R6IT/hvuvOgZIb7/7cCkmHZVpq/kR0CSsHAVNZVmmJZDjLtLBMPPh3cOFOsa
         H6Bu4qLPVRqhFqR8BBrf1xCyG042GKnWw8wC4PhMoDUfV6LvgNSiRfXDv3euLcexb7wT
         A7uYF8BYdsFi5LjBD1CerV2/8IREeHs7La8LLOTwiIUnj7Iyv1dfvzFeXyTyR/R22r6n
         RsZA==
X-Forwarded-Encrypted: i=1; AKwUvBy88zuYVTtw+aKCp5cvqMsK8fR/ohcVGEqB3pShfRKMaPlSQ5tF4DqxXAaXaQBHwPOxjqQF30Ie0BAniw==@vger.kernel.org
X-Gm-Message-State: AFuF++lggr5EFvLt9HRqJVzeIqPk0TPf4Ahi4XZd+tnQTEtKsVqVwPSN
	D4luvPgP7QOOShcTNACgmOaoLB2FY8B+cCakHbs6DCwxJoWu36WwS5RQVa1Dmu9A
X-Gm-Gg: AYBFou1bz4EMzeDMy/lV8Zfjgf9MmpD1UUS87fqlFdWZNBnsljf1XqGDl19xEmQDLFq
	3dMR92PYRfdJfUlCkRGSE9Qt2+X7iqyE9hyzIgsACfsuIaXL6PpLw/QLYYaSsz8t9SDKyLiuzT4
	HJCCXha4DFeXoj6DKgsmbAIH+F2y9Najb01kNownoos8wGZFyI9l7yOzDTpOxoE/EDvfZuVKh+S
	xJf9WbWYTJ6pP1wEXrYqyyIxkKJ+oR/2Ut1zfdzGIgD/0vqCkGwU+tlbpgst7/7s4P5kNCIBQgU
	fn/m1LIDHBkU3eb7eu2penu2gIbQL0TDjpr4QxnJBQf46Agii5Jt7HqIJH0tJljbEUoTu8QcRpo
	HZB9Q4cGmpiu8NeRfuWyjV4AKN+3XqmQJ28JBR0I1zm2DzzgTfCYT4OrxfPtqJlyTcPEnnJjB6l
	awdCjMBD6WT+9nFp8dDgI1j8XHHSPYuXXqSGDFnlP/uPCYrgdCaqOHTFI5Id0AaucaYBGRKL+C3
	pry4xVsemlAN5MJZZbhesvCy7RflA==
X-Received: by 2002:a05:6214:460a:b0:907:bfc0:781e with SMTP id 6a1803df08f44-90ce0f1c9b3mr458422566d6.30.1788247288411;
        Tue, 01 Sep 2026 00:21:28 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90d3331f906sm84437116d6.37.2026.09.01.00.21.28
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:21:28 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93906e8a5feso451696185a.1
        for <linux-tegra@vger.kernel.org>; Tue, 01 Sep 2026 00:21:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqvWgCztcoJk7FsNY0K6HTOZNt+k8TU+mQYPpuiZpekLieWnTfGMnoMGz2Mq4eVRCYmNs5iJECWoDR6Tw==@vger.kernel.org
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

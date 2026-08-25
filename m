Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B904488215
	for <linux-tegra@vger.kernel.org>; Tue, 25 Aug 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670720; cv=none; b=WtN8mZeQJVsiQeW5VXRNPhLG1tsXV3mfMIet9zQIqnH0r9Zy74o0xRLCcP7tS1Zjj0ytENw9GZG5olm48Fc04dYlSBu64A3QxFLaWtvKEoo3Ym8r/c++mQSwYwLxMu8/RS7v/hj58Lb1tUVSBBfvsNuEpj6tcSdpcEQJK7k3vz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670720; c=relaxed/simple;
	bh=VSfhDbGuaO6bj6wZHF4WXo8dJZaWBr1sYjz3PhauiKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlpoYcIuXIxBcel+3u3CuPSJnV4v7UydBtNfGcl7ZHJ/LjY1wfJnJVtGhyHvHJHkiw1tXrdSP8EE4Ut53on7k9PpWqoZjcBvnuO7tzd7JYpnv2s+g01ZYgEgWBBhnHK15e5XZKQ+pomm5cHwM4S2XQDHAlCKcJ+r42pcffnmb+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cmNwOCPW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nY8NWXxz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cmNwOCPW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nY8NWXxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787670715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
	b=cmNwOCPW0pCLo1vgxbiI8024BSzxbFhi3JiPy5Bv8SJO4i3CWLe8pnJoGKFUOrad+B/b/+
	ss0febDjN34CvxqR7kDJPsYhRohx65REzsx6IYHVayw4b9b70DhLTuDcUesPRiEXiPUqHm
	uTFVlFozsf2xG5Uyv+HbX3OiX5QSvDo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-5lSLZ27tPHCEJhpTOqIoMA-1; Tue, 25 Aug 2026 11:11:53 -0400
X-MC-Unique: 5lSLZ27tPHCEJhpTOqIoMA-1
X-Mimecast-MFC-AGG-ID: 5lSLZ27tPHCEJhpTOqIoMA_1787670713
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so67495151cf.2
        for <linux-tegra@vger.kernel.org>; Tue, 25 Aug 2026 08:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787670713; x=1788275513; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
        b=nY8NWXxzUsDInqAxCpLmy+ZgNlGKxq/kfQsQxAorLaiici4SgkZ0nof+e8JjT1U/LZ
         7AHvlkxixLUX5HEIw+pWo9TO/OL2yqXDquuBuFM7tTPMsNCeu9PMYrRxxq+25OWbVXqx
         s3BZ0P1vtgY4EGOmC8gfkBPDo/Tq0KFNuU5pafXZLWKj3S2OULCL1Y9s7AZIZamf3uaL
         NNBTYUzW5TbZBD/PtLCT7eZMLHQO4Y4q5XX6uG03hKeolBMKbUXLrtuYB/YRo9hDPwG4
         VheOijSCYInUzGi5mDeobEqmFnxTsh4xa3N4Qv0gB/vEyazaFFf2Va+MpVMnP8zgrtG7
         bkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670713; x=1788275513;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
        b=qf6Z4Z03HvnTlXsKkrAkeY2gKV9nFafF8ZyGrSHmmJMXL/LgPra9mUfLbN0biTr9E2
         EkUQC41wLfRp5YlgUcJTf6syL/Put8lJyQjCUKvBhaHkQUYA9YRMw/Wz6QxjcftaiWLD
         s5EzuC3fNHlwYkfPbjAzp4cpucZB8i3fNAGxyD2T4eLWv/wYeijCb9T9lp+fHRUNVNeS
         qtudVDhpmuCY6ahRA9/MMcQ3Xh3fHV8KWhtMlyoxTw5zyploeWEMHGV5Ad39hubqZoTR
         ahbET5rWp6sM0KgJADB5caiJDVieAfzDmIkTl4YFeQ/4MBCLO5xajz2qjT245h+lD1DS
         FtYQ==
X-Forwarded-Encrypted: i=1; AHgh+RogF0GovyPYctL79fQq9t1mjcaTqgDNOFoWdo8/JgqIeA97ATK3r6GxwFoiCw91eGGzAd69yV7WuFc3wQ==@vger.kernel.org
X-Gm-Message-State: AFuF++njh/M6YdhXmNa1nHwHvCPunWKw1ZVPpqS4yUb/HlNSl0pfQzSp
	kV6KTdwccL4T1t0bGjZjcR1riIAm/re8CNegCHITNaqMCR9sbpZqOyp7g5hWcPsivitgDAs29Gw
	LZ9wTsx7tGsc0rsOFjDXrnooGQLz2ggJR2PKgdXt4PgHQa8mTehn6+MWnhdkPSbc3
X-Gm-Gg: AR+sD10QBOtQi7r5VMsmX6fPits0vn+Lt6Bhf5DFQVncgBquVzNabL/aJcu0TtZNvmR
	1knh6ONXTKhj28xuwNUR8unqUBBSWMwMPL4wbEz5u2TbKDTs55V8+rMs2vXmMx0rPomttUX0HDl
	aLp4nXfKt+4lKxZ0eBj+rY7je2sx2PRSqA5iU2t+oXAoh3M/f14fus9g8y4ANcN2nPwvemcvzwr
	dviRFVqMhtff4LwpTSZDLJBZ77PomarbWrGCIWVbfBHdZQpzKkY37ELj/X0IL3cydv/ObX1MlLf
	ZPwixgSVM8ZMZtBz0uyV9sUkxTNZhxdyEb5QH0/L/2BK9PoHhQ/O1My0EgOK1J/2tBUJki5hW4y
	lKwBabKRBcGRwWZ3EEgP6oPiF36hheuPN7SU=
X-Received: by 2002:ac8:7d13:0:b0:52d:3d46:bfd0 with SMTP id d75a77b69052e-52df5a4a41emr343136091cf.32.1787670712370;
        Tue, 25 Aug 2026 08:11:52 -0700 (PDT)
X-Received: by 2002:ac8:7d13:0:b0:52d:3d46:bfd0 with SMTP id d75a77b69052e-52df5a4a41emr343134781cf.32.1787670711664;
        Tue, 25 Aug 2026 08:11:51 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aad030sm71209161cf.15.2026.08.25.08.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:11:50 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:11:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
Message-ID: <ao2ws3ZA-o8ZVjTh@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <3074509.irdbgypaU6@diego>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3074509.irdbgypaU6@diego>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Heiko,

On Mon, Aug 24, 2026 at 11:11:32PM +0200, Heiko Stübner wrote:
> Am Freitag, 21. August 2026, 10:53:10 Mitteleuropäische Sommerzeit schrieb Geert Uytterhoeven:
> > 	Hi all,
> > 
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
> > 
> > Thanks for your comments!
> 
> I guess more a handling question, how do you expect this series to be
> applied?
> 
> I.e. each clk-arch-maintainer, or in one big thing by the core clock
> maintainers? Just wondering if I should pick the Rockchip patch
> or just let the whole series get applied by the clock maintainers.

Before you pick up anything, let's see if Stephen picks up this series
the next few days before he sends his pull to Linus.

Next development cycle, Jerome Brunet and I will be clk co-maintainers
[1] and will start collecting patches then. If Stephen doesn't pick up
this whole series this week, then pick up the patch(es) relevant for
your tree and send Jerome and I pull as usual. That's just in case
there's other patches that come in during the next development cycle to
these files and to avoid merge conflicts. I don't have a strong opinion
about this though, and could be convinced to take the whole series for
simplicity.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=8bc7ceadce1f362a8b0e88075ef3d926b286c01c

Brian


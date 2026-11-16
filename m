Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823640;
	b=wWN7jNnzxsYcdpOcsDyYg4RrEidd3UaOL2NLQLL+vzq4ybMO7afg5AeL0G+4W7stb3Az
	 KYGFYbWQ08wf4IkJ0ZfzkUPR05hTbT8BgU5JqtnOjVjMuqqXkCXzZAEYhUA2LQq2Vhjnk
	 Dwkvst4wPWRNDRX4A37ccDPVyN+XyIPrRpkXqneIVy7/1XHRmlf+A1phO87yfMmq41EB+
	 cuGSC2azQr3rnGXxODZ1waZlg6dph+EDxGpoyscp/IHaxRv+2JasCUpRZB5902hOD9DFB
	 HnmIUF60jURsIkwH0E1h9jQBsxq5mGGeaF0YHAVJ2REbYfD4xUHoCPGgQ6sdgWj2zGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jiIzLjcyhaAEDOaVVjH5VECO9F+nQCzI1T/v9+EoYaM=;
	b=URR+P1DHKjiwxlrJsOloL5/kmLChQfsuuOYg4cnNOhdzX3ElTNiCuIs+uTk5+4j9uoMc
	 ZgiRczvwGBYiWJb0Nbs/eet5VKk9EY49Aqy4hfeczaFhWy6o55bSBNLMnY+Bx3a2gx+0l
	 h0W98Ys49vngP1nTxpv/+YF+fOGVUY5A5KYeC4BDwdJvKQoAjqR52TTTJZqkzzfpYQcxc
	 Z2DTMZn7XXeinptGHdvbfYOGUgeQdQT3ASQ44xuSDrH9pHLjjG7SM4DS7aXZucQJ0PKl5
	 03uIEm+4AAyhpdUqQDYzjQqisnNRA3a25YqaARFGlDKF/Lo+i2TWJc0CzA/WaPZbHFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d5SpOIA8;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E8B606A323
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 10:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E8B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d5SpOIA8
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492690dd5daso3113072f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 02:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794823638; x=1795428438; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jiIzLjcyhaAEDOaVVjH5VECO9F+nQCzI1T/v9+EoYaM=;
        b=d5SpOIA885YJysxfb0kGqgAYfTmUHo1oj/KWBQH2yWjLJcr/ad4YAMyYWe4FxDSJYS
         UrPyEcVOzvi9Ojgw5IK1osCk2hQ7yXW8l2qP1eDZOEcp+oUTqcf3P0yGYX2RssIpJVEh
         YUMeZ76KUcXcnm8wD19EjXgQyFgUMRCLfW5ZLOwwY8TE01fgPIU+QuzhcStXE5mOjPQu
         yrWwptPkzYlA18Zp4syMMCMJvPwn4zkGKz3CA+et1ZeHWsFtuWPWTWskDVgHplL64L8O
         U2Gp0oiUMWSwMDso1aVB+KFeJjxav1ekcmRS/dly6jvNY8poyYyl+ilPLR1J2bpE5ql6
         42kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823638; x=1795428438;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiIzLjcyhaAEDOaVVjH5VECO9F+nQCzI1T/v9+EoYaM=;
        b=MPFbeRnh+IVugQfBgC2jwjf38VVEEyuaex7esYCTTsDR7GcdBtq/ktJl92WRCCpipG
         6NqanMdIuVvoeNTq/FfhU3e+Rcfqdp6KkW51gfcUQkwf3KWR8wE5IziYOdX/EYuGQb4j
         QKhsgHNncV7J5frfspFlLjMd/PSh3mzfVI0KK5gNoXbkv3SlTvSpNTg5Tuzzo5y/Njvj
         XXYSMbK+p//OF90GgVmbrcAdhul92mtNNf471ir3/JNNVR5dreyDvT0fGgme5JDj8fEQ
         gM0jiqze2Da4IH/JhWIKWY3A3eUQwsz86Zr06lYd4bRqmT+VKdjwROGnM+RcXf8QCY98
         NqTA==
X-Forwarded-Encrypted: i=1; AL+hErFBKnFCHD2pvvm8HjcumTQ0WmsuqqajK24dxcYI3smTMuVg3UrocU1IWfKPorXVRPShra+KKk4cl7daqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dtB2YBngnjxVewKVltNIBnUPZIe7aAAh+F0hRXGNxGTKjcz+l
	mpftlNCErY9gQMmiZ7oGOAhYxgpeWamTyF6dvDPIwl8CGDFM/d/1iL9qGLsP/Bp9+1UWPuniWal
	M5Vxn
X-Gm-Gg: AZFdTZdThj7WxV37ptD0S+rtmwukhL96Mb2d+JhXktED3DI3ye2Fo9zcw6UuCwF/pRY
	pgJzt0/0qYsc/vqKpnj66W+YEtjICeYmhdK9vX6bEE2oow4GQ2L4o0HSHx0kETAl5V/GML3kXk4
	Aae4H80EQCh08qy4BIcphfluMXQiqPReT2qHOR1ZnAIU+H5qAZ5u1xwPvttRx/W+MrIxscayyDE
	0k7Rl+HzOuBkY+DIvhhYeiGtFH4jUI/4qGaat2DrIIkdMXOCYqKGV5KpDCpbqByOh2bDr80y4pu
	MSZeSWcraWVxwVzMAqcDommgF9Jw2QHqTz3JbFRHTrp8HhFVyV7KVH+RbZikOPNdRj5P2ip94v1
	kVGagzPWgbXjkTAIYsjyOEJmBasFbv/1Kp8F0JeVtLU/15rYh4LFgTpzVmOpldET13zvntOzJgH
	KzDYcy2lUuwUqEtO5Oxk0L367N3WPRe2Ykdr4SeZQoHSs3sYydjaOrXOOzc1NZIgr6jctMQeRX1
	hmcduz8XMgA6r6b/DYFOnykm4TuRzomSxj7gMePm2zi/WuB6zxZJJRnTK7oeosvBgoEtPODiPC9
	+eo1NtVgcrl5fGRQ1Sd3XlTVLv9c164uQlQ6tQeuKv22fLgj
X-Received: by 2002:a05:6000:220e:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-49c71f334b0mr23205262f8f.54.1794823638011;
        Mon, 16 Nov 2026 02:07:18 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm20589292f8f.15.2026.11.16.02.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:07:17 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
From: Jerome Brunet <jbrunet@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
 <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4>
 <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
 <179478265643.13037.17097457582246933781.b4-reply@b4>
 <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
Date: Mon, 16 Nov 2026 11:07:16 +0100
Message-Id: <179482363653.13037.14387881069650442772.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3779; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QVGLd4p/I26D1hizjjIbLHLqTX6+X9Rw38Hjb1db+Lc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm/rl6Jq3JltrR3vh/VudFFaNI3o0pXtYBD3Gndqz7/9
 /X3cJ3UUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgInkaTEyHH62YF5r5oYiCa3M
 3usG4kKRQmdUd5bdkLsgd5OjnKutj+F/yrwF8c/0Na483OR8dp2c3VxzP8nw7ROqdF7djpi5aVI
 qBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-16 10:43 +0200, Svyatoslav Ryhel wrote:
> пн, 16 лист. 2026 р. о 00:44 Jerome Brunet <jbrunet@baylibre.com> пише:
> >
> > On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > > нд, 15 лист. 2026 р. о 13:03 Jerome Brunet <jbrunet@baylibre.com> пише:
> > > >
> > > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
> > > > > for the correct work of the CSI block. Add CSI pad A and pad B clock gates
> > > > > with PLLD/PLLD2 parents, respectively.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > >
> > > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> > > > > index ec537efac692..08e425365469 100644
> > > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
> > > > >                                            0, 82, periph_clk_enb_refcnt);
> > > > >       clks[TEGRA114_CLK_DSIB] = clk;
> > > > >
> > > > > +     /* csia_pad */
> > > > > +     clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
> > > > > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
> > > > > +     clks[TEGRA114_CLK_CSIA_PAD] = clk;
> > > > > +
> > > > > +     /* csib_pad */
> > > > > +     clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
> > > > > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
> > > > > +     clks[TEGRA114_CLK_CSIB_PAD] = clk;
> > > > > +
> > > >
> > > > Change seems ok in itself, just a couple of things I'd like to check with you.
> > > >
> > > > Seems both the CSI and DSI can use the PLL D and D2. Can they be used concurrently ?
> > > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> > > > DSI counter part does not have ?
> > > >
> > >
> > > CSI pad clocks are used only by CSI and CSI does not change rate of
> > > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > > switched DSI clock parent while csi pad clocks do not touch clock
> > > layout of CSI nor DSI.
> >
> > Ok but they end up possibly using the same PLL from what I can see here.
> >
> > So if the consumer of csiX_pad calls clk_set_rate() on it, while the DSI
> > is using it, it won't go well. The rate of the underlying PLL may change
> > since you have set CLK_SET_RATE_PARENT. Taken alone, there is no problem
> > with this but can't CSI and DSI be active at the same time ?
> >
> 
> The clk_set_rate() call for csi pad and csi cil clocks for dynamic
> adjustments is not possible. These clocks are used only by CSI block
> and among 6 clocks CSI uses it can change clock rate only for its own
> clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
> design and are not touched by any other driver.

This is not my point, and you are not really answering my question AFAICT.

Right now you have 2 CSIs clock each linked to a PLL, with CLK_SET_RATE_PARENT.
So a call to clk_set_rate() may change the PLL rate.

At the same time, I'm seeing 2 DSI clocks linked to the same PLL, without
CLK_SET_RATE_PARENT, so those clock will use the PLL as it is.

The difference in the model used is odd. If it needs to stay that way, it requires
an explanation. If adjustements "are not possible", then why set CLK_SET_RATE_PARENT ?

If the PLL is fixed by design, then you should not set CLK_SET_RATE_PARENT here,
and possibly use assigned-rate to setup the PLL, as designed.

-- 
Jerome


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782661;
	b=oo316+O4pEgtfdqHV01H9rfLNnMxxI5v7Z/2O5L0IfIH0S9i2eD6Pg0Mm1uKhfgkCMT/
	 bMuUEK5BSucH7GUVmRpzGEoKrTwJfLAYapw631fTrAEyJFtEq9B4fRyw94Kf5SnV6xy3h
	 mhrY0n5xomE0kPP/a91mTAofoH3ahKeuWNUXWJv3Tw93WDkUmrDWnD5SWpbYvUf0JGLYf
	 lN3kPye7olDtL6lPmdOA0tJnd2UPSEW6WWNiWHdQLpRrRKUbU4BZFlPkzZWY5/iF095HK
	 dbDLq23bKE6wDkMwSUkD5MSIn7edTlKVC16wVtlGc/LXMA/v8pfdgupXdX1Crv0H37g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NPSmaXP2drwVF8I5eyZGD1a3K2dmfOWrdzBdXuu9fdU=;
	b=HhMQG7KL0Xbjo2x9jy7/e+rxGEJzIU5iHKj/sUt7aR3TnD0+Irp/LkSvVcv19sbaupyR
	 ClxWiDVK0f+cHgPJLorGA+/izi485Sy3w2oX0dwjFkhnmKte1Cq5fnR0wbArqkcUhp4FN
	 6oc/12YLL/6aBRXPMNiLFsA2fWSLoR3DA8AMHbOvxFNhywNSOzVSpPduOL2EdsePm3Xao
	 2IlSv8hJDX3tOEM3j8jvBalMZx74StTk5eNd+0JyIBQqjQ5+EqmnxQcImNc660XhN7Cic
	 IzsltVYgFvM1aKaFikVjTUZEYZAH5P5HKsdKwEAT0nCI/2pVSbXcVnH7S6Qe6ST1vig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dOizlCtO;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA4B606A323
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 22:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA4B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dOizlCtO
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso14835675e9.3
        for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 14:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794782659; x=1795387459; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NPSmaXP2drwVF8I5eyZGD1a3K2dmfOWrdzBdXuu9fdU=;
        b=dOizlCtO8MoaHLoxUAEKLCiSAN8Ai1GP8pQyrqOqYZRbkSgleM8hSVuXKhv0/7KxtG
         Ohu+GMh+DWnsA0FZVD1bc9Ik+IsFqPhz4P459g0Atbsy99Iw6JisTd4atOzuUiw+xXOh
         KANSpMKHT7deYcLtP0SB+FU22w+YTRW5IkGV/IjQ2Ph7sO7J1ghe7klQK6l+tYIyFSvF
         Q5ye7fZBlgL9NI+naXAbKMh4Vg5aNmB84XSF7it3070IfOfAy2N7WN0ufB4a0WmtMNpG
         qaFQ4mwRsn7zJBkjFR9WBxHrLDojVjF9sLo2PPjCYttI7xBrB5YZkss3fJcq8LZ25ccS
         4MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782659; x=1795387459;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPSmaXP2drwVF8I5eyZGD1a3K2dmfOWrdzBdXuu9fdU=;
        b=ryZVdH3taBajKkP66Q6tLTclvgrkgXOj1v6SYo7vXPfciElpVjTb34z6ePoKLHw5rk
         1GDKnNWR4QjKmRMZCZgS0mShx4q2f5PVHrIa9/VMwyOVnIGrF+0kPwD0pFnYuzvstHYj
         MhJUFplaqCwWZIT16dpcvHkWdaPvTvzL3Prz8jif91X6rqfafsEyG+R9Pczsdr9w0XSZ
         koXgrVrno50dNqugR+CIMFSEfs1bjgIWemRw6lbf1zBHnjrvWRD+lBq7WSsCTEpdeKHI
         oF2gyKpkv8E0zznQjf3Ubrupc3P/AV5RXPzBgC4+J0AJJTGvvIuyw1r4BhDe6FQt/2bb
         w/Lw==
X-Forwarded-Encrypted: i=1; AL+hErHiPwl8ZasEY9bLuAnsY2fEafDjkOMbQq7rPonyodkK3nW1Lcci6wmWkg3/xotMaeg/kBi3sVh0cQ0McA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8n/UR5pvrtVmL/q/9JvvHi4cc0zJFQVXd4lUH2eSZMduov4V/8
	u5+VmFMW8hU0mnhLjprvIo2hLgXs6h+E7bE7dMULEhBzUq3SnUdABdQIBqk1J3uNtkA=
X-Gm-Gg: AYBFou1PNzD81mcpmy0iMGVs5LwABNqdKYLg12q5UwkrcZ99C5XZVB5PYbWs2kZrRj2
	164+5/dbSL7cUrWt/qXe7Qlj2tfMDrJJjTWIhga26JGF3P1BiCUyMeaGWdBx9sxsvSeFO0nnDVw
	NI7otC5mDjMHUuZ4hrBUBm9LC/B6dCae2qF9Lf6rlnGELFxhjLWt6RbVuypbePnknyXW87FNJm1
	qAi6ptBqY43bz81aohNQWYxpF4oVyXxiS4uFd3xccvZ5b94hxGODxxWZerZAwsaBwu16bGDNrfR
	mBcbh08D7KHleNuAjkda0PnpRGoSyQrfn9sRLp2NKgUhrIUxYoIJ61gsKGxhpnN5VVjqT03HZdM
	mHc8htOg8BpgABNuQAnsn9PTB4/FvptRNyZDIkiO9k7ApSXr/64kVLz3XqySizQZ/f9MMQtiIZ/
	IkwbVND/ONm5Mt8+nUApdzuxsKTPDPzuYYMEW/6/sWk4wHIhsgQNNrykLeNJ4BPZqmT0nfyBF2k
	SFdJFKrrADeHbf7JIXhlZBiMMkIucdA3TfWx4j0Y8Ph16jV9tBhjHZ14DlwpcfBCY9oItU4g4HS
	EKFckjKBRtf56/dv8WF+e2rCBtSHNG8nRKJgWTaCYdk4mswR
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr58944245e9.0.1794782659130;
        Sun, 15 Nov 2026 14:44:19 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608c5debsm18052182f8f.42.2026.11.15.14.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:44:18 -0800 (PST)
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
In-Reply-To: <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
 <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4>
 <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
Date: Sun, 15 Nov 2026 23:44:16 +0100
Message-Id: <179478265643.13037.17097457582246933781.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2792; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=8JbvwUSZk/LfYCAqvF/b9o5uB/ulf6DsCIJ4d3wM/NM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm/TA+sawm3OCzy6fbtN7PbOM+eSb2h8/nhk+4530tUZ
 8dypTV/7yhlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEjm5g+KdxVPJO361Va5co
 emxyety99+wtq18am+53679Tk+zuXzuFkeF+vJmL9ltTZc3icvNFHXpnX3YZq7vaSUUtPnG3LEJ
 8ARMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> нд, 15 лист. 2026 р. о 13:03 Jerome Brunet <jbrunet@baylibre.com> пише:
> >
> > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
> > > for the correct work of the CSI block. Add CSI pad A and pad B clock gates
> > > with PLLD/PLLD2 parents, respectively.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> > > index ec537efac692..08e425365469 100644
> > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
> > >                                            0, 82, periph_clk_enb_refcnt);
> > >       clks[TEGRA114_CLK_DSIB] = clk;
> > >
> > > +     /* csia_pad */
> > > +     clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
> > > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
> > > +     clks[TEGRA114_CLK_CSIA_PAD] = clk;
> > > +
> > > +     /* csib_pad */
> > > +     clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
> > > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
> > > +     clks[TEGRA114_CLK_CSIB_PAD] = clk;
> > > +
> >
> > Change seems ok in itself, just a couple of things I'd like to check with you.
> >
> > Seems both the CSI and DSI can use the PLL D and D2. Can they be used concurrently ?
> > If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> > DSI counter part does not have ?
> >
> 
> CSI pad clocks are used only by CSI and CSI does not change rate of
> pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> switched DSI clock parent while csi pad clocks do not touch clock
> layout of CSI nor DSI.

Ok but they end up possibly using the same PLL from what I can see here.

So if the consumer of csiX_pad calls clk_set_rate() on it, while the DSI
is using it, it won't go well. The rate of the underlying PLL may change
since you have set CLK_SET_RATE_PARENT. Taken alone, there is no problem
with this but can't CSI and DSI be active at the same time ?

> 
> Same layout is used in Tegra30 and Tegra114 inherits it.
> 
> > Also the DSI get the PLL through a fixed factor 'out0' but not the CSI ? is it something
> > you have checked ? it just seems a little odd.
> >
> 
> Yes, out0 is a fixed div2 of DSI clocks and that is code reflection of
> hardware. CSI pad clocks do not have this setup in the hardware.
>

Ok 

-- 
Jerome


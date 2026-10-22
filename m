Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792691585;
	b=mGJpAVe8Z0xR0ij7hWEPtiWJ4yRVF0BGU+62qqEQSTx541dSJ2l+8+sHGOpJsQpiJkqi
	 hc0Cge3E5WN2EgOeobHgTz5mNH3tmvhYBfZSqFa7hxgQJbwYBHIq5XtvRgziteX9fA9nd
	 wGFJFsxMe2ysWC2NvjB/60mjV7AU38I+BXWuYFFapBpR4GfVnvHU1Npd4kRAeORYiHo+O
	 dip2YlerQo0uC/F8yecUgdzV6JpI1eqybY0uOrxVN+IbmaI7EInPko+zz5BDoiH/n51Pk
	 MOa/lgbNdsWbJ30dGsd6RaTWhciZuZaWnm+YzimtUjE2g5OCMaLFhN7fDQa1uWwaH2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
	b=o/My4Xmmo9mKXRjVs1zETgmNv7e6DdLZQQoQeC17gcAcAz3llyEeq+cuvuPKnbn5BGS8
	 Ww5a0yxPZvqOpygq0TX7ffY3SypwXJ9Ac8jcpHsity46B2/sgvHY4U4D+X7R6aJcjzY7W
	 2BrLRwgSHXwBqb8Ziuk/BNSPNecp0rU5ej4bLrtKZ64V0u/epWurVboe66KXTauPlD97z
	 AHMovbrwYbIgMCfvwohRxBt9GJD97Ojtn0eslbVT1xh0OuLggHLuT84wdU49Ktng/i/0R
	 qXr8OcfW0Pd2MNFfZ6KXDaVJpSb7om2PxGL6Ip6ptXtO1XGTJ09DJ7OIrNDbIwVuAjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdWRFVVR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745FC606A31E
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 17:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 745FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdWRFVVR
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35d0be18c71so1307164eec.1
        for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 10:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792691584; cv=none;
        d=google.com; s=arc-20260327;
        b=BZKSYLux074j186Ix3Tdmq77tzjuBlKLamjVsUa1DR76CzYcNY8N8O76LrV04daG+E
         Ii+P+2ckBYx0Wvufu8teNrdltvXOC5pbxXaE+horlUIp+dZVCs+SjsRLjF5ZPRY09H9z
         LdbkTC9PoOUnDrhYeI6J5W8RV+9ALg3tHtS5NQmLWPaBu79ixjbZ1JHVz9QjrWTZEedu
         Fo5ZrGB6V0cnrDU/wl6It1Wk2406BNUiu2IhcQ0+Ko2RFPXeNkqCL9O2VsJReCQd6gAM
         slB9AtvGJVpn5W55PfB4lQHAaBiYWo44whAbOQUCdMCveSa8Bk458SkT79SIGi8AQhUC
         c+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        fh=pKgTD3AGHD9azUr9qiSK+ueNhx4wHSw1gnhxIqGwchw=;
        b=PzAFXCjXPtDtvxABymX3C/UTx3dCJnZUP1/41SiPro+4czJzIjTEu6IK6FX52GNKgL
         mZRKRy+z7qz3XPRk5bX8sSl49RVCsATnBOtyPXkgQwu4qrXqHFcB5ILZl+XJTly7gBDM
         FCQdSximhqLqSC0K/9aZbV7YpvXaRnuZwYccn3Fk9rO2DHFPawjzZm6xxKu34Mdbt2tq
         ixP92gujJ2rCEyqbB5iR5Kq02HAlOfZAhmXr4CKDZH7JQBGiXsLH9OiPgeiGB3LfmEht
         VU3s5Glgjx9PvR/IewLcPed3o/vKlbFMrXf5rJsYdR6+ChH2S+m9iPH5isf0vqE24EUM
         0kjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792691584; x=1793296384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        b=CdWRFVVRQFA7nUIEbW9/tuJ4GmATopKWcFmos2aLIz3VeptOn8kVZBD1BAB0fOT5ti
         iH2TdABNtqgWFySel6gPxtwrMOUDidEbyaIWboNu3OWXv2xFwD2l65i1ZRPbb81GTRNk
         7cwzieID3NXpEioeJiX2lh15lDBWOycH3jFXVZuBdOZB3BWFLdfINCnxJgob/hpFPx+v
         N8AJMVFlDMH6aMCcHJXW2au0INS95a1s8MAiYvFXIAqnwbNiNQpFd+gzIEONWen23FBv
         NEbhhdP68Wz/JBqcjICoTozj1zQKg8BF3eyJym3D99zB3Wwg6gK7lK2ZZpZsCIDkYJYG
         wliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691584; x=1793296384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        b=pET2PFEPNx2H8olmJbeKbh01QZ9D0Gt3wwzTw3npjPEEFuzF6+4Q5gStXMdY/i+2Ei
         mS/VL/gW9Zg5Tk1IqFwVPp9/x7PpPkl93hEBKnE0pZhgvq0VB3KSnYSsxE3NfXjKWVHz
         jU4tP/gFyxVxdDfDMa64S1NjBj/2tC4DpjqNTAs0HKi2hFCE9SLykbBdgfjjpxse8rzz
         j9LHimOc+wpyExMcOPGybm8POa4lMZu7G+fE8XuwmVwWTDfDbmrBg4jZxtZpUQBTUcnj
         i7yYDS6Gz5lnctzVQd09pdNxBUsj/iFJRSm/G34OKQx4/uKvlYhNiblGQgsFuN7JxS+X
         xGNw==
X-Forwarded-Encrypted: i=1; AKwUvBwoFhk+IbgXApqECyyebK24XDweUsH19B6YQGMM2nK4rjHHxM9wWLyKwK31ILViv8Aq76Q+G7nHhgBAYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJl4KV5rcpzDSsp1tbhYtyV8YlFWgEdfL1m3wIBz5abnTacPIjC
	h9AML0R9EeRtEFSCiNo8GBkm8B+hFna5GYtptptfN+46hy5A/Mw05nufmkgU03QZH5LdHOgetO7
	j9lEech+PdqgPGbkcAQibKhBIexP4D5c=
X-Gm-Gg: AYBFou1OE/LOEveV+t5NSLa45dAwiSIi79g1Gxs0kulOuUX9yZx4wE+ZiZgtXfxOOip
	PFje5JbsoNQtSUvEtpjTMZ0mXYPca6tzCNd8M+cGD4+LfLvyH7N7ZhVFBb7usoqJRDAWEnwPbbq
	7CVTHoBNydHgYqlR++/1/pSQUXisr52Y3qC+ozKOA0g1nAJorVdsyBTw+gcLf44/T9N8hznhaO4
	RGV3196lKkFLXQ5v8Kbfv4TsFwcwWDJxcj8kbzt4va+BROZe74S+zmDh/wnd5a8MGRLNFQpwFUi
	lsHBcffd/xg4q/2RXq2fIjrlxFsfNHdpFCfqOYH4R9vIfmUc1/YBdC3+QM9frOH8+lcT8SJhQLL
	hNrTNzF6fjc3ynn7V6rSg3VSeOarpZo8Rh+VWoU62y2xgM58bcCjcuNoB3J01NNw6OcJ2EkU=
X-Received: by 2002:a05:7023:d08:b0:190:716:4822 with SMTP id
 a92af1059eb24-19599bd3be6mr253220c88.8.1792691584483; Thu, 22 Oct 2026
 10:53:04 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015130628.184279-1-clamor95@gmail.com> <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
In-Reply-To: <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 22 Oct 2026 20:52:52 +0300
X-Gm-Features: AclHuK804zMlj-QH-mnS-Z0lN9YQ0e8iLQ84s-klji9qX-wEVgx75tAGWTn5j64
Message-ID: <CAPVz0n3goYTds2oVExJUwNcOr4kHAHUntCt0yHMueOnJ3GxCGQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate
 all codec support into a single schema
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:0=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 15, 2026 at 04:06:27PM +0300, Svyatoslav Ryhel wrote:
> > The number of codecs supported by the NVIDIA Tegra audio complex is
> > increasing, which leads to an increasing number of bindings with minima=
l
> > changes. The main differences between codecs are the compatible strings
> > and possible pin configurations. With the introduction of auxiliary
> > devices, a definitive description of possible pin configurations become=
s
> > nearly impossible.
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.

Hello Mark!

Just FYI, this commit should be applicable to the current next since
it was made on top of the recently merged Tegra ASoC schema for
wm8994.

Best regards,
Svyatoslav R.

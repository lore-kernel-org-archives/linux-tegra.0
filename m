Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792956100;
	b=a+uj1bFKQzIv4QqF1VfUnG9VLiSij7oCVGwPI0FqlDAydT6uOQiD/ixOOOuWf2LMd0Zm
	 Xl66oKYjhcRaypE1/p8doJguJanfeGsmi4vCrh9rRu85N+VfiGlnAzZt1MqVudKXpsQx0
	 FaDmF6McOSRkSGzDnvmGdRDOEqtwfAyv9yfdAQwqxNHmJ6FcgWMaOMls+pvgwr0GrR4ut
	 L/XXQ/HrI2r1Hue8hcqrbFbPP9/nUgzEFBP8FcCNH7zOVL0Xo2uw2yjLYonZFnPbA7jLR
	 Z7lqngQWezWgEZkTF6ua+wxCFiytbEpNyFgXBmTBufp1FpQZPCwg4GhYw2q3kHLgEqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
	b=X/BjwQ5eM3OsBSVAsFFT3nWKJHTesGCFvpNPwlQFueKn7FXB+yIkxUhj5yMf2LO9Bjte
	 1yrY62Z+58ZpssH2I6P6F4Ww5n7iPDEJYA9723hqHkhex+2EAH+uz0W7S5m2UYa91wbvM
	 B8mQcXP4tp+ns6xUKqgBWb0/6QdE9IFxdo77YjLxcL86lGev44dDuGgAymfclU76xRW2g
	 6g2H9xf6rSQyMofav52ye9COMpXx3u0sKEAPIu51ucX0jjqO/Eu9L6I9jOiXxx3iN0nfA
	 YbCnR7Fs9xZChrhxhJF9s+VkjJ4snvoZN9yfW/ImmeA/JVhOZ75HvXEpR4Snj4y1AlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M3KUq8wh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A960A2610
	for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2026 19:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82A960A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M3KUq8wh
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3930401eec.0
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2026 12:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792956099; cv=none;
        d=google.com; s=arc-20260327;
        b=MLQUC2T7c3AwARG43tx2el03ZkghV0ahLrF755s+dHjCMz9ZugwTInZHj01r3ixFQ6
         fnQlI2rxhpFp7qXHf2NCck3Dt3U5kpOPwkEeGL4nhTr20ZmnjiESXDYIaAgOZdyMIBSa
         Px/3wAHD/H/B87kwW/bQRZyGvNKPAWDcBTvg5xwiA+M4Sior5NOwd6n8aS2tqiJ9eETA
         1WqdWpFWMBTa/BEqpzK6EN7Q8tlEfwqvIxJoRWgX4Y1cOOEWMAEDJ3wHPqgocTyqOQ7N
         EPTD8xgM2zc7rAiHKabgSKuKSkVZv+1zYUZdrWcxqz3utIMWHkGvW/xKfIwtxJU33eZA
         iMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
        fh=CZS33Tz017O8Wx6KFDRBP2cXitGs44RIQvkmK8P3ZCY=;
        b=AckloyK+i7B5zLYcAeJQRJDOh/bxKSGY9zS9jlURlCqn2Xil7lZ3VlgSoN8jWMx2/T
         eHQTix/9CejIKMa1wksqzlwrS/JwZ9S/LpUmdsk6nIAmNsP6ABZSCkCscEPEcV19yEpf
         JPK6efuYaapAqoX+575QhDBXtl4/OXgwIeu/7ZwvhSxln1NCb0cNI4ChQeLY62v+tap9
         mKb2uNO0YGF5D9LdojCfEhBineb4lIViRdOsN+KViQKxVtBltbSlPFlp/RUSkk4JXU0h
         2xXjpo31k/WvZCUQVeNFW2Vot8j0ylB3wtakSIUS51jcFTv4An/cj6LX8EtE1cXDE3Jy
         bXeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792956099; x=1793560899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
        b=M3KUq8whaTsLJ6plVgkBsYp7Udx+ghUM+jFVw6R5idi4BXD5awRFMvFS+EglrAC6Jz
         559v5cbuPq/LvGTLvAo9XzWo4w16yiYx8BS/OU8BwS5LJ7U1spf8EP3frSZaB8JLLUpb
         z+n/YLecOuCouGUToF4uSikzuQAKwJeNb7UpGhtwNBfpt2mwbj83uNgF5w6qL64LNS2j
         xYCC+OneYqgSmBqSx1QEUyFHHUw0g4iikHrQBKZsf0UGY/oxH4hkzLTmJ+agS0oKxTEV
         r7oB15D/4w4DILHo1m6pFZJDudN0kq5mKOvy97I0Ta2Z+IY/QaoxpD4acg1Ms5PGlruI
         VWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792956099; x=1793560899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
        b=PpSVROkIuQL7la3JDrLagQs79esAGlpwJowQbrR80dOSFuPF3JGddXptCoUopf/u/T
         PI/mL8OhjGKR4Quh6ZucrMuhq1BsYTmo01gkB/wEnCjUHbliaksymo6rUddh7w3diCax
         6uUHLlYouLVgIx5p1TeX76F3J3uwriPx98T8c80WTIJjrzUiuVWNnCEDvUMjPfB0QilO
         AFvV8HjwqF3ZdMM/C91CZdjwO7xEpi5rz04HbuUqe/eSXvUgfPglL8nc4iHQXQg6JOwl
         7Wuex7pPHmDQEUsHoZUcgwP0FZbUXX8hnYYKpKxlJuxCDLedQ++QqyMrYEBVkKLWf5YN
         0zyw==
X-Forwarded-Encrypted: i=1; AKwUvBzVIZwSIiPTqyC0pz2wRrz0OB3Fglilnur1huqPJQg1mqt9ZpQz4ahknPFD44Ar11ebynYyJmOoVFxQew==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0fNsKEhAcfTlL4ZhBAte9oixkBX03/tH0tl6LxqYx/t3ZgKSf
	EViWpz0p6cjU5hxT1COtgQ7HvE3m2JWE23+HDKQBy6zdmrU0LbacIwWrwmwV5wEF9gbHStVuoYu
	ZWsJ204wJkLp/H1XP/KAeYS98Y55CWkI=
X-Gm-Gg: AYBFou26/XmrPIM5R7S4/Y7cyTHhW6H0QnuYcL94KPkxMasCnQJ52vH7LbVTHX4/ul1
	K7VbKvgztRAvXfnFxUtNIjmOhIqHpIM/wt0F8IYlajvBdcBHW3oTRNXTR26qA+K3zZLAedVJuEd
	GDckFBlx3yQt5jggjT3u6vrHAh2Yet4R8Uo2tzRCs7my51bDFCEF642M5LOWfathnNZBwdUTy5Y
	9xlWJ4uOK4/TWAkOld/wzdpFXuZLJH7K0VSUxsz53OKXd83twJs0onTXL7tMwBIopVsXOcgvhLj
	7sbaHuMOA6KlS2y26lDyyUoL2EuhWQRgWdyBw/16jdetPRzFJvIRIChat6UKm0b87iKZGfiUyyn
	og6f5JiQQv/tjSXgXdEcgd1I3IGY8bPoqdXdBxUr6jqFDfkY3Vy+PerW3VAqd2MBxRq2j+8j7SM
	2pae+eq10EJPa5oTU=
X-Received: by 2002:a05:7300:84:b0:35d:eb9c:fce with SMTP id
 5a478bee46e88-369e84afdb2mr8666043eec.25.1792956098996; Sun, 25 Oct 2026
 12:21:38 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
 <258d0c04-fbf9-4de4-b009-8feff88dc69d@tsv-stahl-riesa.de>
In-Reply-To: <258d0c04-fbf9-4de4-b009-8feff88dc69d@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 25 Oct 2026 21:21:27 +0200
X-Gm-Features: AclHuK-Zu-La3MBSX4NrGbqHTCl63lbPGopl2QWUuujCrh98e0xucb-_xaWX1wM
Message-ID: <CAPVz0n2QpNfTfubqvZ2i9B_Z_gug4oKSmD0YMJ7Riymdh+guYg@mail.gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix Tegra114 MIPI calibration clock parent
To: Mikko Perttunen <mperttunen@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Patrick Fischer <admin@tsv-stahl-riesa.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:5=
7 Patrick Fischer <admin@tsv-stahl-riesa.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 02:18:34PM +0900, Mikko Perttunen wrote:
> > Register the gate with pll_p_out3 as its parent. Also drop
> > CLK_SET_RATE_PARENT at the same time: the parent canonically runs at
> > 72 MHz so we shouldn't change the rate.
>
> I ran into the same problem on a Tegra Note 7 (P1640) and ended up with
> the identical change. Before it, every DSI enable logged
>
>   tegra-dsi 54300000.dsi: MIPI calibration failed: -110
>
> and enabling PLL_P_OUT3 by hand made it go away. With this patch there
> is no timeout at boot or across DPMS off/on cycles.
>
> Tested-by: Patrick Fischer <admin@tsv-stahl-riesa.de> # Tegra Note 7 (P16=
40)
>
> While testing I also found that tegra114_mipi_power_down() never drops
> the clock enable it takes, so with this patch PLL_P_OUT3 stays on after
> the first DPMS off. I sent a fix for that:
>
> https://lore.kernel.org/all/20261025-upstream-host1x-mipi-clk-v1-1-6bc6e7=
55b4cb@tsv-stahl-riesa.de/
>
> Thanks,
> Patrick

Thank you for cc-ing me Patrick.

Hello Mikko!
I have observed calibration fail on my Tegra114 devices and your patch
fixes it. Thank you!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T

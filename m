Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3363D47BE
	for <linux-tegra@vger.kernel.org>; Thu, 19 Mar 2026 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926836; cv=none; b=Th2SohmqPZf1R2wemH5hjyge7UMneKMs0EKZQ33M88pmZs5lFwlS/K3vE1okV3EYZScJDr2p+7/hbLAO57kqqj30DLlNA9fDKlBTpoucepUVDtgwS4wEQgj6B9yXooPfAzaSrGNx5/iQrFjaWiJw3YEXiP13yZeFgibiZtkSDWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926836; c=relaxed/simple;
	bh=YfjvxjLB0GDlAsgJZKyuoB2YbldYRAw8xucc6F4mKNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tp4J5C3dCeA62Y8NYjnyWJEcCz90K6q1PPlv12yQlAnuheCsfdWn3f8eeKCBGTj2xJrFgf8sV9bxTGfEsR6CQto8qvgPOggjB+YqYMEXvvzOtREWrhzVAgLpD22a4bBJd7pWYmPjiap/yFEtbI+0H/A5aMGPk1AZAd6wCtfmmzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EndLn3Tj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EndLn3Tj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1FCC2BCB1
	for <linux-tegra@vger.kernel.org>; Thu, 19 Mar 2026 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773926836;
	bh=YfjvxjLB0GDlAsgJZKyuoB2YbldYRAw8xucc6F4mKNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EndLn3TjYxItpnM74orXJnojc3o16fSSZrpnTo2FGTS/pb1dTAD44kdIHWSSrQy6q
	 0pRaE/gWw09PIJi+DzeSs7aTECpYAZmNKdOCPFV3B4rly5MWTNPWVvn0gxDZ7h0Scc
	 UzqFfvCzRlbonr1JrCRSKBUoYiS3E9OB0/kbii408MVhK2eBxqBtDEM9H7vMChBw5c
	 MKaLf/IvUe04djd+1Z2B0fI374ZIJDt88+Ss3VDmiFNv7uJndkbpxw3zrcUws2aJdt
	 ffGi3uXgZUZCtsmN49v3p5924be2KL3PVIFvqu7dXvkWz5ct+y1hhp7QbKVAZY8kh4
	 +/ckCYguNrxdQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79827d28fc4so8964197b3.1
        for <linux-tegra@vger.kernel.org>; Thu, 19 Mar 2026 06:27:16 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzz2vd8bDK1sk4NDmXgLGZbgWM/2pyg+ZPab0OjiPzzc+lq4l2F
	k1CHeCNDrTYwkENDebpzdnX94HnK61JOHB/kETTkivXyymmE4pyPsBrCKMIX8UzX+5//8Ctzc5P
	pSoM96vxNL9ZPOWaG0ESgAijx74XWNVk=
X-Received: by 2002:a05:690c:9a0f:b0:79a:4419:71bb with SMTP id
 00721157ae682-79a718c829emr73772697b3.21.1773926835305; Thu, 19 Mar 2026
 06:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315231000.50543-1-rosenp@gmail.com>
In-Reply-To: <20260315231000.50543-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:27:04 +0100
X-Gmail-Original-Message-ID: <CAD++jL=uPnttN80_Vp_EGwnYHoXwfNRXqx2cEsZKXak6aAmM6Q@mail.gmail.com>
X-Gm-Features: AaiRm50SrUjQzHzOxgNl5nRwKxauP4cULXsxT32vKBDjjefg-F-8SL3OKL1Ohx4
Message-ID: <CAD++jL=uPnttN80_Vp_EGwnYHoXwfNRXqx2cEsZKXak6aAmM6Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: use flexible array member for array
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 12:10=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:

> Simplifies allocation slightly by removing a kcalloc call and using
> struct_size.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Since it's my own subsystem I could just introduce the __counted_by()
and extra variable when applying, so not gonna complain about that
this time.

Patch applied w/mods!

Yours,
Linus Walleij

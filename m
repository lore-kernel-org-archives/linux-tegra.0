Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF8749365E
	for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2026 10:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369687; cv=none; b=TbL0vMo5lAXSD9lUvwCEMfjVVIzn74x5kRG+dwhqErBchK2Rju4rngK+OHrKvqa9DeiA8jkMpfx+cxrCAF3K4Yego661Ps0W/GbOr92T2N++FgAoJ2OQ7P9iTTucfyhhYH4cm0SJXgwt+4eutsosel+yIcL6WtvGDfOAiHfsDu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369687; c=relaxed/simple;
	bh=3oMHpMKhoLQpfSFlB3aZJUBRXv00LSeXZK7ZOAuEHfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3n+w0yd1U2419k8owVnq8LBERLFs4V9JADnrhrizk9HofCKAfOWsgnJQIkAJSq2F1oCGiWLyKTTbhEj7fJhgnx4P01XHRtX1hPAOQISmU1KvrqSgJafuzDPhAnjAGyAG4mdEngLmgJMX6uDUja+x8JcQOPXK8TaR9k7fdi6/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieL86LGL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieL86LGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC371F008A2
	for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2026 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369653;
	bh=3oMHpMKhoLQpfSFlB3aZJUBRXv00LSeXZK7ZOAuEHfo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ieL86LGLtBk0DR+yFpYgHqkMdE+QcwfgKPCCG93zVD7XE6FO342jKMBZvEZPw5F3g
	 UEYUglVtQTO+lKWfViWX2Gevgb5nw9k6mGHtBO2kslbtcLj+Zg4ncRSfUpcRwO9CR4
	 kMwMm3dMQtSMGVh/mlo4WeuCsJfuqMkrn5Krr34fIXjSW1U35FGc1SVhd+WZ3HHjG6
	 jfLXT7KlwlvB9+PtNrr6reoemsIeWXoixZPrpCycY8LECbyK2y8H8E0iRkxqd05UZw
	 rkpacFTkErwYf8pKqGk4pQ8SdLkLor9BJnF6YRSgckuEWJinrC2mnCNAk9IyZJZHZM
	 /jmRrKdSjVLPw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a87e23860cso18934251fa.0
        for <linux-tegra@vger.kernel.org>; Wed, 07 Oct 2026 03:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuimXbEoF++n+Kc822Di6/HsdksJpFy/NLX0eW6oreZ985LZU1gi6Q4zj6VznTOlQsjp2kngwfaZUf1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIkckpYKikxbMKrqwazl6y9GPh3dqxadz5nhnwDVR1Y9xOqioFY
	o1qWnomWHQrWzTSvbYXhBQ4jB9+0VLTO2vVA+WmIGrvZwYEL2i6pfbSWs86xq8w7gCRecTDpmsu
	l60tsyblSyVcX4pfouwC8Ii7lhXZ9IPk=
X-Received: by 2002:a05:651c:345c:b0:3a8:7caa:cd4b with SMTP id
 38308e7fff4ca-3a9a2cdf5abmr3364011fa.7.1791369652676; Wed, 07 Oct 2026
 03:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004192921.2460405-1-praagarwal@nvidia.com>
In-Reply-To: <20261004192921.2460405-1-praagarwal@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:40:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLnqchXhjy_dyjiWRLPC_jtAUd1XLFWHWeyspnjS9yhv8w@mail.gmail.com>
X-Gm-Features: AclHuK8d2cs3SCmdYkC6N9ZbVMyzRLZiErqItqUs4RH_74jKkII334w_rIwe70U
Message-ID: <CAD++jLnqchXhjy_dyjiWRLPC_jtAUd1XLFWHWeyspnjS9yhv8w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add Tegra268 pinmux support
To: Prateek Agarwal <praagarwal@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prateek,

thanks for your patch!

On Sun, Oct 4, 2026 at 9:29=E2=80=AFPM Prateek Agarwal <praagarwal@nvidia.c=
om> wrote:

> This series adds pinctrl support for the three pin controllers (MAIN, UPH=
Y
> and AON) found on Tegra268. The pin, function and pin group data is
> self-contained in the new driver.

The Sashiko remarks on patch 3 seem pretty serious, can you look into
it and address it, or argue why they are not a problem.

Yours,
Linus Walleij

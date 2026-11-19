Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795099902;
	b=czw9m++Ek7hROCoTAhcawSQcYmFOF1zBfNW/PmCl+mCm/wSmy95+/RszTDKowZFXYXCH
	 HFzE18zQdUJbwW2ylo+H/m8oi/swmK5o8m9kPpsVrik/LjlGQCQQTAzBG6XOIa8GZhG82
	 sbyFqBlkZu608iWbiUELxVGDZmDHMBc47Q7n/C7kxLBUdNa6BErgFnHf2Zb6l3pxXMj0+
	 A1zq36wtECJKyKuIccu0TYEwCRpeXssOkcemFbiLeg6ySV2VnHrNV4sg/eWjLUxKjqsF3
	 aT6KRhdW8HdOwdp+rey/AHc4vCvH/wyEzIyjTB9Hkx/Grz/VX670Jk78rudysQ5PsbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rVz62QW1HjQ4+uCtzasNNB/vluTYkgnjHw0Yp9wwc8Q=;
	b=ENFqGEb5mZcs8ZGvU0Rxqi8Cw1yq3RtDLgSai5SUEzgsO7BqBhSEI+NcgUhIn4K11++P
	 EKh2Jvv8pfpy0n5T7oZZVz71BUVgf5vtChf14YzsOCU+bYzYLJKC35Mr5b7mS55HQpQHb
	 Wfr68yIB3t9UFYrv+zaVP+WHW60NRt8ubVNvcgugHCnhmK30E60GN8SBmQhv0ljiyhiN+
	 HbYiLmKYzyiznvdRpR7QDGBzJx4li8Aun6HJYdpVC112dgoPD/fb8FmwZFW4lS+ipunSb
	 iv1P6qhVM1QIdLXmXUIfUOr0bvZm+yZYf5pGEy2WHb8vFYpoix6yxjJqD9wzJWQhvMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dWwy3UQV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B048606A830
	for <linux-tegra@vger.kernel.org>; Thu, 19 Nov 2026 14:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B048606A830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dWwy3UQV
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38318d69173so3273769eec.0
        for <linux-tegra@vger.kernel.org>; Thu, 19 Nov 2026 06:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795099902; cv=none;
        d=google.com; s=arc-20260327;
        b=a1WSHvjDN/NS8MiiKv+tr1oOVeu3ec4TmGHhdiwyLhlxu84d82WhP+aWoFPC+lPB2d
         RlcoFYKL7jY9D1AAaJdW068x0nbgaVhy1QysyF7JvS08XFMpIAgOsYFXLe02cmNHDPhr
         5ynsF5nHMDlbiJyf1YKKFVpskBjlVMtn1NzPTTwdw+2WFKLnyoJXb8EBplPLZqcsH83d
         wvMOmSSGKyUETWWCqJbSEFiYEhri8S5wuDLPIUdrT6J8WjvkrLRl2T+mc5I7hyb2kjkQ
         LOwkSOgkVD/P92Oiq+vcNhRI4D+g6T1SP2SRAauRxo+amswPtu2sRcM+XN0NJlheNFWI
         Z4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVz62QW1HjQ4+uCtzasNNB/vluTYkgnjHw0Yp9wwc8Q=;
        fh=a6nlInSbXW826HCpHRtiVKMbxIX7kZZKE7YOmYI4XX4=;
        b=fP9ZyN0z8fLtr0gejNnSnSMUOeTAIpzyDbsJjNcaVysfLKRaXKSjnaS28XY2NwO6BT
         j2IpIL8wDONdS/JVJDHSoz4mcwefnEaddHpGgs1EL53sKOdCimDLs+Csu62WFDcdEoPl
         H0AZ+GBS64UOUdK+HOGsi7XS8BSxZLZOtdMVfI4Wo4KjPrX4oAzZ9u9YBpfG/AGfQOp3
         guiLWUCQJVZLaVe20OmmuT/FzjrbrFK7Z/KWDztc62KSZH41zM+Ysehu+x2OQR5qL0Di
         S41E6Zop8gxbEMozpJ7eZtT3/GJliS353uQ4d9H876gSSDXs3BVANwvGrWFllMh1RAxl
         WvRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099902; x=1795704702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVz62QW1HjQ4+uCtzasNNB/vluTYkgnjHw0Yp9wwc8Q=;
        b=dWwy3UQVVYQLiKDxkA3dgZkZebW32MqoCRtNCPSE9MpO7t7SCUIadQkRZJTN5a8w+V
         3+jB8/+GgdxSwPRLbMBhkMYZd+rZkYs/iaE4Vz9TPjtcDog5e+Pg1NWQZ9MRwGFq0e5w
         LzUZo90zMzoehE3eCLRA1ydOP5xUVZi3O9Y3OY+QKVU2moQ85xP9bsKJk27hvttgM9dT
         fwQe4YuYdrDTdwhpNG1TWYVeXvWAcgtl/oYi1d9P+TUGslnhSuGhgpfPhtggZ4SvwyLs
         osmrQ9/r+uYHVq6YAjvvC0hCJnG0WTpZnwR1CMffZO2NWqJPT7p9zd4sHKLVr+PL9l/g
         jfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099902; x=1795704702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVz62QW1HjQ4+uCtzasNNB/vluTYkgnjHw0Yp9wwc8Q=;
        b=IC9C2xtOJ6pEptePkyNhvZfLnzKnwGp1dmRyRdYwX3VXX2bjQlnQqQ1EKt+cygeuG8
         4kL9PuQpw8bOTFJBY3FKupWxhquk3OugzIfth7r172Q7A8HN4/SKVW6i6ZGDXfRmTldQ
         vt6SS3Hq7FvVxkSO84MSw8S+HIZqKj0us3J0f4xe18VN5uTwJs+g8+h4Q5rBYEsQoubq
         1W1o0KYrECJVLKPVkG0/CJKeHUatc3qGtixoLlGnpi3d8u5oJPt5CT07VI53Rs0y96uQ
         sV3Dp/kJxF1AhCj1ZyZPm6D9DDZzMv9CYhsqjOBE0fNxNAsvLw+o3CP1wAsMVd+E5Rnl
         r+/A==
X-Forwarded-Encrypted: i=1; AL+hErH3bpo854M09HnkQEdHnRVRy/VT6mMYAg/AdQypUjAldjhF0eNeDdL+/yTOJUeHXDmXJa8GXzAYYZqnVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9CN3Zu2KoSmqVTfXpBlRL4zz1mrEtuuwCFC8iECQg2sG7swCSK
	x2SxEEeAfaiiJoFsd4z2BMhZ5Rl+hYDHgDUfyQD3ptZJ5F7gm116Ku4DhiZxpAGRq0KqzQF4A6Y
	6IW23k3oiBDg6xOD7RyWZwf95VEM0SJo=
X-Gm-Gg: AZFdTZfvIaKonKdPiZNeucYKaHMNnbm9NmOSd3Y5nfIW7QtIr1XsjcMwqaUjM0EFvl5
	lx1m0PYx6xgnDko56g4LOcJehT20o3zzwZugr/8zUe5hSx539MvN9wvaGvSOo4cBlxCbeyltkQJ
	lTznUvSFIj+U3DAHL7UwTFak2i2mxAbVtlBK73NupO91ZOmCo/SBy6c2w1jOx/Xx4zFkJHxRUQp
	rqvm+hIs0H2LLHsf18+Asj+fbI9WYzU2eDSdfDchPMoYDdMoOLZiqOFMf9LnjFgUiFnMOOFI68T
	j0Iu0pPahcbyY2nkn0SNQ7F4kbC71+99aTtkaxzAJdPq8ncUFauv0ppDOFF2CuXHn9NU7wLMtt5
	gIqZtPqcg1lCXR/5D/VV1F0pfCu3h9u9LFl6N4B036zJJsPcDVKEQ8t72GN344VYJGsy8ETc7ve
	mdTns3+fOJDIftxxVGn7SKxysmDd6vwA==
X-Received: by 2002:a05:693c:8803:20b0:384:b001:4350 with SMTP id
 5a478bee46e88-384b00145cdmr1285277eec.24.1795099901356; Thu, 19 Nov 2026
 06:51:41 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795095742.git.geert+renesas@glider.be>
In-Reply-To: <cover.1795095742.git.geert+renesas@glider.be>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 19 Nov 2026 16:51:30 +0200
X-Gm-Features: Aa3M54oSpPPjIjBXKWbeu_LdZEGptwUS0dUMO0QTPqvZvvRh2xuuU1prMieCCXc
Message-ID: <CAPVz0n1+qXrO5P+rOBKOSOE86+WcmjNF0taWDZoWqerKrjVgJQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve MFD_ASUS_TRANSFORMER_EC dependencies
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 19 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:5=
2 Geert Uytterhoeven <geert+renesas@glider.be> =D0=BF=D0=B8=D1=88=D0=B5:
>
>         Hi all,
>
> This patch series improves dependencies for the MFD_ASUS_TRANSFORMER_EC
> MFD driver and its various subdrivers:
>   - The first patch adds a missing dependency for the MFD driver,
>   - The other patches enable compile-testing for the input, serio, and
>     battery subdrivers.
>
> Note that compile-testing cannot be enabled for the LED and charger
> subdrivers, as they have a hard dependency on the MFD driver.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (4):
>   mfd: MFD_ASUS_TRANSFORMER_EC should depend on ARCH_TEGRA

Though this EC is designed for Tegra based devices, it does not have
any Tegra specific parts. It can be used by any other SoC.

>   input: keyboard: Enable compile-testing for
>     KEYBOARD_ASUS_TRANSFORMER_EC
>   input: serio: Enable compile-testing for SERIO_ASUS_TRANSFORMER_EC
>   power: supply: Enable compile-testing for BATTERY_ASUS_TRANSFORMER_EC
>
>  drivers/input/keyboard/Kconfig | 2 +-
>  drivers/input/serio/Kconfig    | 2 +-
>  drivers/mfd/Kconfig            | 1 +
>  drivers/power/supply/Kconfig   | 2 +-
>  4 files changed, 4 insertions(+), 3 deletions(-)
>
> --
> 2.43.0
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds

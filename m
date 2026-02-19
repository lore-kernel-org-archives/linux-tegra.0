Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387B34107C
	for <linux-tegra@vger.kernel.org>; Thu, 19 Feb 2026 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771523200; cv=none; b=hdK9f0Be11ZGBEZtxSNNnOupNXK8Y28sPt/fkLGPgVY8OLe4+cR7F6NnZyDKOP9MhkVWNvRLgn9HDz+zpWsFi5WIyMPNh7G7AZtYm7RlNIEhzgXupczpI0V8CMh/SlUU+IWSRVS1WP4gdZAhjJJF8G32JI85FCLEUIzuNccD6VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771523200; c=relaxed/simple;
	bh=bEt+rV/VqBPD8HBT63k2KfFNDvbW36w+6DShtPFW7yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qy704kMqs+tTFq6CNPhMgM6Unl73aFkR+wRrV05qy1oiHuZQC3OPeBbpAA/rIihW2ODbNWx/JvUYeVNnON89wcAd5LMJopn7mfRfzEdGcv8S/w9uuwFcAreY1g0c2D95xS0lgWCo2sdTLIxbkn3RXrzcx4KpjGlcbQ4aiUf2Hh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaRlwAaA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaRlwAaA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4F6C4AF0C
	for <linux-tegra@vger.kernel.org>; Thu, 19 Feb 2026 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771523200;
	bh=bEt+rV/VqBPD8HBT63k2KfFNDvbW36w+6DShtPFW7yg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kaRlwAaA0wwb719iLtJ0v/ZmWcE4QbWFcMGrU/WADo82mMM2OLxH6XssCugxJEZXT
	 SGFX/6cLTXPOgkBXCfwhDHiI/ffpHjgmbW++b3XQvX7pcUYva8e5gpKLdtN52HvazW
	 v7gEiNN2EeKXsgprvwRbc4ZKnCKGCvGqfBoR7wkSUofQ90I22LQhVk1px6tNBfpuBh
	 tHIokH0HYHhwvtj3pvLe9o+39MGNGQxGCtRapWyGyTIna7Cd7kmLF/li2dcsUMtrBQ
	 0MilShOZSJhvni6J+N/KHMcE7zw03w25FCDs6qpHbcpwZrgLfwNQYURp3eigGthHkN
	 S+qvFxE0A1h9w==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79088484065so11284967b3.1
        for <linux-tegra@vger.kernel.org>; Thu, 19 Feb 2026 09:46:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZ7LHTFeqjG+OMw9ZZx4fgkIpMIi+itsQH7FDnA2rnxi9O7E8MKB/QqYSEBNZoiQV5vVgMrg3kqniVQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT2iOOG7H/TYbLsV4MmgyZY9CRnxLshzNV30PssoKW1y9U6QQK
	LUv8dnza1BPEcl5JYRkjJKA7En4HHUMG9dzhEvJDUkiPhCe566/Kd4TPbbM2R2UnSHsp94KaAU0
	fKtHxgd4NpAVhMiTT9AhHBl1izUYBD10=
X-Received: by 2002:a05:690c:4c01:b0:795:28b6:e3e3 with SMTP id
 00721157ae682-797f71e8683mr50043137b3.22.1771523199942; Thu, 19 Feb 2026
 09:46:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:46:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLmya-Ti=6QizctfDXgrJN-7X-vvEo81JeJgw67HO=q4+w@mail.gmail.com>
X-Gm-Features: AaiRm50yzujcUw5_2MMotXUmHWFgY-mI9O6itNPoCdO0GZal3r7WKmHY0BJYOss
Message-ID: <CAD++jLmya-Ti=6QizctfDXgrJN-7X-vvEo81JeJgw67HO=q4+w@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 10:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Krzysztof Kozlowski (3):
>       soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for Nvidia Tegra
>       ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC
>       arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

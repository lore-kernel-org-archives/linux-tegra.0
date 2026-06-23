Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C73803CF
	for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2026 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223376; cv=none; b=TJnUhOM6KYHAwvE4gbX6ns4nvMqHSIoUg2eeHK0az8KUyc/nhav3ZGzZchmqpjJqAqUrkrk2I8uh/htWGVg11JWvU+nDHv5H1plao+OHf/TDqTyttuIjHb2bwANxHDAB6fPBMphuC0FUORlPPh6VV301tWKwzG74ZyIoJfWr5W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223376; c=relaxed/simple;
	bh=jh+uEuTwkH3T/NSqPTTmd+f9/dlDEQ6DOmOfFVq2m1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXu6QeR1satGBMmh1fNbE+YVZWrCDtZG1Q9YtibqD8K0kKE/zIY3C7JsW0xj875wsZMab9+tqxl/XnUlKFpSoNxcw6girU/cXS81VHGEYro0OrpOeDrOBtwvgQHhP7hC51OrBT89luK+NP47YsuzIwf2gwDETHCk2RSOSg4BOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeKDgpca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeKDgpca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB221F00ACA
	for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2026 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782223372;
	bh=1gJqQGyMHBR85BVsKfivTVP/l6UvFz79Emx0q7bw7R8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CeKDgpcaWy8GnBxz8C/3kDDRctthG4xFG0iAzgOejG7LM7TjaxVDiGHKX99//jBlP
	 Sxk7K5tlH2fzz4h2k2TrGPAVc55LD+pSgbE4QyT984yKvehjaHyCDSl+1u3Vsz7y04
	 tw56RpbPWkAZuKtsTJK+7wQFuwGRlV3uVcqRfj1+byRN/owfaKVXds4u1IahiO82zQ
	 QAV4y3DF8uk7FxLdF04i9wFBc7DYYMM689U3oal7/BvYGrmkNwoK2MGs6w9fMoYykL
	 YdaC/HX+OmPUjia3AH6Pc71Cib5RZisiD6CKJByiq96R/kOH2RvdAgveoOkCzRaS0k
	 4vnPXGShSRkaw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so3978162a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2026 07:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/0/ATCPGYcGuKjb9ZMhXYV5AS/KNxP3yvnDWaQhkerIyqVoMQBZdYJbW99fFEpLMIHy94/mhBu8FN32w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5gHx/l/Awhgx2kM7OJd+mgXfREHjnb4qwx8FxcpK2JNBWP1yZ
	wD4VHvnP78lMObOLUEmfJSbkTjvieuQvSKa7g1rMtxOMvbHmS4sf5gLgwDgjDjzYTbTGgWtPeBV
	rMsJiFkJ+7ZKSTOZwK8WnS5zBSxn4eQ==
X-Received: by 2002:a17:907:980a:b0:bd4:6c96:f87b with SMTP id
 a640c23a62f3a-c097c6c1a5bmr1194059466b.28.1782223370908; Tue, 23 Jun 2026
 07:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331102303.33181-1-akhilrajeev@nvidia.com> <20260331102303.33181-3-akhilrajeev@nvidia.com>
In-Reply-To: <20260331102303.33181-3-akhilrajeev@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 23 Jun 2026 09:02:39 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+bbYZnE=Asv=2VnvTpSsLfKtdpcLvfPzn85hyiyp85cA@mail.gmail.com>
X-Gm-Features: AVVi8Ccz5pQCOoAn6KUfbBzvG9H4BnCCBdmvpJiCWRoaKDN4ysBpqyCY7xc7-v4
Message-ID: <CAL_Jsq+bbYZnE=Asv=2VnvTpSsLfKtdpcLvfPzn85hyiyp85cA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] arm64: tegra: Remove fallback compatible for GPCDMA
To: Akhil R <akhilrajeev@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 5:24=E2=80=AFAM Akhil R <akhilrajeev@nvidia.com> wr=
ote:
>
> Remove the fallback compatible string "nvidia,tegra186-gpcdma" for GPCDMA
> in Tegra264. Tegra186 compatible cannot work on Tegra264 because of the
> register offset changes and absence of the reset property.
>
> Fixes: 65ef237e4810 ("arm64: tegra: Add Tegra264 support")
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thierry, Are you going to apply this? The binding change has been
picked up and now there's a warning.

Rob

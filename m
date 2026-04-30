Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C506B3D8112
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 23:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593301; cv=none; b=d1rkUBIy+G2t4kF9jgX5I425laVSTMSUmkKtTp+Hp0ov8dCrwMAemyfzcZkn2n0KbyxXIDBlJ41hqvn75sovsw0hZrKlNVZrpnMbdPQILC4yyRBiqDMSmC7KlR8XSWmOiHl8vvWHl4v+Yzq0Lhj3SCEhC/2OVqFWtB7dlCVCJVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593301; c=relaxed/simple;
	bh=AAia2qkIDmebyJmcu5PDgIuA9G3bwKwbRmrU6wAzc8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQ048h92NtNCxPhM5VpK0/dX3ba2x4u26aiAPAUUm+obwMGHqjM1EN7sRZugp9CjL3mH0lADj6Wgzv7c1eDIc/TRvyLDqugMd6on/P8qNsdE4jjbbe5Eu0xXSM7Mxl9bZJz84bECEO7fVTpEWX99bGEVrRA8uoSA7yxrT0UWMls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SFy2gu6e; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SFy2gu6e"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba8472c1613so254016266b.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593293; x=1778198093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=SFy2gu6eaE4/v4+Z+SKKATwOosCg7IUdrOTXKkmCWvARveYJ39wsVQG5u337Usl0yd
         /pULJDFSXXsAn4i+bdXKzEI08jiXXovwOdj1oxGLudq9OKueQioAMc/CYkPKjmEhMPRj
         8u2/IFLWnrysz96ojqW6s5NYV25y2rhKUJv+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593293; x=1778198093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=XJ6q+oSqaCtzb3I33zJ0p7R4Cws6ZmwYC+xYlSiPTgW2Wyjo23NMsXKxR2YjwNeQPj
         vQGs8llXIR4KuCeKM+5O9FEhjX2ZFey7BGBgZ6Wg0bOZnNqaoaAMd7hgIXk/9ojZvrhT
         4Ny47mEVvOsmfuTAkCQkZ3PF09tKOvGWEVGyZwQIDiMquFvaYECO8JVT98T1CLsylndG
         uFXLfqXCKWGemLtgIWQpHGGB8qMYZH8GgDmL2wxVulB1TaaeCHcxPLvO5wjZtVK2bN+2
         YdgVq/UzwIxO+YDgjZDbbkGBVcwGmmZhSnQeoiVUX1567sgYJ51fUH/yJR3VrtTIQpZG
         bENg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZxcqgPrFKK+WfGlsStsahY3TBRAn0I6v+eILrlwexx5adK6e1plZNZOXJlAlqWyDJDndMSXTDtSv3KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCK/+HPP7ztkxszsDb5y+CAPBFutuU9DdUxQ+5TM6KqDMFUFkp
	P/SHgG0GaWJIZjORq187lAaF/5U5MtguhFEoW5pp05Re5NFtdYMT71CFsgAtE10Ik7NU5+y4ohV
	PpTuZIw==
X-Gm-Gg: AeBDieuwd4SiT9JQNH5cNaOV/c9834Sj6hYFUBYptm5f6T13rTyxbvTz1IT2HIVIglK
	zu0EQHkps8YYPiYECX56PelmBowS+Mp9o2GY98wm0HSAMkZzelTAJaB1wCR24P9GzTSwcU0qLGm
	JQaAIBj4nWG9s9RHlJL2T6MIApu9MQpeckcAcRb75JnmuM5sWGr+GovJ6rOAz2xGezx9vvDq1ts
	EFOOxJIy0AcDcmL8/CezXpV6czW9XxiAw0PpdBzcDjPSqdmahET1v1ZcW/YpACidauuXqN+/IGO
	75Ro0WWXnguL8zC+LIPvoP92OE95D09QfmQHtHnnEjR6TtVZn4OaZstCrvXnUWhE4KJFLNZJTWR
	xeaMYPhFxXRqqRHSPbNNlZS1ERlNaYXfG+mM0tTqAeDIhOc79rSkOK7sTHHL+L++FTcDcF0xsG+
	8oR0OWgyHgmJ3nYlSQGnyMLXER4tYNw8H6oRrF+xokBomemXbcF07gl2PXdiC3ElflZ3U+QBpQ
X-Received: by 2002:a17:907:7282:b0:bab:d909:b89d with SMTP id a640c23a62f3a-bbec07091d7mr33056366b.26.1777593292896;
        Thu, 30 Apr 2026 16:54:52 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06e1b4sm49339266b.31.2026.04.30.16.54.47
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:52 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43eb05b1875so820206f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:54:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9RslX4mXnLvObJaHAb5EFROW6sVV3Gl6b4CmSE9L9GcL6xrZxFeG+Zv2UzhDTf/pRAI+jluh93ZvDITg==@vger.kernel.org
X-Received: by 2002:a05:6000:2905:b0:43f:e16f:3cc3 with SMTP id
 ffacd0b85a97d-44a88058b32mr1086350f8f.22.1777593286514; Thu, 30 Apr 2026
 16:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-5-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-5-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
X-Gm-Features: AVHnY4IqCV1PxHRIY-OTvaBqqWEOfyPxbcpa8ZWBIyLwROAiOEZ_SsblLMHW3zY
Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
Subject: Re: [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
>  4 files changed, 20 insertions(+)

As per:

http://lore.kernel.org/r/afExm9HeB-FMmP4P@google.com

This patch shouldn't land.

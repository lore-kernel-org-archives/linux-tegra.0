Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CF37B00A
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 04:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436278; cv=pass; b=deAHF6yANl/dBisfKJiFnQw1NKt6P99etdmmf5Itnt0yz+ekNE9KTQm5T+WDtynu4/DW6BoKv+JPsIc69UtOZu2GxMDUpRN1XYw/BhfS86xQNPLkiRqGstZxwn1EG88s4mLFaM2VK5HVRLVbuMcMti4WoMGsQx/QY0jINHXvDkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436278; c=relaxed/simple;
	bh=AzwVlyIqYxfmPExGHlhzDdBcn2kCaAcRsyV/IiibDeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULHF5qka6fYSSgSfabzlDUf3zyzKoqDKQ0gKROkwD0meM0kbn0IFM9VyPLegCWo4M7aw7ny129GxhtfuaGxSZMTmzdFkTNBXH2cMrrK46gpKmgNHCXWshjwq7wJ24rWRbiNPXjdB9R0kVUHhIHB4ElGEIx/4ltc2AwRn6901n8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FOYbthWP; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FOYbthWP"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38ce0ab821cso103705601fa.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 21:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436274; cv=none;
        d=google.com; s=arc-20240605;
        b=Uf83pZpWyPk74Yt1kj4na3sA2PZozuW9UDyrjBjZpO4d5GSNJX3LP5WLyIz/Ty8wBb
         MchsZ3qReWfS2tGwOoSTFZutRjkfuZCOSxir6UGAKh/csrYZaVK4atJY472lm8143btb
         ptyITzlM5jIlbvaB8EP/oDbAlSgI0q3BstRhAG3n8ujDlpD1+c8bpTjXrgxPoo0t304A
         DApTSsqcZO7Gb6MbwjqIuQZtez/gSacVVug72rwrjtjuKpBos/2elDp0IdI1uhp4rDVh
         iQOSQSK8UWu8s/Ue8QZp3oCT3Oy6Heb1U8VR7uNqmRd5iE7aKXhFK7QSY4mpOQMmRg4W
         FjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        fh=jvjFQv+hNKpkXC3KwZvzqH8IiF4uYu/bda7++Bmxd7c=;
        b=B+qHwmuy3UHYn3KTfB+KSxgX2locDH4Y+isDGNSYHyMXZReUmIaFt08DD03/PkvRRL
         OSKO8GrvO9Mn+oqn7zr823j2r8ZWiV+GxRvuRz030mKxwuw+3j0AGniF7aFbAZgpAos7
         eWLzbHdZB1zX6D1S7quzoJ+ReGf8iMKTBFpwSdUFKNbCPHqql5EGR0Slf8lNuCLPUvjW
         4Aax5N/wP9L1XAbelnKW2E8TbTLIwpYjXv0iqC8j/yoDa0k34BwK/+VtBJqG/cVOh/xq
         f1IK8cRONiHV2zTxb9cTr0w5AFCv01qy0156j6/RMD10nD2WFOH5/5JupxpsSEqeuiWJ
         X4dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436274; x=1778041074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=FOYbthWPP8lZx5mA4McOSfJeVR0BRGPHdmtlgr+cFqDyaIit578GgtZp31cw0VznxH
         wKUndv8E0Ym7rLT/XDgblyvzj9usFKBf1rj3kFh+mLXvelnaKsP7iTgtAULRzrmny72b
         FRk3AuvUtX08mGI610FMukA4zPRDmNgO5zMjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436274; x=1778041074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=W2z16GXHpmNb+NZHZmvIQ0o2ADFyPixRXZ7zrfzohOspEO8pt5DcpOa5l0rWciP6rv
         uSJn+owkixMRvO9UI0OEpZTOf7juGWjhuD6h40wvDqkUSSAtb+fuSVzUZ5SJfAr5Hyxj
         /4AE5uUtQXbkdmyziqdGBlQ1dFKTq0FOkQrPQX5tjL8S21oCC7sz91kMQL8GqahoEb1C
         1EOJwb8p1/HLnA3XrYe0BVjAGVJK7T6Z6L02rKeVvgXfxD8YAUVPdY/fuuLmBZ9smwXk
         /hCmNv7x9x3nLqxzrNkAb9I4fhSreyw+L9yq4aIpIM9ua8L7otVe/ROQxW9HriJr202e
         dlrA==
X-Forwarded-Encrypted: i=1; AFNElJ9D5lIoAWUjink3NxmtcZKsA5vQHDzUrVM217OmJ9bQ862d4N3LvbSmWaCjt6YA9UrNaACGWPHotIGkeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzjhe9bL/1KNq9vnqV6PlnjYfdym8ij3Huw2uXZBR23WCGEita
	jQNyELPH3B/5kC3vVU3iUeliNWGXG7JMAchON5FThm5ekuUIUXNzPX6gHtSHtdGwhk2lWbYTBzY
	bSPKrYXzWfb59vPLvpyNMk9GcUAoMkaFci8Cw2Llu
X-Gm-Gg: AeBDietHIFRzWlYMeGZD4wuzK8vtP+HksCkWJM0Td5DXAXiTc1lhgAVVw3nvKq0dFAf
	tDGkYEdM0DPlL8mZN19Orf1FOCm2kwuxYTfBwLegq61gtIAf5XKOCqP6L3lg92EmhTk6O7jqo2h
	fZruByZPS+NtVkTTbZbQF6gLSGK/KQpjm2Hn1qrO3Q3FxgOHTFGyCDOnaQudI3yJpd61kDfO2uh
	h4QuQkxPaaq2hHDhjYm5B9GmsUmhWJyb5OwRifjM0T+eHwkTOSsQlaPzzv7bOgGOtw+NzTDp+Oa
	FdtS09H9y3bxNb62Cw==
X-Received: by 2002:a05:6512:3b21:b0:5a7:46f1:d96a with SMTP id
 2adb3069b0e04-5a749cf6fd8mr890120e87.13.1777436274082; Tue, 28 Apr 2026
 21:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:42 +0900
X-Gm-Features: AVHnY4JKvPmufJ1LEj4mzB6PnqIoSu-1P7-pbmF9YGak1q31h2Rrygv9WVJBRdY
Message-ID: <CAGXv+5EPpB92d=ttP9ezOipL6=bC6WYpQakkd5L-weDjLpkrFA@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-versi=
on
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-sto=
rage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-siz=
e
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-off=
set
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
>
> The /firmware node has an empty 'ranges', but does not have
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

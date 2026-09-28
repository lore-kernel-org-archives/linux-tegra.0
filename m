Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890C23D4125
	for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600705; cv=none; b=lVBr1LbLVpf6jlR48N76zneIcdJtX10sLAFPd31/mk6aRhti465T4iKYLSnbzEL24lcEP26EZhLwJoQYR44Lb+8D9VNW2eRRvWBAPYAW2jE2ZCWpItojBl5WFtpvo2RmLsE1yvAIEk7denSyQbMvmdIPOxa5CwIpKzkChHrUDi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600705; c=relaxed/simple;
	bh=52j8945jlWgUfs7EXbllgzvVcw8lTaTuRBWLQUFKmCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gc/ATgVX2gOYQn92lo3YDtyDscn4T1piKaWpb2NZRuYfR62ASgSvrNG8/5SixfDnNg98FHpxUqmnlw8s9ItGGxyuetIdEoDrdK3gPQzEbJvtxALs69yOVwx7zH2EEsg3S1WmNqFiaxEIbeg7yPjIFMMGAiq123KyOwvIacklbBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avR42vum; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avR42vum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625881F00899
	for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600704;
	bh=auF1PGZG5FeNj0rD11SzUL3le7hplnl5FCbwZHCGXog=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=avR42vummbxAYHr8lyLj8YiH5LjxJQD912LYbEWoe6zyGuvhlgWsSiOrRiLgPwwUY
	 ikkHL/h23xI+2DyIj97vMtLCXkqayBHl+RmU0mE7zC7nH7UHcHQHtD86gS/hqSyCuW
	 eGtHCpdL7wqrAtwiweZt6akw6LKRm+xYn6bmxUfw4ORjIZ2L0pKRhpNnEEXmdpVw3R
	 1hAMFN5LoW/Fs8X54sqGhwYprmdMI8JSE8/0jES9Cs2ekxw1Ut77kIzC793+BKDXFp
	 eCMKhakENvdXMOxVcymVsYJkylXosRJ/Pr+ZqYxMhilMuXIdf7L5icvUCtVaOoBcNM
	 Yuh4E7fdGgMYg==
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so271286266b.2
        for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 06:05:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZm/LvKtry1uxlm4VITkkAijFiuTLbPQStVr4vBZnR+unL/1AWDx/FwahbNncX15u+i0+xrOuwucREUA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLiWJX9mzEGTxsUGi7lByx9Vc4257FdyRcsUAqoVoXOI2W8QgXr
	bVpVK8qVwzz7MszBX3PW3RuxR7ceIfthbETkpnVOvk0DmoIWA07Umj38foivqRO7XPOZHyKddJU
	XhqopyO2EVwCGJIAyNap5zeJ35ABFtg==
X-Received: by 2002:a17:907:9616:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c2ac25d87efmr1120379466b.43.1790600702883; Mon, 28 Sep 2026
 06:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com> <20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com>
In-Reply-To: <20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Sep 2026 08:04:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLhhJYP9yP5i55dvBMUr_jqLr3CUvQrvdt__uYPJVNSHw@mail.gmail.com>
X-Gm-Features: AclHuK9QEJ4uOQxPljBhZckKlXzAHfCFvrVCDh-aLNseE1t90L9tpQanxTIxWOs
Message-ID: <CAL_JsqLhhJYP9yP5i55dvBMUr_jqLr3CUvQrvdt__uYPJVNSHw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] regulator: dt-bindings: nvidia,tegra-regulators-coupling:
 Convert to DT schema
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@avionic-design.de>, Lee Jones <lee@kernel.org>, 
	Shree Ramamoorthy <s-ramamoorthy@ti.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com, mfd@lists.linux.dev, 
	Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 5:04=E2=80=AFPM Bhargav Joshi <j.bhargav.u@gmail.co=
m> wrote:
>
> Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
> Set additionalProperties true as this is shared schema.
>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../regulator/nvidia,tegra-regulators-coupling.txt | 65 ----------------=
---
>  .../nvidia,tegra-regulators-coupling.yaml          | 74 ++++++++++++++++=
++++++
>  2 files changed, 74 insertions(+), 65 deletions(-)

[...]

> +examples:
> +  - |
> +    pmic {
> +        regulators {
> +            core_vdd_reg: core {

Drop the example. It is incomplete and is not validated by anything.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob

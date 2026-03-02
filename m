Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA273859FA
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772438052; cv=pass; b=W+FEAb0abiNMARR5BZ4zU76M4yxkuY2DbIdCVj3TlvEA2e7+XozscVOguIAa9goBJrwiAmUr3n05budnWV4HB8P6z5qF4iXl5+pZyPaTxH4FfJI07tp0XTFXRdZ6XTgQw/sXLl8MF4h+wCnfOHSZg3JStWTNa7oiEFHjoT7kdwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772438052; c=relaxed/simple;
	bh=uPb8XLMAB/eVIC8z/PoFZsfbo9bqAYSJ86y6yBPVFa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=My8gbGBfm1sVbxklUV2YKjGF89nxba60jJh4+Mq6bVA1SHqOhJF+pjizDqax4f2KEJDdNbAcbnkB/qnHh/oq68sAz6KD2R6WMMDOXT6ZDIvzLWr2Dur6taZvDRHqYoXsGnFq+2elFVfCdKeCvdz/9Y8MIhTzt8jHRujqhkLNG6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVyPVkGg; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVyPVkGg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso35084145e9.0
        for <linux-tegra@vger.kernel.org>; Sun, 01 Mar 2026 23:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772438049; cv=none;
        d=google.com; s=arc-20240605;
        b=QLGimli+hRV7tUqj4iPpsnuiJS3rer7bYmkQtoz3im2EXE21T14jneSq0jZa4Nz3wP
         mDo+N4rZsMf9afeZd1bV9XD92VhgIBTnX1MR+76Ouzh9EmD0JEfRbe4LTCIXQwoh3rSw
         Zf/3lmp7PmmIz9N9hkOBlVfJjaMvrNTsD6EM/uOOerf6y7pUJMz8tsE4v7WgpmJoTieF
         jQFqRHMw7E3B0f15k3AN/vuM4MNwL5i74zbOa2Hw3ajPXo1Fvdu8mnf/s0xnB5++YF5l
         ixXMDzizSLcRrjpVRIXVl3ecBerOcMWIJDaux9YqO1DXOwsD8iGcfoTk/ldfPgOx2tJ+
         dgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P5+6YqPpCYHdcREtIIaueUQZcnbsY/k4IiVYquZqQ4g=;
        fh=dpl2boyF8zdI3UpXZrc4RRQ/R95lixjZkreuftnDVd0=;
        b=IsCZA1S697ioQ+GVd2vVdc749F4wmosvSZFx/QQIeCGpHpgcDFCIJHTAEu02PR81Ae
         /XC/BBK+Yiyb/lyelrysFB1o8ksgKWHvJCP1IZpaOrNF6hd2bzBiciniUhjqbx5H5PCO
         07nXTkH0HVmjPg4SJSNjWRb9Fmd2mgjeXxE83vaOIT62jX0ydydl7WohoFPvQA+5A2ec
         sKAou6SbzZouvFB9MhxyLD4uZoY+cJ8ju0pt3SWt6Ty+YpQLxhmSmJkPMWhmY7ok/Jk4
         HD5wYHfzn8l4R2wSnnBXcbo6RpyO0AZSSoL0ZIjqD7D4k4PHG7i+V2OogdHo71bqfLNg
         amJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772438049; x=1773042849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5+6YqPpCYHdcREtIIaueUQZcnbsY/k4IiVYquZqQ4g=;
        b=CVyPVkGgj7Y6CGG+CbKhrIra/DfATw7TNcy2XdPlsJm2Y2vS9lK2wNR7mViZPOA6Ws
         i4ToZ/nyjMtHIohguHIC5jBHgz8rd+E/8Dx9lA/FilKPCpAsWVHDMjBltyTAuinw8ODo
         wbctY/Q15j9zYczFPIF+7zeMzR4+2TQ2CjjtB7XTYHaAZZBNFqnZD6xT3tBUgkcf8lR8
         jtXT6Aw7GErhMQ61uEm+c1agLH5IaPr4SpV3cRhQSmxqp+j6KaROnQcg4NiRO2L8D4Iw
         gzKt6PQQs36Zt1SO8onI00d6WLlOPeJ1I3J2pWes60lXExlra2sEtKgnSjejjb9M2Q3p
         vi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772438049; x=1773042849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5+6YqPpCYHdcREtIIaueUQZcnbsY/k4IiVYquZqQ4g=;
        b=e6ogQdhCPIvDmIH32hDeufnT4jT53DasvegP71f6KVmeDSK5uN9UgJ65vJPXNeIALg
         Gt8UtYxheIDj+3LkXfFFZNvR1kOF/e51/nGWwO9OcADTdLIQp0PwLQ//lL7I1OKN4xh8
         8hqiUVXndXnR2Pjsh7vij6vGgdvP2fVnrnr6yP7Uy7xjDc90lTxWeYF8eQGcf7fGo8+9
         B5zqGFoUQWzoF9sLZYe43ye+5A0I6WUlhwHHJh/6izJIsO011g55RKmfYIpNrDdZYQgR
         wH7V/Q9CL7U04oA/fynzl/lujlu5WZpmjYSFqV/4q3VT8KiTJMWcsIy9Z1NnEMsi58c6
         8Pnw==
X-Forwarded-Encrypted: i=1; AJvYcCV/qWox6FLKSASY8WJA82TDDzwOezPNILODdMA0EqjC8BdtvutfTAHCr5JyCtfRA2DxStT8sOXxGRr/Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybg0bK2+uNSxdB/uLLipGKcNN/m7qJKP3DH9UcEcIG3HA+wpU0
	Dt+pK/qMJMpclUCqgNHvhiv1xM2JGygrEU5HGif9fI8hNCZgP+l6Hl3vbZAVBbZC/NYRat9Lktz
	gobTIovOVSOyrS02Vssj4HW0w6W0g2B4=
X-Gm-Gg: ATEYQzzX3DvQUZ5e+aN56HZ5HctxlHlNqy49uycjqhv3INhJVhZki0PqQAnFc5Ym7cO
	nUiYaEo4qDfODuQHdlVNf/L27R9Hp9XopFitwGsheHAoqUUexA6vgPhJmVeh99PAmXFVW8F7vxN
	rlNgLVrK5OAnoIv+YKG/tB2w8aZcfR/IH+4vXjndCfaGr1i8PJVTEA9R4qB9Q63xi/RyEhTysvS
	N/VhT6NYS7DRLYmCXqROYf92jdped+UKw70CIpIqWMiWBSUEdI5nJFo/Ukshsi1oczPXD4KoTu4
	rupdDZhG
X-Received: by 2002:a05:600c:34d0:b0:45d:d97c:236c with SMTP id
 5b1f17b1804b1-483c9beac83mr219348415e9.21.1772438049446; Sun, 01 Mar 2026
 23:54:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126101018.24450-1-clamor95@gmail.com>
In-Reply-To: <20260126101018.24450-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 09:53:58 +0200
X-Gm-Features: AaiRm506qvRoGF6DoCpl6P5GcPjJm7j_vQK9_TMbHPXN7jmVA73dHMx5lkNgJTI
Message-ID: <CAPVz0n23ZW--SMO0qM9eKVcWQSAPgXKdz5Xb9_RAAU4d2Ft5-A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: tegra: lg-x3: add missing nodes
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 12:15 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> With the recent kernel updates, Tegra30-based LG smartphones now support
> several additional features, including an RGB-DSI bridge, DSI panels,
> MUIC, a charger, a battery temperature sensor, OTG mode, and capacitive
> buttons on the P895. Add required nodes to device trees.
>
> ---
> Changes in v2:
> - fixed dw9714 and tx13d100vm0eaa nodes
> - added video device pipes graph
>
> Regarding CHECK_DTBS output in v2:
> - nvidia,tegra30-pcie, nvidia,tegra30-gmi, nvidia,tegra30-kbc,
>   nvidia,tegra20-kbc, nvidia,tegra30-ahub are not documented yet
> - nvidia,tegra30-vi was adjusted and applied, change did not apper yet
>   (https://lore.kernel.org/lkml/176860988748.1688420.11717122647073678.b4=
-ty@nvidia.com/)
> - st,m24c08 appers undocumented though it seems to be different from
>   st,24c08, at least they google as separate devices. atmel,24c08 is not
>   documented, though it is widey used in linux device trees and is
>   supported by driver. Here is one of examples:
>   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm/boot/dts/allwinner/sun7i-a20-linutronix-testbox-v2.dts?h=3Dnext-=
20260123#n33
> - onnn,mt9m114 does not have 'orientation' property, though it should
>   include it since it is generic for camera devices
> - ti,lp8720 and maxim,max77663 have txt documentation and are not yet
>   converted to DT schema
> - backlight in panel nodes was not added since lm3533 has no DT support
> - missing '#io-channel-cells' in ti,tsc2007 addressed in
>   https://lore.kernel.org/lkml/20260122193549.29858-2-clamor95@gmail.com/
> - missing dsi controller properties of ssd2825 addressed in
>   https://lore.kernel.org/lkml/20260123073411.7736-2-clamor95@gmail.com/
> - missing '#io-channel-cells' in generic-adc-thermal was proposed in but =
rejected
>   https://lore.kernel.org/lkml/20250310075638.6979-2-clamor95@gmail.com/
> ---
>
> Svyatoslav Ryhel (4):
>   ARM: tegra: lg-x3: add panel and bridge nodes
>   ARM: tegra: lg-x3: add USB and power related nodes
>   ARM: tegra: lg-x3: add node for capacitive buttons
>   ARM: tegra: lg-x3: complete video device graph
>
>  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |  39 +++
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |  79 +++++
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 328 ++++++++++++++++++-
>  3 files changed, 429 insertions(+), 17 deletions(-)
>

Hello Thierry!

May these patches be picked if everyone is fine with them?

Best regards,
Svyatoslav R.

> --
> 2.51.0
>

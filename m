Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B771A23B8;
	Fri,  7 Mar 2025 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741356368; cv=none; b=Jb3u4+jef/+q2yjEATnOBQSsGwNh7pHYjb6IWdAgxiCYxTBaxhE9XGjkI531lPn0LuUBjOT9WLWsVPTk28bH1rnrknikl9HNuUZhuV8Jq19lytL53Jo+mVuABpacCwT/AidSSwStZC086NE8aq4hoKon5qxLZK1iWDeaqkm6mxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741356368; c=relaxed/simple;
	bh=5VLagXW2ew9uhRLkbykIfrKcmkJn+Ce2ATNGQ9NaCuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYia7OIUGEBDTdr7N2a9D0MrfP7sLNvr8FboF+kSle39ur78j+8Kr87QnN+bfurd0Q0RCqn2I8sp+UEolTuwwmy9w+VNBLfvn6BpHbmfN0BQMLokX3LxrH7j55QcS1wkOG9d04pjk1lt0TiIeVMUUJDfhl36y1jkjJ5dt+jmW2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH8Wy0yr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH8Wy0yr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3912baafc58so1241804f8f.1;
        Fri, 07 Mar 2025 06:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741356363; x=1741961163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SZdxN44/1acImS0lakyTJRUhJC1pE/XRacRur4akcg=;
        b=HH8Wy0yrAtNmntfAfzIkspn7MMZnOZqrc1x67kwuwNBe8GQHZuZ82nNKJuATzwT9vX
         nAdI3lWMR+C/60bWt5CnyK/4Y/ovQLvAiQcAopKicIFvI1dhGHjsL3eP31ic2PYLcYd6
         fY9npZJEbHMNm3WzpvQ+1FA/lOLU51CujhfIuH3KwhDECZac/74KUUr1MgsJEFvPdbCF
         x5/ohXillMb//ofY6z6yT3lkQCHUzKP3SXw39ysq1unLwfs1DUoS0ySbIf6/kqBNFmMN
         juF1+/A+x1r/OyEoTBqekVP3klv567tljJCFnsnYHlVqRcMRKqpBRCjL+ea0iOo90Q4t
         7XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741356363; x=1741961163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SZdxN44/1acImS0lakyTJRUhJC1pE/XRacRur4akcg=;
        b=GJFsQS2iCvE5/wMfQQEaACT6ggfsMlSpz5allTVdB8Q2fFIs8N70ruhPg3rPlU6upg
         4AmTWigeF0CXnUFGJB+Bc0mwNiBW8ucCXqjhuJ0p657Lpcvmf6oUdYGAN6WmpzynFj8C
         qU6ZiJ5259BFi640YvV4iagwlT5FfQP4x/yCveqHmVcY3pzQMZOiKxEv2baz9KBzvbF3
         oWD7ssk/CQbefPFCJexefujBzKGRB/w6DsqwE5nJLQtkhV28iCBm2cm1yzrlk17UN8hf
         2Hm/nTLyxY9t2F3a8wTs00q5PMdvp/l0jdkoWoHt0+fC4p5Nvgx3pyyipueUZgohLYOz
         KHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOKAfA9kPu/atrXLHPGq/bqHj9d5xq8Fn186s08sD42v7m6FusU7wNIWzeypH256MIsjGt16sKKSaDaPI=@vger.kernel.org, AJvYcCVqKZtTkO56hVPprzHPUpnWK/94e7BmcKVT26UOnDB/hy7VoWz7yOq3tzwhhBzP/NL7+X/rBfXyzGF9GKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG/vukKrWpWgdh5b8yunmkdqklKrSVuGtaD8ioA00G0W62KEKV
	/248/gB1K+7ngj9jqqGdBxj1Cr3EIlINqC4PDi+aWvkJ9GIqTGb6IkCwkwAaVvvxBCZmK6NTyl4
	2dfvs2MGMDDcjzC1xcvLYdceNuRiKIQ==
X-Gm-Gg: ASbGnctf3bApyuhwh8w8kD9qMqiS2EhBE0mlON3zzLdS0yVvL1VMfn+ONyAGI+Cq6HA
	i9uCGjQNU9shVyZ7MFXO9S2Z4V0aC6iQLNOBDypb2Rh9tru/kkcgpCvzan6Hxe5BFqvXzYz/Wvv
	usxrgrEVSYm+vMwoq2gIYOS0SpuS0=
X-Google-Smtp-Source: AGHT+IFhub89BE49PmxRZ8B8/y6+v62Udl5bv83R4GZCBTLTM5tTKYVilTiiVDGq1yCCtdpNz79F+1Uik61AGfCdedU=
X-Received: by 2002:a5d:588f:0:b0:390:f699:8c27 with SMTP id
 ffacd0b85a97d-39132d4d155mr1899751f8f.12.1741356363179; Fri, 07 Mar 2025
 06:06:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307081047.13724-1-clamor95@gmail.com> <20250307081047.13724-4-clamor95@gmail.com>
In-Reply-To: <20250307081047.13724-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 7 Mar 2025 16:05:50 +0200
X-Gm-Features: AQ5f1JopsiBx3C_3vrquzAAnidmlrCqZUF4O16fOjewKfMKN97K_wjqcS_eBo04
Message-ID: <CAPVz0n3EwU=N4Fr+HEKTEM-nwmYb+Lm7NHPjg7OXUH4dhnGm0A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: tegra124: complete HOST1X devices binding
To: Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 7 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 10:11 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add nodes for devices on the HOST1X bus: VI, ISP, ISPB, MSENC and TSEC.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra124.dtsi | 65 ++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/n=
vidia/tegra124.dtsi
> index ec4f0e346b2b..8181e5d88654 100644
> --- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
> @@ -103,6 +103,45 @@ host1x@50000000 {
>
>                 ranges =3D <0 0x54000000 0 0x54000000 0 0x01000000>;
>
> +               vi@54080000 {
> +                       compatible =3D "nvidia,tegra124-vi";
> +                       reg =3D <0x0 0x54080000 0x0 0x00040000>;
> +                       interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&tegra_car TEGRA124_CLK_VI>;
> +                       resets =3D <&tegra_car 20>;
> +                       reset-names =3D "vi";
> +
> +                       iommus =3D <&mc TEGRA_SWGROUP_VI>;
> +
> +                       status =3D "disabled";
> +               };
> +
> +               isp@54600000 {
> +                       compatible =3D "nvidia,tegra124-isp";
> +                       reg =3D <0x0 0x54600000 0x0 0x00040000>;
> +                       interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&tegra_car TEGRA124_CLK_ISP>;
> +                       resets =3D <&tegra_car TEGRA124_CLK_ISP>;
> +                       reset-names =3D "isp";
> +
> +                       iommus =3D <&mc TEGRA_SWGROUP_ISP2>;
> +
> +                       status =3D "disabled";
> +               };
> +
> +               isp@54680000 {
> +                       compatible =3D "nvidia,tegra124-isp";
> +                       reg =3D <0x0 0x54680000 0x0 0x00040000>;
> +                       interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&tegra_car TEGRA124_CLK_ISPB>;
> +                       resets =3D <&tegra_car TEGRA124_CLK_ISPB>;
> +                       reset-names =3D "ispb";

Thierry, here ispb is typo and should be just isp, obviously. I can
re-upload patchset or you may adjust it when applying. Let me know
what you would prefer.

> +
> +                       iommus =3D <&mc TEGRA_SWGROUP_ISP2B>;
> +
> +                       status =3D "disabled";
> +               };
> +
>                 dc@54200000 {
>                         compatible =3D "nvidia,tegra124-dc";
>                         reg =3D <0x0 0x54200000 0x0 0x00040000>;
> @@ -209,6 +248,32 @@ dsib: dsi@54400000 {
>                         #size-cells =3D <0>;
>                 };
>
> +               msenc@544c0000 {
> +                       compatible =3D "nvidia,tegra124-msenc";
> +                       reg =3D <0x0 0x544c0000 0x0 0x00040000>;
> +                       interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&tegra_car TEGRA124_CLK_MSENC>;
> +                       resets =3D <&tegra_car TEGRA124_CLK_MSENC>;
> +                       reset-names =3D "msenc";
> +
> +                       iommus =3D <&mc TEGRA_SWGROUP_MSENC>;
> +
> +                       status =3D "disabled";
> +               };
> +
> +               tsec@54500000 {
> +                       compatible =3D "nvidia,tegra124-tsec";
> +                       reg =3D <0x0 0x54500000 0x0 0x00040000>;
> +                       interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&tegra_car TEGRA124_CLK_TSEC>;
> +                       resets =3D <&tegra_car TEGRA124_CLK_TSEC>;
> +                       reset-names =3D "tsec";
> +
> +                       iommus =3D <&mc TEGRA_SWGROUP_TSEC>;
> +
> +                       status =3D "disabled";
> +               };
> +
>                 sor@54540000 {
>                         compatible =3D "nvidia,tegra124-sor";
>                         reg =3D <0x0 0x54540000 0x0 0x00040000>;
> --
> 2.43.0
>

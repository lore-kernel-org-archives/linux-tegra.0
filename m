Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCB01F09A3
	for <linux-tegra@vger.kernel.org>; Sat,  1 Nov 2025 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762038823; cv=none; b=Fl0LjqJUXkUbFq6404hEGuy1YbR4fFVNZKzWeqpPOwto0Z2EzRSZ3Wpgn9OXpwM/ZcdS8rp2VccOMB3R+QWm8HNJLuAVdLp94fgoqZULS3RWYdDB1nXbVaaChPYBlGzqaJOqwGzfidq71pHtcfkQUrwMWQ4llXS6M/68og2POOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762038823; c=relaxed/simple;
	bh=SrBDDWvLXhp6U/q9qNGjROiU4g3/enClGtkXirRh038=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7EFZiSdZzpSKnPowbMwJbKy52voV869lvW/j6bYuwlKzjg8rVe5J3P7ImdP0oxTB1Xu4dN4mlMsOZDP3v9bXtgsmYR2O0Wg2/6q1ojcLyFgnBO7WlEmToq/OzAbDI0aa6u+6HbuF8lYASSqfxQcwH2MRgUtvDH99RF6TExXPCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vuiro7t1; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vuiro7t1"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-36295d53a10so28964771fa.0
        for <linux-tegra@vger.kernel.org>; Sat, 01 Nov 2025 16:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762038819; x=1762643619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYzGZVeDG/F2ZwAs7gohbCGEqRaB9fTMjsTsiPiSNv4=;
        b=Vuiro7t1K/kjRdRhbHqfsvvpkFJeiuHIV9wV1rz9YcYxGQ3VFVY4+EjongG7M8+D52
         MXI8BqAFzxxhXgcOlKS2dID5H9PbdeOsRKezDik4zFKdKylM5W4btKxiiJ6LJFrEw1Pj
         2WuWQwls5grEA11cyQPWF0cdwfckDAFS5J6lRCc+khG8Vz2i895dN1NRhh5aukdbpSXs
         jxjYuwlfYIb20XLTnO5R/lvfoq2T1/JcJ3IvZNNNbTLYQ1U91bQxGJ95xbzOISnlGp9t
         ykPRQIiRCMiD7rNPy7PBJidrSc/a8OKmpnneK76cVU6RnituckberWNjbzmrNMrhTPDG
         wgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762038819; x=1762643619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYzGZVeDG/F2ZwAs7gohbCGEqRaB9fTMjsTsiPiSNv4=;
        b=a/J3AG2H6DU6VZQ+0FrPYklptgkMYWwTQDHCmjbg44kgQfsPNhIinoHVjP3DuXsRg6
         MNQAbyYyFJtwQVKRMp+5EPXskDzIevmatSD4DqzZuEvAq6e5qR0rpZxwlzkhA4lIuIbT
         mmJT6N4KEqO012JRLIUMIYsvhd9kw/6RHm1pdHoh5TEz9XeRbH2rwBUoOpOJAgwKgwUS
         cUKE2pTEngd+vjTn+P48naKbkCqMSeCoLrGo7sSyUX9StF6hgXFAntzA9zNgHdydomMi
         IkNWsUgMxzOyx5LSMa0IwM61TtRZQpKr/QbvfiViciJJbNJIr4BWZ/RtO+buMv3IP65c
         G2OA==
X-Forwarded-Encrypted: i=1; AJvYcCWW3GFLx2CtA16jGY0pCxeW+0SsqAXd3TPGtRkTMn8ijCFYWhvQEpftPqiQMBwRmhUMyNOEuCfGmU3Atg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu9Ehq8mBMN4V55cKItjBdpNxrSVEYl00REyAoJIwT7COBIkGS
	u95NkaBIb3I8Je+A+zG+IocXrn2a9TEaTaadgMMVciL2mvGUlIlt2+/qZ+s+6b5e6SIXzJNGPEu
	t82XPuB5I/mgkz4vTWDTigArpS9hMWoA=
X-Gm-Gg: ASbGnctEcwwNRiAYAaDlhTGZbEicn4MqwDREJkWBNuMJJHsj9/DbMJklU1yrltn16Au
	YdH0jBzh38B5goughOb+QQtvZg1TAyFV/54arGENsQ9+tsuhtKdVdzEz7gsS1ee+N/+Yz6casvc
	+8OmpdXTqjsb7X85kT7Cs0wMqH5Nxn4/AsUJe/8oKd884Ut1ybamqguLrtIF6Q0DGFr+xIBVzRy
	t2glaM7jPUkDXMTfR6y1SFrPJekkwEncQQlniLYBfSIKQxFx0h2W6xk6Sou2oiKnuDjDwk=
X-Google-Smtp-Source: AGHT+IE8XHymc5LMX6z1ku44swz3jJJw2qy7TpmnFfZvFQicmRNID6fCODQ/EG2fDStIeCQx9l6QeL3n1Ukp8sZtLxA=
X-Received: by 2002:a05:651c:19a6:b0:378:e673:cff0 with SMTP id
 38308e7fff4ca-37a18da4d4fmr27578951fa.5.1762038818390; Sat, 01 Nov 2025
 16:13:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com> <20251101-tegra194-dc-mmu-v1-1-8401c45d8f13@gmail.com>
In-Reply-To: <20251101-tegra194-dc-mmu-v1-1-8401c45d8f13@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sat, 1 Nov 2025 18:13:26 -0500
X-Gm-Features: AWmQ_bmW3soIlYVprrFQERj13nFXgvHtfazndXt9w2FXnFW8w2VSQcJDNe151xY
Message-ID: <CALHNRZ_QrQHCmF7f1z29tAmuNR-=rG1SgYJ1sssK3VXiQqURYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4e12.
>
> Mmu is now being enabled for the display controllers.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46aa1d8eedcdfbae1f=
dde1374adf40337 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1807,7 +1807,7 @@ iommu@10000000 {
>                         #iommu-cells =3D <1>;
>
>                         nvidia,memory-controller =3D <&mc>;
> -                       status =3D "disabled";
> +                       status =3D "okay";
>                 };
>
>                 smmu: iommu@12000000 {
>
> --
> 2.51.0
>
>

Question for Jon as the author of the commit being reverted. The
commit message states "we do not have a way to pass frame-buffer
memory from the bootloader to the kernel". If I understand this
correctly, this is talking about seamless handoff. What does this have
to do with enabling mmu on the display controllers? Seamless does not
work on any tegra arch as far as I'm aware, but Tegra194 is the only
one that doesn't have mmu enabled for the dc's. But enabling mmu
allows for better and faster memory allocation. My initial attempts to
enable this didn't work because I tried to attach them to the main mmu
unit, see the related freedesktop issue [0]. After noticing in the
downstream dt that the dc's are on a separate unit, I made it work.
And so far, it seems to work just as well as Tegra186. Then when I was
packaging up the change to submit, I found that this had been
explicitly disabled. But I'm not seeing why. Am I missing some
additional factors?

Aaron

[0] https://gitlab.freedesktop.org/drm/tegra/-/issues/5

Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D31362136
	for <linux-tegra@vger.kernel.org>; Wed, 20 May 2026 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779298204; cv=pass; b=DSXGl6d1+nEed6FJodaoq6YJFaMbsDCOXl0A6mLomqDstLcFrZnFE9r7inaVgsyNDScKzeW4RP4OxCYRg3GM5hw8JpS1eAbFBkuSsNZOaKDBDbt9K4GY0J4YNiJyV4QO4Vl+5VYOKaSFA+3Fw3EkOioEzblDeJaK0sMRZhv7eBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779298204; c=relaxed/simple;
	bh=AxJKt3npx/5olYpRGoq298LXQ/po4wFjS8RwWFAvF84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcjgI9Vlke9Y2f5s5r281DvVKvWqgarVjHq4GB1I7qS2P5rlYzvXc2Yv9UKFmcOi1VK2Cn1Ktu3BeL3AmVzELsXIcEbaIjPPWNRXWAbRXzLE0/KFf20lfYEli1ip/bfxPVfwDZo36s+qNVVDTDgs9Ot0/kmfo+6Jd+mCMkhvFQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCiTtgM9; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCiTtgM9"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39380e79936so54939321fa.2
        for <linux-tegra@vger.kernel.org>; Wed, 20 May 2026 10:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779298201; cv=none;
        d=google.com; s=arc-20240605;
        b=CTKIq8Wdn8Tw00592oxdFEYRVUyS5YJi48A+58TMNv2fF12z3R+q9T52w+LJN75DkZ
         Am2M6DlQ2INdzvWEN0g6kFaarKxYfN7Zkdpgo5AAdrKg0JwErppDIGOby4uj73oyoBPx
         5hFL3mNM+ZM3/rbd8zSwuLjeGOwn3lY1eOf2P4u+DOZK7jlpcawC4lhcBglec7kKqZ8E
         JS8va0Tr58SY6Z8v8MRjIrbjSTtNzDxN0d4HAaZdHumki33BBqvNTubwSUX5PfW1kdzB
         UJwxwHfGgguOcQ1gJQLD6Wku0sjQ7swnJlcoTxS6d5BiXEJXLPmUbm2pZa5YulwsxXsY
         pseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqX6X7nWtjyIR3qederrBeJlDMfIxrgMnvzCbwNNfdY=;
        fh=5st7bL0qytHZiJkYZeOBai6xEj92lU7NSt0c0mbBP2s=;
        b=Lg092u2tmFaXKfQ7pSNjsGQoxDbsKE8fVn/SDlG6oEXEfEZMfPZbF7DACzGmMB4Oyy
         A8L/0Pt70/1Y360tATlLm/K2utucUgzXsAntfghc7Jo2FZtQhDZ0cyVTzSdzikQEkRL7
         43pQxrCyHywaXzi+bI27/HZu7GKpAwZbBhGzJ8GPUzzmkgfgcqOp0/ZaIE2XrqAR8FEv
         BzUbXIT5rzVXXn+cmzYcDbj4VWVuybXeDbzCq/nYSI7qVR0ng/ZChiYw723i/HSnzVqz
         /2v8l/x4KCyTrL15oX/OhMaK+9PPkmNa71tijgN+7/ub/iWzc407CD13kwG4XQ5C1UAZ
         s/Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779298201; x=1779903001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqX6X7nWtjyIR3qederrBeJlDMfIxrgMnvzCbwNNfdY=;
        b=pCiTtgM9+8Bg8icQNwyyQj8BmgJ4pc7kwCekh88YUppF1+v4ke+830RzDiJ08r5jK5
         IR5P9TAhoz1+ma6fv6i9QUVg4X5u0k8cV9NOJZt/rnDPBGuRo/M+2nIor5TPltBPA4gk
         TOQMUj5m8g9D6JHlv4mpZsVxstIs8m+u0Z5jEDttAsJ21VdKEWjirrKSGzyVrSQwWS5T
         oTlgHZRnDVeWwKWYyJQ+AVfqI0By7JqiyN20e85pLwjpRRbYnX4F5mePTouyuaqYPNIo
         c++oS6LQaCvrpAXGjDyNCGry1+AeWM7EnE95UUJ/qXzbWkkzf1kkvEII8C9rYBPwat/M
         1FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779298201; x=1779903001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqX6X7nWtjyIR3qederrBeJlDMfIxrgMnvzCbwNNfdY=;
        b=oBtMwwyzc7p4jQIHE2BMN49Q9Va/tXt5KfK+ZuoeELWigNMNcZ4H7QEc9cxWjABRsv
         ogmQsqyJhmpfY1ShpqTuoewofEtSSoguifDVZN0uvN4iPQUkt1X1ALlWg4os9OFEPZgB
         aznA4V9wbTNvghgG8f3KcASpT8BDBe8pdm3ECivFf2OHaWqbSNKm0/ZMf/J2Pav/e7Xf
         /RvfF/mj65RsHnJsdNPYXHJTn8cvuJZ4sJ3Dfz5hCouB6VII7L/Hb1ob2B0RTHqE0mUz
         Jz0N5YK1oUdqSLypVsfh49QolwyQgacl3aNLr2oiPdpsqdujcZadrYnIoBFaqfuV5Z1N
         2qrg==
X-Forwarded-Encrypted: i=1; AFNElJ/ThtC+kbdf3jsxgMHoatIJa2F2r8w2EFkLtp60BkbtbTjcP2rMrtqSsTsu+kiKwKn/Cp46o6nOQGV1ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrSpklOAEH8rmylXa6YVH7SO3o0GD/oVs82zOXxIheKTUKfvy
	dAIKo2iVzstVY972JKCa/7Hv5LCPruIFf+kEHXV89kRZYdLaTUBOVDORBIZ4LxOEffojMcDhRaA
	tJlirmrHLAJnMs1q1Yv/Pa/80x0CFa2c=
X-Gm-Gg: Acq92OGsZ1/qanXIFY2Ix1W9bw2Fp4wFj80kt26wn5chf+0Ql7JHQKgN83FdRyW5BYR
	6euv3PfmgxiysCqd56ZXDZTcXNYUltkhS4mZZ2wrryG6bVQjEvX29i6oBi3ZiTemQj3DO3W+uE7
	6t+5UcVnZtP7VNZo/PlOvJLtyIJavYgsq+e3YerwH5b3utVRQsVObggf/HpvIgBU/ItvSoy/Vf6
	6eMWqCmR6AjnPOW79pI6UiWtMoOuyjkd3KIpfHaW2j/tUN1Fiog++RWM7fNLEV3C6697QMQX09b
	744iiy6iBCnR2BkaYd9P7rJQKYv9g2ynvuMvsQxHdDJjF4NAQ9x16/L4Cdrr7oM50KXoJQcuzii
	yIi8=
X-Received: by 2002:a05:651c:4187:b0:394:378:b53c with SMTP id
 38308e7fff4ca-39561f312afmr68643811fa.29.1779298200654; Wed, 20 May 2026
 10:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com>
 <20260515-tegra194-qspi-iommu-v1-3-57dfb63cd3d6@gmail.com> <ag2fjPWwKJmrdYMl@orome>
In-Reply-To: <ag2fjPWwKJmrdYMl@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 20 May 2026 12:29:49 -0500
X-Gm-Features: AVHnY4LvroBWjQk9zP1yNxXjFt1vwSYbmuS4SgnDFGII4R-emIrKxrHn6Q0vFZ0
Message-ID: <CALHNRZ9+X-QMmse-+KOAgt4psobecQvizqXMPufx-BnEd2wujA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: tegra: Add iommu and dma properties for
 Tegra194 QSPI
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 6:49=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Fri, May 15, 2026 at 03:35:29PM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Without iommu and dma enabled, flash storage such as the spi-nor on the
> > p3668 module times out and cannot complete any transfers.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra194.dtsi
> > index 1d659454a6f9fe..0e0a20befe9e68 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > @@ -923,6 +923,10 @@ spi@3270000 {
> >                                <&bpmp TEGRA194_CLK_QSPI0_PM>;
> >                       clock-names =3D "qspi", "qspi_out";
> >                       resets =3D <&bpmp TEGRA194_RESET_QSPI0>;
> > +                     iommus =3D <&smmu TEGRA194_SID_GPCDMA_0>;
> > +                     dma-coherent;
> > +                     dmas =3D <&gpcdma 5>, <&gpcdma 5>;
> > +                     dma-names =3D "rx", "tx";
>
> dmas and dma-names are the only properties that you should need here.

This is where I started and it didn't work. Without the iommu
properties, I get endless mmu faults upon accessing the qspi flash
device:

[   62.313833] tegra-mc 2c00000.memory-controller: axisw: secure write
@0x00000003ffffff00: VPR violation ((null))
[   62.324542] arm-smmu 12000000.iommu: Unhandled context fault:
fsr=3D0x402, iova=3D0xcd21d000, fsynr=3D0x80012, cbfrsynra=3D0x820, cb=3D1

I know downstream kernels aren't always (normally...) the arbiter of
sanity, but I did pull these from the Nvidia downstream 5.10 kernel,
which is where Nvidia was starting to try to align with mainline
paradigms. All of these properties are set there.

If the qspi node isn't supposed to set iommu directly, then there's a
larger problem here that I don't even know where to begin to look
into. All I can say is that dma fails with faults if they are not set
and works when they are.

Aaron

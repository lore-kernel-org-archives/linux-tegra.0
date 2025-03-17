Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2210119F133;
	Mon, 17 Mar 2025 11:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742210369; cv=none; b=qC8sEsCRlVXPrUXn66hzA/nFN7vsl+TvoL0QV03XUNGHyhpyd0JlpXL0bbxzRkM9PTxaXM9NodenCL1iZtw8WNkjrBKkCi3P2aOgTK0XET0QTY9mXabM9nNtASAV5YBz2NPZ8qwRRTgl+NKkttqaXj9Yn7VTreRgXqIUzUVrpY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742210369; c=relaxed/simple;
	bh=pk0bH2hjb2JgVLak7SCu6viS6he98qJK5O47lwOAc5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZ1zZeI57luIY2OhwYXChe7ggvGrHLoHtl8xM/xEKvrMc2BAtsMx81EimHMaJFlZ8LaziyAP1gyPTcHB1ewL9K9q+An13s5QapZYOE1pqKlSHbrLjMBQ+pPl17cWmMq8+VE1aYAEMOfO+88e4y/d2QUBknzObj4xPowXJwBGxZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX+yGMum; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX+yGMum"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390cf7458f5so3736634f8f.2;
        Mon, 17 Mar 2025 04:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742210366; x=1742815166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLeCZhZ0N7Btdvw7wqczPCvnM/7FylGR6df72bZxMwo=;
        b=VX+yGMumhmHO982GJU53vg0K3iggoQ2fU9xOFOhSiFqo8D8lACl7qY4+JY4HENbvW3
         lmos0IE+StlZ8mI0BlF2gp5jOjlhrVWz2ejw52IgJ8oeLB17PwI7C59A7tw1ITw82YAX
         ZQFvRilLNf1QIsClis7RJ+fKkGYGsJFM4YP1uxouw8A100yv3DIMNO9c82rJHrF6+5EM
         iD/yr4BZTJQbUPNGgHKjPEmpMvNgcfNenzeWMNEv23lm2zlftBTv2TaLJQSFipuHF/+E
         AsdCSy6m35QqUjuCZejlp9a2c+gn41TzV8Twkwa1QB/94I5z2WPcN6OyikZxNO04v37u
         SwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742210366; x=1742815166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLeCZhZ0N7Btdvw7wqczPCvnM/7FylGR6df72bZxMwo=;
        b=fiGXysP6Bst3BQttOcaxOggwf42hoCWCblkyNxy/w1Ipv6Vw1rUmY3Z4GFYTrhKVUr
         Iuo/Hpi1kCgyIpJasVX7sCa2fbQnPgeXtMbDSukLu9k6/XmcMFGiaE53zXcuXPaEHNtP
         1LEOeaDGzKdj76IiGLVz50gN7cYVeT/ac33SITPlFNL6fnYlGJs0Pq0LjAdtevGos4Ci
         PD+3WlRorB8vL52oOySVxOuhWc+gg1zx+/YUfwWupPxKeHcqBOss6AA6te1616+zEqFd
         S5aC2+YBIjyElBfHPyz1cTPvcypjpTLT7M7tuv+jRZddNQk5cxy7+2a9yMhPGh9C4B+B
         /gWA==
X-Forwarded-Encrypted: i=1; AJvYcCVkaerL0S1H166nHKousVy1ZYaPDId9BkjwJpQDq12Q+kw3ELczyOqZ68Ju2mrcRPjY9WO+sLjLWAXyiPsW@vger.kernel.org, AJvYcCVs6V2EtS/37m5EcUCLJj3wKQseZlgcbo0CzgQaBALmts0oGoE+gisZVWxr3g2i06gmpUuBWqoSIpPrRMg=@vger.kernel.org, AJvYcCXXkOGm2yscZndb/z0vUWTxnNWsIbeS9fQKuv32enBlWETqAnat6gCwgpo2vExYMUvr6wQMyUQCon7f@vger.kernel.org
X-Gm-Message-State: AOJu0YwsLDSKAHyguyVWQ6/ujtWxRD0RDNthpxDYIF1FJ5OMKtkszUSf
	PgfvGJS26eSoDeZyxONjNlLV4epWW7BnI8YHAbIVisWr6HH7MSjNA8i6nqRTO3YN+7Dj45tnNUn
	F9FQEYHdFvknh5Svhw/RVOnZO2kY=
X-Gm-Gg: ASbGnctAy7mJUUeix2QPL4D3VHLA0N92C+qlIi8PqlP8KHIe5I2AiIfSsEN4QWO3LTe
	8e2LiXce5XlhX5P8paXFEEbXPe0QOz+mRq4YCpKKVl8gSLJojdC+62xK8Msz0i/FVRBtDAE/Ziw
	GNGBNQjuBhVehWseodUO/Oly9MaO0=
X-Google-Smtp-Source: AGHT+IFo2h5b+eyfl0woFLxR/UFx6OQZ98qqhvRZhNVeYIr8krODO2LmeZqPBBmYnnZaM17WarXLuwiCmMNQeWaICqg=
X-Received: by 2002:adf:a351:0:b0:390:e1e0:1300 with SMTP id
 ffacd0b85a97d-3971ee44dc1mr11128611f8f.33.1742210366190; Mon, 17 Mar 2025
 04:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315074416.8067-1-clamor95@gmail.com> <20250315074416.8067-3-clamor95@gmail.com>
 <20250317-enormous-bug-of-triumph-ba274d@krzk-bin>
In-Reply-To: <20250317-enormous-bug-of-triumph-ba274d@krzk-bin>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 17 Mar 2025 13:19:14 +0200
X-Gm-Features: AQ5f1Jo22GVFIaQR9LPaBlBUIWc19Kq1F8oyPG85UW6JOlkNu02aurf1d7hWkUs
Message-ID: <CAPVz0n3o2=6cXh81CwqzASEcz9AbBmaMeU94V4xAyGdzKcUoVQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ARM: tegra: Add device-tree for ASUS Transformer
 Pad LTE TF300TL
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Maxim Schwalm <maxim.schwalm@gmail.com>, Brad Griffis <bgriffis@nvidia.com>, 
	Dara Stotland <dstotland@nvidia.com>, David Heidelberg <david@ixit.cz>, Ion Agorria <ion@agorria.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 17 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 13:04 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Mar 15, 2025 at 09:44:16AM +0200, Svyatoslav Ryhel wrote:
> > +#include "tegra30-asus-transformer-common.dtsi"
> > +#include "tegra30-asus-lvds-display.dtsi"
> > +
> > +/ {
> > +     model =3D "Asus Transformer Pad LTE TF300TL";
> > +     compatible =3D "asus,tf300tl", "nvidia,tegra30";
> > +
> > +     gpio@6000d000 {
> > +             tf300tl-init-hog {
> > +                     gpio-hog;
> > +                     gpios =3D <TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
> > +                     output-low;
> > +             };
> > +     };
> > +
> > +     pinmux@70000868 {
> > +             state_default: pinmux {
> > +                     lcd_pwr2_pc6 {
>
> No underscores in node names.
>

These bindings overwrite bindings in the common pinmux configuration
which has names with underscores, so underscores are needed for
correct configuration.

> Best regards,
> Krzysztof
>

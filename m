Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880D7289821;
	Wed,  7 May 2025 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746635233; cv=none; b=pHYKY9q9NH/CxSLZED+ip4oDY8GD6cUdTlSfoRGTI4qhByUktWFtCDfvTIJPp2i1TO1goWrFFzR5682MBpVVJ0X5cNkdkfuM0ME57zb9m61AbVg8PJa0Kgh4xlvzFC1vQO8Mcdl8aMgUDZD8dO7rnMzLT9D2Fbj8e+J52W6MU64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746635233; c=relaxed/simple;
	bh=/bkp1+ndxM6IUZavIiudg3yZ6BIozijVYfvBG//IBwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLF4YWzJ9fp5J1Vo9uKSa6NSY0lAunYV6s/4pBSi4O3rDhx0nm3NVt2t3VKsaIe4HBwGDl9mVr4I9+xFv4VJpNRtP8wW37ovVleZmgJlKOezavUaXCXpnxJt5x7hLNW6EhuJ5LBcdHav1WrMGX//CQBRoVhy87czwIaP1oLuoAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXKpjqzr; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXKpjqzr"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-326b683ac3aso1036151fa.0;
        Wed, 07 May 2025 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746635228; x=1747240028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bkp1+ndxM6IUZavIiudg3yZ6BIozijVYfvBG//IBwU=;
        b=BXKpjqzrZU/aK6BeKwUiNeBVcVsuvFwRaX8r2rvIf/c7nZfeDNwrvCETuR4C9Hh/fz
         YEerQ0DqjXofVkKtV49lE7dMAmakQIu/gmpBad9AkL8uC/0aDENWAv54+4EOMbZIm7A2
         zLl+HPhtfNdJaA+wrZI1ZhxjQTxfMJVc48LuNclgfCFgqG1afhN40Rz8Xavp4IoW2rEa
         2vpr5XeCpzfFULpSTa8Sd5LAfAJnP8S7niCr8nSxQV2mndAr9ZM2NYwgAUZixihMlUlq
         U/1ScTlRGXdcphSNpM9rck3jyXIwlnCrzaKfO/ToUlfrMphnctTcXXWJqeJmlUtrO27n
         1xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635228; x=1747240028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bkp1+ndxM6IUZavIiudg3yZ6BIozijVYfvBG//IBwU=;
        b=go/H1gshU1GgRdcQKZNjLLVECW8p1uEFwiL0p1rjwoSm8sAn9JoQJR0R4TZPPE7ykB
         CyVWlGidfrsy7oHOY0Hj7mHuhPu0C8og/JTXWAybwbxj9JEi7ln5yr2cVH4d2bF34pCs
         T12iNQC7PJDkAMHnQjR/ms+smY7TuhjwtFZgKKScqBCjV1PEj00JmRTVdD/y6LyBptwC
         RhUXGrIFxpPcnPEIK13jwRZyOP/eMnGIeF6g3GLgzLSBsTEfOdH6SBJA/eAlybTsO1mB
         4c75pszLO/W5iPK251zyjJ1E+UfrseIU5gPExLVydEXwz7CIWEQhuTBoE0WwQ7Y8V8mR
         LIzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFP80x14djxj9zsAJ23t17AgFkH1iVpF64tQCQk9yxdNR04SdEoyKcxcF0eC/pU7+NQ5vrXDdRvM2OLPU=@vger.kernel.org, AJvYcCUSoqq/xX34+Q2UtEL2f1S5Dkldc2xkalKzHcZtWMjt/gldi/pgp/BZggjT/ivNMyHRgIG6Y2zp/XH2@vger.kernel.org, AJvYcCWJUnBFcv/gDCW/N+0aGu+B15/kPvYigQf5jJo4XY6ExOMR//qWR0Vyyva7roChG2z31Qjr7MlNcSKXERgg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7QShvRKOrOAlL+HHmmTmbIs4FMfZ/tKmFRrPB6sfyvb1GF8Qi
	JHk+gOAae7Cc2GOgy7/7+rOz4m55fZSXyXOBz0woD3izKRbP7HONPFWfa6oNhwLPTafNjuZTty/
	7sjrKo1hzv5Hrd95Qvz3EaAEAr4c=
X-Gm-Gg: ASbGncvpSwCkxVaU3MPnTKkGUX3+UFhpF0+/S1xOAwfaRb+mpQvLez47Tktz0bSqa1H
	XkRR85Nq2T5yhJQ4f+xM0/R1wpJM3c+2+EwF2vl7P9q5Rt4UMVDeV50A35jSiI6nJxVAqqvaVpp
	s+JfIjIcA+Xz6Rz30hPxFKowtwV22K56oRUg==
X-Google-Smtp-Source: AGHT+IHOrELlfrPc4U6o94ZfK4oHdb0EgEpd9D53TLeAXQjPNrwN+J+jfBObUTEvdKwpYzy9vRNel+cJiNf8YN9WrPA=
X-Received: by 2002:a2e:bc94:0:b0:30d:6270:a3b4 with SMTP id
 38308e7fff4ca-326b764f0bcmr720101fa.15.1746635228251; Wed, 07 May 2025
 09:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250419-tegra186-host1x-addr-size-v1-1-a7493882248d@gmail.com> <vegicz45jspxecpaitgju6ivvrefwoufg5yrzlvxudjatno7cr@rnvnqrmqofsk>
In-Reply-To: <vegicz45jspxecpaitgju6ivvrefwoufg5yrzlvxudjatno7cr@rnvnqrmqofsk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 7 May 2025 11:26:57 -0500
X-Gm-Features: ATxdqUHPCKEwfrljQ_Y3mZLOd5OdP80bfGHGqvB8s0eKCloQAxHcEsxq3hWZt1Q
Message-ID: <CALHNRZ8N=NnirL_vBYjsUt_w8hSXzu5z7H7ditFQTjuHH2Zs2A@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Bump #address-cells and #size-cells on Tegra186
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 10:37=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Sat, Apr 19, 2025 at 10:30:31PM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This was done for Tegra194 and Tegra234 in 2838cfd, but Tegra186 was no=
t
> > part of that change. The same reasoning for that commit also applies to
> > Tegra186, plus keeping the archs as close to each other as possible mak=
es
> > it easier to compare between them and support features concurrently.
>
> As explained in the commit that you referenced, the reason for making
> these changes for Tegra194 and Tegra234 was so that the PCI and GPU
> nodes could move back into the bus@0 node. This doesn't exist on
> Tegra186, and the top-level already has #address-cells =3D <2> and
> #size-cells =3D <2>.

This isn't recursive, though. I had thought it was, but kept having
issues. Then I found docs that say:

The #address-cells and #size-cells properties are not inherited from
ancestors in the devicetree. They shall be explicitly defined. [0]

> Does this actually fix a bug? Just making this look more similar to
> Tegra194/234 doesn't seem like the best of justifications for bloating
> the DT.

Tegra132 and Tegra210 also have size 2 on all these nodes. I probably
should have mentioned that in the message too. But having Tegra186 as
the only odd out tegra arm64 arch is confusing and makes for extra
work when trying to implement things across all archs.

What made me sit down and and type all this out was an attempt to get
simplefb working for seamless display handoff. And I could not get the
reserved-memory nodes and iommu-addresses and all to line up. Not
until I made everything connected to that have #address-cells =3D <2>
and #size-cells =3D <2>. Which happened to line up with every arm64
tegra arch except t186, so I submitted this.

Sincerely,
Aaron Kling

[0] https://devicetree-specification.readthedocs.io/en/stable/devicetree-ba=
sics.html#address-cells-and-size-cells

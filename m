Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F2A21129C;
	Thu,  6 Mar 2025 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283194; cv=none; b=dEA8xHbMv9HKqxruDpHlg7lwt/hep+pkj/EJRQ2plgMBXmmNdAato8i1x0IncdQjxAE//LFDYnRZ7oCeGiSMYHWukWhtJHWlSKw4K8Ko5nPged1Akqxc7gwCEN9xO2tBkjQf+vDB5X8i2aBJMgC0Zxc0rVyEBlavYRWzPysRwf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283194; c=relaxed/simple;
	bh=f2kzlgGHz5DJlPqLZ0PVUDZLi28fgrfy/MFPVQ25PHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ir11DAIiHJKx70vJ1DAT3BTnzMi8SIqIwouKtQqBBHRcNW6ZOYB1M1h7/09nA2CSeN1jD82A2vUTwGCh/21EptMftYZAFZS7Q5wF1yP+lE3CNZKIi0KnNVIg4P8c9g6FIsEsTthfl8M0SKZeJgVdJItG+/LHYUooPEbL1MlVrIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIgf5j6v; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIgf5j6v"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bdc607c16so7733665e9.1;
        Thu, 06 Mar 2025 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283191; x=1741887991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUrSbxsEvJj8SXyjEPV/R12/Jv2EEwFN9+C1T+zZXQc=;
        b=QIgf5j6vsISF+tJNLMZt1OVCusmRbGmBhWGEZQ9uPZGMBP82nRIEJKKT5KY96hAsRm
         1F+jmzwIu0D7iKlhgUXCf5UK+4Qb5vkxIknHG0hcIPqVfH/sT28aisnVgtG9br0A3d9M
         QeFjP8Kg7gS9mRXzB1VrUC/AObTNNBvpsJOb2bO6TpcQnpFDFaSJ6gkgVXnbnTbaPPeQ
         0XtlTQrH/cBw6Ao6VSPm43LLoDLkiejg0pAG0WNea+oFUIJ2AB+tQooPgDc9VP7xu8LA
         bZFfa4w0r6ensJCfmCiJgof602H4BOtIUkag2cvGMK/+g4xTeE/VPOeFUbXbhPfSQvp4
         DIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283191; x=1741887991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUrSbxsEvJj8SXyjEPV/R12/Jv2EEwFN9+C1T+zZXQc=;
        b=O33tlwo5zqDWsZNVA4QM4Vdbyfy2tVnDYYwV9LXRbngG7XmMs4XDNlHd7qPNwpmDef
         qBL0yh7+EKLNbdmuKENzOE9u9sQu86pDY9CX7bL+2RVkrVQfTqGW8heA0BqHvo/w+Kcp
         xluPb2X6cUY2+5ZhgLfLT+c+WPLMlf9IwfAoCr1PXHErdKLluuxfBzS+H6+0MwoR/qdl
         AyrE68Kf6mSDlMMZl7sWhp/1gwZVfAVJGiEpBBTV2ST85glm4iqCTjVUv+QF7SiMCc/v
         AWzMOTzISpgiPKrPmvLJbVPGMjgXq23PSYmzBoERdKO7aS2VU9NAlplIze0ste3rvUc7
         Oyzw==
X-Forwarded-Encrypted: i=1; AJvYcCVSajoRMEkL9Ht6QtCFzGZxwGEw80Fo+py6Vzwk0IeBcNCz81yI+PSHlK5kKxpztinsObF+8tO1jSG6DDg=@vger.kernel.org, AJvYcCVz91lnLIVRtZPOMoiUVcI/BcVNizvCi228huBuROyRo3TRpThDZ+sDD5JjTIcPXKqCQMziPgDzV1oFEfLp@vger.kernel.org, AJvYcCXERoJ05HheHrRvUf0v9Z2MTwBzx3nEyq4rkrvzytwBrXMsCwQLW+O7s6JiPkJZTsObZqotIjpwIENc@vger.kernel.org
X-Gm-Message-State: AOJu0YzakwiR1UlA/jlD6IKocvlGLf8bltV7wwMa2wWVOUPlhhTP8po1
	dR7YQ/RVWlsG4gXP2289rWy/h3wd09DOmTZ1RzAqBOU0FocdxU9h/we0UrmTjUDsw9k12AlIxMS
	0hWaT3OFKakB9RvecYMI7QGNiU5k=
X-Gm-Gg: ASbGncvIUr2AzvSCHDL+Z0aLmTLE4XKMPAExF0djd2QR+4roT9SSyc+MiYkGiKD//wO
	iMndFbxoRDCeAZaHD0hoeDHliKKJszglWVe/TkIwN12drI3/JUil5/7KGnEHr5IwOs1erDWfvBd
	ERfiHL9lCDHKGAo+2KNR5rR6/X6SI=
X-Google-Smtp-Source: AGHT+IF+Z+McyKCt0tY0iwvAfiYpK54AW+0yD8k4T9lQt6vf9W8VUA0as302U0SNTCEHO/HXH5POp/UjI8PXfQZp7/k=
X-Received: by 2002:a05:600c:1ca7:b0:43b:da57:9f5d with SMTP id
 5b1f17b1804b1-43c5a5f70b2mr4187465e9.10.1741283190646; Thu, 06 Mar 2025
 09:46:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226105615.61087-1-clamor95@gmail.com> <20250226105615.61087-2-clamor95@gmail.com>
 <hs62xcv5t6dupjelauzhytvjyosyjy2pmpk2cf53dmastma7d4@clug3pqdi734>
In-Reply-To: <hs62xcv5t6dupjelauzhytvjyosyjy2pmpk2cf53dmastma7d4@clug3pqdi734>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 6 Mar 2025 19:46:18 +0200
X-Gm-Features: AQ5f1JpvoAaBdSbBWHrxEstKgTCjrlWvxD4lWEk_9HloV5D3x9h_zS4BDs2CoWc
Message-ID: <CAPVz0n1Y59bv4-oro=KHcA21jQppHOzOfK8uC9GgMMynGpxrVQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] ARM: tegra114: complete HOST1X devices binding
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 6 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:42 Thier=
ry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Feb 26, 2025 at 12:56:10PM +0200, Svyatoslav Ryhel wrote:
> > Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  arch/arm/boot/dts/nvidia/tegra114.dtsi | 65 ++++++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
>
> It looks like we're missing device tree bindings for ISP, MSENC and
> TSEC. I didn't see those posted anywhere. Can you add them?
>

You mean schema? Yes, sure, will do.

> Thanks,
> Thierry

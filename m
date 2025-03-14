Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832338632B;
	Fri, 14 Mar 2025 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741939172; cv=none; b=r8Q4Is2qfQmQiQipztELAgEr1rbOcT2vXC0VZ9XNC0+L5D4VHrh8hI6MNZ//egUmMCxucjjQb8TL6GU5v1TVU0M0U3jSMOPscm2p1cS8+r+ta++ft9dmK0ieYGx6bhW3BveFTY5ESqzonoG13gz4ksDY3VQ58oxnPBo8ZT16pZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741939172; c=relaxed/simple;
	bh=eSMDh3ERdIC84ERtUBwJc2u7JMe/X6KRzZHxDEyyR0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2JAXgyU85ZwfwaRlTIkmu/1pZa619innIfgA0+sAAtkSe3Y6RXrLrwVjbDRMHHjfkOGi8Ai7HCm+kpCotBzNqzqc72np/kPn9Z5nF9Ug29Z2YNgqV+b462ZEynC8VQQ4nEgOFr9IYMU3t1xOsWkm4i6+/KUdjLq9+Esx1KBZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9WlClzb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9WlClzb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39149bccb69so1637071f8f.2;
        Fri, 14 Mar 2025 00:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741939169; x=1742543969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSMDh3ERdIC84ERtUBwJc2u7JMe/X6KRzZHxDEyyR0s=;
        b=i9WlClzbAl/u7cQjXBujY2jmhM02nXHIRNCf0lIq303Uc5nzcEXerqsFcYIOjnoOHf
         27z0oElVBnPUJwh3x5k9NwMdTBAby347vlIsNMwWFlCnMTGWpFSXXdoUl3vdhV5LyDXr
         NydtK6LzxMHXl6/H9VIJ6DvFLTFAsIQsmFQ3LBSUjZEUxzosaN9XkrgBV0qqr2kR6LMQ
         1K/T3rqnpLGHAjMY/XMz/pW2x4+FS5y91lZgj5UvfJaQtdCo6TQ4BgTH8rx2JBddtf6A
         egX1UpiLA4xbm23dCu9fsZcCNSeS/uk/MBJc+QfRQBzY5Q8H7J7KLBt/o8b4fVU8t9n3
         CGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939169; x=1742543969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSMDh3ERdIC84ERtUBwJc2u7JMe/X6KRzZHxDEyyR0s=;
        b=i0Uvi9F0o2Pt9Z/gOmm9zdDV4M5kmyhMyloFmdWmZvH5ywaZLvZoGEUCseNZS8TvTc
         McUhVfZKIx3YCoYDI77mamKfRAzkU+kqirEMMhv0bYabJ8nVZciQt0pF1g5S2ztkeXHT
         fsSUEIa8eAB1xCIE0Hab47yyoE/vQ55rD4awjOt01CkMSWrJ9HkVpPkLW4MQmc/C9chc
         /uTvxZsH5IZ5/Vz2hj9s2/OoXrVGlfaBNS/x2OlOP85z0LM+e0BjjQ8r3ZAoZG5hn0sM
         05vfOU8DSkRGF4WTMK8cBICAGkF4mAu6cXrOZ5IX7tvDJjwaVzYBJbiGf24Qi7h+0S/a
         dZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCVMEuLEqxx+Go59OO8y4A1P7m8LRasLrmmqhaH0b8iCYspXc4nQhn8Y/I/czNeFEeMoZXwQBBbCkEI3@vger.kernel.org, AJvYcCVfk8JAaJh8kRjrq94n2nkrtxMjymlEHeEs2Y9jh1U9VE8kM8D6cJyNV+HmRogyfETZGSuTJvMUijoY0Jq7@vger.kernel.org, AJvYcCWhsS8TZIZmB2LpKaOLlTdYoAtuzXCg0AmnyZkbB7BjCwV4nyuDc0TQWFIwyZEJ2izHOY7oBQ15a1Upxzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJbxZDf5a8ddnlMqJLr0ZgGQHcS8H7S9/0SCuCEmr3dfOeQ2M
	i+THcxY1Oez8AYg+TL4oDbVDYKTnY5cYCHIKOga0R3cX96/H039ajunNTVxyWvqHiOSzqdOggqI
	ChwB5KpA+m/xItRdeJKlOpLnfG8Y=
X-Gm-Gg: ASbGncuvybkQsB5z8cMo03weQhnxCvsMu2QEpYlWt208+2fTt7csvLbOEzEPyT/58Ma
	1f6eCuj2U2gzc4DsuhLwxsD4mu/m9H18qfSC21DBjDo086gVjGYNnXJT7i6DPRtFkyIjqrCSgXj
	w6BXZpV8re7dfLcCtiaMYLriItbm0=
X-Google-Smtp-Source: AGHT+IELlymiopQ2Wd29owWHY366XSlvhTevkuVbuARQlSX0GrzxrAB7Ac5cl62rrmw7Uqo4A4RvZrfWx5JFBhg46mE=
X-Received: by 2002:a05:6000:1547:b0:38f:4d20:4a17 with SMTP id
 ffacd0b85a97d-3971d236e68mr2073310f8f.13.1741939168608; Fri, 14 Mar 2025
 00:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314074557.16367-1-clamor95@gmail.com> <20250314074557.16367-2-clamor95@gmail.com>
 <d2c41dbd-ca11-4e06-9081-db772f8cdd2c@kernel.org>
In-Reply-To: <d2c41dbd-ca11-4e06-9081-db772f8cdd2c@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 14 Mar 2025 09:59:17 +0200
X-Gm-Features: AQ5f1JryGsFD79j83C3wkmL2lxgey5Uqi3ixk-C1jYMbfFqf2C-a64Ar9SwIIIc
Message-ID: <CAPVz0n1fNnkbfCc7-kB2RAJjDVQZU=zUBuBzqyynO54np4Wi5g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: tegra: document EPP, ISP,
 MPE and TSEC for Tegra114 and Tegra124
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 14 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:56 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 14/03/2025 08:45, Svyatoslav Ryhel wrote:
> > The current EPP, ISP and MPE schemas are largely compatible with Tegra1=
14
> > and Tegra124, requiring only minor adjustments. Additionally, the TSEC
> > schema for the Security engine, which is available from Tegra114 onward=
s,
> > is included.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
>
> Thank you.
> </form letter>
>

I kept reset-names for TSEC since it seems that it is needed, ask
Thierry Reding for more details. Else is applied.

> Best regards,
> Krzysztof

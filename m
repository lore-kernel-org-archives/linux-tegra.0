Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1490F30748A
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759153284; cv=none; b=JpGCWzpnQEx9ZVXlGg+NmlqZLRd6o05Lf64VLJeE2HBFi/9zzgsK+E8wEJF5fBkdWO4+piHfKlT3fCWrWRC4TrSIuy3jsi5oj9mGNoeoYFo/WqE9sWNokqF254qzz5Tl2UNSe9F/ngSBcCeM1flLzxNfWLfYMd4jBnDv6QXb3zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759153284; c=relaxed/simple;
	bh=5uahX3/t/qKl+AWu2lHhkUSygd0Oeo7v5srfItKOpo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVNV8qKJkN8xfXv/2FjQ9KIj6u9Qpb/TFuYaFdF5iXiqLpXZlhlyV6RhqxKK17cYNfW7+asnkQa3U7+ulNHbm3I5AolLotisjxCte13AehPXd333qWzakaZNNxUtcHIthaBYcpoyxEhT48XuOTKPC+bz9HXGXe9dKTNjFsMUN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Yfmrrfy2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yfmrrfy2"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57b7c83cc78so4498053e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759153281; x=1759758081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uahX3/t/qKl+AWu2lHhkUSygd0Oeo7v5srfItKOpo0=;
        b=Yfmrrfy2+GMnQBf9zFdyVUDEWWBk7u2IspZC66fvQ78A1OHbwndRgBelIasgsZpbpL
         Myh+TWMFO+toEbK+5IE/UW6n3CRi4rpIoKJho27gz3Yp+1um0S1UYJKGmUzyM3TRVZbX
         a4W+eNLF1Ep145PoknDbfr0oqYv5FrdInBntIkfrZ48eL2YuJnvPi81RCCPrT32tIbtO
         Tj/vuH2BUk8mCzL/Z6O9F8NOCgAq9xsg8knlI0Fea5zcpL9O1J9ZKrRG8CvXjpG62Zyw
         2mDC8jahuA1b67ayY4OTaO82SbTCBPUT4KxWBXuMIpdBMmukJervGKJwOA5gj8OtkR6C
         3GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759153281; x=1759758081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uahX3/t/qKl+AWu2lHhkUSygd0Oeo7v5srfItKOpo0=;
        b=biHfvSnktcJ/C88b4VlZ9SG0K4OC42b2XwqwNxzd7qEMD6rbFnN10q+dyAuPyqQJJn
         ZGGGNhtFen/klUOZrNOZXXZZ7QLXIac7tar/fw+ijK2l7IR537gLh/QZicNQcddo+5aj
         xN+K38xlriBSIYXoen0PI7NQmuY007M1pUGBL65qDv0glNj9Tr/sZVWIelkzyNxkKc8p
         EZmSSIgzaINK9NRgMOSGpY9e6B4QXE3x+COljWPxTFnEcnOdnEYBocC7+mVBIvafb3LO
         Qo3sZi7VAuab23d5n1CM2mFUcJXP4atwbBoC4IaHMI2dQmg65JVhSdDiyNOK2Uw5msbo
         Quww==
X-Forwarded-Encrypted: i=1; AJvYcCX5szCW4oWSgD2FhISSn3opVWRqqchg/gdYnLjGHvBk8U7/kxdniIXf3j5400vmqu/mdw+6zxxxLqmEBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNRSl3rX791QTueutapa+sGAvDozGH7T9/mwAT40h2UydxzEi2
	1Ba6oAwSYwiR3mrloF0hfyrR3krVkqhlXi71vckq7yRleAoB1C/vWJYCDruZI0U5t1HQjWt0kJY
	pbXklrZy6pBHApPRuTbpxVA6NmVYIDCNeovg4Wulch00ImSdeJFizExU=
X-Gm-Gg: ASbGnctTwsUmu/hWhAdHPTy9MxTNQCWYsuv8pTWUEf6ucD3DUzGmUO1F9les8DzMy/f
	tBCW/+Idg4+rHORkE9/AbZCZ0ygZjjpdzNh3Lo6AEnY09HDuG9/BFoal2m1nA0czDMYDFYNb0TH
	OruoSHc0WPKb+BDHDCoClwtARQwuzZ9JmoK7m7osLz4ZO7vPMwBInLBCOLlJoq3eo8NGGzzOhVH
	eo533TQ3/9dxHrsp/K6JTYFNQKqBT/4v4mcuSA=
X-Google-Smtp-Source: AGHT+IHVwcUt8n2Dr1HYLUuIj7lg91of8OCj1ZiQGHG98cWyZH+Ddd15Wdp2OohNipHuMRCcT2tzkYcUlRcdG1A1CM8=
X-Received: by 2002:a05:6512:304b:b0:57e:3273:93a7 with SMTP id
 2adb3069b0e04-589842801c8mr179708e87.21.1759153281232; Mon, 29 Sep 2025
 06:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919093627.605059-1-kkartik@nvidia.com> <20250919-undusted-distrust-ff5e2f25cdd5@spud>
 <f6c001af-bfaa-4d1a-8c32-1e2889e78650@nvidia.com>
In-Reply-To: <f6c001af-bfaa-4d1a-8c32-1e2889e78650@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Sep 2025 15:41:08 +0200
X-Gm-Features: AS18NWAjOCk1Qe6m9A7AF8f5gOU-rIzmkU9f6UFIkGdqyVsyB080HPyzY-M8DlA
Message-ID: <CAMRc=Mee9JvcOCAqQxcCMBE7gUQWvZaM=wDAfyKTG5bKyZeHTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra410 support
To: Kartik Rajput <kkartik@nvidia.com>
Cc: Conor Dooley <conor@kernel.org>, linus.walleij@linaro.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	Prathamesh Shete <pshete@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 9:24=E2=80=AFAM Kartik Rajput <kkartik@nvidia.com> =
wrote:
>
> Hi Conor,
>
> Thanks for reviewing the patch!
>
> On 19/09/25 22:44, Conor Dooley wrote:
> > On Fri, Sep 19, 2025 at 03:06:26PM +0530, Kartik Rajput wrote:
> >> From: Prathamesh Shete <pshete@nvidia.com>
> >>
> >> Add the port definitions for the main GPIO controller found on
> >> Tegra410.
> >>
> >> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> >> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> >> ---
> >
> > Why are you modifying a binding header for devicetree when the driver
> > only appear to grow acpi support?
> >
>
> Although Tegra410 is ACPI-only and does not require a new compatible stri=
ng,
> we chose to add the GPIO port definitions to the DT binding header to sta=
y
> consistent with previous Tegra SoCs.
>
> Thanks,
> Kartik
>

Hi!

The kernel policy is not to add symbols nobody is using. Please drop them.

Bartosz

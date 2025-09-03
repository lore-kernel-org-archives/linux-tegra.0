Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2582D660D
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882553; cv=none; b=pCTlP2ClefOA+Me6l2QcQXKV8ql+OoFAVcHgS9hwRoRxlXSbiSgQrCpN0hwzEjD370D2v1uJK8VxLZ+zHgcRLS79iVqba6VV0rPpyuzYGsEs1YZWeO2t3nAQ2A6z1qmzOhS3juFYOcGZNrliVPGuk08gNCpqHscsmzf8Y4BVU4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882553; c=relaxed/simple;
	bh=IDpAPdDZzSrb50R42xhvKngU2V5A6SF5b3FmEOfvqg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJaReqxytKwGjB9QRW3z8/LLOAUTWUOOz5EbEQu0DbBuAuVWfnfz9gKcn6S2/spkSOCd+A104i+ZNUuJ7/VuXR8vY6xxnhMvbZz2slp9uBcH6Ghmon4Ae+0ejMSPmVgpn6hlinhkTWZtcrIah7DXBV96ZG625YZLdMy0iCn2jF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3rFveK/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3rFveK/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5608d792558so108905e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 02 Sep 2025 23:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756882549; x=1757487349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3izdWZnZsKRsTL0QdhHG4QsyOhmQjAte3ln1Hvsa9JM=;
        b=s3rFveK/DerufccgV308IX5ZL1EQTpNBvnv2OoPrVxGVnnw70gcoUAIIue6AKS6gLd
         RjIdQCf6Szjbh2cdtMWczIRM9TQps8MJQnaH/skYZDAjwIHNc4eQRj/pfYN54Z8HrPOH
         liDihFO+YGHGavpIBo5sD1GB/OicAG8pSXBPPGANOXEDe9aXxpClBM4/Y1jPZcwUg/3w
         5HRIQJIe1B2JJ6eW/Rx5m8jMrXF84mT1dwpjwOyjeJM+4eJbm/oUmcN8tdeLWAe9KjqN
         ak69+AvDyAKtWAK4GM5odv/j0RDQqPNiFupTLVZTbuSeiy2wQCtrFAntyOTXW4a3dMx3
         9bLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882549; x=1757487349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3izdWZnZsKRsTL0QdhHG4QsyOhmQjAte3ln1Hvsa9JM=;
        b=UA8t2eSZg2MoQUuFNZQsiZ+cEWuxduu6G65GvSsGxTFCcNkGDkfzYbVVjTVOvVHVlZ
         bNQuT84o0/GwsuTNJBXx6usy7dmTGc4wPntxi4UO8Vx/hT+CCHiDbMD8RI13uBroSh/l
         0uWSA0sYvmOTohJ+EvWmPgyvwSnvjKi8P+MTyxuQNP99YngIxeq8QQCwYsTpnEUhfZ5O
         i46KcImCNSoFIC6oudSkEDTndDAKk/zRrsYhiKHM7rT78EfBB6vMmz+OGXJh/0hNXOSe
         jtpe5lpfuI21BJCZmg/Mb91ruZDx86QVBOOFRK0ubebTtvnFJA1Ju0wmDP95Yj0MR+ma
         93vw==
X-Forwarded-Encrypted: i=1; AJvYcCX3zjKWtA2plHkPf/Bp8Xd6tQYsi1ClVOCEytYRFLugTlq3kAhqI/h5FtVhIdTVPW9RlSijEguyUnIIWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/HXkEQqpyzOJUMl7AROzSxUmLJYm/zLlRR3eLi0UlfzU+Q+5
	kg2nsSZMm+7uMXQo4NDWUjUPw9NApZTVR5YdZ0QKyZxe9Pxir2Ba8o5voNAP0JVAk4f2lSaP+4t
	fxBIgHzUxxSBT9/luMJa7MoOkAB7sgPFS7TOR/cE01w==
X-Gm-Gg: ASbGnctm+6a3B680WxufdcGpbHrStM+FpnT3iAdFwXnbsmWM4+aLF/OFXVfRRvWqkjN
	cU8kSZbTGkNCJb7lBVZGgPtR22y9dwIs0WulsJT57a40vonItD7gmzWxlHxONlDl6dlvtJ0E9J+
	m8qFOB+9Cu4q8kBxOK1AfzsHszUAX7+tQBpGQiUeKHfwODw6JDGOpYNB0t58snVSRHp/G1EDEcG
	uy21io=
X-Google-Smtp-Source: AGHT+IEmLx7loP9ZecOZBO3528SSI/yRm+MhYRdfiMwPjoy+KPrBG8249IPqTCwY1GOtN0xl5pEKKGRDKB/zlEGXKBU=
X-Received: by 2002:a05:6512:2392:b0:55f:6e87:10c1 with SMTP id
 2adb3069b0e04-55f708db54amr4348155e87.35.1756882549501; Tue, 02 Sep 2025
 23:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
 <CACRpkdb=U=h5OguMuy9G6avCCN6Aem=2_60C+_uBsrY+UvD5ng@mail.gmail.com> <CALHNRZ-dRvaN_SyHRfAsq2MO-ec8rzkeCy6CtJpYdWTobf1-Wg@mail.gmail.com>
In-Reply-To: <CALHNRZ-dRvaN_SyHRfAsq2MO-ec8rzkeCy6CtJpYdWTobf1-Wg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Sep 2025 08:55:37 +0200
X-Gm-Features: Ac12FXzeaQco56Y2RwPUQv74y9to5SIPZF1IYZUjwIRBuYrEJbptpSe99KCxkJ0
Message-ID: <CACRpkdb46OwzNQuSp0+QQVjy2LojMyhdE7XrNwdsyqGi5okASw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 6:54=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com> =
wrote:
> On Tue, Aug 19, 2025 at 6:30=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > On Tue, Aug 12, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > > This series adds support for Tegra186 pin control, based on a downstr=
eam
> > > driver, updated to match the existing Tegra194 driver.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > (...)
> > > Aaron Kling (3):
> > >       dt-bindings: pinctrl: Document Tegra186 pin controllers
> > >       pinctrl: tegra: Add Tegra186 pinmux driver
> >
> > These two applied to the pin control git tree.
>
> On patch 3, Mikko noted that I accidentally amended the formatting
> changes intended for patch 2 into patch 3. Linus, since you've already
> picked this up to your tree, is it too late to fix this properly in a
> new revision? It doesn't appear to have made it to the main tree yet.
> Or do I need to send in a fixup?

It's one of the first drivers I merged with plenty of other stuff on top
so I can't amend it, just send a fixup based on my "devel" branch
(or linux-next, it should work too).

Yours,
Linus Walleij

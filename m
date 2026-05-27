Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C4E2F2917
	for <linux-tegra@vger.kernel.org>; Wed, 27 May 2026 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883770; cv=none; b=mxeCh3eW31XIa/a0JK2bOZLUlbHeZ2S2sVxXKWRutX1RHm+9qinsjjILnEisI7cK7vnuniWVKJ18uUPO0spsqdd0Rh37+WaDtGPovCONDoBYlcrwAIOOHYanGxbHKdQF6+lRUvdCmx21pC/e27l9UQVFXoqAGijIPKx3ptXMC38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883770; c=relaxed/simple;
	bh=48xVH2ydHUSzkmkXtFg8FJeaKVTBONbp/dt4isx7Ht4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxiEwzUCrSTY8gwxZ0pggone4/sqD2WUU8cMNYLA2T8aXLYJGrcla7A5pBAGnvxL3frbmLNl+HZO17xnFQhoJ/mJKHKJAI/BUVN3Jw7ocBoehrxEXmB9MDu9J4qozMEGBpfGnYLvI/WqFoz+wtZXs9iyb0QFm7AGxlzjxepWllo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5mCvAEx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5mCvAEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A00B1F000E9
	for <linux-tegra@vger.kernel.org>; Wed, 27 May 2026 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883768;
	bh=FTXkfOnDfFOTWvqRAuPOSVt2uty57HoIgjltwQPQoFU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W5mCvAExioPbWSMpLlS3cvZsX7FL3JLnM+jz3Gk+fGVT7DTto9l83tyjB0duJy551
	 +Anm+McoL+ATRFuUtLadwR1CsMzLdBxCv05X2cIrCGFvYqHE353aq1RNyRJHgVoMzA
	 RsQ++1+GvgUqx5Vv/78rZmdhAidJ3vJwUcKgbNI7DkQzISaU3irxdiif7O53VdJWPH
	 C/Po1imBk6IA1ue96Ey5plTHIjuyoYd9S4HR1cgC/72rTodU/vaav/F/V7lXRCOwbD
	 ZU3AFJ2bZ64+w9/QhItakKgFy5rJ20BOVGols+ecb88EDQC9lE9LypHft95fwjk6iF
	 7K+L4oahe3BAA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393a49d2e5eso99521001fa.2
        for <linux-tegra@vger.kernel.org>; Wed, 27 May 2026 05:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+FhNh6H1dLLBJgG0ndmpThWeQya7eM310t2uQzsjBiPR0hSv2LnYohBlzDcO7bWeU882xnL/CcmKLgSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVAqDGC9M7Bu87UpB4m8HiZdJKi6f9sJDjPOP4o14WIZmYBe6
	F5fDJsNu2VJau+qJNr4bgo+RV6qNS/0nmLbqTLr/Az1pJV2rfTo6K567qW4bfAFkmiOIfIwNRwQ
	ZvhrQf8w1/pzIgIV3+1UhOGsCDhBJxvk=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:8825:15fc with SMTP id
 2adb3069b0e04-5aa3238ba06mr8164473e87.3.1779883767164; Wed, 27 May 2026
 05:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427134231.531222-1-pshete@nvidia.com>
In-Reply-To: <20260427134231.531222-1-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:09:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLknF3oSMC3=FJ_RK-xwW5p26BcjiG6BGivrjRoqTRrKAQ@mail.gmail.com>
X-Gm-Features: AVHnY4K8_P6is2XDE_AI6bl-s0O8Bgg55Zzg51voovFh3rgPjMzEXLxRnfzrlGk
Message-ID: <CAD++jLknF3oSMC3=FJ_RK-xwW5p26BcjiG6BGivrjRoqTRrKAQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add Tegra238 and Tegra264 pinctrl support
To: pshete@nvidia.com
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, webgeek1234@gmail.com, 
	rosenp@gmail.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 3:43=E2=80=AFPM <pshete@nvidia.com> wrote:

> From: Prathamesh Shete <pshete@nvidia.com>
>
> Add pinctrl driver support for Tegra238 and Tegra264 along with the
> corresponding device tree binding documentation. Additionally, export
> tegra_pinctrl_probe() to allow the drivers to be built as loadable module=
s.
(...)
> Prathamesh Shete (6):
>   pinctrl: tegra: Export tegra_pinctrl_probe()
>   dt-bindings: pinctrl: Document Tegra238 pin controllers
>   pinctrl: tegra: Add Tegra238 pinmux driver
>   dt-bindings: pinctrl: Document Tegra264 pin controllers
>   pinctrl: tegra: Add Tegra264 pinmux driver

These 5 patches applied to the pinctrl tree.

>   arm64: tegra: Add pinctrl nodes for Tegra264

Please funnel this through the SoC tree.

Sorry for taking so long, trying to use korgalore
and manage to screw things up for myself...

Yours,
Linus Walleij

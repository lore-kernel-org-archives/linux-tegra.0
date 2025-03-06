Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8992C25DB00;
	Thu,  6 Mar 2025 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283739; cv=none; b=LB5KqqB0eNn53DJy0PL+lB1/gMDoNFi9EkxIEo7QIcbtD5uvMxboDFlt21/Qyz4PWCFf3aSmdeCKcaqCC2GDI17VS9AGTQkzsq8RAepxP/96XOx0IkhZv/Y558NW+/PL/Wb78aMYeiVVNo2iMX9W/Zh6VEh7s4uU6RSPpbzizyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283739; c=relaxed/simple;
	bh=ampQ0rIBf2EETxl6f/tmHqX/PEyW/3273HsO0GsaKDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlQ/I8caWm+ZWJbBIOtDosIZGSmAXeP//aIjySXZWYBSITSHCrScvgWu7pE3S/NZ7/glCg3Qj2K+OvL6BnNfNR81M7kGUD7Wh6DUa0NmzKxqXQWr8nsgZBcDpzfGtYfNFPAPH02Ks+K1uQJMtA6PR5sFaQR1b+daIMNuUGEy2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfYsM9Zy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfYsM9Zy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43690d4605dso6493985e9.0;
        Thu, 06 Mar 2025 09:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283736; x=1741888536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2jK7newG5AZ9QVlYtUitgfkCRoTX3ft3lgm0HqIdJg=;
        b=nfYsM9Zy2bh8JA4PAxN+dEAZczN5B3pX70UBz2EjhCMm0LtgVy9KDNNRs/+0OwaLsy
         77kiUo3th7ZZRI7IhlWkiJtpuDvMoboJ6QkFJ+7t2MZVCewqmr7mtI0euLSvz6zji+TU
         LgJb31znYwUJ1GYVkkVKWYvx8dwPeeYbKP8MHEoFdNAu66DM/QXMTQnSPX/irBKCjuCQ
         sUQih1nMLdiBliC95zMQM+A1JqFwgQ7QvHiBnce7hfIvdQbls9YDGkON0PMbq3j7NEkA
         haNe3/3SPeY4ecpCdIEsSiHaPdzRECR7xzVimL2RpDpmXZ4WvR3pZ+RnsATIiC9XW6sS
         p45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283736; x=1741888536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2jK7newG5AZ9QVlYtUitgfkCRoTX3ft3lgm0HqIdJg=;
        b=Lqm8I0Rvb5ecMbQ/ErU7wF8aUYqzQjZaZyIgw+Z50Lh00uSoDUnHRQrO/QCS0x1JfQ
         43AQxYxsV7n12XLcW3/uh58EphuSO/X/xA9iz2qHEACvixrTzAcf3rcPdkmW6IzLpzw0
         TYHy4fQy8KX/0/aKdN1rfjMOKGNhYopXbc5Gk6PdE5NJ1pra10uDziVfX8BwEuf/mc5Y
         UXRf06Sboqp9lqydRcCkKWHdY4+9DN29uHc3mhTIa4DZSYs9t5X/ldRGB7MxZEKLaoR8
         tyVDmHNbhNd9hnncHy1me/1AymeD1tEFM1b3PiZNT4a+Sq02QMMUkraaalvsOAjOpdkk
         IUpg==
X-Forwarded-Encrypted: i=1; AJvYcCU2SsHBxZyavBh7EsQAAECZ8V1qFl5iiSKebYIRRqCDhdvjlzkgqP4yOEDFjww2t7EIM7SlDPVWHK8P2tA4@vger.kernel.org, AJvYcCVMawL6WdTB749b18kzjaiwOrghSXA9ZZ67M310qsmMXH5nfhnhgIfE5tck2G7DDxOM5pjUnU/W97/s@vger.kernel.org, AJvYcCWUOg9+E4Ai5oVK5L9htTVlqYVLn/d/6R/So9bUuoKKprsR1gwbm/VhB6fA60e4Gp8fTkMn6Wde8X7f6Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YytkSgdTZD6EstvLOOCD+96uPPgp/sWzEN/cQME07TktJiem5NR
	WVJ1fzIzlmQZ5snsXPWE7uryWFSmTix87GpMreMgzRTxwVc5CJ7WORR3CWmOneTHr2SHkFRk934
	EiuJ2EWYQ/W0JEvRR2ERXOnaGTjflCw==
X-Gm-Gg: ASbGncti0g6mfCljZlcaj1Pyc5BIcpOOzHIp2+vjMtMUsssrbsUjnBvc1+nyKln/9X7
	jQGNNVt6TuC6xVAHRrZk5rNHczKEyx9o41t749YqQXHbgVYTwVoQ02aDBGY5EgiXpPveJJbFcju
	szbLOhEwtWB9bZjhSUH+6uRNWKiro=
X-Google-Smtp-Source: AGHT+IEmFdjAJvNaYRLsydOqGHRNa9C6b1mG2aYQlAjPLT3b2CAjb19sj7VxgfMs1rbXnJM3xFAD7tLRp18iu0w0PSI=
X-Received: by 2002:a05:600c:45cc:b0:43b:ccfe:eee5 with SMTP id
 5b1f17b1804b1-43c601e188bmr3272745e9.17.1741283735774; Thu, 06 Mar 2025
 09:55:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226105615.61087-1-clamor95@gmail.com> <20250226105615.61087-5-clamor95@gmail.com>
 <kzwr2feo6i653nniemd6omjmdpo5ukqdfcmc5gjik2cyopvoyx@7ua6a3tb7sz4>
In-Reply-To: <kzwr2feo6i653nniemd6omjmdpo5ukqdfcmc5gjik2cyopvoyx@7ua6a3tb7sz4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 6 Mar 2025 19:55:23 +0200
X-Gm-Features: AQ5f1Jp3tQ8fShm0wa8eKlRZJcE5h6JYsjpr1SXdQKeX17Or7Xic0wviB3300mM
Message-ID: <CAPVz0n2oRD_iWeNUEAsRjT2SVzo9SntR8Cbu2gJEOMTUOngJ2w@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] ARM: tegra114: add HDA node
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 6 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:54 Thier=
ry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Feb 26, 2025 at 12:56:13PM +0200, Svyatoslav Ryhel wrote:
> > Add HDA device binding.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  arch/arm/boot/dts/nvidia/tegra114.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
>
> The nvidia,tegra114-hda compatible string doesn't exist in the bindings
> yet, but I've applied this for now and added a patch to the Tegra tree
> that adds the compatible string.
>

Do I need to add binding adjustment in v2 of this patchset?

> Thierry

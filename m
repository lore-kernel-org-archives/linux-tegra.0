Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F61E5B78;
	Fri, 18 Jul 2025 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830290; cv=none; b=BHULgEoM1vZoMxgiwaYMy3rfVrY30+wCBFY9onTBRH93lmCPTVezinfjvvaS9FJUSrJc4mXTVKXvcM0dN1sKYFsNISIbidHWWpv79L5Ff8v9i17KdAPHeSSB8yfJLOTVtxPW4Dq+oDcJ/i5boCQj6mO5DdHJ2EY8xa7UgAU67lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830290; c=relaxed/simple;
	bh=P3ZbYFiMmEF+RkmwjaVtahoeFJtX/k+oqwr7ySQJAIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTy1wt/q/GGIE6NKlS9QBKFIeQ00jr0EmHXdjtnTFwuR1plPRmtTMSnULJzWOAg8k777QFtJ7Jlk/kFJZUL+bfjyu+iuYP4wBQhsb8zKm5juj2T6M6z2BZUQi3udl25tc2RpIUHWYW2ctS7jzQkTRubxnFYEsEI5sfi0KPPE9EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J562/NZZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J562/NZZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d3f72391so17948055e9.3;
        Fri, 18 Jul 2025 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752830286; x=1753435086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txHiNEgzLT/qSl4OZgY8NqRe0t4qidcOPq+VdRZOPkE=;
        b=J562/NZZSwnC8liKrVf2GPVKOuw9dI62pN5qUIrKi3pYk4T8ytNWz7bb5Tjd4NjBmy
         6TT/d3rJLTL0ReUWrEi7/hpuh44/vO8utseOR9cFmx+ZZ4+lMbpdqdmDzwPNPu5THLiV
         JZ3ybNWj8m7HSAcDVJSkzn/Slk9LeRkfRoF+1ILsTa2eqKhGMQS8ponlRFRLjGcliAKD
         vy88TjPz4TOWGKPokDgG23MG2Ck5/rw5rUlswgxGt4tqP2P3Yn12L/5LFV/oUiZ9UZRQ
         9/HFb5r8lldr3LWbDOK9l5N1x1Z7UHNCF/USolPY4cyHz9PTGXXEJ62fYTWQ5OLooRjZ
         qE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830286; x=1753435086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txHiNEgzLT/qSl4OZgY8NqRe0t4qidcOPq+VdRZOPkE=;
        b=KsoAh5oUgFKV+jW/pNvfhrhTk+uLiwfsqVYjMwDl+VEjl5/RzApbsSf81MF4I/GmFO
         q0coPrphdzaOlG0BxwYwwrUVgWfdFm1goVjpUQjEDCpSPm00qVxJp4KhWOKHTIbw4BYC
         kwBdMJrgjd8EDqjQlId11uMgEdz3ll9+xBNwWR9R5dY16yxMkDcYMVSL51gvgvNTe5RX
         jhOaDakdXg1AgRoC6BZVd/2g4g0heFw/KtMBqsTR9PxGOdDrd9L65DCYl+F3dvEcerYV
         MPQNQS8OE9ICfPwg7mavRM353rvsngIRNUNc1b2Wi8Si9K8XTYC+GJChgefrBDqm+TZN
         mU0g==
X-Forwarded-Encrypted: i=1; AJvYcCU+4DJo4RHs1r2kH2oPtzHVE72xO2lhv0uVfXkdhAc8PB/iJJguvfmjVNp9u65DHyFHfcK1wOsSFxQR@vger.kernel.org, AJvYcCUXq0GLYRU0HvvQXeo5MRmhrsZTtC87PyuXLl/pIJZfTFd66oLRdq6AQ9Mu8VUSxsUgBkC3OWmUpTZJLdQ=@vger.kernel.org, AJvYcCWJEo/S64AxqVcNXgKLFKRg1S7N0/bzYFqd8d7vBlpBCJAv/mzRt3j9u429VyQLamdtf1ioOYstKpD6+1I6@vger.kernel.org, AJvYcCWh0rtNAaepKEZAVzjuryXRf+5mIl75hhKZUgosECb/Igm2CGgKs7X68w46ECUSrTj/adjBVwLn61ng@vger.kernel.org
X-Gm-Message-State: AOJu0Yxesg/eA7eepubFw60l5hC78Pv04blT9z8avsUXxCGYAp+DKY6t
	i6uOIfRx3WTxGB3KEsb1CcYqhmmwDqhiM9xSCtPdZ0vnx6vyhr6QAIoWn8UVt0CP+3FYzlvue5v
	bTynvXUctA8ZXZbGClAfswgabvMgEp1E=
X-Gm-Gg: ASbGncvKtNLyrgzuFrjaMS67bVxabqG8FBoTLmg3i1qq1wpbl4MpcgNNeMy3riLCSvU
	HmDL+KD7TrwVIvTx1yMel0On8IItvztFnVpCup60TFUDpW/tS7xkF0eX0/J9wQXv/VEiSqdPJRx
	/OZl6yseya3XQDWOB33qCYpN9DFFqKJu2vIKIpBtOAMWQcuhv7/Z1wTx1ZxpcxcbgaoQeOqfRYl
	S2Yt2R7
X-Google-Smtp-Source: AGHT+IFZ8wMKIx/E8isGBLpDzTPqGmr8RwNbZDlMMF40PNFijmWy4bBhyf8VmTn9JDl/xhNB1IGk3vhk8pOYlQo2rAs=
X-Received: by 2002:a05:600c:4f85:b0:44a:b478:1387 with SMTP id
 5b1f17b1804b1-4562e39b996mr115055915e9.17.1752830285977; Fri, 18 Jul 2025
 02:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717142139.57621-1-clamor95@gmail.com> <20250717142139.57621-4-clamor95@gmail.com>
 <5474709.5fSG56mABF@senjougahara>
In-Reply-To: <5474709.5fSG56mABF@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Jul 2025 12:17:54 +0300
X-Gm-Features: Ac12FXwkiKFiGNrvrcZRa65PO2Me53wmAzQtfzYTCB6B1QYpAjOt5b9oveZCdW0
Message-ID: <CAPVz0n1TxOb_hKgKYTdeJ=Ka0STqfiHLtwAv+Ws=vtq=G-MAow@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI
 calibration logic
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:11 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > ...
> > @@ -311,6 +330,43 @@ int tegra_mipi_finish_calibration(struct
> > tegra_mipi_device *device) }
> >  EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> >
> > +static int tegra20_mipi_calibration(struct tegra_mipi_device *device)
> > +{
> > +     struct tegra_mipi *mipi =3D device->mipi;
> > +     const struct tegra_mipi_soc *soc =3D mipi->soc;
> > +     u32 value;
> > +     int err;
> > +
> > +     err =3D clk_enable(mipi->csi_clk);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     mutex_lock(&mipi->lock);
> > +
> > +     value =3D MIPI_CAL_CONFIG_TERMOS(soc->termos);
> > +     tegra_mipi_writel(mipi, value, CSI_CILA_MIPI_CAL_CONFIG);
> > +
> > +     value =3D MIPI_CAL_CONFIG_TERMOS(soc->termos);
> > +     tegra_mipi_writel(mipi, value, CSI_CILB_MIPI_CAL_CONFIG);
> > +
> > +     value =3D MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> > +             MIPI_CAL_CONFIG_HSPUOS(soc->hspuos);
> > +     tegra_mipi_writel(mipi, value, CSI_DSI_MIPI_CAL_CONFIG);
> > +
> > +     value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> > +             MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> > +     tegra_mipi_writel(mipi, value, CSI_MIPIBIAS_PAD_CONFIG);
> > +
> > +     tegra_mipi_writel(mipi, 0x0, CSI_CIL_PAD_CONFIG);
> > +
> > +     mutex_unlock(&mipi->lock);
> > +
> > +     clk_disable(mipi->csi_clk);
> > +     clk_disable(mipi->clk);
> > +
> > +     return 0;
> > +}
> > +
>
> Where does this sequence come from? It looks a bit strange to me, since i=
t
> doesn't trigger calibration at all. It would be useful to mention the sou=
rce
> in the commit message.
>
> Mikko

Downstream nvidia sources, 3.1.10 and 3.4, dsi driver, function
tegra_dsi_pad_calibration

>
>
>

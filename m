Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567C225765;
	Wed, 26 Feb 2025 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583701; cv=none; b=ArIAiMU50ohKX30H5CcwuMraIaqDJ8f2NCS3vDatYAhPkx4ZRjdjRvvFrAdhec7Bce6t7pXIb6sbJ8thxoyNoRbaV6v2qiSdKOCIm1KccD8gv4zzTIJCqBfSFjuIX484B20M3lkK2bnNJJBMVBvgqOO+xjSDHXanctd+PeZwrYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583701; c=relaxed/simple;
	bh=zTxeGIRw7OHDygnCZSmMfmz6WRG2HM2bMn3JZySEUE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jirbst7zmKFa6mat32aiS/qmWw089OJwr2AcSD60NWqZnOxzzSkaHvTSK915lYoggQkOugPhoDsXigjzRXnLWI6nxR0YQYfxjHNuk8o8ntww0PDPQyZoXxZqPhXkx8I1Qq5sfi5P1UTc3h97TvunSpAj12dHnxqFaHHWDZeBJPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B++7VAH5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B++7VAH5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f406e9f80so6303397f8f.2;
        Wed, 26 Feb 2025 07:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740583697; x=1741188497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuGqDoxQ783XMsm/02hGJVXL6doll4p+2l07PIFfL9k=;
        b=B++7VAH5LlYeVJUsTtA+kOl4fy8hNwvSPiwkSsMcwYrfpQ2H1RzaSCJDr+WSG46FAl
         5otAHmzsIKH8MYPNiri5u7ipuF05C0GQ+5tzwSLwx3Oonj+Zw6ZvNmZIdIQttVrEBFy6
         /0CGi88CS6WuR8h9h5Um4VS32pg030M/ElNCkPFLqBjpzNUFxr3tEut2f2vO+JTtUl8X
         AwD2vVaQ6lE0TIrgyqnOgGxGoAGZ23IArlMUUWGxTmGnoMaZ9ilIyES2uTRxyZs5/m3+
         K55/iX/9xk2h+agNMBH+0dvsWspPrQkeVOMPzWM0W7C/MIoOz79rekWFF1gzjohur3kB
         079Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583697; x=1741188497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VuGqDoxQ783XMsm/02hGJVXL6doll4p+2l07PIFfL9k=;
        b=wuHuU43YvUzBH20lFV8VlJE2e3oWm83UoeXahwfPsAAgeXj/odX8EjZsisWrDgPXOI
         o26CUvXIlXgN+RQgpBUjIcP5kYQdVoF673uMNVy5Q6ZMIb1DTBO1iLYL/1wxG2YHhhBc
         AiF8pz6Dv6wNaRPOhKMsqw93tKnIuQ2PAoZvHf9PmD2ldeK3omS8zgMip2AYkOQAaYHr
         7yE8DN7U30jjznI9B9G6w+GWsoX4eIGDDEUvR4CeVpY94efkXSzedzmZAABiSESYJRFe
         n4eXqoD0n40cyDzY35qTfAU7WamrVyUxBg5L53YAcGeZUZpcyIoF+g8dhAePVHP4+swC
         HVkg==
X-Forwarded-Encrypted: i=1; AJvYcCUoF678nK/KjCxplZDNvC+XpydYEk2deiKbaLE/eeHFh9luiZgUtpJCCg8wYtegAhytuEwW9XLIM3jV@vger.kernel.org, AJvYcCVHm3SFBosczfbXUW2TcobOn7E4Q/B6pYkzYFnHUl5Grr+8A1UR2C8G2GQTeyjuFwiszvAw7quY10di@vger.kernel.org, AJvYcCWH4XEgjTiPtRgVVYB0zLUr/9PJ6ydreDZkeE+Odlq/Loars9FZF/nMk5HLqYII2Iq6T29afZfkBV22GpFJ@vger.kernel.org, AJvYcCXs0piygpXIx/rCjSnOGlDy7gxXjIn1pyFzeb2HVcy3q/n8hSCKNQUterhwtLOPwTr+CR6RdPc6C+WioL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWEwQlmSIDvpXjnZY9R+EBItE1nGht0znvyRUNSd5iO1jIHjkx
	UBEaq/hgrjXtsiV1oEWKYfUiOqbXUCqVYqC2tLrGh3aB38DLKbXOO/db7IBmweVtJT+2aA8ij+i
	jK7InqAk7ntnbjcBFJdIybevdDlHgMw==
X-Gm-Gg: ASbGncsuAkcCBL1CzhRGfL8y6EO3aU8bKbsmKMiJSEg7L9Eh1bsv5m7IkqtjApQVNIW
	9qcsdTOqBh9R3eFwej7xDK26kyfIfgg8QF0em8f85NSxuyxBBd0Rh733ltksFMPhSvkp7ewQMXy
	KG5E5OyreA
X-Google-Smtp-Source: AGHT+IE9iHkHtYre0Ww/O4P+hlZGUD9J0QPDn4LLcjjxgY8uho2r6TLAdxKxuw2+gHuEbXVzJp8f86byyYPZ21gkhxw=
X-Received: by 2002:a05:6000:1f8b:b0:38d:ca55:76c3 with SMTP id
 ffacd0b85a97d-390d4f37710mr2967095f8f.11.1740583697332; Wed, 26 Feb 2025
 07:28:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225143501.68966-1-clamor95@gmail.com> <20250225143501.68966-7-clamor95@gmail.com>
 <20250226151529.GA2338510-robh@kernel.org>
In-Reply-To: <20250226151529.GA2338510-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 26 Feb 2025 17:28:05 +0200
X-Gm-Features: AQ5f1JpfBmrEsWDEnmea28rAEDuFMtgEmxwSmG_wRDVyVb7z4GOiUoWN5URcBDs
Message-ID: <CAPVz0n2rOuskKRTbmoFUJQb6ZFJ_nDESJMNE_iio=EsHWqZ4Og@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] dt-bindings: memory: Document Tegra114 External
 Memory Controller
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Georgi Djakov <djakov@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 26 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:15 Rob =
Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 25, 2025 at 04:34:58PM +0200, Svyatoslav Ryhel wrote:
> > Document External Memory Controller found in the Tegra 4 SoC.
>
> This all looks very close to tegra124. Could have missed something, but
> I see 1 property difference and 'nvidia,emc-configuration' is slightly
> different. I'd just add tegra114 to the existing schema. For
> 'nvidia,emc-configuration', I would just list the range for the length.
> It's just a list of magic register values, so we can't really do any
> validation of it. And I don't care what register is which entry. If you
> really want to document that, then keep the existing list and put 0
> value entries for any registers that don't exist on tegra114 and put new
> registers on the end of the list.
>

You are totally correct, my first intention was to reuse tegra124
schema, but I did not knew how to handle the timing list correctly.
Tegra114 version does not have one of the entries in that list. I have
tried to use condition to define additional entry but yaml check
continued to complain. Maybe you can show an example where similar
situation is resolved? Thank you.

> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../nvidia,tegra114-emc.yaml                  | 431 ++++++++++++++++++
> >  1 file changed, 431 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/memory-controller=
s/nvidia,tegra114-emc.yaml

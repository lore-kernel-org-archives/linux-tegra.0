Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7300B30499A
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772438564; cv=pass; b=pgHLqvoFZnNks8jU+dW9jnrucaIKD0C9sHyA+fTbqR+IwjNAdSVfHG3CUqzxfN/OIUK912BKKh5wKNKi4cXEiTUBWtzSOqeD4OreSCH/YXpvWQoLFBiQtkYqA0aWKSEw9mnXzScLHb0OJUX3tf3SvOIEMbZ/cn4IGpmYVO1yF6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772438564; c=relaxed/simple;
	bh=vjkn4ApR2SwjC9QQbFTj/Obyb525qHPBGoJ4zOPSnPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmRNa2ruXT/AepgxYMvcv4Co3zvWx7mWpbVBw9G5Pmyonm5ldXLIGnqY5FYX+TvWo5uyRytUeGmBCWy9Y8pejMmPqyb0ssTFKncJKp6cNoEhecb3UtrByIEtvMy6YYG9TKw0a40oR8HubW4QxPNasw8neJFC+DZ4Cimu9NbAqEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9CNzJY7; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9CNzJY7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43991064db8so4276419f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 02 Mar 2026 00:02:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772438562; cv=none;
        d=google.com; s=arc-20240605;
        b=lzXOa0coYJXx3mI1XytZkEfxTwur2w6gcunH6V1Ku6HDgZa4qvCaIm2y7kfHCEKhUl
         ogmUEo10tlrz7SmxJ+c+yufcYHBpY/DuHfZKfrDAOPYywQVUgdR2vcS186NcUzzRCNVC
         G361joxvkcTCVgz/XUH0QyNVfu/aAnowEAEpnK7VLsPnUNVi85NQd16YX5prm2hG+Mfu
         2dKC8SOPAGQ0OFE0p+buZtxlUz6u25OZHQcBAAB5vcjGXz6DmK5LN4DRvUE7BddAyJ/8
         0PZcgB4eMqaFh88jeRG6a1Rm1nVslVU+N+4TqYTQhObHAi4C5V7SJXPt1DOBoxUJ9UvL
         kvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H6APRDcRhUjIkR+M3BFPhhG/NfjMrz+PATN7/PzHvm8=;
        fh=oxq0sd5Qr7hvxqGqXctXnzZKMsEJ2c9Zjmt8yz/EYjQ=;
        b=W5rLG6Wd1NJn1WDZ0JuEhIViUzvMFIAymjeAVCqN18TfnrsAlE466u53TNM94ZPeRb
         DZuwcgWHJh3/EHJFNzd2Oj5PkkMkamgM0cCAkF3juCm7jBbbSupCQGhDnvoym405aLms
         zI9R5n9HaukwIu8bM6ekkn2sY7H9kLSN0bCbTVV23F2NgZ6tJKzTOZhIhVoaHFJ8am1O
         rqRS3XdDqTVydLdkABUjYZ8ITcRvdQddtygaGRwCyzEHR0dHSdHU+FkbFk2CWmODyRG/
         Q6YZsvZC3nTjNZ37pVwsBLkEswbBLoaTS0GtHNDVK41jU3MnWkesBE+lPjL3W5ieY40j
         GqJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772438562; x=1773043362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6APRDcRhUjIkR+M3BFPhhG/NfjMrz+PATN7/PzHvm8=;
        b=j9CNzJY7UuNEHg0M+XIAyq8fqv2gsARtv0EBXfE5pR6JiLkoMF797zSQoCM8fZUay2
         JbJh+9OVeBuMYBQHO4I4nDL4NQZaX8Mob833Cz4ggHEG206+q/rFieMBUO0w9nSKYYUN
         in5+cc1VU3oVoopVW45IcGgCOnH5PdEMSx83ESMkkYnVfH4U/RV9IKuGR8r/TblCf3/y
         EOrH5d/Z2z0cfGV2WQbi0M13QmT+kqNyhBeLxRyJoXRVbi/3SPzeWn5oleIRmKmY7Juo
         f89ywFr/lEBJLps4KRwBQAinHtFv9iWWQseh8GGVXXNqStgUe7tiIAwvjthGvBgGb5VZ
         1Uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772438562; x=1773043362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H6APRDcRhUjIkR+M3BFPhhG/NfjMrz+PATN7/PzHvm8=;
        b=kddsH8uNGSlwuYjVySD4S+JR0lUVgcIYvWNGCmMZz3yApq30LrT4EucmFNUE6aHejQ
         OvjSadFf/dhcygoqs396v6DifWY52nh1UdxKRjwGT8POD32agWS5L37/srMULEV3xqbz
         lEpLsrOg7GTb7kiZc9ZRSxfewyrWGNMSUhfn5gb94nsNgFG+RlSuENX3fGDA7MtUsabH
         t66oxgP54Bb4Yhi+524UqoBqcorO8cQznNlrmDc9ooLzmgTmJU8mXqGNO+zYxlMe375X
         T0YyzEO9BErOTtESsJ1zC7kL9SuL9v6lflFMoCCiWZ5bP/xg7TKLpIumhRDmQub4dQ22
         hiSw==
X-Forwarded-Encrypted: i=1; AJvYcCXuZI2qhGepNW6oPCmKhKZZObiTCaNz71zRRk4bo3Xkhur/MFHGx9KAuJ8nGT8ydMpmA0DUy4sjAdqqDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpUd6QjN/wXy87N+u70CwSiqHWWHdmQRJ27NLBsOh6nnxwmrCE
	t0b5JMN9BUbPLb57HzK91cV3q78PjNXUwmPa4jsEX4V3+qFDzsRXPKDARrp/eZVUm2rrPfjNolD
	ZtxmyoZnh7qwEi5mkhnDGKNntDoeqeSo=
X-Gm-Gg: ATEYQzzkV53OG/BGk491PZo7ZugLgzAugL/L3Ht0oaWOwKgOgcFDkz0UFreujfmpLRw
	9A2vdra8TmXbutcH7cpQE7cU9hifkxpWrEZRXlmPJzLqSABnHd/vZCCIhOqNcqIv79sGfbRkgJU
	2YcdsKFrd4lOaqu2H/VjP62aIvQdbFf9Jh8ZQo9cJ9q9iJihxt1CrJoor2cyqLYMfn88PcU3BgD
	DxRWlNzOp9bX6d7aLFJed4t3PEOpiV6HokuLVLbSU7+iKxojFNR8xtyFQSGxVq71eEZt7ejWzJz
	xC6F/tCkzizqb4Tbyjo=
X-Received: by 2002:a5d:584d:0:b0:437:67fd:ef5c with SMTP id
 ffacd0b85a97d-4399dddc7efmr22120608f8f.8.1772438561482; Mon, 02 Mar 2026
 00:02:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828055104.8073-1-clamor95@gmail.com> <tdknls7jieu4ple3qhmdqntllmctks2auxhxzynwjjmgl3hnx2@nubqlzpgohwf>
 <da8aa4c5-4aa0-42f6-acb6-55d37cc29774@linaro.org> <amc5e3sffmwqguivwch6b5vtmlgu5dlwxm7bsrn6nd3rllbvxg@koqmavn6uuy5>
In-Reply-To: <amc5e3sffmwqguivwch6b5vtmlgu5dlwxm7bsrn6nd3rllbvxg@koqmavn6uuy5>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 10:02:29 +0200
X-Gm-Features: AaiRm53AlW0Vs5liTlfz2qko8M0ob5L9wn1q8gJB9M2tLSanbYjxsAX2ISoySnw
Message-ID: <CAPVz0n1XMpnetG6JKhTLMxW3WNSSAV0Sr52KrZc=Frt=fmSKYA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] thermal: tegra: add SOCTHERM support for Tegra114
To: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 12 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 13:27 Thie=
rry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Sep 11, 2025 at 08:56:12PM +0200, Daniel Lezcano wrote:
> > On 11/09/2025 18:27, Thierry Reding wrote:
> > > On Thu, Aug 28, 2025 at 08:50:58AM +0300, Svyatoslav Ryhel wrote:
> > > > SOCTHERM is thermal sensor and thermal throttling controller found =
in Tegra
> > > > SoC starting from Tegra114. Existing Tegra124 setup is mostly compa=
tible
> > > > with Tegra114 and needs only a few slight adjustmets of fuse calibr=
ation
> > > > process.
> > > >
> > > > ---
> > > > Changes in v2:
> > > > - no changes, resend.
> > > >
> > > > Changes in v3:
> > > > - expanded desciption of "thermal: tegra: soctherm-fuse: parametriz=
e
> > > >    configuration further" commit
> > > > - changes title of "thermal: tegra: soctherm-fuse: parametrize
> > > >    configuration further" to "thermal: tegra: soctherm-fuse: prepar=
e
> > > >    calibration for Tegra114 support"
> > > > - Tegra11x > Tegra114 and Tegra12x > Tegra124
> > > > - ft and cp shift bits dropped
> > > > - clarified tegra114 precision
> > > > - lower_precision > use_lower_precision
> > > > - nominal calibration ft and cp hardcoded into SoC specific structu=
res
> > > > - added tegra114-soctherm header into dt-bindings
> > > >
> > > > Changes in v4:
> > > > - fixed Tegra124/132/210 cp mask
> > > > - dropped TEGRA114_SOCTHERM_SENSOR_NUM from header
> > > > - TEGRA_SOCTHERM_THROT_LEVEL_ made SoC specific
> > > > - adjusted soctherm node and inclusions in tegra114.dtsi
> > > > - dropped use_lower_presision and nominal_calib_cp options
> > > >
> > > > Changes in v5:
> > > > - fixed CPU and GPU hotspot offset values
> > > > - added static_assert()s to assert the TEGRA114_* and TEGRA124_*
> > > >    counterparts are equal
> > > > ---
> > > >
> > > > Svyatoslav Ryhel (6):
> > > >    soc: tegra: fuse: add Tegra114 nvmem cells and fuse lookups
> > > >    dt-bindings: thermal: Document Tegra114 SOCTHERM Thermal Managem=
ent
> > > >      System
> > > >    thermal: tegra: soctherm-fuse: prepare calibration for Tegra114
> > > >      support
> > > >    dt-bindings: thermal: add Tegra114 soctherm header
> > > >    thermal: tegra: add Tegra114 specific SOCTHERM driver
> > > >    ARM: tegra: Add SOCTHERM support on Tegra114
> > >
> > > Hi Daniel,
> > >
> > > there's a build-time dependency on patch 4 in both patches 5 and 6. D=
o
> > > you want to pick up patches 2-5 from this series and I pick up patch =
1
> > > and hold off on applying patch 6 until after the merge window? We cou=
ld
> > > also do a shared branch, but it may not be worth the extra hassle.
> >
> > I can take the patches 2-5. Regarding a shared branch or wait for the n=
ext
> > version, I would prefer the latter
>
> Alright, let's do it that way. I've picked up patch 1. If you take
> patches 2-5 now I'll pick up patch 6 once v6.18-rc1 has released.
>

Hello Thierry!

Patch 6 "ARM: tegra: Add SOCTHERM support on Tegra114" adding thermal
sensor nodes to tegra114 tree was not picked, may you please pick it
or should I resend this
patch?

Best regards,
Svyatoslav R.

> Thanks,
> Thierry

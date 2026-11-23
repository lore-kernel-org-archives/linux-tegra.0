Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436984;
	b=dQmZuMCauVUnsivdGq/bxUBXfloj9SBEAZimVP+9Rcmrfqw8qhbK2EBX8w1FxK2bG1Z1
	 116yTuovZdiCN1d+AmhzaRub003YZhPQyeFcsD4pOipd18R/n+aoCclbpsLcTdLoq+DCX
	 ifGwhjSbHx20/RBi1aeOF74QBx96Sh4waT/nol72FV4X5uh4D0njQ7j08WMPqfo1U32Wb
	 Qk0+wzzXzZ8SfqyaR4qB7fOTUHfLQlZ/UuOQsqiY6WHz6/eHvy3D2giuG6fJr5/S5uomN
	 33abpVacF/n4Of6JQJlVfHsWS3SltzH6DlS/jLjR1rXSkwEhnDnrObVGEsjtc+FcDjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
	b=31fLxwNpV3Dp5R2tA2WlSfS1GgAbJFrHKeHJpvm200TLIo738w2rBIzPdiW/I6Wr2AsP
	 S21ee4zJ9x7t92i+blIlY4QdDN2/QbRXyGqb9o5FTBDPuRgJ99HAP3A83YJ2Mxc1f9rTp
	 /I9CrF1NHnch6MgimTS9j6YhCzhdoQbkeqQV6Zlvj7SfZh6RcL2Z+YFYj5Jr9PcywP/u3
	 GzCxZ8WLnh4l+rpg9jcmUMviTwnonXJhea4JbcvmAb1C1srS3SYcDqP8zdrjHyOOv7Eow
	 fClYUf1CcxO8hW3O7l9TlhUuTrZ6OBYlMx7ZQ0vxJQUZVj6RVSZM+TQP6wVbT13aB9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGHjuIpH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9706606A31F
	for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2026 12:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9706606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGHjuIpH
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380b40312e2so7811981eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2026 04:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436983; cv=none;
        d=google.com; s=arc-20260327;
        b=MsH9h+v9D8W7wGIA32yQ+l6p/9ByhXBQsDRuYReizDjMYy5PwUrnfS0BwehNuJk7HO
         mm113dydlcwOGORcJcnLI8FvVvlEyyGt2QnVsB+BpO6AkS3/nhVUhMiWdVcoXc+HeUJs
         aPOibyFamQmVsA0VHNJIpKeKhPVuwmN9ysruhsLfdXUrRtbZahCRU+Er0YgVDcAWmPF4
         KYAghW8rVSZRh3xQdnGKzQsCaTqXtGO4L0iMA1treww0uAn89wAvDr/ldJNScPDPceii
         /L+GSs73f82ISkmRK6SJ+8wmMeb2B2+o0eU1eP4wqEDBB2ysPNM3wP4dwcUpzdeLssTV
         7VyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
        fh=WC8qm3xUEPf3v+fBsbWokJGLV13ku6H5KGkfWudeN8Q=;
        b=ci61OY+XNZTueYWHc2bxiHzbnggrcWn74z5gXLQWUoqMW0ENXo3QBlpfsQkpK+APjL
         IXyyglXr52DB6MBqFnYI/iEjrpwKFubS9G5+d/wDtBd9JZNYSZDbBwBhwBGiNyIoa/Qs
         4Y6mlIzcNuRgGsy7iuilrucnpAqLZGcddByXeV7F4QKCG2CNtR1nz15CkDj/NKrCEwfx
         QvzlSICZTyJXrKLwlWz5PBWVassYdJ6/lnxYTLXtnqnOEUX8ore+4T99Nq9iRF0iKIOw
         XDYHpgiQLV276mkhbIjcTM5TheZExnh8iXFaiWgmNEqviRjM3ChqDOO0XeR9lm/yXavI
         8I5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436983; x=1796041783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
        b=BGHjuIpHKx1HmZeK4dAx1dqiNlSjkCcoIWx2fVvjB5cchTDfvhJ912m0xoDTR2SVJx
         3sx0IyYFcmXLHbLBpSfugKiXFSDAZmn/8ccDNz0OaI9SNYR25/fIhnZsoJxS1y0cgiUl
         91FUUtgiT66UoTBLIc7l84l+bVGYYMWvomsVYXclcdTZnugp5VNVOyCs1poFTBTsPTDt
         OUEDN3njepH95rBYr/ETQoXcPjwlZGKAL1JPd5OGXB3xJV2T+tLV5pLNBn/B6PnB+aZz
         4pwkDVmP1CJH0AUcCLZAfLLFjxRqPBEAfWmGhayayLNX+HHslD+Th/QbJ+Ix0MPMIb2i
         PXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436983; x=1796041783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
        b=LYlRafsvVlJ8REmmLoKGEzkJCbxJZ+SVovhY12pXuT7Lsj8SMQfvMgtQ5cKnGI7GsJ
         fiMGEFNEikWJgtbiq451geiw6KjFE1BNd7b/FQnXoIOSL7Yyo60cKHmoJ08B0vDaWlbu
         NchI0I4b5Ai7m4SdTD4/f5EH8Ju8WyiudRoIJGRX3OdC9GXDvRKs9UerMK0Pe9C2WE2b
         kh8CcZzC9+cle34vRdNQvKpgTSa20QbbjSw0BbUNsAii4HPYYWnussvMb7dbuHFdrl3r
         DnKiMo5PyhplFzpK5WEFVd6BhiHvn3fTQ9Ta0AAu1DNDP5Wmt0LfvtfffKEGASjADYvy
         FiJQ==
X-Forwarded-Encrypted: i=1; AL+hErGxXZkM9dQUvlaGP9Erbw4WndP5nZ4k00Vscmp10euB4sV+LBToxk0iEWPhCDE1f5z7tRgbOrMaOXNaQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z92WofbOZDfYv8sU8QmjehjP/6xLmQeRuAqHHqYkT4X2cSboaSr
	6q3itw8V1D9RsoOKvk4Wtgnuk6QZGwlJet04fZbPAEdh7ZRi7ykmtOHKGqGLzztcXDUOaGwZUwM
	ZThSr4j3hAnuejOAbCmS/lboNxhHAG3o=
X-Gm-Gg: AZFdTZcKFdHE7Cqzpr0E+5y7w3F5iT/al0vJ8ysdo8qi2fokBpXPPnJg6yQiky3HW8E
	cfdr4x3GiOOfx59mIvxOakUOBgFUNRGq08DfQc+sNeTWkh3vur/hIxgi8WmhJRRQRjTTcdICWkE
	/X1e/Vy5+V4zFULxfpPx+TDCPOiE+XldDf9+jGQUwe8yGxhA+xFymqHVF+PCpf6XqArmcWSbDIs
	N01J9UaRnRabhf14/AEBCiLTFulWVusK4ENQnqe9dcdf0yPg8fwHBKwIVqfvfQieltDfIkM9rXy
	HeT9M1PaE6hE7rj3ZndyWO+REwT2fsJ8lt2jlNXLNpjVyTXLLYV5Q38SxUNdAQd/xKpy7cCpy/3
	j2DKGcmdnw79juzpZDI++/dvPrsNIoDX/bgHhq5FNwiMywjGmSIC+TKrCMXxAECURt/IhwHAtjL
	EEZnRS8H5UKUpd/IG2w9J+H1zz6LCk3g==
X-Received: by 2002:a05:7301:416:b0:356:7ddb:2e54 with SMTP id
 5a478bee46e88-38570f27b33mr12240392eec.29.1795436982705; Mon, 23 Nov 2026
 04:29:42 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123100228.77797-1-clamor95@gmail.com>
In-Reply-To: <20261123100228.77797-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 14:29:31 +0200
X-Gm-Features: Aa3M54qdKM7FZvWtT8WQZcdWMo3hSwhK3iAkQqlt8iIEs-0xQqheq2rc7TEhDHk
Message-ID: <CAPVz0n0r7NTVwhWwkWNv21Fjy_pjmWiN+N4HbC0x0++-nOxF9g@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: tegra: Add support for mono channel to
 Tegra20/Tegra30 I2S DAIs
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:0=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> According to the TRM, both Tegra20 and Tegra30 I2S should be able to
> support a mono channel for non-DSP formats, while the number of channels
> for the DSP (FSYNC) format should remain restricted to a minimum of two
> for Tegra30+.
>
> Implement support for mono audio by adjusting the I2S clock and divider
> calculation logic for both Tegra20 and Tegra30+.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
> I2S clock calculations were adjusted to match those found in downstream
> sources for Tegra20 up to Tegra124. This change was tested on the LG
> Optimus Vu (P895), and sound was consistent with both mono and dual
> channels, with no distortion.
> ---
>  sound/soc/tegra/tegra20_i2s.c | 21 ++++++++++++++++-----
>  sound/soc/tegra/tegra30_i2s.c | 31 +++++++++++++++++++++----------
>  2 files changed, 37 insertions(+), 15 deletions(-)
>

This seems to be unneeded, additionally, according to downstream
tegra20 i2s format does not support mono channel. Sorry for
disturbing.

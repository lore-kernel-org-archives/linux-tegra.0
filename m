Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3F984A53
	for <linux-tegra@vger.kernel.org>; Fri,  9 Feb 2024 19:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707505323; cv=none; b=JcOz69qpcZDTWRyqzFcjsigHQ31qWQdHCM+Awh4jQvUROUQSZzZZ9z4R8U/kcGswvhC/jyH2VJR9kJ1e0Ap/3J/sEwSxcLX9KN5IM5S+ceyVExiFT5VNN/5/uTU5CbbcHOtNhr1k/apChytGIX+mivj0ockKsyTh20IlBoktg20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707505323; c=relaxed/simple;
	bh=r2GAPlcgJGDaQINPFrlt1R7Ny0c1Ad/P9P2yI23KbDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqG0u1KMfdl3xgenPygO8EQ6EDLz1Jq3yycN/lzblg9FMaZ78r9qF1q49Dz64+J9S2jy8GGVy28ta7T3c0Kv7t88f2F/QL52tx6mGr1fjPMcUVSHkPTaSmEGBPlhV3Grqyw7rnOSIjDe6njYGFwGC0NjFlXHjz/A3BBmA/oLXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com; spf=none smtp.mailfrom=soleen.com; dkim=fail (0-bit key) header.d=soleen.com header.i=@soleen.com header.b=YrISHW17 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=soleen.com header.i=@soleen.com header.b="YrISHW17"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42a0ba5098bso7797491cf.0
        for <linux-tegra@vger.kernel.org>; Fri, 09 Feb 2024 11:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1707505321; x=1708110121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2GAPlcgJGDaQINPFrlt1R7Ny0c1Ad/P9P2yI23KbDE=;
        b=YrISHW17lCS/ho4//b4p9TqA8m5OjeuDgKDgXz2T9RvjLqJMDjuxgIo0sijLNlnvbw
         vlbxBsbVIkA1cbwtLh9in9xFo1B4OsJA0GK8KZWWdHvOBSe5wPtvUL146w7QRZY9MQGr
         NEW5JhuUvu2EeSXDCMubEXBxZWE+NnF6BbEMvRNFUugYnfCRkJrf80B6e9HDwpGNXcsU
         PKEXQrVV6iloQuodAuf5jDgLu7zt+VWUHsH4xY31Z4+MZkdqqrszFzl1HE58BU0sqGjE
         XjYLaGRX9jwOCKgEY1Q8HKkMLe12wEj+BgZXxmorOV5bUdfuVgOPnV2+qch5gHTJV4g5
         u0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707505321; x=1708110121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2GAPlcgJGDaQINPFrlt1R7Ny0c1Ad/P9P2yI23KbDE=;
        b=KnjSi9RPtX/iywnp7TGvmjjwbx8XbKaci5GRi3YjUWL8c7fjg9lgMQRzOJs/UZ/X3T
         SfAuWbJZfGJK7mJFxb+oMKUI9rdH0k3Pua+tzDEtbXdgOPMcMafEMgIbJzNy3sPPtwsW
         ZlXRU6IVU2K3igJjMMB9MVLmpRoA4uBcN0ibJ7qId9kaIluO5kbrusqb5iu+NSkNBD6n
         rB49e3RPNH/YbcRtpMMmGiZzhnDBAyxgk/ey39RUVHbAUv0hkNmxNlC3SDygOPd9xekk
         uHy79t4ixgfUyvrioMCxKn2Gj7EsLzp6YyfgzqG62OMNVdyzT9nVYZN2483UvLQacXra
         0fkg==
X-Gm-Message-State: AOJu0Yyid5keKOf0kUwstE4bUPDbggvyulQQGqu9l0ijiMPNXu8gmFxe
	nTECPB7eh9T+LQfaTUyW1sdjVtHyyY6BMaCtQw5TW0qoQz3sM77tgEXfy/oVfsZaRvw/geSb9ct
	IWM0hEs6UDwh5vj8YRlgRhE5s8LOB4TRzDwLHoQ==
X-Google-Smtp-Source: AGHT+IH7/mZBjs2EjvojqcpcvFrKDkqXbLzePQwHXjWI3pjuKzeuKKYp6aDXpqli+cr6MKqGXO43wFaJScoTxBnZMCE=
X-Received: by 2002:ac8:5e51:0:b0:42c:5f0e:6411 with SMTP id
 i17-20020ac85e51000000b0042c5f0e6411mr85445qtx.25.1707505320844; Fri, 09 Feb
 2024 11:02:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207174102.1486130-1-pasha.tatashin@soleen.com>
 <20240207174102.1486130-8-pasha.tatashin@soleen.com> <2718393.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <2718393.mvXUDI8C0e@jernej-laptop>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 9 Feb 2024 14:01:24 -0500
Message-ID: <CA+CK2bBqzd4imzKxGJVUn3SkvDBPk_=CLA1Fm05kz3DqSE2gpA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] iommu/sun50i: use page allocation function
 provided by iommu-pages.h
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jonathanh@nvidia.com, joro@8bytes.org, 
	krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
	rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev, thierry.reding@gmail.com, 
	tj@kernel.org, tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com, rientjes@google.com, 
	bagasdotme@gmail.com, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 5:55=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec@=
gmail.com> wrote:
>
> Dne sreda, 07. februar 2024 ob 18:40:59 CET je Pasha Tatashin napisal(a):
> > Convert iommu/sun50i-iommu.c to use the new page allocation functions
> > provided in iommu-pages.h.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Acked-by: David Rientjes <rientjes@google.com>
> > Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thank you,
Pasha

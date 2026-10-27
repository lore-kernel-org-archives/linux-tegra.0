Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793126696;
	b=gCfMfC3vL/RmhK5bjw3aMbK8u8d3jIaqPn6aeHrGWTTRsqCYEk4dFmZQyVvxnkUxBiA2
	 0md8nlhuiaFZdWbAo1Q35jNG6mua2u6kru4lbo3dkwf7qUBXR/8CTNQGlW4bfsI3tU9Jj
	 B+UQcTWcraPrNGW2Ki7Mt40qeJ7l+JjYRkStAZgDiYMua5IfYQIxyYHK9OEfjaJdA3I8a
	 NlbUvI4Ttq2ATIuWbkAUZwtkJhTfM46wQbxhpg1LFGu40We2aUvPhum9TLIWRiLbITsG/
	 RK4MBVuwg94QhZquU9GFyNmZ1zIiGiOLR6ppDiNjGpIs4lcK0+aHWHLwDbrZBve6OFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
	b=eaFpRkeAk1qUjUAOEdJA6ZZmkQDkOWTqv1m+LFzeKzSUyUo9v6ios8E4P9y2o2CkjzBL
	 lt5oO9FvDlCxIWvJDEGxU1x3qE/r+u31nhZwu1rWFF7UWAyGhbQFxbkNmBi/7KS6EYgvL
	 5UZU/t1+y/fj2xoQ5XqPekmOImw9iKzpfYOa8StGqSloovMbnZmDBQX7IvAbhK3ABbVx7
	 GcGSNDntQhEF2Lv0srekAilVv7U1RmdEC4n6Ern8601WQfL+Ogq2OCqXfqO5ZiiGhWfjX
	 ikhoCSELF/s1k91mdVQueSSO7oY/5LtoBAQm8+VbL55J9iwRlQGHQM++fTgkNpx17Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZ9Tmw7X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB01606A31E
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 18:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB01606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZ9Tmw7X
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso333010eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 11:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793126695; cv=none;
        d=google.com; s=arc-20260327;
        b=CJbkDATjtNaTnkmULKny0Bov0qIN28ZeNzCOAWkJn+QEQwKnWGXU4ezJJEobAAM8UE
         PtBO0BZ2iSk1gaK/CGMJgh4Olv622h96c3Uwkeu/oruR9KH0/vAGE+4mpd1xSdHMLd3G
         9ijSNSNglbxljwJiJ0W5o0kqCTy2Hd7QYKf4DpMF35rMF4v3aCsL4VsGU2EUORalbTOH
         XOcpxMdD556+CTCOQnMAlEK4zp3ayjPBS99S3RB5iPExcPcOTQFeaTELrV/aL+h7mFoB
         tQ/fkBdelJe7RGW5Oq5BvpwZeYBNyL4PDYJ2Ozc7cjGVa/+vw8mPbhn04I6ezJgDodhn
         9hig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        fh=RYymoO9G4BbUmdzBkbu4tKrZxOuwHBm92zvKIM/aBvA=;
        b=F7f8pp9CZ3iYSfEc6NCvzLOSh9q4kbTrPeQUxlyNSMhYmpyJhTVC1zmYhxe0Jv/7CD
         WNq43es7CIpJ5KYEuwz3eDwKBMrh3RpWEpA2UYNf/tmJdlAifBPXxlJmbCbTc7AFVKL/
         rROCNtqNuzYXgstyBwk3jPeyoZVBXPuMFYWIPfYHb1Nw9XUJ1gY8AxOTVbk7CQROheVV
         Sq+zchRRhCj1EKkpOySAnAIABuAajRdBNVNCKnQXxCEr4DUZrUw1bl4QTvb8g9W7fc7p
         L1ArV6IFHKOx0CyfdipA8zZCh8BkZxVjGtn/BxVYgwK/7MligZipuJ3iCyUWdfai9rQM
         8EBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126695; x=1793731495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        b=RZ9Tmw7X9onYeXIfmAJ7wd3QPCdcDBD4paScJ30dfXx3BWGyoV/6iQVFuzt/zccTjD
         /R35Yw+g8tOlNVl9zG9vBSMJgjxM/01FiXo4i4OMwmfBWTkYxrwCTYp23TJhNnIZrNUl
         5Td6Blf2bHUxOSbtHInNeN2TmSkk/7hRDPWcbGC29dn8i2aJUskeIehrHrFKYXyCVFqa
         ChvsxSNNwMjawkbG0F8uJ6EhS+Ro7P32dpB1Tr1pYwVglEU/MTXh2lSmWArCdzF1Ufqs
         8fXSzdJJ/apgn4X+SdnXZz/JC0H46gG4PTYJHNOcuPBLOwpeR4FONKL3Vf8zqXYbDJsv
         Ym1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126695; x=1793731495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        b=h9v1gMmbzPJauzbJpL6nne2ia4Q0ATdoQja4sZF+H8brunr3rHakMZBeufhgfAVPUN
         8KlfvaI6rjsuV1GUVb2X8ULLY5cZqrJSGFCR3bw6IglPefXLxadlU8Cr5qdQhjh694p1
         urcgxes1eawXZrKVUrdnbnc3bbfHubalrZpDG0EPVUYFMxzhsrnDIgmvXa7AANaJazOQ
         MCmohdl+oDaYh/D4DhtjYb4r7brXQqgEDhiviz9OAqXfpJnLbZnIfk3J3PbVYeLqkWDr
         WXqzYIRco0TBB/nzQrCWoM7tj8w6lozVmf0wlVLyesawDkht1mXmhbvzeaUyM8HcExDH
         TZyg==
X-Forwarded-Encrypted: i=1; AKwUvBz7+qLSLjDhG3aGHZ0FfSbYv79IxXb5RREqMQphqe5K+hDoF9a3EsfSNLf1w3N9mpaSIqZZsrTIrL88DA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKQpFJAcbtf1ZpFN3D4h6qUG4b6Sp6CnLg5IW55NWDoWKshvDVv
	3d5W6198Ds4T1kgCXbGsAi3iZNo/ssXIEUvrYhrOLpayliaaw6S+BJnkSJLiWWPXNZ+QZCl2j/H
	65v+hNbnKvufbbqO+Gkp0JCNNGRUMLYJuXw==
X-Gm-Gg: AYBFou395u82L1eZxfPKbAK2+dnbkxO3UNOxwk9QDvpVhTW1bOzMXlMVA/3ujFkf04n
	XSDCuwMqaRF2y0ad/my7vKJmqiGrfj7DpYJZQkai6j3gQ8kgzVDbYcNq3OwP4/cEi+1H3p1nUyB
	QEQb6zgphFj+X54QX3OxlfngyUDwEmHmdHhPNYcztWeJY9hODNsDpipJVImcJtPCrHX8bQA0dHB
	M+35oAK7L0QaA7XwrTxE8EiGuHmnAVuUBPj+P3XDQ0vRODGddyK4Z2B9UoqKE+oBsKcTDViql3D
	b4JCveGjveF+PWvwoT+orfS4V4/hjBlT/rr4pR5XZtTBuYU/dQUFUPEnUpqzY4JYqiwB0ZI5T4X
	ggMwDslFlJp4K4Pawzc3K1xeM4/aPYKMS1Y+XuwbE4SCUg6fYOMveCeGNuXruaoHcK4kvi9NOOf
	jrkh2W+JBXe923VS0=
X-Received: by 2002:a05:7300:c88:b0:369:eec1:1d7e with SMTP id
 5a478bee46e88-36a2011245fmr748593eec.11.1793126695515; Tue, 27 Oct 2026
 11:44:55 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027120019.93611-1-clamor95@gmail.com> <20261027120019.93611-6-clamor95@gmail.com>
 <179312433904.199157.3178610408209114840.b4-review@b4>
In-Reply-To: <179312433904.199157.3178610408209114840.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 20:44:44 +0200
X-Gm-Features: AclHuK9YRoKNp7VL85UdMjrZOorWmZTdr54Qmc8Jf3CO54OLWmTMK4fUeFsGC7k
Message-ID: <CAPVz0n3MXT7_h6_REqcyayC_qyi9xXLNUjJLPzeyACFipr=TMA@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update
 #sound-dai-cells property
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
	Leon Romanovsky <leon@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > The Wolfson Microelectronics WM8994 codec provides three DAI cells.
>
> >    '#sound-dai-cells':
> > -    const: 0
> > +    const: 1
>
> We have existing Exynos users which are validated with 0, this will break
> validation for them.
>

Yes, sorry, it should be enum [0, 1] my bad, I will update in v2.

> --
> Mark Brown <broonie@kernel.org>

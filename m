Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793354590;
	b=xHs60HhlwvS5f582V2yr12jQ44ugghsQQSRNhG+KBM+t1Y35VhkUKsfE/E3i8Xh6VKLy
	 Pxx3UtsmpEvtMQe68WEvMzqXN7L4/nflrVbZhvWchW8K25jmvdyuSMGDEG8XkiLEPxK96
	 NS+vEbWJBw46pru9SYKN6mCLagRL8K1s77GfRlLc40T8pNIqDZ6dNalmGIGRloVYmy1n2
	 59CQO6AmdpzTRVvv+G5E9i1FIVa6OIEypYrT/PTSCYhdUTyL0dLBFjk9oQ/P3aI5c1qF0
	 UAP8MhzAR4AKFx/wu2hGKHb8TvmIr0JEZFcK63pxVIPUUYJfTq8BhXXvzrrzNpU7k7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
	b=0wOriXdm0KuzrttQbYaVlYZ0kc4i9MWVLBR0fc0ZntR2KxHpgyY+H3O7wIcG5ZtWFyLZ
	 Ey4iN4IUqb4dtUlWt05Ow8khvU394iV11/yBm2kp6FuYqpkmjpXNTprcoeUg+qImSLEn9
	 7Kai2PGn7D3kxX4snTEDMcdw3h9JVWAcSJIJs0nWJ/UgmyT5tBwOE26bToGQe1A3AOhYR
	 +IIHnCUjCO/HlQeF98I6efMM2qkpOkaEYLxKNR4qJqRFv2wvum/AVXr7XC0OyCjz2LpNB
	 xillAWjKpZVFpwWc6mTfjl0GYBcGNUpj0ZuOm5jh9wuGdBsySxfIvKhn/4luaAWPjMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cB8b/Y4X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB989606A31D
	for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 10:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB989606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cB8b/Y4X
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so876060eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 03:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793354584; cv=none;
        d=google.com; s=arc-20260327;
        b=kXqXJL4mbN20B526AMsh3unSd3oHQjaBgGOT0UEgddYpNxAX/VHClk+dmZsnU7Q9J1
         T1/tJqBb5aOoFEztyb9slOOa9v+P3piRfTLWy8ZuTok8CnvFuTK94578uL+7WvLtAVSI
         CcHPnfGAAVmDyhDwguls6WAkNgGA1Xxaqfc5Xtjh5OECOFFtI+lNPyhUE07BeOT7O7jK
         0AUqCKfDOOOlJGSyxq3WtDrgSZ9glZEYSjUBjEYzqiCoqzxekFf6pfrXUwXtEHkvFayM
         insB1kDzfm/+B5tzXUtCNFrHMKXLoKQvJh1jzzIRdgpM9dthL/pW7DZo9DP9KrNePfq9
         90KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
        fh=AuiP4p59DW+yJY/oevo6Ust8+pLJiw8mrJ9jTDplIHE=;
        b=IbKCtAVj84G2vk10I3Kbgtm/p8USm3UQvPcSICfTck3UobDlmd2mb4wsVsBpG9Z2EE
         fNv+/0g203C4vb9MbSe/hAesqGGexu9+LncosS8Au0o9kszFTd+Cukg45RszgNEdhOkD
         3TtywrsY3ujpqy/Co/2aHSttqf5i3w83d1OWz7bfamt2WQpJcnxaS7xk+Chj1wb4z1dz
         uib+e5SCpBwNErANGyr82fQn9qD0WysAWwj/wX79fLKJrTXaZn+gjDfbSI5ajAWXpk2s
         sqYRRe2rii/glJSXRH/BfgA1iOP21b6SDCqxwTUwwTJ0O3vpH18CKfF0xsudLKz6mivU
         /ddw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793354584; x=1793959384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
        b=cB8b/Y4XBoH3d2mx1sKiFkgaIGdUg99+DVWd6+3nB/DQsr2antbnO9ny4/huLEhgov
         Rf9CehR+G8CfFq3vJ0jU8Np1ZHQq76IRStPZKG87lVuSp2aJRS3C7zyg23jT0pOmjdnI
         m4lGlbvP4/pA/QI9+VZPsnacGVzR/MrGJckQALCnxrencrKpDaYfoK4KVRpsW4tUUNR/
         lBCkiGaNhBRqia8LQw8w7iU/nZUVnmTu9wj2MCEdLrnmVpW9eZtWaPG4y/4lkZ9WrG8I
         Te/8SKLCspInB6mhw+Q1vVwQ1Tkc37Ot2UaWEhI1xfCJCJB1E1wU0WYPJVnjTIMhc/K5
         oEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354584; x=1793959384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
        b=i92tnq4GWLK60KzghL0dyAPXEZw983NLbybhp4BdOdBetcEEf1vtTShG5cx+KUQtMt
         R3ueSWNgSE1HTOdALZc3f9Eq//n4MKVjro0y+EqsbXbVkByl8RQVcXVEBgqtq1hzVyZY
         ZBW2UNd+BO8CHVs+Zt0w+gPyvPONRVZJ4k8mTiRjBIT1/KyBuYq6euUIQJapi1nycfM2
         pkKfR5C5qr+CanBChnm4gct/ynJbQJUwCKx5aTMVBZ4k+UlleZh4YC6rRPBiDtfz3doL
         fe73/bKDJGECGSBivApob64u42gWvjo19Q/2ie6lK475UxzZokIqcjgh+iRdJ0dG/9CC
         uGnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTM3NzhoLWhl1KlU1j4w0h4mqHmU/MltGHxFBTJ4Sb7wHp3RHCtA7jW/hbzaLK+i20/b09+f+23q8PVw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUSKjYY3QARTMjbrT+2e09UiffA6dQmqRlUT8LF+eJITaZDMlb
	msvhz4aoc0Hycouvy7+BvRUkzdHRjykGDCxNJwxXFizyzurdWFXIFkxaRQKo7Cvcp+VqydSzX55
	ptLCokpdmMQK7/sPf7IHXbifrp3PNnZE=
X-Gm-Gg: AYBFou36PYe5TkUSECgkdHWmqnhMMezhQMca6DFZBpN6LSVHm7rigHUALUxasHsjSPq
	UQAbh/zyqXbbAEw7L5SpLketswwLho9768jnb02Sdd9XUQMY8obsoDqkRmwah+2v35/l19G1aEF
	jxN/2YH0jozEcKNRIjLiNDT1HtAaL5YexKsDTnqGppgDpx2aaObNFd/xuoTG1UviOhBMfrM938C
	Wq0mlgVay0svTajCnFzgxqOI+BM8DLT5jUKSEQdwtp3bl2uuGrbf8VF3SNwEL0C5fGxyPBaXtSG
	7xjUshyT/NtxRSKVZ+5QKI0kHNePpAb9r4YX6Du2jqV46meHlgTCYffLW3HOjo54F1fXzzX+VNz
	6L9ceBL3vsgZ4Y5t1YJ9QnZAha3o77LECg1uLGGWd8Nikrx7omy0cQ2h/6VIw/p+HNYBz2w==
X-Received: by 2002:a05:7300:1897:b0:361:167c:2364 with SMTP id
 5a478bee46e88-36a42362348mr4001559eec.8.1793354583867; Fri, 30 Oct 2026
 03:03:03 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029152909.234584-1-clamor95@gmail.com> <20261029152909.234584-2-clamor95@gmail.com>
 <auRjGM7briuvXDEg@houat> <CAPVz0n2=sgbzBfvhGOoRFXeOzKDvs9en7QD0pHc31r5GzgCsKA@mail.gmail.com>
 <auRoaHUqMO4BRQlk@houat>
In-Reply-To: <auRoaHUqMO4BRQlk@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 30 Oct 2026 12:02:52 +0200
X-Gm-Features: AclHuK-L_bH3_AEz9gXr-D-fUGtxDSP6rDxMoUG2ElKY1BLDMKdvYmD62gCTKCI
Message-ID: <CAPVz0n3K74CZemDzVVymmjU_5GUGE9FsEKk555-AJfG0jek_hg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] drm: Add MIPI DBI bus support
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:5=
1 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Oct 30, 2026 at 11:42:12AM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
11:29 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Oct 29, 2026 at 05:28:59PM +0200, Svyatoslav Ryhel wrote:
> > > > From: Mikko Perttunen <mperttunen@nvidia.com>
> > > >
> > > > The MIPI DBI bus allows modeling DBI hosts and peripherals using th=
e Linux
> > > > driver model. DBI hosts are registered by their respective drivers.=
 During
> > > > registration, DBI peripherals are created from the device tree node=
s
> > > > provided by the host.
> > > >
> > > > DBI hosts expose operations that can be used by peripheral drivers =
to
> > > > access associated devices.
> > > >
> > > > The original code was authored by Mikko Perttunen; I have aligned i=
t with
> > > > the existing MIPI DSI implementation.
> > > >
> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >
> > > The SoB situation isn't right here. The author is allegedly Mikko
> > > Perttunen, but you don't have their SoB, and yours isn't there either=
.
> >
> > This is up to Mikko to decide what to do.
>
> Not only, no. When you're sending a patch you must add yours too.
>

> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

My CO dev and SoB are both present. Mikko will say their word and I
will update accordingly in v6

> > > Aside from that, which MIPI-DBI type is this supposed to support, and
> > > how do you intend to support Type C panels we already support through
> > > SPI?
> > >
> >
> > MIPI-DBI Type A and B, which have NO support right now.
>
> Then you need to make it much clearer... everywhere :)
>

Ok, noted. DBI Type C support remains as it is, it was not
changed/touched at all.

> Maxime

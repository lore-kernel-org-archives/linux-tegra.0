Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF941167F
	for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802627; cv=pass; b=q0NJEDwE3DELg6GNcJOepNIzJgnSjshsVLDquoJ29sH0sEpoo4LqjE7XxbGVsQoXRvc0zHXm/GuZW4jEG25mFk/WxsJ80PENaRqj6OXE/R+g8Kvy8lDp79fne8SdctSQGGEh9zpV4ApxHqD4ILiOLywMMSnRnh6aEQn5ui86/84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802627; c=relaxed/simple;
	bh=+kueSqtDkmmifGfg+cVRz9fNJOmsRyFdj0JLziYDbAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeQS/MlpWnybuVMfWmRma2aJ7Y4Uap3bVVISxrhU1iKT+HxZJSWfp6SJKGntMImz6bRAqlhUeejHogfpsoo/zDywchXxkZ/b1Xv53oEmY1+VyryHr/XpOgSCtH6q6za9IOzJuR5by7HXDxfUH3Uv4gzQ/WDBds9kTx2GeRO9mNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/4UMKz/; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/4UMKz/"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso286843866b.0
        for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 03:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791802624; cv=none;
        d=google.com; s=arc-20260327;
        b=mzldjjobZWMiBk28MGs4r1SuQ06hcLkT7RgOT3PbfOzip2/fnp9bYmwQBoF/jmmMEg
         Bi3tsNEUdc8ADxQ5dTPBMz5iJ511H0kouR50DJ4SZNtdNxBEE3MLfNGYQp4gnwkIVHyp
         T58p3O1xsS9H4U4x/kEbuzm84X+l9F73VpF5rWRUbRwdXUYL13vKZNrIV9MC/JpWR3C2
         jayZKQp/uQ3d2KYHu6aOkD/qJN3sWdZsfo/u52wpjhCf8aOLxboCD0iqi6xMXl4fdDmD
         /RWsMFI/gterv5lcfcl7DBlkewgGzsYC/Wu8UB1ihcvy5PTLkFPuUgy2PnnOg0t+UCEu
         Jpew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MTJutfJA4EZWAG366GZlUbyhAbT/TlSiSk9Yh0EFsdI=;
        fh=H2SGT2G98oOdz49M9vOHgfxTzjEZYptW+eqoAI8zPb8=;
        b=h610uYajgL/5QVu2L7Pk5in0B2qBSdTrOUE0R68SAzbK7mFFjgaE4JnzUbIbrzzHLd
         GvpLq/JHd/WTUIlDc3uOnxUXQ/h2rxzMy8k34XTXJDO4vWXsIz2EURDBLk0luk6LKcwL
         3xKXLsOPlvhY9Jh9aFoKHkx0s7Gu9SvnCZRj88tT5AzGsUKhg+C/4MeWzEy2aIGwkrAL
         CyPnlPuHZlq3ZBSK7ResgtBfjFu4a20kE8EgqVOdMTUk6SOuQMPFYoZX5XfQrTRfvBNl
         ZPomHZeLiTQewfys1daVYvXE97Ngi1DBj0IlxPJ1+/ei5H8YxHlj9hQg3/tMn4JSG1mw
         ANZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791802624; x=1792407424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MTJutfJA4EZWAG366GZlUbyhAbT/TlSiSk9Yh0EFsdI=;
        b=F/4UMKz/k/J+nvY9qJtL0iFliLw51eQwsSvFWhRQ7E7GvumHvQEifOuosxqrUmFOw2
         z4fKtvAhliQ6VqQZ4spvsNH7jcioOvnM9slRCLAgT2GWzztWqUnoX9KARERu3ck/0Yvs
         jqevguxg/dTYcUubBodXYff7Y1UDnpHTeFn0/6NnXFrWkwTb4XDG+WyLhqXYbJFuZGmi
         xeLBp2Sib+351Yu6eivCgeTnnkTJMeIAF5WMmPqMQP4Y3UXNcRlkqz6wZhrsTOQs+swJ
         qaNm/4HdTuEJLPFsxe36D0xZ572gnTLPvGaBnHsQcrGwGDS3WJA/X81zUlDgjqGy0DeC
         51gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802624; x=1792407424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTJutfJA4EZWAG366GZlUbyhAbT/TlSiSk9Yh0EFsdI=;
        b=nd1CCtLwbUrQpgbcU4492WuTWb5RWR44BXt8Ev4yHHtLw3oKWnSqiys/uypbUDHymS
         0ecXWC7Nnbs2m9fIkhH0zBQqOp1v4phWtv66qRhpLBAOzybWj6LlJ3uaiL9HS0zbISqW
         5kI3j/C+NwQvcX67spFxaD6QmC2+lhzL5WvFIYpTfqTl+6HcicW0y7f/nYFBK67fW27l
         vzajkL9bKdziVUNjjV13flr5Fj58cJ6jW+KrpenFY3SBJo2VjBAMNFOapKwls2Ci8viW
         1+XY4EsdGszb15BDa0/4CZvnRAsLthtcxU6Dyp/1QOMJixRrKPjRRe4g0K+kz1BHn09P
         bD2w==
X-Forwarded-Encrypted: i=1; AKwUvBzlUClQx/eJ3Fk9zJXe8ttdmmk9zEu7DUZSIoG09jRtzu3wS8MeSuIhEa31FhH9vdcypQqGkMXincCtmA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJb5M0ZmbjqCtT8o6r68RoPpapI7LLq3x9JWcQLjdJL6eyGBVt/
	DPoum+Ru61On9EoOq6DLhZHp6qCjD9kfA4gXlEZg9QYokFgBWWC4R9qaRCU60FsL3n1vsA8vwD4
	1XpEsc82D8H5NEMufes9mRgMpu/juwl4=
X-Gm-Gg: AYBFou0vO7XrW+C7bx53MEy7zXI7hWLxprLe4xqBK4AHzyMQyxa5fVOwW6HvlPc8jRD
	zdc5CSS85LqcQ2YhrJRRHQ+8WiXyoZhDv52zEiv0+luNrE6O/pS0Au9mTUu7CEFwEDn1RZVDzAk
	kb+Cn7xhLfBKUUpUFtgK8XpNvklzntCVzfX+0Aghjeb+NSocBmrVvaEehhH1BT2knRg1kHHgKLw
	YZSl0tKX7b4EF5h72ede4Z3XvcLjaojRpS+bIjgLb2nzADWNLVWXtlP3++JJljFaNOQ4WnQivcb
	oiI4H0TjXZSMJ2jKxNT6631CCBEYopnlDEFp4WvhZa5xr/kXqFUbTJ8wf2pzDKTLFyBeye5bMF5
	DaI74iGvvknCz
X-Received: by 2002:a17:907:3f24:b0:c29:f5d8:9c78 with SMTP id
 a640c23a62f3a-c31aa097abdmr895867566b.39.1791802623456; Mon, 12 Oct 2026
 03:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004154456.145362-1-clamor95@gmail.com> <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
In-Reply-To: <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 12 Oct 2026 13:56:48 +0300
X-Gm-Features: AclHuK_ZqxpgUVqij2whdQ3M4VYrk50vnAb18U15iemeFvFo2pCGgfBKHQG-j-Q
Message-ID: <CAPVz0n2SmOY3Cw2HpnpYd8eFXw7B=2mjP6LMhKCu5niN=KnOQg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 12 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:5=
5 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:=
45 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Add nodes for recently supported device (ALS, LED controllers, haptics)
> > along with minor tweaks and fixups.
> >
> > ---
> > Changes in v2:
> > - added USB configuration update commit
> > - added p895 power LED trigger update commit
> > ---
> >
> > Svyatoslav Ryhel (9):
> >   ARM: tegra: lg-x3: Adjust WiFi node
> >   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
> >   ARM: tegra: lg-x3: Lower supported suspend mode
> >   ARM: tegra: lg-x3: Add light sensor node
> >   ARM: tegra: lg-x3: Add flash LEDs controller node
> >   ARM: tegra: lg-x3: Add haptic engine node
> >   ARM: tegra: lg-x3: Add backlight LED controller node
> >   ARM: tegra: lg-x3: Update USB configuration
> >   ARM: tegra: p895: Update power LED trigger
> >
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 ++++++++++++++++++-
> >  3 files changed, 127 insertions(+), 10 deletions(-)
> >
> > --
> > 2.53.0
> >
>
> Hello Thierry!
> May you please pick this patch set if you are ok with it?
> Thank you!

Oh, you already did. Apologies!

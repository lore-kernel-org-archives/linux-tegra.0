Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFBE10FD
	for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 06:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757916511; cv=none; b=XLWfNMtEHrD/uRfix3gEsZbmkz4byRGoTSRTnqjqrs6C6qhwPKyScue17jnQTjNL5jvhfzhIUqK8kOQcFNqHLCwiciSM0x7IFkkVJVXwfvOMfZYIRYjH8A6zSUee5O/XPC4917CiBlNX7ch4arl1DAy+imUuigxwIplGDzMx/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757916511; c=relaxed/simple;
	bh=7VzbklctKdIrn6OpeqjjDqcdvSxO6Lzp/1BHbgsjrIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BL5q2z5nNjtUX4KozYWrKNYUyjM+HsOE8yKzymfrMsP5lWSAqIPf+rVX9Mt52iCSUMoENNpOxF5Y1FLSUX+xJylKDS2/F9gliJjVV6sktuJrjX8gtsmg4u7/ebw6VFWE54m/YQ0QtPydlQ3sDpR2uH7wU3o9OU7riY8OXry/hQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2thQLtu; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2thQLtu"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3196206e87.2
        for <linux-tegra@vger.kernel.org>; Sun, 14 Sep 2025 23:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757916508; x=1758521308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+bAX19gw/9gH1ginZH4Z7Vwie8QhvssmibHNzq3eoY=;
        b=S2thQLtuERHfqEu0cb8GSvjx7+x4W/aCl8/6dLJ7M3I4XNCmH8TX61DwiUUtAS89zr
         ST7R1t/wsrIGYRMC/Jd6PSqD5BXrUSG8V9V0PM1rcCR8l8XB5yIdYdLEOnT9dAsW8FBp
         QV87jKxEm1oPhGqS7GQlUbCjL1gZNLmQ30qnYv+mUlD8xjYJVgvcxoOOWKv44ND8/bQg
         HBFAFL5Kk8GtPjzArG2N69yp+n3MAlt3uZTXSWFsrs5htbs+/XhTborrjqc/NFz9AsB3
         gdN+QzCNLpMUgrgvieUFMK5it8uon2nem7iT+Uht+Nq1FpVaMmLjm4AMErjUiZ97sMGJ
         ZidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757916508; x=1758521308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+bAX19gw/9gH1ginZH4Z7Vwie8QhvssmibHNzq3eoY=;
        b=j8DFkpsVB++JeEZmPP6lwR87ODAhaF2LN/aGPh8cQHhegUIOt34cMTmQbc77euKi3e
         b86naH68ys40YVeXQtfzJ3F/RqWrRm+S40lXOQSHGZDp8J93s1vdmhlVzO2Ji+Wc1srg
         GSGck5vCKFzHobBMoWBbPGAvFTwYnNccDkmTRuUZGI2uczZNlfhpb9jqUPXCucwb5w0O
         eMJsTllISVgpSEw7PAiYR7AFAUSndKrjxh/o970v6cXUdmY+L6Qfe0xhRMqn6OzfAMLr
         O8xH94CTw8GhtnAQmPJ8ImCEYCH7OYbjHVNC+Xw8zZr9hviUYlupptxT2BbjreYiMkSi
         +y8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOAAaI9+ieuSS7v1trTSVvJPwZeWyuQZJQID+B4xO/7+MJJEFUx7Qfl7yvbWKZjRE78Q3s3+xomEkxzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlgiBeLsWuugAbwxhYfJJM9Fhft/tzzgfI8muyQKkED7rPXb7
	iJzP3BDvraBM5f2w5A5t9Aa10KPP38s2zvxtW3Bw/zDFT7fZhzsAu8flLhzTxIIj4j0oeo8sIyE
	dNmGKhIUdmgDSaWRfXQjIkIGzuqrOpolrt6y3YA8=
X-Gm-Gg: ASbGncv616XUsBrSJVHgTV/fbWHqZMRixMTBL6f4Gngopsu5lBBEgkGpDbJ57Dt71ma
	k96BEZ+x9qyc66XWDi++L7DuCytiErqrNVIPRVSQltPgJKtQ0QmALNd2WEvEavxH3zS24b6ZfyT
	wI4QmCsmw82FzK4+0Hp0rSfeTbQCntHNlMGvo39ozqufjRgCNFrgo1idsiqO2cYGh7tjEWVsqpR
	LI7eGmpBLufz4BG6w==
X-Google-Smtp-Source: AGHT+IGFGnkhckMa356Nxb0PE7sy4MulP40ZRRHJNJXJXO8vi8UJyukObUTHuMngTBbku9KLRFQWU0gFKtiEEN2v7mM=
X-Received: by 2002:ac2:4bcd:0:b0:571:3afa:33dc with SMTP id
 2adb3069b0e04-5713afa35f7mr3565655e87.16.1757916507877; Sun, 14 Sep 2025
 23:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906-t210-actmon-v3-0-1403365d571e@gmail.com>
 <20250906-t210-actmon-v3-5-1403365d571e@gmail.com> <29ec10fa-1ca4-43eb-a865-7219d39c7140@kernel.org>
 <c1b0bffe-f5d4-4d71-bfb6-b047d3d2866e@kernel.org>
In-Reply-To: <c1b0bffe-f5d4-4d71-bfb6-b047d3d2866e@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 15 Sep 2025 01:08:15 -0500
X-Gm-Features: Ac12FXxfBqN3bMySguM87nRxs_1fzm1bjR4kMnBwk53fxGN6c3-9HEkbRgJ-OG4
Message-ID: <CALHNRZ9G_OA0+quNP=NwnwX43iaV1JWxjJFM0Aoect9Y8jGjWw@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] memory: tegra210: Support interconnect framework
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 5:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/09/2025 11:39, Krzysztof Kozlowski wrote:
> > On 06/09/2025 22:16, Aaron Kling via B4 Relay wrote:
> >> +
> >> +static int tegra_emc_interconnect_init(struct tegra210_emc *emc)
> >> +{
> >> +    const struct tegra_mc_soc *soc =3D emc->mc->soc;
> >> +    struct icc_node *node;
> >> +    int err;
> >> +
> >> +    emc->icc_provider.dev =3D emc->dev;
> >> +    emc->icc_provider.set =3D emc_icc_set;
> >> +    emc->icc_provider.data =3D &emc->icc_provider;
> >> +    emc->icc_provider.aggregate =3D soc->icc_ops->aggregate;
> >> +    emc->icc_provider.xlate_extended =3D emc_of_icc_xlate_extended;
> >> +    emc->icc_provider.get_bw =3D tegra_emc_icc_get_init_bw;
> >> +
> >> +    icc_provider_init(&emc->icc_provider);
> >> +
> >> +    /* create External Memory Controller node */
> >> +    node =3D icc_node_create(TEGRA_ICC_EMC);
> >> +    if (IS_ERR(node)) {
> >> +            err =3D PTR_ERR(node);
> >> +            goto err_msg;
> >
> > return dev_err_probe
>
>
> I will send patches to fix existing code. I also found some more issues
> which I would like to implement here.
>
> I apologize for coming with all this at v3. I should point out things a
> bit earlier, although how this patchset was organized also affected revie=
w.
>
> Anyway my comments are mostly non-critical things, so v3 is late to
> bring these, I understand. That's on me. I appreciate your work and
> please do not get discouraged with my comments.

I understand and that's fine. Get it done right the first time so it
doesn't have to be redone later. I will try to get a new revision out
this week once I cycle back around to the relevant devices here.

Aaron

Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D312817BCB
	for <linux-tegra@vger.kernel.org>; Wed,  7 Feb 2024 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303294; cv=none; b=BJS4b1UKnOZoSXJkPwlZzCHIH+eahLsW0mj3j+yxjB3iGvB89q1puq5qQPyLNrRWR2bgsW55rUZdEBZ3O2QCiLXmVZfNH50vCOcH8qjj207wFqWaTQC5MjTWx3c9I7/JbhB6GCpXSuS7cnc2BdiH4zBYNStckrGX+px0r+nK7EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303294; c=relaxed/simple;
	bh=AqRyfre6hpYKrbdFfgct1DMOhUQC1J51jmJyfuq2n8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4TdH1+C7aYHeFOnlVKVa3MhU3y3hVpl8VWKzILovm4o8WROGElvpscKqfiars+cd1Z9zDXmvdIgwZSqwldxpY3LatNV7bgBLboZ0jMo6CKbYTeQrSy4y9rIHc740EENxwc8QqG70Lc29UaZeM8DRDo4ypr5yz0yjxz/ynUBiwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HDO9i16d; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDO9i16d"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso373252276.1
        for <linux-tegra@vger.kernel.org>; Wed, 07 Feb 2024 02:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707303292; x=1707908092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqRyfre6hpYKrbdFfgct1DMOhUQC1J51jmJyfuq2n8I=;
        b=HDO9i16dkADSVvq6bn0Sbo+lrGoZqVgEmDyNnddeI8nc1hnZq+Ja3AMz9KQ3uYYhLz
         /dccogs4m04hXV8h8p3iFRjmnsa5oOrDLB7agajpybVu09VFCRMSyGM5GEzQAz4jkTEa
         X3Xn8Wu7VTXOR+alvwQIax07jdzy/X8V3P/4U9aoIQtQafuPuqtviS2tHCs8dTP4MCaD
         0BlbgxAiNQYneX9QIZqfqVoVNV1aVZYGWgO1zIV8s5aoXVjGqJrhrzaXYnRgKY2xIN8/
         fOrvWwnvq9iDaWDiPfqqjPR6e/CWaSymQpokA6dJcZqFEjHkdip85CsKVqK/BVgO10nX
         2GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707303292; x=1707908092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqRyfre6hpYKrbdFfgct1DMOhUQC1J51jmJyfuq2n8I=;
        b=lkPrLsekbqsoP70K0b95soHPS/xGHbhmXdgeqo0rUmsGSeGpZHzdOvf2oo8Hxs8Anj
         mMC81u23hnD6Mc0vKu4t9HHYIvBIZNqmAi9DdWUmeYtv6M+YesheebvtTWNJhla7Q6qB
         iNdoVHeR3/xstjvfOjPbPuzw8kS9tCSJWw63aHslNTTop9p90BZs903i5/GhaOxFcyOJ
         ntiVvGvB5OeginbaeuuRV4aDHaKQ4exbgUYlOBKRJIAJBgimwtGKd42Gyc6m3CFMaLIY
         0T83SXKc4FlUVuLaje+2n5b0ya1PsCJTP70s9vxh2DyVE+GjRypyJIqlBmpZ5OdtNtCb
         Tb9w==
X-Gm-Message-State: AOJu0YzuSsEk9yvjGrliaOxx0AKDTc3QaLKTPZlB0b/L+Bqi5bckC2gM
	rIbNrPZlIRRZi6Isd5GCpj8U73KpOckNdm9jYX6KRO0pI6RZojOLpL5H5F3f7a1gkRpjfq0/Jut
	MJg5EyP1Y3gN1KYFAqStL2S5kkOr+Cj4tztNWKzWMflYuo+wbt7Q=
X-Google-Smtp-Source: AGHT+IGDflkHEVBa03b1Bfl72mpon3cdcyEI04qMZquBPzXoVaoldzCLxrdhfuAGz48oB/DXRZc65MMbqgc8o/+1+XU=
X-Received: by 2002:a25:2d14:0:b0:dc2:3818:f36e with SMTP id
 t20-20020a252d14000000b00dc23818f36emr4815404ybt.18.1707303291509; Wed, 07
 Feb 2024 02:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202223454.1667383-1-robh@kernel.org>
In-Reply-To: <20240202223454.1667383-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:55:04 +0100
Message-ID: <CACRpkdb+Z8oxBa7kibHdob1qk1eVKiSm1MaY+bF442d=ztdmdA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: nvidia,tegra234-pinmux: Restructure
 common schema
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 11:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The structure of the NVIDIA Tegra234 common pinmux schema doesn't work
> for restricting properties because a child node schema can't be extended
> with additional properties from another schema defining the same child
> node. The 2 child node schemas are evaluated independently as the
> schemas are not recursively combined in any way.
>
> As the common schema is almost all the child node schema anyways, just
> remove the parent node from the common schema. Then add 'reg' and adjust
> the $ref's in the users of the common schema.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

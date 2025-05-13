Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817A128DB70
	for <linux-tegra@vger.kernel.org>; Tue, 13 May 2025 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142736; cv=none; b=bGzfnqiJDYZycXDjebRoEA3wmPAzvtwj78pZw9AWTQ/R3OgRGLLJzc3HQ/zoQpJT/Z52d8IdojWKi5O52udaEg6FcHJFTNshTGY016rt995/UousVN3EYH+MNej4fdXIJLOS8v/ovZif5nKiUAd8QmNtf8MRSk+pVSrJR12/frE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142736; c=relaxed/simple;
	bh=vr6jWP48yxMylfuZaQtdjlPFLP+Sk0yvaEXfr4dRZmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSqpIPEHE7B9807Vjuhttkk8+B5yjGeNZNmyaMA261KwziFKXohqpNNJsE8AX8IsUGpltAR69cjj8OeWNKwJEzx1vU2/wzX6HsmxkENk1cx8/ZUy0yCGiYJ6xY2R/SZX5uIvP4x8KRMtesfCib0WvJS7tmC3gA5GwWYZ3PNx2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i/2LWdbn; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i/2LWdbn"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54fc61b3ccaso5872025e87.1
        for <linux-tegra@vger.kernel.org>; Tue, 13 May 2025 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142732; x=1747747532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr6jWP48yxMylfuZaQtdjlPFLP+Sk0yvaEXfr4dRZmY=;
        b=i/2LWdbnAflcM5SZ41RLSj7y1Jw7DUynh9ewjfOfjYRPaRzQWgcJvKHN5Cft4SL2rM
         zgGqZTiZkoEvBQURAWM3ZRTSa8hWb3EaCUcZGXm79YVpJ/Vt8d+mkTdtZDywVu5Dhxxb
         dTrbjFccTfPvtRuWQ0nozj0ulwV2vS8T8cV3y2W5IWH7NiiVHHDnLYNKWTsI/tIuWI6r
         eI3/7CP0EHm6xCNt2e4PAj2c50WpQOzptxqDavL84fVNlDXn+gSJIFWX/hHf5sORnv3z
         DFIAot4XvhnAL0D8N4mfLEVdW880gkr2bhaPwDJWD/KwjC0CgIM7me7D5d9cd/gudOtc
         QlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142732; x=1747747532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr6jWP48yxMylfuZaQtdjlPFLP+Sk0yvaEXfr4dRZmY=;
        b=QjB7ak2iDkyFmRhFxNtCtALUlHTdLex5ZxCfl3f84pkdyM9cdO4VAALH70JFiTMwPq
         FGkxD/dhRx4wIvWUuQ/JynAcJgkvegRO9tdv010MqbBEGfcHsjWpN8J2zJ3vPy3gOMtB
         MKkPxsPVGbayfb9vp8g1B5UTvsbh7nOzdEqUYEx8TjVNxr3efF45XgT6sjUhf8WBvEB6
         QtSVgtlOD/lGCQgqxyHGKj2fUsvak6c/nVzcgBB2p8arkz0oX/J+Ut8TpHVqC+4YgQGw
         IqV8gnZwA54dHm+aDQTgIB3V/6c5uBs+2Xn6jN9XHzlCnybAzWg/V9twqBQNNh8Yvdl3
         uN/w==
X-Forwarded-Encrypted: i=1; AJvYcCUiBw8Z9gxNQ0yH/vwzEc65edUZcZYYy4P2SP4ydoCd4iKhofDbmf424H52U7K/RPVllVhqZgGEo/LKYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJh2EkXf7jjHZ7NWj7N1iXdn6psvSSAefgDQL1Xx1bjWc4G6da
	JkEAcwjtuQLzcTUNGRAXuxlCXXmFBLznnuiXvhv1xLCFoSOWacvlE8MYWTaIeVBUPaI0EhCDyL+
	FjAHNffI5+okLR4C/8O8rKXCTNcjDCBVdD6Q3kA==
X-Gm-Gg: ASbGncvmn9IX4EKAkLlPJ9KIHM3RxvqzskwxHJhhTr6ej5/6bI1+bBfDGhZ+gP1+AKg
	UFJ4GTxbF4w2UOZlteXWSY2XoYobEGp/nXox2Iat2lCia5CSjA5KECxMriKebExMbqB1aGSBHEc
	klJKCGOCkgVLZ9T71QOkI0FjkNE9jhERLT
X-Google-Smtp-Source: AGHT+IE0uPHvi59GKQReP0FS4yIDYcDcoiE56BNfoi9s0ZtA39+qwHxI+HlYyMOtM6ESsG8BIrjV3tSi2Mg5STR1bXk=
X-Received: by 2002:a05:6512:4201:b0:54b:f33:cc16 with SMTP id
 2adb3069b0e04-54fc67bf61dmr5906057e87.16.1747142731593; Tue, 13 May 2025
 06:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com> <20250429-tegra186-pinctrl-v1-2-722c7c42394e@gmail.com>
In-Reply-To: <20250429-tegra186-pinctrl-v1-2-722c7c42394e@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:25:20 +0200
X-Gm-Features: AX0GCFsgSRMFDJQegzrwRWIt-rIi0vhgKArb-MEwIUl7eEY9iod1pr2LmbxZAks
Message-ID: <CACRpkdYyaTaXcz2zdM-13vXvc2JKXKk75=XS9VELDRaDA6=R=Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: gpio: tegra186: Add gpio-ranges
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:33=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:

> From: Aaron Kling <webgeek1234@gmail.com>
>
> Add optional gpio-ranges property.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

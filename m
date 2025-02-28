Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15EE8F6B
	for <linux-tegra@vger.kernel.org>; Fri, 28 Feb 2025 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731928; cv=none; b=KJptsIfX691+J9yJBnw0GoavWUGD2Xv6FHxGLlrHnyl6subw9HK5ajhTUVHCyacdN1srbqdiXwU+cv/SiC1p/dZtgnxLcwJjFu86GzWqXJ+gSM6HOqt6Au22d5dxCJX/F2mruhZImfhHBto6m/9MkY1U8rjd/ZQ2nsy79QdDuBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731928; c=relaxed/simple;
	bh=A1hq1DB07dwQXcqWwcco9SDEwQn8DEialn3ZI9yG+nI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r//b7b1DbLYWPbiStb5xNa9TzS/Pg4XNOvBaKnw5JyLhKrnarEmtr78yJ4n+DRXIewnJGX/Rl7L3YNU7LoEdA0ytv61zK1zMl04HkiYT2hrulRmGFtPDMcajcHvayzXyRv97FwPQUsi+wNqKLx8ArdE+k0H+pRLtZhnhUIqUIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ktlfyo5R; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ktlfyo5R"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30a2f240156so22019121fa.3
        for <linux-tegra@vger.kernel.org>; Fri, 28 Feb 2025 00:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740731925; x=1741336725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhQwmFqFnuuSHTQ4pAgL3POj8tqEsseUbiv1Ze3QwuU=;
        b=ktlfyo5Rezu/DwyRXtB+mouxaCxNdMiOvsPrFQiZ6MqUd8kl38loCYP8gZilR3av/9
         4orW/S5c6/3vJGv3xIkdfisMrmvsD5ezvh1wIfGla9GD4IxSJZ4nh0w9OT9Z2907Fpfu
         6oiM0lua77jpKFdrTWRsLmzJ+dCnPk7Kz+4bFFvePfWh468oY9almut+KlraH8Lwx+rA
         KwT45/3TRElrH8wbzNksnRDCIgwKw/hzAKjGWW3Oi/9fcPwkjEdIQ6Kj5zxbONafI7GB
         oeZyUjWwAqpV+eoagBIruEFbRlq/fqNqjkcPK2B1T1j7cRzY65Gc2xstHMbWJ0zO6Xes
         Xojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731925; x=1741336725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhQwmFqFnuuSHTQ4pAgL3POj8tqEsseUbiv1Ze3QwuU=;
        b=dXyFMDzmIawwddM9jMlGIgsdKUbMGQph5TY/pudZHxDxaKagXJNGSXjY8dl9Rg7jDy
         N7JT9y7/iAemVTR86fden1EDMxu9awSe16yhgVu+Jd8b1My1APzMydeRsYPnR9sK5G2Q
         /Nn/9U28Z56vgUhPzZZ1GRkvHcm01s3dHiIA3QO0SZKAkdbT2BizpEV76vnhgY7zuvW6
         aTvHdcNDFP8zMQeX1dj7g/BVTpcaUwPrAr9trvHUKB9wH1muZOS+vvuOhVHh6g0lyMHM
         fphGbnDBaWzQ8XqQMfvCFWGflsdjE/8KrWsw/GbR9LnL/pTB8u5oPIfxCBeU+mmSd45+
         FzSg==
X-Forwarded-Encrypted: i=1; AJvYcCXpVpG/fL4C3ofgg0+ShZ3dK6WASdkN3n1BgwHXm1t4MThkS8FcF+ceC/kbEQ0QwNlvm4Bk0CqHCnmhgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaCHXJmZYj/slvuRsW+i+3gwR7vojhUNrMtaMv2QpbUBHk0ywx
	8U2opXnGPkpXcOBQUvadj/adZwE6PK+tV+uNYrrQeZWfrbPFVdT69oPT3lxy4Za59ziLH8wb8j8
	78Y3MV0hug/jxU3T5g+JS0JGsWdDFgQ8ePeYDnA==
X-Gm-Gg: ASbGncuHlasX9czpzLtHmUoQ1EeqcEmCqLFcqlF9j5Y3fdHjPzo6JOsOe/urd7sPtZs
	Rw/92pRuIiyXkrtQJZngeS1m0YsZtK0jf17jH4W3f8/9RP+uCzopx7RWxAUlrKi0ZgplyZ7gabc
	pGtXdBF1o=
X-Google-Smtp-Source: AGHT+IGAeIIeJSXlZOyD09BfTdJNYrhaAtk2Dv0VSScJsFIn/A0Qltg4bWtfnluZesdEZ3LGCJeP/Y2geE3003qeeVo=
X-Received: by 2002:a2e:be03:0:b0:309:1d7b:f027 with SMTP id
 38308e7fff4ca-30b9320f37bmr8362171fa.9.1740731924837; Fri, 28 Feb 2025
 00:38:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217153249.5712-1-pshete@nvidia.com>
In-Reply-To: <20241217153249.5712-1-pshete@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:38:32 +0100
X-Gm-Features: AQ5f1JphGbre185SJnlbZEv6StWJ-0HLtZWYERPdgLdD9d15LkTt3vUooRToznI
Message-ID: <CACRpkdZGB=O_1ieN-RhFTVxsm6RWAcjO_JWvVBO8gLgUBZ4_CA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl-tegra: Add config property GPIO mode
To: Prathamesh Shete <pshete@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, peng.fan@nxp.com, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prathamesh,

On Tue, Dec 17, 2024 at 4:33=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The SFIO/GPIO select bit is a crucial part of Tegra's pin multiplexing
> system:
> - When set to 1, the pin operates in SFIO mode, controlled by the
>   pin's assigned special function.
> - When set to 0, the pin operates as a general-purpose GPIO.
>
> This SFIO/GPIO select bit that is set for a given pin is not displayed,
> adding the support to retrieve this information from the
> pinmux set for each pin.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Sorry for taking so long and losing track of this :(

Patch applied, I take it this is for getting the right info
in debugfs as Thierry says, and that's fine.

Yours,
Linus Walleij

Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3D62417F2
	for <linux-tegra@vger.kernel.org>; Mon, 24 Nov 2025 07:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763969554; cv=none; b=j/hv1/EENnjstjfEJTNVTT0gxY9XnnmJ3xrLO9LsWITI3QnqHgePz3ChNYolunzpjv/eTfrSe+oUlEqiWWDqfA3fOGaexRdOUROwujma0GFwhsa8Sg4F/paHFzhhIG2wU9yEBqu+xWY/RnkHXPWmUEa7i095rsS31eLJCKhg4qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763969554; c=relaxed/simple;
	bh=TzLgTRAToNMdwJ8kNV+L5VPlgoj6g2dualIbgNYvYK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZznFFAJgEnwxrySEWfiNcwzA2HTaIPdXynAjKTtMnhonBtHtTlTOt48E0CD6euRxejwVhWVsJrWNfZn5JOyTC4fqzyZ3YKTC1X3Tin8NtnHSuKi/K269gKA8tYdB5c1eR8ALBAAVY7jZ201WjFNu1J7TKWUIm1wNyonDzdFlb28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UddEn8PV; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UddEn8PV"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5957db5bdedso3999388e87.2
        for <linux-tegra@vger.kernel.org>; Sun, 23 Nov 2025 23:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763969551; x=1764574351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzLgTRAToNMdwJ8kNV+L5VPlgoj6g2dualIbgNYvYK0=;
        b=UddEn8PVI2UtTqlBWRY6sapKklwW41Pm5FpPci5Ip7UVpIHLRX0uVSN8VgyVxppjhH
         ZBRmQgtUi3Uc/FfqR5s2mYVr2sh4t3vJvZ+KTbZXf4/EvXljhjy7phIpAg1GVYy39sbf
         upNXUnflNl54q1g+fYQtbJFz4QZgJIwhkwphRVhVwhQQtdXh8QrqSsJxW1WK+fxjcAMK
         97YmAaf/nQTVW/nTiIEc1P2S44AP2xV9yQ24CjKre3f82fbPEqN59/iEQCjFQfrLsOqI
         0hAS6jVexBxnHUJScrK5zJRWYhGeZQpS09SrfprTAfF8yCDFWYOB8vs2sd4JECpzLQhM
         BVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763969551; x=1764574351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TzLgTRAToNMdwJ8kNV+L5VPlgoj6g2dualIbgNYvYK0=;
        b=ku4Fe/wDSf4LIJjcqHiLeH6zKHhrraQb5vcRnpS0/5Jlf5RUFZ70wrw53nFeWEwD9u
         qZCfBzmNBNA+moXoGmZatbxvEMxOa3/dFdE/032lF5hmE7ER9D2STn7zWI/i58PCG+x4
         cxcPKIVUdQp1adkZgFjzfRcw6ABK3QYid985DdLx/YsZcvqSbYVUCS2dvKY6NvO3QqRt
         JYC6zjPaNzl5HEizkDpNJy4hC9i0ld9yjUnl4hyqmtb8osnVS8oMQffQMQsfXuLvYAH2
         5/RIAoHj2T7ovjGChaO+ShA27ub3nP5288jQ8hQqKJ0GDxNd6XqFm5ZDOYkqG9Bzwyml
         LWsg==
X-Forwarded-Encrypted: i=1; AJvYcCUq5SpnTydxEeUbAasHi8EMJlnyg73+Z1WNBTnsn8bZ+Zg3gzANBSdW3LCVWb6flDVb3qd1pRPCmj0uhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQCUgBeesIJQw0LlmD7P0YBlg77xl/D6gRavOinIudvI2qGQlA
	74PIXHWanpe+oxhg6RhUP1yB/1GntqgIHRwohDTZd/UBxkJW5DYHGMG/UrhB6qq6/2p9F0bCp9o
	YooUtAzNN9sgFbgCiuTV0Jr2qdXS6rPE=
X-Gm-Gg: ASbGnctY5HRg3+JC+hhapsvnIPl+N39SL7by9C2cmn0vOsBKPAna4ogil+DUDU35x/9
	7qZaw+c/WibVZ+cXvGEGtomuCszEZeN1Hu9WPI9CEkZZkjRHJx8GX63xyiWheh5h+mR1ZIQyWfw
	BA9qHdGgJOZ6ISdWdj6nzBbz4rdC2Qevr0/BrPQdCnnYcxYLMOgniLQbBpnH12oMbVKDtC0Ayh3
	J47jfgNsBQj84IItI+Ua41IVC5o2cESEJWGxDMnOotGWED1dasRe1goJ42vxHsMDV8IK/8=
X-Google-Smtp-Source: AGHT+IF919kFuDq2yuZjPj2LcsN0sIFvhhVUFbWpYI7AoP884MvjRmP4QglZNhgfHZsx2wZ4htdfdK0gc1Iw9L9TDxk=
X-Received: by 2002:a05:6512:68e:b0:594:33fc:d52b with SMTP id
 2adb3069b0e04-596a3edbc7cmr3808065e87.36.1763969550433; Sun, 23 Nov 2025
 23:32:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-tegra210-actmon-fix-v1-1-3c4e2aa98e5f@gmail.com> <3bd46325-149c-4ca4-899f-3bd52e6a86d6@kernel.org>
In-Reply-To: <3bd46325-149c-4ca4-899f-3bd52e6a86d6@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 24 Nov 2025 01:32:19 -0600
X-Gm-Features: AWmQ_bnMOR2_5ypF292F3GX8Ll-xkzVCQWKhZBJjOtwQtyRbwd4R1LQYfIZVzFI
Message-ID: <CALHNRZ_b6b0F-srNUbcz56gNWYAWAp-X5tGTqGsf4R_Kw=yDVA@mail.gmail.com>
Subject: Re: [PATCH] memory: tegra210: Fix opp table cleanup
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:09=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/11/2025 07:19, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The original change did not clean up the opp table or hardware table on
> > probe error or on remove.
> >
> > Fixes: b33c93babead ("memory: tegra210: Support interconnect framework"=
)
>
> There is no such commit anymore. Like I said in the other thread (and I
> Cc-ed you on pull request) I dropped all ICC patches.
>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/linux-tegra/aSAxxzcRZduavJQT@stanley.mo=
untain/
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Change-Id: Ie40abdc1f2b1a66ef60cabf00d64cc5ff069ea91
>
> Please do not use Gerrit stuff here.

Ah, blast. It got snuck in through the b4 cover letter. At least it's
not in the actual commit message, that much gets caught by b4 checks.
I'll remove it locally for if a new revision is needed.

Aaron

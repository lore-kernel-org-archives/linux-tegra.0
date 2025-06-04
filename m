Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B551F9406
	for <linux-tegra@vger.kernel.org>; Wed,  4 Jun 2025 03:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749008609; cv=none; b=c0z8S1vq9UK9oohHGpIOh8QikLagkKVelWKopzTkqQSTXdzK4V+luqkVLJ4BNKZoDVw9KYnCes4OeblLzWhv+aXOH2pbuR1ILH2lNpLMVD6P/FaMFucgZOTlNIsFiTwOQumwV//DAxW3nVCqa9CEmC+2WedUmQIUMJQIJh5e5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749008609; c=relaxed/simple;
	bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljuI+q7efcUlI0BrvZJz/jxPEcGy8AwjDXau/zMzcHrT8MEcfQjhE0R85lj6FcQzsni9klHpmembY/SsdB04cpiSfVVHwH8K+sbf8C/DjaZtyZZTwlneiLHhIg3oVHRqem93bG5ZbhcNH13r082989qvDhMc4Pm8Xd5MmrQRe/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mJWG7Nr8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mJWG7Nr8"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55329bd977aso547770e87.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 20:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749008606; x=1749613406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
        b=mJWG7Nr8R+3Nk0ovAgf0iNudseMMDB6mVjXhfPn70sDGjUpCtXGXs/BrcpuCIEE5Yf
         UT7iUbhMXjigUo63Yb9m9Q0RoICmqZXfExmlFE2ccvCsspCeOQK34sWzefjQTXd9MdEW
         fYL4e259Y1XqLbA0EQWfnctzzhnsnweNzwKTNlI9PnBtn6/d2WuP8EFyR5slYDTnBfyM
         8TJpEqYtBf0A7dq2DE8+HM7ZVdZ0ZnkIg8T+TI4HninWyO0h80MbnTZ0gcifWrzDM14z
         DYpr46zQJNP8aMNxkmb154oahSOF7/1Pxq+Ud6Tmx4TPOi6OuTDQh/bnDiTOytD4AVpT
         us9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749008606; x=1749613406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
        b=vUv9fiwqcsDC3fVh/Jgi37YZiIFMk/DmMSVeiMCe+b+z7jUckwk8JN7mJJcX6+C/iI
         j0ha1EupXL34w/ris5gsqWAUuC2MEKCCS9tx2enCY9AK2NdbYL1dFQnbWHXTn8vlC0+G
         MQHS5p4mTG11sskMFcZC6AMxK3EFeD76VOqir+GG/LgyHdvR80BtkmyXsC5Q3ido0qiA
         UTLzMxI05OLZEAB0LHoC0iVhVUoITpKs3UvWp4oypQaaxWllz6Er5/vCh6gfKb5eWiN5
         fVAw/+vOvFgMhefj06MClNdqFvpctt45FyxFLt07skN3nRWBLra6YKKa663mP1rp3IPL
         K+nA==
X-Forwarded-Encrypted: i=1; AJvYcCXeRtH+R1jsxpufn/ifR1+JbuXEMbwk+VVsWsHWm6wkdjvgIfeLaf8ZRIXZ/TLn9FUI85WK530disuzLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKCgeSOFICEua/lMFIAgXHL4jZ52UvnrXUTxdYGMcocrq3Ynst
	hDIZTC1mIoltWJx1U5XmKStomMww5sPRoHQylIROS5PDUQ8TDNS4rbV8pMPtNdG1YzU7GRFrXt7
	/6EElBir5vM1A5Zdnxt1G6smD9VfASX8aG6Yq+bc=
X-Gm-Gg: ASbGncsGuzxtBw115nTnFV1guH1qHDnWYpnOLO4NewIeMrhlFjywVHQE0ahCg/nzjLw
	up/r4gPC2matH0IrWUS1M8F3I4dvRixGL0BS+z66rfPqBf7oAUHF5DDTRWytor0YAYPt7LsjFEl
	Y1Y5+5VC7PeZADJReQJPUITi59TEbLrr51Z45jFJI/Uwjo0SeDzc8ye01MKV5iWsV07JRQLHkz
X-Google-Smtp-Source: AGHT+IH8ZR09cOwjQWxlzzIIzvv/qRTFHJMY8a37VDJ4S/kE7pfdaVMCEhiK2Gv1YMR2kEbER3eXRAurwmgsUUQyZRY=
X-Received: by 2002:a05:6512:1110:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-553530e6bddmr1432974e87.0.1749008605694; Tue, 03 Jun 2025
 20:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org> <20250602151853.1942521-8-daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 3 Jun 2025 20:43:12 -0700
X-Gm-Features: AX0GCFvc7MVw8hFnvp1SKu5kFSFas_79C7UyjmOU1fxABMnJcu53irlnUJ9Jiw0
Message-ID: <CANDhNCpngvSEC1bXP_djk2957n-_LF1CUXNgZ-eEQ8vcCsizMw@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register function
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Will McVicker <willmcvicker@google.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Saravan Kanna <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 8:19=E2=80=AFAM Daniel Lezcano <daniel.lezcano@linar=
o.org> wrote:
>
> The timer drivers could be converted into modules. The different
> functions to register the clocksource or the clockevent are already
> exporting their symbols for modules but the sched_clock_register()
> function is missing.
>
> Export the symbols so the drivers using this function can be converted
> into modules.

Thanks for chasing down all the details around this issue Daniel!

Acked-by: John Stultz <jstultz@google.com>

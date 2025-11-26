Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431630215D
	for <linux-tegra@vger.kernel.org>; Wed, 26 Nov 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169533; cv=none; b=bqhzrOIWrIz1XRUmKADYBRjlT0kbOoVYXENiOantJeVFqHSyT5Yes0wVpTPR6a9/huUua/BBcsEzP9ADT7BM5f2xZ3y+in8jaaRKeAkkqRd48Ux63Crac/fbl6C5LDD5S1oHIAqM2Ake0qXFzzdYPVKjF/ZBBcci6w0o8vpGYDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169533; c=relaxed/simple;
	bh=J+oyg1mBBqSSQQkvSrNBpiZ7W6zMitALsCYhR3FXK+s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u22ZSWn+jCKnWO9tmp4CW+pHKKz3V+K0Uk9YM/ZjswFIcIcLr/wyT+YUPGGYA+DgfjFc+PMZvyDdpG+2ZytmLkcJQubuiwsJJBr14VYYNycotOG/BhsfV8prWXdaqMkcLUMWsrXaVuEQz5SshfOQIgUt1pq+f6ddCacOfLmpS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3Wtgqi98; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3Wtgqi98"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37cf475a1fdso28153381fa.1
        for <linux-tegra@vger.kernel.org>; Wed, 26 Nov 2025 07:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764169530; x=1764774330; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdozIWg11HXn8YrxuTHyeRPHWCFIep7IAFKsHH2Slm4=;
        b=3Wtgqi98DePCWX3LVQHFO8RvE/Uoctt4R6OLMyobJSdTCkfut6H3uSSejsiM2Wh0+t
         N8Sq1CISf/NnD1674k0f+jXFK4Q5/ueq/UQgrCAgSyakuDlQ06o3tNPqp1fjd7Bhodn5
         yIwb3CREJ8EQ9gkb9xkTKxLISO6byCyKAgSQY0IzMmVWuyTLYSECzlMS3c357eudzVN4
         0H/WU2X9T+ANnPruXCjmu9vSWit+hukqceg4wPIeKiZJDlyFOe+xdWtmF5jV9Uhb/0uj
         XFlBonSqH0dbr45jKeCPMN9rLBVJwvFjVLeXYFT5BdLzEYpAaIumMZBbTkA48bregwBH
         oObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764169530; x=1764774330;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdozIWg11HXn8YrxuTHyeRPHWCFIep7IAFKsHH2Slm4=;
        b=FE349mxMb40zP9CQQyzpBIsW9NdpYMu0pPtdyaYchbw3AUAudPReC8/vyZbejs+pYe
         vrUi58u8drGGErEf28YQvqvjjyaJ9okisF1t3U+xUTkCwC6/xpwg0XNv5zE9Hw7fFFpO
         +T3uzevTd9i2MCGLP2Hz7mzSheO2gCNhdhSwPG2l6f/YYKGF1kHNCumwUjlvUGPV3oBy
         Q+yvz1lKu3mYEduvpyW0bMdmpI9ghpokl0NCe5fqph5WKL6TMl75iL+NYZxw2id5ttV0
         fIjWgiwrvmVgA+cXM5SJLmgCTRUKvdHmaNhEERXMBWnWFWn9RAjZqPk8kjnPHfu4/g3+
         6D7g==
X-Forwarded-Encrypted: i=1; AJvYcCW9sIWMuGwvOubDkdKTc0Ont9EmD5gK2u2vVw0ZUBhoOmYHOPDP+RAKU3529asWgNFXFZturcc6J3xXVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz70jKWpBE5FU3W3WRjN0uRmE8tyeBqSky8a/WZgAi8GRhN8JW4
	zKtaj6iXDlsc4l5/cDBiyZQnghZWr9QvsT2uTX4L6PRgo6mm/bvEKIOoiT8i50TmO8XMPfOy0hE
	U1w+/OqrTDdoaA+z4YNUIcokOnsXjLf0ZSKZQGvJwZw==
X-Gm-Gg: ASbGncs74a0kdv1c7YB/gpKh0i5dwbYQR+sufVJAKAgQ8kv0EufRkiRlgaFypNw2tFM
	5RUS7YtVmbeoCW8JndFMRQAJAUEyRvOImVTXf8mULneagIXo/f58GjNuirLRFtLa3yfoWZ6RDlX
	60G1GVIfRNBLc4bmvRvtorK92deYopqTLE3uwH6n2G5ENdcQa8Dc+ol1VwczIzsAlxK6BOGbGVX
	52CxmTdftA1z9mfPySD8mB2Q5VA0n4gycf58w2ENZUfGoSPQ3O/5HR1uBV2faZAPZYDP9pcp5ds
	MAaCNSbQSKwLlp9gZgpuIbofje4=
X-Google-Smtp-Source: AGHT+IFW4CVHKhpnJ+JDeABCBeOEaqoUOa+vDI4F3g0UIFLPs7i4zmAKKWQz/RrJb85q7OyTg13Elak/IxVETnc6Fz0=
X-Received: by 2002:a2e:9f4b:0:b0:36a:925e:cf3c with SMTP id
 38308e7fff4ca-37d07952b19mr17246381fa.31.1764169529898; Wed, 26 Nov 2025
 07:05:29 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 07:05:27 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 07:05:27 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <d56ac97f-24bb-4ea5-a46c-a07dfd0c9e62@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
 <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com> <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
 <d56ac97f-24bb-4ea5-a46c-a07dfd0c9e62@nvidia.com>
Date: Wed, 26 Nov 2025 07:05:27 -0800
X-Gm-Features: AWmQ_blhTm345iaYZ4rHG9m3t_z_cQOEDjbyggM_ksomZgdEfdTrTBoPz53r_Yc
Message-ID: <CAMRc=MerzKQTSj6PXeiWDA4qfNou8ApKYLgJhUGLP0QBatqtVQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 15:55:54 +0100, Jon Hunter <jonathanh@nvidia.com> said:
>
>> Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
>> Kconfig and post the entire kernel log on pastebin?
>
> Yes this is the upstream device-tree in
> arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts. OK I will get the
> entire log for review.
>

If you could also add the following:

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 3803b5c938f99..51af7886d9f2d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -101,6 +101,8 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 		    strcmp(prop->name, "gpio") != 0)
 			continue;

+		printk("%s: %pOF %s\n", __func__, curr, prop->name);
+
 		count = of_count_phandle_with_args(curr, prop->name,
 						   "#gpio-cells");
 		if (count <= 0)

That would help me.

Bart

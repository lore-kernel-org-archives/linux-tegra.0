Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A7231832
	for <linux-tegra@vger.kernel.org>; Mon,  1 Dec 2025 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764569573; cv=none; b=I1ITjLe8Zlyt/IoxopeUaNmYDXhwavN/SnNsRgQFKcSpMG9DiSvhc9wCkaYfKbXAGPodBULICAUeWYHLSVSVLNi+RMY8AOf8yZ/vfCMhxo830fqDVdTZTJTOhhGyG9aeohZDiIWM/hpSAqrfEewx8wxbBtmsZFnVDTzQaDlnTzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764569573; c=relaxed/simple;
	bh=0gqWOlt6q0VnzXoDw9gLNI555RhmJF/DyPsr1omshpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ib957cPH7VomHVoCpxiHVYE1ZcbxtnXhrJ5Pnzbehw8X3sVTgfa7XkRBRDnvy8Vk1ksosVOvyY5Za2oII2TefogL9JuVjPHZZTo2J8DWu3nLp0+tq6S1T8mROkLCn+T6bsaxQB4zZ4ietIGzk3LMaCfmZl/xJwA6VTo4eHBFxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cxc7gSbl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cxc7gSbl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so37042315e9.3
        for <linux-tegra@vger.kernel.org>; Sun, 30 Nov 2025 22:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764569570; x=1765174370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gqWOlt6q0VnzXoDw9gLNI555RhmJF/DyPsr1omshpk=;
        b=Cxc7gSblD1kga+ixxfkqqpPpnCHI0Jz0AG+H+hgkm9NfsyZMfQ5xqTge0YWVxuZAFJ
         axrtJVbwUJyDcqjZ8j6Y1xeiPfWnBdKDMwlWMHn7aKeTh8SHWHt8Z0KuzYyH7Tk7rQcG
         cTQugrgVVnbkKcrPUqw2Tq3vb6uzPYSToLQFdA44DzNFFmuCVXZazqWnLmEfMeg7tbKD
         /Juc+JgL5qVhgPmwB5qbPxAR6nFFVNmdWQcjl8KWz5Si8y+BYfOqX7h9h5xuwCPq3yyQ
         aKpR+VlNt688rjvG7vqfKAmqnW41/gGJONRM3RppPA/3jU1zAsCxB2e/lYwdWhWnCvfr
         2RvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764569570; x=1765174370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0gqWOlt6q0VnzXoDw9gLNI555RhmJF/DyPsr1omshpk=;
        b=FXcUwQWeVEjJnQO+eKKI4cQwIDro0xlGxq9vUVP8eUkgaFJiIg9tyOrB7mpUEi0yiV
         Ckgbb6IJhczzmVdONpH61sU/BPEfgPTm6xtuTpokIlp1IbXaXUUQoFP0GGs0wNvWoMmQ
         OAhpTuJe3kXG/h0dGQBXvfNYOlO7UsL2xPm6R1BkzE/zCJKQzwkd3A/hCz4eaPgrk/LL
         b0T8tO1jSeuWQyPBMs1fQewaidABupWffyoo4zFw1ibpGdIvd+LA9u1cgsfLyWr9balr
         vcesuyKrQ585QcuBzrjWHxDRekzTdugJJpJ7ewhND7wz+pqh7AyFcveE2GFpk9t5R3U7
         eeTw==
X-Forwarded-Encrypted: i=1; AJvYcCViTwjilEvnu5TSwBSRXoOMTXIah18MbmQWZ31nrW/N3f8Yq2RPWa21wse3aHZLak9VyTOZ1jk/fHXTbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1V/Sh5tUep46oAgFAfOuyCrcWulwlg4uDZPS6mgI78wYChhd
	464M0IB0nYAf931ZswIrxxQfmNle+1uSHOBRJEZTM6ItJZ/d7D8J3Ciyw7z631kzFKZ+Dlb3Bwe
	yo+PwanYHpw1cb1XGRcIAUfmRAj+KJH4=
X-Gm-Gg: ASbGnctNh1T2yNoX78MfDVsIyuTNlKVZko8Fu5XkkCDTJGsQ7GY3VYau92ToRrFDxQj
	527bpC0gFbNBHlBL7yBUt9SSkeCf8CcD54pcEXDwGmEeLK5lcTFufehbECMKXO/4nwVwCN/grGa
	KHzvn/Gbx3iL/fA7/MAjNlLFzjWeTiS3DAlLF04Sa3B0QqftIyQLJJ1JPau6xTV3EZ8fcNyHXkg
	vrL5PuWLqsQ4PM81vnikVibOZJKTv3viIFdVWr84DpVa3d8bjZ8Fn2i9qGxzjBMw+XDxr8J
X-Google-Smtp-Source: AGHT+IG3M3ax/JFTY6r/6kCAKUsAn9FNfG4fATSRqdxto/IaG1LWGYFhzL7upnvl0p2HSyGlz3IJEPgGEFfXgAl5Wik=
X-Received: by 2002:a05:600c:a01:b0:477:55ce:f3c2 with SMTP id
 5b1f17b1804b1-477c111d3camr385466695e9.14.1764569570297; Sun, 30 Nov 2025
 22:12:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125120559.158860-1-clamor95@gmail.com> <fb3a497a-1e48-444d-ae98-f764d9b5ebf4@kernel.org>
In-Reply-To: <fb3a497a-1e48-444d-ae98-f764d9b5ebf4@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 1 Dec 2025 08:12:39 +0200
X-Gm-Features: AWmQ_blKNbLhm1nZrpgeDj-g7J0p0JVXe7hTB25EN5hsiX2ADUE2rw8DoOGBpiY
Message-ID: <CAPVz0n1nk30=UwR5344c+rk=n6LCn-nnzLCf=CRfWOUPDw-rqA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Tegra114: implement EMC support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 26 =D0=BB=D0=B8=D1=81=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 10:4=
7 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 25/11/2025 13:05, Svyatoslav Ryhel wrote:
> > Add support for External Memory Controller found in Tegra 4 SoC along
> > with adjustments required for it to work properly.
> >
> > Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine=
.
>
> You mixed here FOUR independent subsystems and without any explanation
> of the dependencies it means things are just harder for us to handle for
> no reason.
>
> Please split independent subsystems or clearly document the merging
> issues/dependencies.
>

All commits are independent and subsystem maintainers can pick commits
which are relevant for their domain. No regressions at the build time
nor on the device itself were detected with individual commits picked.
Only device tree changes are preferred to be picked last.

Patchset is made this way to show logic of implementation of EMC
support for Tegra114 since a list of links between fragmented
patchsets will not bring clarity nor it will improve merging
experience.

> Best regards,
> Krzysztof

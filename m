Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC27527A47F
	for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761586029; cv=none; b=uuG9BnekW3eWPvv5ESQsh+LBPh9rSBRgvi0sAXt1/0ewDq+1+wNpisKU1qqGI5hhdkBcyyTxZSO4VfXVtO7g0M3cG87fq6liNU8vGiuHg/FSWLkUj+VxI3q/qIQzB+LirRiqYl9e9dzK6VfbwYDmv9ZAAD+sfstmQnfjrJo3W9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761586029; c=relaxed/simple;
	bh=E37fOle3ST39P+A7lT+g+uenRFySIHC/mg1b7+VoNvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhfNYbb7q8meBhYcI2QVVjc8Co6ztWLMdnsxEDCsj2TwS6oTATkm8psFLt1/lunFR4vBxyxgSeEbbAhJchTt4QCkAaI0yCBPhvdvhw5ZKTtXa6QO6HDtqalt0nNNqZDEXbc7qVNzryMdNi7Au76rfqDJ5EavylLsd9l1mwK51eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ahgrwfkm; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ahgrwfkm"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-378d50e1c82so49920271fa.3
        for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 10:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761586025; x=1762190825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ddh5hq0qRn8Rk6Qy0F8WX9+cfR1Qbj4buJo4sJPvItA=;
        b=AhgrwfkmSRK3ihwt2MmiEA8h/HpQ11QPnCuMkerpynvXsns0xVrc9VPLMo3NwifKg1
         rWUqk6Gltc5khHW0kYu563HPRK5qLXLYttifm8eOUIgir5Pp/22SNwmP51Sfe/S3DVX1
         eJOyE4S5KjtXP0MjC6mcchZ1Vk8KFi77lse8iWqq89NxXfq7ajikrww1EDybNn5UXuMa
         iOxl3Z3LR//FXupA48VuUNHKtfklk1ku1M18TV12eXuzF6katmEzip1g9VMlIBlhKi1P
         jR8nzD4um3CZJj7T1GftG7jirxX0es6FwXLy0wvmjh/xzIFWmipZ2N5Oj2LOn0xHC3Ky
         UALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761586025; x=1762190825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ddh5hq0qRn8Rk6Qy0F8WX9+cfR1Qbj4buJo4sJPvItA=;
        b=xG04VvgUH3WIr7L6NsZFi800SmkA1EeyPZdnKaZjgGw2h11Rk20PyEH058Bt9/ONXk
         2L3tCci9l0ZTvZ6VcSy2yOu3dJXO7wyNtZUSfSw0HlPLqXhAynoNcBsCvPaS0Ri1AXVd
         moDqjGvf1azisHg/RrPaiwROMS7wHwLI6IBXyzLo55Ic4TgfsZKjz+BXOBKGvTf6zNR8
         s4njh/dn1faptnvfsn30r3Nb4/gK0Axtk7WClu9caIySlXOMh+Ke4UATSdIsB8WMgTzO
         iNDooUlMH9s3I3eDIgnzjZjvVNfZvDdh6l1wmed0WBBz/b5yp0lZkMPiys/sWHwvSowy
         0MEA==
X-Forwarded-Encrypted: i=1; AJvYcCVsYJyZR0V3G+51tJLplIcv4cJATS6rMLcNlZHHGbL3l83ofjoOKAwNJHz5HcqkE7dmag4LQA2JM6yxmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzswIHda9ZYzHkLc/8psMuByXydNxzF/aqh225w8m6DyB7/J0o+
	eesHVsk96qSsAvqIEwPdkFwiCRWPzqTrmaEZnONrjIloQ7bA0GhRgrvAdNfB2vacbWiHYSTkCIM
	//WZnegWVyuQN65/dNcc7/grwP5ycr4o=
X-Gm-Gg: ASbGncuHS4Wc00DyUzLHjo+MdQzaTpIVutavh0ye2UMjER83X57EGktzSKs2CTjNVH4
	NVUuyw82BMg6ctJVQBZVoWYylUz1wbLdQZ/lGQG4R4D5hqqG6o5X3hpLoocUNMCSHlqKw2+mT/9
	LoKE1NSMSEJ76xsdWcP4nceTJla7Cwcjr9BEFg+zzN5zzBGdhvigpyEzmYb/XRsALwPWeuqUqlF
	H9saleiUyrthqEnxsEaCBuN4yeADrOIzpzft4kfwAtoWMlF5FvNHlwXDLnL
X-Google-Smtp-Source: AGHT+IFKliPkfdx9RIVLQRN/QzU39GGUoDM7Qll1qTLLc2HT1QruAR8oCisrb3Tu2QDviPTkH+x4Ni8k+J+lFfu1dYw=
X-Received: by 2002:a05:651c:235a:10b0:372:8cce:2360 with SMTP id
 38308e7fff4ca-379076aa91fmr1226431fa.14.1761586024547; Mon, 27 Oct 2025
 10:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-t210-actmon-p2-v5-1-a07dc70e948d@gmail.com> <0c86e790-84cc-4d4a-b12d-3876f2846073@kernel.org>
In-Reply-To: <0c86e790-84cc-4d4a-b12d-3876f2846073@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 27 Oct 2025 12:26:52 -0500
X-Gm-Features: AWmQ_bmzZMIhaAd104M2Pk8eB6cxIvfn6TpmDfHsRKML26idHnHGvI_UUGuHKEk
Message-ID: <CALHNRZ9ZG2Vck4GB4an8-p-m39G2+YGffzOg630Ey6A6MHaCuA@mail.gmail.com>
Subject: Re: [PATCH v5] memory: tegra210: Support interconnect framework
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 5:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/10/2025 05:10, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This makes mc and emc interconnect providers and allows for dynamic
> > memory clock scaling.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v5:
> > - Split series
> > - Link to v4: https://lore.kernel.org/r/20250923-t210-actmon-v4-0-442d1=
eb6377c@gmail.com
> >
>
>
> Tried to apply... and see you did not run checkpatch.
>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

I ran b4 prep --check, which runs checkpatch and that passes. And none
of the kernel ci bots have complained. Normal checkpatch also passes.
If I run strict, I get a warning like the following:

#340: FILE: drivers/memory/tegra/tegra210-emc-core.c:2226:
+       if (!err) {
[...]
+       } else if (err !=3D -ENODEV)
[...]

The code flow should be correct here. Is this what you are referring
to or are you getting an error/warning I'm not seeing?

Aaron

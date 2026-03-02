Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E9387342
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 07:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437744; cv=pass; b=t2cBXHjB7qLP9SUplTChLJMW1pnndAFJ+L7NlUA0jzfNSeAPqiFy1ZUNyV9FnJEmjMKsUeZ+HWmZ7LogtczMuZ3BMJ7hgtVXrI0YVee8I5NH12Fdvxqnel7vKbGt/z44AANiYBR6JJbz3gJsF3j9TuiYlDia/g95K5rV2wB3GT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437744; c=relaxed/simple;
	bh=zfzcHPT+JwZC39dyL/viiO7eTWwNwkDHvlPh65vmq9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KL1vhJrJIWbByuIm+koBSEYRuX/HcwPs+E3UlWGBC/gTCj8QjBtClJRNjoTSlxISXy0coniULbLcjXy2MZlFksoc+J55wa35ggLkB/eNm5ufIG5RwJ80SzJyJLHtbNRH2zJrQ7RODXHmzMKKEjZcedKsktqeLKGgjRXAxljqa88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lj4zFjuZ; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lj4zFjuZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43992e3f9b8so4280123f8f.3
        for <linux-tegra@vger.kernel.org>; Sun, 01 Mar 2026 23:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772437742; cv=none;
        d=google.com; s=arc-20240605;
        b=I1X+QA6z68f+1uKBplZmoOYbMq8rR2ouYAybOq+puCkfJG1bIwQhkuNoEba4pHSqD6
         r/z5htq0tUOvsZAKUpJ/Z/bOfoJusaeeMgTNFuImfpFYuhKfHOJ4JRFu6CXVuNKz+uCv
         Wkc8hfwZ4fyybuQq2l/jHnRPo73glUEsrk805RJ+GLwl17zP+hJfvhsQ7MJSg1S+a59r
         47JnLJonmzOeYGNYX+jW6i0Z4OLbSdbvner/nG2uRxuPvBQh8z8E4X8WzxYmpz3myl8q
         Q4HTwnff3J+WuMfquRX4EEzkttbOfW2yDyqxfJX6knoLkHOjGPlQ5lIHnuX982v8Zq95
         kqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I/oJfr9Pu+urtc/j7fGTmlq8z2GFyLhYZEAdkieiuKI=;
        fh=cQ5GrjZEQDZZh//zTwFCnS5a/qL9VjgiFmswSEXcomk=;
        b=L9lWWHGF2VJ8zVsSCoMwvq3NiD7RhjQUi+GQJcb3ZegyH73voqc0IiHQzcNmDghWlg
         SBG2iLdCaZeny5b5IEKLyV6QLQq1gFiZdQTwjtCeBgHseqbQ7HvWcxgAYi5sw7E8bGss
         sv9n5MJHLUjVu/y3thWoj9chL/QozzyDbUny/9Rgd1gIs4FysTYYEYDYrd/kcXUjsI+u
         EhfIjuImqhnw9xykZse98vI48NLGh+LDmw+3oc6REhucme0wFQAkP7ZNHjQh1mUxANV4
         GGRAXCXoVMkmfOYoEyesR32b0VjnE+y5wb+77wKNQlGTXYJciLMsncP4zv1d40/rpar5
         r0Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772437742; x=1773042542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/oJfr9Pu+urtc/j7fGTmlq8z2GFyLhYZEAdkieiuKI=;
        b=Lj4zFjuZadj9QskrFn52BHDgAfizPkiUjiNzjaoYXJsWQ5AQD3oZp8RO7CRoRE/9Gy
         31S7g3QOkVGCW3gzx/aPGO3s/xgHV5Jie0oqXS2bjmoxyLHU8cklJ8cXhn7fKHSvIQxC
         JAplpB1fAkJQdyCI1FzMtM216q2nzfGRr/dLb0B3c9GU4da061WnizIgTJk3QEJMu9NU
         6gOD1doj3ReX2rE+JPctlU/pWQN7jM7V5W9qoTPVUmUTPDxGLYf1nOBkve9CqzxI9YO+
         /ZQyAC0YFLMINZNlmzrlYX1HLvHd5DSbFZbtiIBGVMUa86A+piyMuiuoIOOsnyexwHJM
         wg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772437742; x=1773042542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/oJfr9Pu+urtc/j7fGTmlq8z2GFyLhYZEAdkieiuKI=;
        b=lFiEexRzI8/1CRI6Ob/wLpV6IcMkJhpqThNRNIUjjUEEaM1F8cb275sMckT8o3hIXx
         pycP9ow6EVVMEXL1VGjYihskBs+1lpSbNF1RykyFOT8GIc0oxjH29I/c5V+6FUg0OZUc
         acB/VRanQ+KQ8LiE9w9UIcZ8ceTWoHQuoKW9CYvjgIzAJt0H7rKlv1fuU0pWaRhd8W3r
         3EUJ8ocrwoBJo/UkKt+aMUOvZnMWIfuwfGOUYl0OW527gnT7KZ8wrdhsq8Bm0HNlfzG7
         4q2QSQJuc61Bhbn6maXX4fvDjiulbEOqSY9X9mKppquS2BpQR6GGzGeAF0201W07XVWL
         FVPA==
X-Forwarded-Encrypted: i=1; AJvYcCUKZRl1TPiqVSUamUYLOx5Xj87UHS9rid547c666RrjtFc8OS6KbdadtLBrNrgb0HYGBSobqta+z2fbjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh/0Fc4Z+towwFYyDaTYpBvz4HS+ZEXkfTJkt+ngvF9qc4A0zH
	X/PxkN/AprRjiljUb5sIVj2JZo2fSNg0eDEeunw6DPdppcgpd1NNSJOH9L4nT9d7OPEUvOLxllB
	N9VksRI2XF0kBCLbHOEIoThnDIfwKEfI=
X-Gm-Gg: ATEYQzzpFwW1fWsbofkZQcPoS0dd/FsO287WAIabFYytXnsXQ7wjyVZyVEOXGNjW5Gc
	pfZAYF4oW3q8pEhllbssfWeqX+9CBsxXRfm/RO3OCElkXNH9/5Zl0N7yr/P1TioYEI60kM8WBQd
	AOkS0qcjL+talr7LOIDPBnBf3AkQFTNtKqKAly30bgQwjqEsAsS9kaORu7y3p7HzvujzoNmQ/1I
	H0YCdeXPlOCZbEiKc8LmFX50suH+LQVcafwo+u5tlAqUu1BFhBTnUdgGBJekhrR+gelKr/z02MW
	mBuuitKHaGW3Ih13vIo=
X-Received: by 2002:a05:6000:220f:b0:439:b7c9:2efd with SMTP id
 ffacd0b85a97d-439b7c930a7mr3857211f8f.37.1772437741562; Sun, 01 Mar 2026
 23:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126185423.77786-1-clamor95@gmail.com>
In-Reply-To: <20260126185423.77786-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 09:48:49 +0200
X-Gm-Features: AaiRm514PkOkLCVQwvZakcRSu5Q1HkrbS3OBb9ig7BeBPfYn1x_O-WPzyMmvm0c
Message-ID: <CAPVz0n32qtkKs1i3E3smAT5LZq7EMWDbe7rjdUNSc7QUE4FmBg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] devfreq: tegra30-devfreq: add support for Tegra114
To: Dmitry Osipenko <digetx@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Thierry Reding <treding@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 20:54 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Lets add Tegra114 support to activity monitor device as a preparation to
> upcoming EMC controller support.
>
> Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.15=
8860-1-clamor95@gmail.com/
>
> Svyatoslav Ryhel (1):
>   devfreq: tegra30-devfreq: add support for Tegra114
>
>  drivers/devfreq/tegra30-devfreq.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>

Hello there!

May this patch be picked if everyone is fine with it?

Best regards,
Svyatoslav R.

> --
> 2.51.0
>

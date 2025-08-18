Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C236286A9;
	Mon, 18 Aug 2025 03:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755487406; cv=none; b=p2lHNFzlz00XkUIXI1dVEdxSK+nQmGHGIhko3iYp0p1M9z5YzONyARdbIKUxaGTE0YRSQeimHJRQ5oxwGgQ8uiBiT9w1YgPaKYx48KBCrpag3CEaq5/nCYmmZAcAYxhEG3LkmKebhvGDRYS28oO8a2i9vU2GaVk3Y8ZmYrsUT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755487406; c=relaxed/simple;
	bh=DqRd++kLOYi/PKl4KCdif7meZuHLxFrK30CGH1IwJOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDdhPrBmZeHF3U86L+M4Y+d21c4igl7Q7BBeAmX/m5lEp098JrFBCeU736Ow2UbtjZ7i+iZ364mm7ts+r34JBi9PGph8GbrTUKF1Rg1t2DKKwYsdFxBAYIA73SgxK5G+sou77YOis5TD57Oc2aZk7InNh28GIkSNEl9zX1Acv9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrBAhhcZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrBAhhcZ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333f929adb3so31324751fa.3;
        Sun, 17 Aug 2025 20:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755487403; x=1756092203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+c6UkI3mH6pJQqcMjW7wcqcwyDQeDy3mYvkDKUpFFo=;
        b=IrBAhhcZr+hz4trQPEDyfrW6uOqRs8bl4gclRDfpgr92WJl/d0SZSq4E7w6J8ACNWq
         ezA0I2Tp4M3Qh0+kLHA4Ey+v+DlaTbma3XB99kgHIYjB0TaPbMV8cFxKj53UoSZqhQuv
         A29qBnuoNTy2FNUV/8i+c/M2ksgI60BhwQfd36Z3ET0t4youF64mUeWCRtgAqr0mRghV
         pgp34cIV4O0SIDPLnjeISXd00GrzVtLmxB8SJcCFSy888JG7gs/Doo20KnLiWqaBPaVV
         BKiBKUqvwGiHanN8MgCrZILVhhQc/tD5hjvuOk8mVIfqjA4OMDk+adlAWPHwK8KEZhJU
         weOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755487403; x=1756092203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+c6UkI3mH6pJQqcMjW7wcqcwyDQeDy3mYvkDKUpFFo=;
        b=dIkM/wa3nNsdkBy917ceHo9pC+ntUvRixgBhgKLyp41xljXmhFn3nPPzQSZ+tFSU64
         EHH6HB5Os2aj9/dY529YQNKB2EHWYYTPGxu5es7Xv6AWa/l9IbAumQj1ghUo2tRnNc96
         UKeWeH2VH/iwwGmESJyFwzvrRZDhmBF3K7UEz1yFqAA0Z7xF2QcxUanxtlVandP0aTKX
         KcH+1goPb2tmqt+KpsfipbdOxZybmq/ePuva5vhdxGfxuMC99mRXo+xWrmNAZeJLERl1
         aK+L7jfEO9sNgBsgClYSLL2qiqvzj1qLh65NyjCsY0fplLMi0yYW8RrG1y9b8b1IGU1c
         29Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUas7VINdSy9R7y8TMkKYcQ0cgqDJd7oZlR77Na/OLCMC4JRcrX2rtfwgEFUsyYhpH/Dwd2nsXm8glq@vger.kernel.org, AJvYcCV440kNQ9f/1s29uiylctJNiaQgDnkgNsKqBlCxVuNCtm5Db0Bs+7002XHtcIjVgRoLmpU9ZVCnR8F2e6sr@vger.kernel.org, AJvYcCVzPT3IPD2t/ISpiGnZ5L57sIT8pBI92Pm6mF9xk9oMHGiaEPjmwP6AScOhwxR/C5cWfJVt3KBzqzx1Trs=@vger.kernel.org, AJvYcCXekGyjdJQ21NwvGrAga2qTnaKvRlQc2uzzPSGoztM/cMF+0EfPYlWedq6L41uKKf9dq3jX205Pcptr@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHzfAxyn0+qxSNUeacn8L2rN4XwcMCONOrlYQL0vMcHpYcBRx
	0odqyW1Ve+ErUL+8WADV+EWaBCr1iZoDWtV+DkSOpaMJkIyrYr+gUVsKgnyHCzKmL4SgrXOQe8B
	D6DaE39H0jgzIpp50D6uNOOCuEVvQmWg=
X-Gm-Gg: ASbGncvdBzA1+sr6GI31wYv/ckUMnV1/gsPQ02+6l8vPe8mrzdG5CJVl4RTj1Tqpe7j
	7ZY2b1Eeous2A5D+pOn7LCwWluY6MzM+hgWvtbRCREOXRuBF+owXroyGz+4By8ebMarT7ZLR1rm
	HH4x0bD8r10ZSoY09pQLVcrB0a+Mzq5tbQr7HvFU0iGutjOSk14sdGWgArkgJJ4IPIWBwNRpOb9
	cbYTJA=
X-Google-Smtp-Source: AGHT+IHgOJWFn1sZdSzgU/oxpUWbrepGI5GDDxpuLOq7lH1HchOEgqHtYfbhc0P7A0+et8YLJgxd6xzVIXpDsCRUUlo=
X-Received: by 2002:a2e:a016:0:20b0:332:2f5b:53b5 with SMTP id
 38308e7fff4ca-334098d373bmr18511951fa.23.1755487402446; Sun, 17 Aug 2025
 20:23:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
 <20250816-tegra210-speedo-v1-1-a981360adc27@gmail.com> <cc3e798e-bb66-4e91-8fda-d1c8fcecf301@kernel.org>
In-Reply-To: <cc3e798e-bb66-4e91-8fda-d1c8fcecf301@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 17 Aug 2025 22:23:10 -0500
X-Gm-Features: Ac12FXxIAa_LkxHC-RZ0PLzSWAmlGE1LRnE5jMOePNHpBWg4aq4Xgw-7kaBJ7vk
Message-ID: <CALHNRZ9kLabyFv5PiMb7jrZgPyjOKe5sWEq7EJPb5LO6E6FUMg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: clock: tegra124-dfll: Add property to
 limit frequency
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joseph Lo <josephl@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 3:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/08/2025 07:53, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Some devices report a cpu speedo value that corresponds to a table that
> > scales beyond the chips capability. This allows devices to set a lower
> > limit.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt | 3 +=
++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-df=
ll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> > index f7d347385b5775ddd702ecbb9821acfc9d4b9ff2..6cdbabc1f036a767bdc8e5d=
f64eeff34171a3b85 100644
> > --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> > +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> > @@ -70,6 +70,9 @@ Required properties for PWM mode:
> >    - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled=
.
> >    - dvfs_pwm_disable: I/O pad configuration when PWM control is disabl=
ed.
> >
> > +Optional properties for limiting frequency:
> > +- nvidia,dfll-max-freq: Maximum scaling frequency.
>
>
> 1. Frequency is in units.
Ack, will fix in whatever form a new revision takes.

> 2. OPP defines it already, doesn't it?
The dfll driver generates the cpu opp table based on soc sku's, it
doesn't use dt opp tables. This property is intended to modify the
generation of said table. That said, if there's a generic dt opp
paradigm for this that I missed which works without dt opp tables, I'd
be happy to use that instead.

> 3. You need to convert file to DT schema first. No new properties are
> allowed in text.
Per an attempt to auto-convert this binding [0], there's a pending
copy already. As I don't want to duplicate existing work, I'll have to
wait on that then.

Aaron

[0] https://lore.kernel.org/all/20250630232632.3700405-1-robh@kernel.org/

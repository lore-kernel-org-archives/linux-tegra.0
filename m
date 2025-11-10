Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137A288C22
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771898; cv=none; b=goxyIyJX9fmODPXY7lWNXbTXdja4zgCDKPHxftaFEslMeziDPMQcS+vrl3odK26bToiB2aj8AJB65jgU3hviB8cxF3EFdrOdKiVWd1HSVEDxbMKVBAaDrapGc54kzluP8olKwvsDpeS2bbRqIobeeo/1Y17HFIQXART6rmwOK+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771898; c=relaxed/simple;
	bh=sV8cROs3dFOC6pjCX5PL2NJwZ3NP1xrJN8UDmNflI8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AV8rwhc1uVtHvolNSz3T793FPypWNfwq1cq0kmti/byaY7N+AjYObg7ULtuHPe//Nh8KbiLr08xh2jkq51dJa1Yrtk0FzVoQYH31SDMNtyigyrEmZkX0IrJYImUSWlYfVRZDB4hieKbL9toa1+uWvaiEGO0OgQ6AVkCKNvAW08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cU5KlekL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cU5KlekL"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-591c9934e0cso3611386e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 02:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762771894; x=1763376694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3nSyx7sHEHeDeu7LgYEFiB0vbj1RV28VjEOVhrx7z8=;
        b=cU5KlekLQWeHbHVY5EazKftYRjhWKrax0JxwTsgySCGeAjJnnfy/a9EDXZme86RWsS
         DDZSMcONgBLMOrSk2U9bPqKfsUxULIKY+2LTpcelxaYuOYHr8kpoXHs4qyV3gojqeEwj
         /k25nHseOfm1yYPEXJBPDob4WwxgnCPPP0HxHLWzNJYBnoNuc9ckeK/xmVQ0/TdmDU97
         kRssIahkUIZvJCxGPBKnKL75NX2qKZ8eNGVnS5gEsCOO3OmBPOdkqId5y2TAYOSyAgDD
         QMjShlVhlC4apb+5wSMejViUdiIcBG8s4khdjOrPExKQdAAubQdeXKz0S4t5x7v5vJED
         EF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771894; x=1763376694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W3nSyx7sHEHeDeu7LgYEFiB0vbj1RV28VjEOVhrx7z8=;
        b=A9EDsRc3u+mCAsxWy9JYLE0eXkFAAIua4UEU0I+cZkppJHpgUxc3Xqi6NvyzqibrcK
         wmevw2mqelGb4oexEkZ3hjetYB+Q/fc5BkPMYKcH1lgWIE2BdUDfXJCofXDczgYX30X8
         Z0Z3zH5309OXcZ1V1VVPJSB7ZWkTX5RYyvily3lESlR/LTJpbRF3jxsf4iv/pZDHCHP9
         1sURhuKeOmH5hj4yBRfdWQmutlIwxQ+UTcFvdxmxh5gu640eltYW5nSyA1naqEElFKqZ
         2xsqc8T2nr+uPAT4AdnV/zrXJ5GIInAan5Jnb1rnMUdG14kZO9cFltiW2mRFtZY4o3ic
         SA7g==
X-Forwarded-Encrypted: i=1; AJvYcCUwiS2q9imSTx6p+Fr27FcL+mwsbniTXTuoXNqL0klG8XMjOOngUPOIbA8sEn9iwnDo0tofa8CuzQG82A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjeoYKkThaJSykdSW7QoWCkkbybGa7y5l4j0X1NzhXu/qpCD8
	FFk8G9cJ+LY+0sGr4Z7kORttM2YM5MMeTvOmfNAN0S5UfAnccAbjoGZK6ui+OBHOceSOiNPet3H
	fLIBRFKxYcaPpNMl1GziGg+X3WiDKYcea9JLSKhr08g==
X-Gm-Gg: ASbGncss5BetSwPQL0fgyxYDZuZ8XH93Y3fEO0xYuDr5GMTXC7vtqXTYyvD9bY4TUy5
	ZMHKnwFzBPWyia05ffDE4pG7sYKfh3pUGv/5ZJazcc7NQLNXmgvh53Wf977psf3/t3YyMvS0qYT
	JcQ4AyuCuZ3vLPBqcSvAfvwKlBI9Ym/uqBKo7f8fXnzwyAT7PU2JxE6MiWldXcfw7YD7DuOvVW0
	folbtZa5fHXjElWJdw9GJ18JKlJ3F6aaUz26GptFwedUq1V0/99DhW/7794R6NHipRm6PpB35Bg
	fGhtmFwiytpRSF7ZPPWe4lyHdgQN
X-Google-Smtp-Source: AGHT+IHVTxNZg9Iea46RFVb+GORMLRps5peJQgiMFx4r9xzzIy/O3W2vJG4Z14WApk/wO+ZVzi5LspbnzJr6l7WI5dI=
X-Received: by 2002:a05:6512:108d:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-5945f1cb2f9mr1931017e87.43.1762771894136; Mon, 10 Nov 2025
 02:51:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106163341.336989-1-marco.crivellari@suse.com> <atnzuecdwp77svypw76e5z5occyh4tkswfc7rg4yqh4joeh7fn@ayygwyjdpe7x>
In-Reply-To: <atnzuecdwp77svypw76e5z5occyh4tkswfc7rg4yqh4joeh7fn@ayygwyjdpe7x>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 10 Nov 2025 11:51:23 +0100
X-Gm-Features: AWmQ_bkcdXSQHUYUpXYWbrqofEomSBTPQr7krtEx6F2AVUGd0pGtyz4_3n0RhQg
Message-ID: <CAAofZF4gSgeY7_qkHG4n375eqHhpkoZTmJu9=p2_k=qwUR3vEg@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: add WQ_PERCPU to alloc_workqueue users
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 11:49=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
> [...]
> Updated subject to:
>
>     cpufreq: tegra194: add WQ_PERCPU to alloc_workqueue users
>
> Applied. Thanks.

Many thanks, Viresh!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

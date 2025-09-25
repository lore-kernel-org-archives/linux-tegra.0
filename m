Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FA43218C5
	for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 22:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758839502; cv=none; b=KX4g+0tqSLEzSUO7NKKc9XeeSNzaqykLrolYAzgJz2QLpb8TT4bPfWzId0OKCXD420vuiFyLsliYFxtAeSnc5JjGGBzVDfdsV9EZSLZUX+m6Kq1d4DiS9rifFZ03Ta5pkG+HKvEndoAMR0UKjwYIrG+t33ZM3BOM72OsH20PSKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758839502; c=relaxed/simple;
	bh=51K/RWydM2PjyVWXirdBujcKFN1Wi7wrBw7jteFADDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMkP3mQemQXa+s+1ZsQOJkcBT7S1dp6KauMOhoSQUXM4BfJHOOH3Kz2Aka2DlqlUXZjGtiUR/ZCLmfaIBPxBceDFjTnsaJiG/8PJXyzRTucccvUppnMcQjW1H0TUG2STY24C6NEqb6lWHmyDAXBsRjczHgjgPZgZCbj249pgMIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bjINOmhW; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bjINOmhW"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8fea25727a9so458609241.1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758839500; x=1759444300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8gdJ7wKziz18TkLvoXgJuOhaMotEm6Z4D28IrFTO2s=;
        b=bjINOmhWlPyicnTfAhtasLSin7j+OJyo3wJRNq4WobLpPqQcGRw+ivPdVK32wIkJ1N
         9L5wSGn1yCxyIFEisZmXNKp/zjoqEC4Ya6IPpEfAADz/XE/s81hqqdqhpFdbLVOIBiQK
         7VJ9UAPAWA6m1EdHg9J330ID+uCB22eSCDwOUvQ1PjAYYu3LEa4r7ax3sKHe7NzIfV3P
         DfyUrp9crecyJkdsJmlO0uItDk7/nke1Rqc/cHeubIDK9+33NZQHsQ47g3JrVb+3NaI/
         sHeFcsPdKcMVh79SNySV/BW4/z9A24xpIgggWwJxQLxSG5jcGIUKPHttoqXwPIMdFswH
         2vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758839500; x=1759444300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8gdJ7wKziz18TkLvoXgJuOhaMotEm6Z4D28IrFTO2s=;
        b=qVIKmrxmzrZE1b6FeRaIkj139sZB2nXrKBvyQ5AhSSyHrJo2ZOq/MCADbOW0wjPl/Z
         tQM9vht+J91LoewVPLEvIU3bZEx454+xpHGbhtcqgMlHSAvBmP4I0/BNsN8gyBG+K27I
         v/cih4GL4vGmhWo4csBapkke6fNsh60DSFSBkDNZTRdCgUJK9AQeBuY/DplrvU5+rfqM
         GVYBH7yghO39i5BAFklMoJtSCVMeToRMVArLdyaS7X+Lb6ARh8SJ/Go9aDkECsC1EI6S
         XGq1XsASV6XqJHf0O3M+t3/PNvplg0LbQWxnckpCN2j4PGn/COQaevwaS2yDMaaCdFmy
         p2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3J+jk3/O8sQOttXkfCF0VDv3vo3vaJaGXJlNtNwy5TphttRFeZrX+BbsPTSeavBe9FYEb7IBY8j4eCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7gXYAkv7vL0UAp2pelOJlEOX1S1JNQqsjGBSlnfNtZKQnm88
	AfBfxfWmTzkl6YFkJMeAuw/yaIlG5v4G+DvPaNn9T3FnSYn4iMj0X4NO8zbKxv1VJTVJuoMf82f
	BH79QdHJ3Z3FIi/sbmjN0ynzj9wN0tmuF6PQ07T8o
X-Gm-Gg: ASbGncuW33M9DivBoKQ6bJlh5gp/hcMPNRwRgimxIn4pZcAkTZ49nV3xvtdE+p3sBcb
	FGIx6AczP6s/dYLwSQDglyhhTkNmGhAn0tjFHHgb1iA4mldj2gDlljLHX21vAsqUlI+k/C/UNUe
	Kyit13iVhO60ZBI2p3d4xs9o7lS/wm8m/4iqbKZ/Cw0lh1nIDX16YHBHd7a26cbK22ccaDqTewg
	sLYdUsTPAUA4vNJ3mDhCFstQxZQacM9sXg/hGDtYdia
X-Google-Smtp-Source: AGHT+IFLlk6iDpEvaZjhHPcTDawfBx/XYJFVbUN5Hu8c0lEpBCCCVTWZi91ZCI4VwGOJE/tK3T8mihQAbe8ugPAiQBI=
X-Received: by 2002:a05:6102:5488:b0:5a2:8ace:c921 with SMTP id
 ada2fe7eead31-5acc4a1eaefmr2368837137.4.1758839499299; Thu, 25 Sep 2025
 15:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-21-ulf.hansson@linaro.org> <4478f28b-47f8-4049-bf17-b7fc95cfac65@nvidia.com>
 <CAPDyKFqSyP3e=JRFYEuFefWVN5SYJWULU8SKzXmrThvyiVGXgg@mail.gmail.com>
 <a904d953-acb2-44f6-81bd-118f7abd22da@nvidia.com> <614f726c-4d6d-463b-a8b3-26d3df590575@nvidia.com>
In-Reply-To: <614f726c-4d6d-463b-a8b3-26d3df590575@nvidia.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 25 Sep 2025 15:31:02 -0700
X-Gm-Features: AS18NWACHkwlAZcjEriaXRqurBvXndQI9uNxb7x206sV9Gbmg4UhlXtVn8x_XjM
Message-ID: <CAGETcx9CpOgtPSDK_qPRQ_u58w3fedSFAfFzugXW4eYq2TLECw@mail.gmail.com>
Subject: Re: [PATCH v3 20/24] pmdomain: core: Default to use
 of_genpd_sync_state() for genpd providers
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 4:41=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Ulf,
>
> On 03/09/2025 13:33, Jon Hunter wrote:
>
> ...
>
> >>> Following this change I am seeing the following warning on our Tegra1=
94
> >>> devices ...
> >>>
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to
> >>> 17000000.gpu
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 3960000.=
cec
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to
> >>> 15380000.nvjpg
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to
> >>> 154c0000.nvenc
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to
> >>> 15a80000.nvenc
> >>>
> >>> Per your change [0], the 'GENPD_FLAG_NO_SYNC_STATE' is set for Tegra
> >>> and so should Tegra be using of_genpd_sync_state() by default?
> >>
> >> This is a different power-domain provider (bpmp) in
> >> drivers/firmware/tegra/bpmp.c and
> >> drivers/pmdomain/tegra/powergate-bpmp.c.
> >>
> >> For the bpmp we don't need GENPD_FLAG_NO_SYNC_STATE, as the
> >> power-domain provider is described along with the
> >> "nvidia,tegra186-bpmp" compatible string. In the other case
> >> (drivers/soc/tegra/pmc.c) the "core-domain" and "powergates" are
> >> described through child-nodes, while ->sync_state() is managed by the
> >> parent-device-node.
> >>
> >> In the bpmp case there is no ->sync_state() callback assigned, which
> >> means genpd decides to assign a default one.
> >>
> >> The reason for the warnings above is because we are still waiting for
> >> those devices to be probed, hence the ->sync_state() callback is still
> >> waiting to be invoked. Enforcing ->sync_state() callback to be invoked
> >> can be done via user-space if that is needed.
> >>
> >> Did that make sense?
> >
> > Sorry for the delay, I was on vacation. Yes makes sense and drivers for
> > some of the above drivers are not yet upstreamed to mainline and so thi=
s
> > would be expected for now.
>
>
> I have been doing more testing and do see a lot of "tegra-bpmp bpmp:
> sync_state() pending due to" on our platforms for basically are driver
> that is built as a module.

It being "built as a module" is not reason enough for this warning to
happen though. One of the main points of fw_devlink is for things to
work just as well with modules.

In this particular system, do you never plan to load the modules? Or
is the module load just missing this timeout by a few seconds or
something?

If these can be turned off, why not turn these off using the sysfs
file or the timeout commandline option to turn them off? You are
burning power by leaving these on. A warning seems appropriate to me.

-Saravana

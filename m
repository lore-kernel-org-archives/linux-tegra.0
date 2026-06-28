Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9623B14D8
	for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782659004; cv=pass; b=JA0GTXT+ef5tGh1vBelsZXRet2v0+j+O44OErb4m2nIL0NipyYlANAUJIrYwCW360zAzypYDQoAA2x/UB4o1j1OhYS7Ba6eDmMnLrMriVLF2VM1qPynCieHjqZfNw48lDfYrUL4EhHjRiYZHbmqUI57NOkI5QUziPeDRk0m07js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782659004; c=relaxed/simple;
	bh=nfvXGen1pZWN7T0sfCH2Bj3OEW1n3dNckFQBTzY8ffo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODM8bK9f3GJfu0V2EEhoNFCc5pzyEHoyQaYbtbLHWjwuC8IrzAi4Gai6VQXuRHMkiMp6zu2p78zuz1TE5p3zjyZA+l0rL9WfSrf5uPORISVZT+O56s592zcCUAknL5gveMySwCnPhFDqDtqX0BfOBVyd9fRTolb7gvUIhFCDMbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDrH3tyj; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDrH3tyj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c0868ca8738so405220966b.0
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2026 08:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782658999; cv=none;
        d=google.com; s=arc-20260327;
        b=MYHAy7MhVj1c4NucXEy9sAEJp2zBCIxB9qASQrEf9yc5BQM2KKbagmWgY4TZ32Fum1
         EQzyBNWSrW89bpJxrB1l1dmgWwyZhIowQCsQy23dE4xOIs+BbsyiiqcXZf0M+DnA0Zri
         n4LMgvFwSUpM5/b0mv+cefHKfRN+T9mB60TMLstS1lUDZLIf7CBsRcaS69rIS0f1uSpE
         q7qh4tSHQcEG055J8ImaBNQQnD4MBjuBsPqKcWGLOIXyfrt1mkwPfBvfqbcTGrCeUAlM
         UQlhALpaK71EsVvxEFhXtQUHFXelNPTqbV2rRlOPiD5cCFl+9mldJn5JkUNy7nMmlrXg
         fFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m+0bTimSr7W6l+WGGk2k0BV0oIenIto2vdlN8jTh3+A=;
        fh=upaNqg4RdcQLLNK547/NnUt/QAgrUXTEQHqb67FVsfw=;
        b=oHFaxYcIfUzMc0xJsneHw8ToeqWJoN+BwctP4NZnFGIfisbnRxjoKm2CfAmh1vTnmN
         R1oPDIws2mlTD3PgcuEi/IREKZFMLlXio4PM1cVuPilc1fDi82Mu/SD+BGk0j31a7QMm
         1dYHORKJAlYWg/g3ZKrv4RZtvfLFDFA20axKZOSn8iPavwrBUi1deU0HKvdSzmIKYvg0
         C1+DRiNlfx7u6fPBThP9u/KFcDHOsaxCijE5uB2PeR3t3LwfEbBVAuytOG3rPqRGM3Ae
         Nrg+SpSFMldx1/cm9UEu2yEHRpQdj+dKyBclrXe3s6/ilQzBAlbsO69D4d8Dl4b4jDzt
         M+ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782658999; x=1783263799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+0bTimSr7W6l+WGGk2k0BV0oIenIto2vdlN8jTh3+A=;
        b=nDrH3tyjTUDEbdenmm/lUYAkB6zhmdRWcPWWzU0JfJw+M7XXKAtv9Hpky/ZbNd36Oy
         DhMaqblewSvaeyKOUfSDb+nxwKxIxsHyfT96yYKgFLP6pwnuvsj0BNCAbkwUa5JVmUfO
         DoltT0Y6GxW7r4CPOPSoKZDRkFToZTYrfJRR0mJtcDxxw0cPmkjMSAevCOgj9vkd5VeN
         xgAbSKSo87PDRnaT7njaToxlSjBYLw4xzFbwsNwmqsbshfu+nXSKQbCgh4kXZfkbgGrR
         gtfMthIDssg+UbN5kxu0z8fmVA7XTUk4PBdahQnbfNrgMRgCja00Ioac9nAfI0LT0FRR
         LXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782658999; x=1783263799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m+0bTimSr7W6l+WGGk2k0BV0oIenIto2vdlN8jTh3+A=;
        b=c+Ae64+CJxDA+beeUTTRq98wsPdm1qdewWBowPxr6i89W8wRsiJ3zz1722Vv58nWL1
         1jmUuY+r5dEF2ng1j0O7NPqlcNu4NNLnRjkayxWDoukY8krh0q6d5C38qs4UirKa3BM9
         Ikr0F14xIMUHFUQPc5UBrZC+RnaIrev/PpZgN8Ji4AjynJaiwbQ+cr0VM5DNWtPO/cxs
         +QNJbKRHuHlXIJEElyp1ajoE81GlDu3cqkyjwv+BzyAK2MvCvkSMuSSGBz1P/wE4XjFE
         A0WB7hIzpHH8CICPjo7EGrRL8+k8PIa5uxyItszTQQu60Jf8YKsVzHhULxopav8I2At4
         q1FA==
X-Forwarded-Encrypted: i=1; AHgh+RqJ2mKVohtOmaWlPa8CPabu5Z/OwmH/tQw/qJI9f8u4rPoEJb8qSqWTd/XK3x0mNLnssawHTNt3zyeuZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypOGUy26z43umbzCb0W4C1TvKZP8tcSg53ac0NbOLoAuY8xWo0
	UBGyU5ZTN4Q3lFMPI8LAuLO1KCNvpP8zzJVhYpcKkVsHQss+D99p3ueaPNSltMudIie6pmWuF+E
	VdA5NEcRW7VZoHw55oJSBe8IpiEz58g==
X-Gm-Gg: AfdE7cm4yiFdltvAeDiHkv35UhApqK2ZefiB1gd79uocaxsMU3np1Xm1D24UAaw635y
	uVPGyEdK7mdX7khHmo0t9rbuG9DZx7h0+egAm6sc8NjJJXYuwHeVBd2j/wueixEwx5MWe+ddh/f
	mTiqQJj57y9Gol+xKk906GwyjahM1m4why5PXwjGv0v/Jc6BkzxrT97j4gd2sm7bx8LQ6QSIi56
	4m+BpRk6ANmUI5RuHytT50mVZ1b6Va7euw0Kiov3AqN7UH2cKMQfsZ2gGRuzEb+T638TaJXaSo8
	71Acy7AM25gbY3coNQuhwO6Juys217UanxkRbPcsj4mnV153N9R4fi9oh5UPRTISrsjSnk5bTpb
	nczCJTafSgxhaowgd
X-Received: by 2002:a17:907:9407:b0:c12:3e8e:2ac1 with SMTP id
 a640c23a62f3a-c123e8e2e83mr222127866b.51.1782658998764; Sun, 28 Jun 2026
 08:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626093014.66092-1-mhun512@gmail.com> <aadb5ad9-a2b8-42fb-bd3e-e0f0e641ce3e@nvidia.com>
In-Reply-To: <aadb5ad9-a2b8-42fb-bd3e-e0f0e641ce3e@nvidia.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 29 Jun 2026 00:03:06 +0900
X-Gm-Features: AVVi8CdOluK8GIc6jFjoiZojQQNPt67eF_wXUtJyFP-gdl5VluS7X3Hp9t5TuQo
Message-ID: <CAGEsz8ETT9W6Wu-+BLK3GoL+M-2X+iHamhxYB==4j7biNGFC8w@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: tegra124: Disable DFLL clock on removal
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for reviewing.

Yes, after tegra124_cpu_switch_to_dfll() succeeds, the CPU clock is
parented to DFLL. The intended cleanup path is not to disable DFLL while
the CPU is still using it, but to first reparent the CPU clock back to
PLLP and only then disable DFLL.

That is why the helper does:

    clk_set_parent(priv->cpu_clk, priv->pllp_clk);
    clk_disable_unprepare(priv->dfll_clk);

This follows the same ordering as the suspend path, where the driver also
switches the CPU clock source to PLLP before disabling DFLL.

2026=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 2:18, J=
on Hunter <jonathanh@nvidia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>
>
> On 26/06/2026 10:30, Myeonghun Pak wrote:
> > tegra124_cpu_switch_to_dfll() enables the DFLL clock before switching
> > the CPU clock parent to it. If cpufreq_dt_pdev_register() fails after
> > that point, or when the driver is removed, the driver only drops clock
> > references and never disables the enabled DFLL clock.
>
> So after this change, if we successful switch to the DFLL, but we fail
> to register the device, we disable the DFLL. That does not sound good
> because the CPU will be using that clock at the time. I am not sure what
> the value in this change really is.
>
> Jon
>
> --
> nvpublic
>

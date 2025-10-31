Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1873093CE
	for <linux-tegra@vger.kernel.org>; Fri, 31 Oct 2025 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761932053; cv=none; b=PyHwJ79YRp/6HADzpj6/W9/gBZq1jgYfhN5MFzsv9n0fy++dYkFcM3d0xsAgGOKV/4MQDEUtjL96YfM+a1xiA6+8q5ve5MWLnVsyiR9TdQNjOQwfBB/yqOj0N8cdRcpniRtKCqCwEtHW9iV+2Um8sELI02wJ91WpMsQC/pAPlAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761932053; c=relaxed/simple;
	bh=vm2rw9OAVVokG1IKy6SQwFUdmwmv0/uh3ee66zoaA1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzVA4FZjF0tv2S1m+PVY6rW9n/lz+2zTgqjZ0Hf1YKnfDx2i8jIiHyKvS/WWTCHPkfKmFrRIXiLDark9LXpaTVj4q6xnHtlyaq8BXQauv8NAU6EYSg7OJrDd6UbLS7293ZcL/lf2PLc8sP2/aQ0FLpoXh3j49yFO6dIxk04nQwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFwG9B4w; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFwG9B4w"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57992ba129eso3333148e87.3
        for <linux-tegra@vger.kernel.org>; Fri, 31 Oct 2025 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761932049; x=1762536849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6TlDaAKDgJ98uF0vWpMqswF6DNe1E/tMeWskNbv9WE=;
        b=DFwG9B4w5Jdo97RfnkKwZp9wNXv/+3r6IThE/u8soZU1jTAithPYFQHG7JByg70C/T
         JUnnGPlzUAhFWXNtX1MKGXdWagaUxQF3VRhWzkwekGS8+H3qFeeYFkqPvXNkOAjASs04
         CRZxlcPtBjmqo1scG7HGhvOBOZBnH2zaa5nv4bvZLEPc4FVpQLElK9XbS4m6nG98YP+M
         pK8U/B1Un2ntbdKjPkt2rjS9TPMNaagHbTl7RfuwIfQeSj+j4Gs2kbLGu0tDTXnnhyBS
         g1wR4V9EksmFOlbERLUFSz10RLNq4obwYbyhvc94tLvRCSXqgPvnpKRmuEwVH2TzGG9O
         OSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932049; x=1762536849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6TlDaAKDgJ98uF0vWpMqswF6DNe1E/tMeWskNbv9WE=;
        b=BTpDqGKzIi5+hLXG9B6TxQj1eqNczDFU5EOR2EmjU9ppDzDL6eTbBmMYiehDFubbu1
         q/zCwHePI0V9eCsuSlWlYs/jYbNee3rTHPTzCwCRZJovR5VrkfeuLwiL4GypwtTueCTD
         EQmy6+MSVsXi0EJBZHLErnQb4aASLuXun1IbwTpTzBVBeyywtXO4oJQ1Q5UZ+cYibyJf
         fgZF2/0W7BGmFZ7nh5gXH86+9b6xf55+f9Jj7FX77KMmmB/iBU5x2sCtsD15fj6IaVaH
         CsRpFl89V8EVF4USfu+GyQwZWAD6vsgKqHpDzPND8mGoYOkUx0KBJ+bXOoLSD24WScw1
         tPNA==
X-Forwarded-Encrypted: i=1; AJvYcCVjuVEAuI0yppSiYx0o1LxdqTW9blLVqvfkEohe3eC42FvaQKO6xs88eDKqGLLz32aDchP1lEOlDm8vDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5snWRhYJhECPHSxHjnjTdCjZZqdPR1IfehKM0PEu6DssS2VfO
	pEsF3OrCUR01X75/UDvlWYWLqmZRGYDE09etvUiBV+EXgZAvINIUgE5ydQUOpz4e4OY6v30JHv0
	aNgCJat22PNkHit9yEljpcBU5GXh18wA=
X-Gm-Gg: ASbGncuwZST6ayOhodw54Z2PE7tDurOnzE4EQFHqrVNgyzOgRGBBUPYAmUoZZwHJHSu
	38lLF/FlNL30O/YXNCmanH5lQByXNK5pdg1XigCt0qvvpWxOSjN6HoiSggMlTsHbDPfCwhziRCD
	NESdBTNi5p3mldS2mr0Y12xrRY+r2Ja0GfEaI0P92vifw02GIg19UJD5ijJJsKwZZKc3K82tET2
	zFd55bCCWHtR3zfK1EnzZtLQ8IH0JAZdiCUSzohTDBCCSOwi8FfIDIa1fL8
X-Google-Smtp-Source: AGHT+IHhMeiEyIqzYzHJijcl5TBTNGDRr/d5tb8yS2TDpbW9JbWHSHKcLowQEjw24NE6wUQ1efQ67W+06guv2WUu/pY=
X-Received: by 2002:a05:6512:3e12:b0:592:fbb6:889f with SMTP id
 2adb3069b0e04-5941d52a9bamr1587311e87.20.1761932049165; Fri, 31 Oct 2025
 10:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com> <865037d1-c89f-4142-a66f-3283c17bf533@kernel.org>
In-Reply-To: <865037d1-c89f-4142-a66f-3283c17bf533@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 31 Oct 2025 12:33:57 -0500
X-Gm-Features: AWmQ_bndHaJNZHt0znns91r43ADIO5ad3kOUvwSt-EKT1lzX_wlGtIud0hl6pEo
Message-ID: <CALHNRZ_gvEdkjmum-VZa050HOPPweD8sL4K68-j3PLRc1pCErg@mail.gmail.com>
Subject: Re: [PATCH v6] memory: tegra210: Support interconnect framework
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 8:19=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2025 18:48, Aaron Kling via B4 Relay wrote:
> > +
> > +     err =3D dev_pm_opp_of_add_table(emc->dev);
> > +     if (err) {
> > +             if (err =3D=3D -ENODEV)
> > +                     dev_err_probe(emc->dev, err,
> > +                                   "OPP table not found, please update=
 your device tree\n");
> > +             else
> > +                     dev_err_probe(emc->dev, err, "failed to add OPP t=
able\n");
> > +
> > +             goto put_hw_table;
> > +     }
> > +
> > +     max_opps =3D dev_pm_opp_get_opp_count(emc->dev);
> > +     if (max_opps <=3D 0) {
> > +             dev_err_probe(emc->dev, err, "Failed to add OPPs\n");
> > +             goto remove_table;
> > +     }
> > +
> > +     if (emc->num_timings !=3D max_opps) {
> > +             dev_err_probe(emc->dev, err, "OPP table does not match em=
c table\n");
> > +             goto remove_table;
> > +     }
> > +
> > +     for (i =3D 0; i < emc->num_timings; i++) {
> > +             rate =3D emc->timings[i].rate * 1000;
> > +             opp =3D dev_pm_opp_find_freq_exact(emc->dev, rate, true);
> > +             if (IS_ERR(opp)) {
> > +                     dev_err_probe(emc->dev, err, "Rate %lu not found =
in OPP table\n", rate);
> > +                     goto remove_table;
> > +             }
> > +
> > +             dev_pm_opp_put(opp);
> > +     }
> > +
> > +     dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu=
 MHz\n",
> > +                   hw_version, clk_get_rate(emc->clk) / 1000000);
> > +
> > +     return 0;
> > +
> > +remove_table:
> > +     dev_pm_opp_of_remove_table(emc->dev);
> > +put_hw_table:
> > +     dev_pm_opp_put_supported_hw(opp_token);
> > +
> > +     return err;
> > +}
> > +
> >  static void tegra210_emc_detect(struct tegra210_emc *emc)
> >  {
> >       u32 value;
> > @@ -1966,6 +2222,14 @@ static int tegra210_emc_probe(struct platform_de=
vice *pdev)
> >
> >       tegra210_emc_debugfs_init(emc);
> >
> > +     err =3D tegra210_emc_opp_table_init(emc);
> > +     if (!err) {
> > +             tegra210_emc_rate_requests_init(emc);
> > +             tegra210_emc_interconnect_init(emc);
>
> This looks like new ABI or did I miss something and it is already
> documented? If so please always mention in the changelog that bindings
> are already merged to master tree.
>
> Same question for earlier PM OPP.

Both of these bindings were picked up on v3 of the original combined series=
 [0].

Aaron

[0] https://lore.kernel.org/all/175749727162.29308.12636309161261093675.b4-=
ty@linaro.org/

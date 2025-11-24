Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514801F1932
	for <linux-tegra@vger.kernel.org>; Mon, 24 Nov 2025 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979398; cv=none; b=Vqon908jdVS2fZ2Cb2iCqEcapWweiF7ORYTfVHjm3D1gJ52/yeqcvGCfAsqHpvdBZFUE18ESUy8HIJLmZA07fsWwsusL4CZszye+SjOoA/bVVXg48b5q/cCVK/MxAETlCOX3lljwqm0K5K3OdgtfUci43V9FsAk+MXGRjlvFs2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979398; c=relaxed/simple;
	bh=p3+Wkeoi+awOerBEqliUtsZVxYdk/VvMuODr+mw3q18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYtnDLt6oosdJycXn3vIEwMPwrUUIQT42JxNA+Q7aJ9wcGlVqaL0qPM/vm041dIkxKXpDWWnWPch+Kh+rUpNUI36NNdFJin8l+eiwHBzQrDeZ0qzqPqATMw+WjZcC03X1Cp4T30qEEP6VtWa93bDJqvM3lGKoIQ/tcu4QGDEE2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yN/MTMQm; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yN/MTMQm"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7881b67da53so39647317b3.1
        for <linux-tegra@vger.kernel.org>; Mon, 24 Nov 2025 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763979395; x=1764584195; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MUJocug23WNDU1Y6GfZPFr7BhDF2XBVjY51YTnPiJ9I=;
        b=yN/MTMQmuUbOKW/1haG1umPRA2w46BoaJ5y/QEiLCOrx0qQ4APqE0XiAY9E4VGvf8l
         Q9y5szUzSQqE8sRtO2FTnuUpUFPhAXHBpTwOBcAlcRa28L4nhckyVzFv5Y0GwBSHEzeu
         VCZSx/eUK1tyd9jqmbEHCIcFWs1NM7rFF9PGKbx/kqlwJxCHbvsd8sCgPtJYo/RNiL2d
         cfm4+1dvS7xy7Kpjb1wNbv/R+l1KJ+vKs3o+vxj2tkxJpcbKp7XQiS9FpGjdfAQT6ZeS
         sQ6Qd5i2rKGFMO56L5PV2HNeerPU3Z5Qfz8OCH7u8DF2v7W0eI2Zh8v9V23jUmBpq+PM
         CUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763979395; x=1764584195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUJocug23WNDU1Y6GfZPFr7BhDF2XBVjY51YTnPiJ9I=;
        b=VQkPTky7nm3s77DIvT/pjvGSQ25mmx75u2x1TArliK8aD4lGAVrf7ZuMcSoSRI/DWc
         mOReQpB6xkabG8NirD9dOON3Xm8N1GT9MnV1S/DRsi/a0m+UDReyUIl0Y6Zh7p/hbDcg
         1y0E8VhHmBlIcsreKTlp8RRGOlWafmWs4qMvkmftCVpfmVfaYb3+vXqSK1YBiDP7CQmg
         LExreKRlIuvc1CGYGDHcPH5n6c6WDE/hbOJ45GeyWuQkWbiSXKoHfVYZDF6Tiu/5EzSC
         NhW6E3pWVMerQApiFko25gIKwPnfgGp+iOv+K67oSCbkzluU4rOtONXVAY1/qhX6mUEP
         80LA==
X-Forwarded-Encrypted: i=1; AJvYcCX3ek+RBMMDSLRU5XwZuqh1ha8jDUOWtvcOuvP6sX5Y0rDlK3UZ8VWHtxGYJ60xOzrZhAlXYHF6kfZeGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOZlSHJeWiUCrOH1cnWtf4FOoF09kboVouD2qXdDhOnhy1QtjM
	vqBx//u4YFjwZn4JoTB3KfTOC2p9nDLGX/TB4vQ7BLd5cFeM9whkegcGOGhOabLt8V963bZ3bcr
	0EGnrfRbG733VWZckdpnBer363Rv5uHFJLrzucq8ckg==
X-Gm-Gg: ASbGncuqmRIxkWwahc0ZegxF//TslPbMVfZdYjDCWRaRBGMhssRnddWPI4C3Jv/rjTX
	wlnyu7mFK6548Q9S0FE7/Jo7OTpQjbGBgCMa5yr7xlMVPZynRJwr1a74LdLB3DSHxE7A3WasOvH
	5EF6RgPumB0jiwwk2jlKDxbUGg3/L3m4soF/a8dEJVKAsYx0fss7JbArZQToqMZUGTEwEFntJ0G
	yATNxeAh1X1k8lrEoJrMLcM0VKvuQ/qoa8mwBPeZACVQrYPLznjYLIKCshKBz1YQJcgn1zS
X-Google-Smtp-Source: AGHT+IFk5xPuC9WllFeYsMt+cAg6kWbQNM3KukyATnXbYdApjEIkRdeGdUKoq+5c0uXHzxg9wlZtxBQZ72ka+tuwxxk=
X-Received: by 2002:a05:690e:10cf:b0:63f:bab4:fde6 with SMTP id
 956f58d0204a3-64302a31c05mr5812050d50.13.1763979395064; Mon, 24 Nov 2025
 02:16:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121141003.1808684-1-jonathanh@nvidia.com>
In-Reply-To: <20251121141003.1808684-1-jonathanh@nvidia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 Nov 2025 11:15:58 +0100
X-Gm-Features: AWmQ_bk3EBTHXt5C05GTGKRYiwOCqayqrpMK8udBn5ehvC6IZljccTyU6QUcoeI
Message-ID: <CAPDyKFrsXydSXEZYxtuqQRwydbuq+VawJ+J_8EvaeYUkMSizag@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: tegra: Add GENPD_FLAG_NO_STAY_ON flag
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Nov 2025 at 15:10, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
> late_initcall_sync") kept power-domains on longer during boot which is
> causing some GPU related tests to fail on Tegra234. While this is being
> investigated, add the flag GENPD_FLAG_NO_STAY_ON for Tegra devices to
> restore the previous behaviour to fix this.
>
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/tegra/powergate-bpmp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/tegra/powergate-bpmp.c b/drivers/pmdomain/tegra/powergate-bpmp.c
> index b0138ca9f851..9f4366250bfd 100644
> --- a/drivers/pmdomain/tegra/powergate-bpmp.c
> +++ b/drivers/pmdomain/tegra/powergate-bpmp.c
> @@ -184,6 +184,7 @@ tegra_powergate_add(struct tegra_bpmp *bpmp,
>         powergate->genpd.name = kstrdup(info->name, GFP_KERNEL);
>         powergate->genpd.power_on = tegra_powergate_power_on;
>         powergate->genpd.power_off = tegra_powergate_power_off;
> +       powergate->genpd.flags = GENPD_FLAG_NO_STAY_ON;
>
>         err = pm_genpd_init(&powergate->genpd, NULL, off);
>         if (err < 0) {
> --
> 2.43.0
>

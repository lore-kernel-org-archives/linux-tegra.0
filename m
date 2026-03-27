Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B1737BE7D
	for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 20:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643052; cv=pass; b=lLyYYRlEtOhXdm8SsaoE0JW6P9vKhAlXuO6poxgXZfrttrohmegBwLK0AgN35w/H77K9kjZEjFs7DkGF3Ydo29GmMTc/S5JZW/TMB9BGeFXVeIHRbmrELGAaFSz4swW/cBEcwpjpt8lXWSR8RDENxwlyqYczSBPJQM95ypmRJq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643052; c=relaxed/simple;
	bh=fe8HYEgNDSZEJwtPnP9d7rdRK4mOuzWO1Arb10bM66I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=beO3Cwpsbvqkwd/TGBy9nCER8qd/lL6FYuRIeAxNiu2I/qW71C48h9ZTpNdbqono0jF7uDw1LSOgzrRRuMooLJyOL9V1X89gIJUMZGXPwL0e4PDMTOPiX/pkqx/luE3dQ4hc1I/hVbNFiJRIr+2zqDE/xKd38nl66KWNtbj+RQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VuqQy0dF; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VuqQy0dF"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66a33f61d80so4222552a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 13:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774643047; cv=none;
        d=google.com; s=arc-20240605;
        b=TuZu8lhlOfclIuMazrs4Gz6sc5Nqn/o3X/YQSLIk7tqHPpdMJhFBkvCWIPtZBRMD79
         uKCk88BSQwYi9Ad6MaJPzBbCWC9IHUc4dGe0XdNEU3D3DyQhZKw22XV1jpffzrRMFXaw
         O50TGlPutyDQv/FCDT8wqzfUwvT1MyIMRi/cm9lYUnnhKWvRVGU1Zs6BtYWKCeSVVBF6
         32N5IT1WzUAyBV0NLmpz/HLQXLrIbU6JAxVGw1FBOvuDH786Xi41du3S+P24/yZNnQwu
         EecQSzgB7P4jj0g9yeuyMgY1bJSesrR2NN4T4D3m1/PpHrxm1vPoMudvBXWPrn49bLI6
         Oo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        fh=/ux5icjn4AuE3RWnZQ4N530Nd+W7BZi+Pt/YEMbqDKk=;
        b=dQAAxKeCVKUVYH9CmqKm1g2DyFkiD7JTg2Ts5fKXApeIxXRKeYnBa4ICLJfdXCGp1h
         Ct9QNuwpZ2qcrD9oQ2UZ+Feq8kUg6dtWrSpbs9M8PAJ8LrD2xujK293BHmXdMmlysOVs
         aL9lETeF40DBVzIJsChwLuRVTYRHFaCrjAV2VijdAiJvEreQ1+Ma3wbI1UcJMFvQjBLN
         pi/WpmzNY1wB6BOXwecBSWyugZajZWKDRW3eqqacq2RbSLSrAHHNstNL2BhUqEVbgkqi
         eUWv7+bgMRggS8IN8wjra5g8IBdQpRq0r0f/ndiXGG83e1VskbxhJ3dl5bZhmWmQJ1SH
         iY0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774643047; x=1775247847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        b=VuqQy0dFFUKCW5LFnvEaxGiKsvA7wZMtgk9MpLPdPYNG0CjRWontr06l/oScJ9SlL1
         r9wEtzgkdnjKi0jIFmkCWVMcUt1DKXUUnD7yfUC1jgsUScQbM2/1SadvK6JBbSkmQYv4
         qSJ68sbS0T6VZPCTKM6GaMbq+iX9Q7TUrvklbvVXtraoXJ2iQJiNf1CCxINzF8kNLKwP
         NOvf4x8hp0t8wrVujWooo56OYrlQ2VJYEsTv/8AoqFdQu5mfMcrvLthjlYiwU3SoH/Us
         hlNdeZy9StxdLBHAoU7DXMvu0AqipWs5uVJE/jJHuiXn0PFfRmPiYl7JPpxJvKz+0G7z
         /5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643047; x=1775247847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        b=S2DtZUGFkzb22WSFobahYmGxcyyT/oFAXSERbRcAZy5adyXm6d2RXn37vPXTUiqcoN
         Hjdl9tzJe8NQ1wLCPR21zeeBq+GKETwVFGer286mYNjnJ37NKH7V1Y479Ycw/FGUHQ4Y
         n+QyPBY0IqpeTxwjeHrxZTV2rMr1Rn2O4ZV+OKP8cLdMEEc544jW8tq+KANlovcx9ttS
         wE1quKiOu1K9RMZbiLO9tf5velteqUmGB3KFtlXGvYj3JuHHqU1Q//CgdrDebRAnpT0Y
         Qptvi6j8xXoo30jSvxzry+2Ab+wztjrqQuM88Di9VfDciWprLTo2J/8kMJch9o8/0jy1
         FMSw==
X-Forwarded-Encrypted: i=1; AJvYcCXOw10ti2n3E+4w5DemBxSuXmtpB942qBbILrY/0BTqHEGXrWU/yiLxjbU4aArgrUTvIMos/pkPayQWkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ04y2mxQsKTutuA/i3PYLpu86tqrKk+2Xp2wTpEFmpLMPfPeD
	qo9bUUG9uLH+kEXkRkaTc/6t4FUlocOEob0lm1ULwMTpa2ZAQOFvBjzrZtQ0K/+/l/5rtXw3Qr9
	sMAc9RKsISVoYeQDzIqhyZlJS0Ypjj/V36Fj/Cc9syg==
X-Gm-Gg: ATEYQzzXb50rkatlrZF1fa5KsoSmTA00uDCY53NTVClQSeqTUEqZcfCFu2m0ERmuQn8
	WFAdPvUd6bqvRFcMqR5sf3Cw5MLnEGAY0BvOie/h3RMHL8dQgphwL2wo0cjma2sCcWlES/XkSPe
	ur9D0u7ev4BnJKEZoXo5qiaR5OaZzfdD/y/1XJjFUD7O1O4GFdTdoQCgf655jJOFXJpKatEbhPn
	T4Q20nTFdcw2XBhHfQtHDv8+GNpjlxDCdAQnRI1Xhn1BtNNz8IM+2KFTMBu9F43TQo8W+OMkXJy
	9YmBYuSatFhBX4PgMPxdaJ4bUB7NsvMQepuXyzyp
X-Received: by 2002:a05:6402:46db:b0:66a:199d:138 with SMTP id
 4fb4d7f45d1cf-66b28c66cbemr2039826a12.20.1774643046839; Fri, 27 Mar 2026
 13:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com> <20260327184706.1600329-10-vladimir.oltean@nxp.com>
In-Reply-To: <20260327184706.1600329-10-vladimir.oltean@nxp.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 27 Mar 2026 20:23:54 +0000
X-Gm-Features: AQROBzCjrloDfUGTlNvOpQXdM4anVOjHCl2P0WQRB2XbIrpLYVg7AhYSjcExBJI
Message-ID: <CADrjBPqMwtrae7LB9A8xipg6R0rHGewe69awQ_jJnsf=2c=eTw@mail.gmail.com>
Subject: Re: [PATCH v6 phy-next 09/28] scsi: ufs: exynos: stop poking into
 struct phy guts
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Bart Van Assche <bvanassche@acm.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Chanho Park <chanho61.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Mar 2026 at 18:48, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
>
> The Exynos host controller driver is clearly a PHY consumer (gets the
> ufs->phy using devm_phy_get()), but pokes into the guts of struct phy
> to get the generic_phy->power_count.
>
> The UFS core (specifically ufshcd_link_startup()) may call the variant
> operation exynos_ufs_pre_link() -> exynos_ufs_phy_init() multiple times
> if the link startup fails and needs to be retried.
>
> However ufs-exynos shouldn't be doing what it's doing, i.e. looking at
> the generic_phy->power_count, because in the general sense of the API, a
> single Generic PHY may have multiple consumers. If ufs-exynos looks at
> generic_phy->power_count, there's no guarantee that this ufs-exynos
> instance is the one who previously bumped that power count. So it may be
> powering down the PHY on behalf of another consumer.
>
> The correct way in which this should be handled is ufs-exynos should
> *remember* whether it has initialized and powered up the PHY before, and
> power it down during link retries. Not rely on the power_count (which,
> btw, on the writer side is modified under &phy->mutex, but on the reader
> side is accessed unlocked). This is a discouraged pattern even if here
> it doesn't cause functional problems.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
> Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Chanho Park <chanho61.park@samsung.com>
>
> v5->v6: collect tags from Alim Akhtar
> v4->v5: collect tag, add "scsi: " prefix to commit title
> v3->v4: none
> v2->v3:
> - add Cc Chanho Park, author of commit 3d73b200f989 ("scsi: ufs:
>   ufs-exynos: Change ufs phy control sequence")
> v1->v2:
> - add better ufs->phy_powered_on handling in exynos_ufs_exit(),
>   exynos_ufs_suspend() and exynos_ufs_resume() which ensures we won't
>   enter a phy->power_count underrun condition
> ---
>  drivers/ufs/host/ufs-exynos.c | 24 ++++++++++++++++++++----
>  drivers/ufs/host/ufs-exynos.h |  1 +
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 76fee3a79c77..274e53833571 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -963,9 +963,10 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
>
>         phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
>
> -       if (generic_phy->power_count) {
> +       if (ufs->phy_powered_on) {
>                 phy_power_off(generic_phy);
>                 phy_exit(generic_phy);
> +               ufs->phy_powered_on = false;
>         }
>
>         ret = phy_init(generic_phy);
> @@ -979,6 +980,8 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
>         if (ret)
>                 goto out_exit_phy;
>
> +       ufs->phy_powered_on = true;
> +
>         return 0;
>
>  out_exit_phy:
> @@ -1527,6 +1530,9 @@ static void exynos_ufs_exit(struct ufs_hba *hba)
>  {
>         struct exynos_ufs *ufs = ufshcd_get_variant(hba);
>
> +       if (!ufs->phy_powered_on)
> +               return;
> +
>         phy_power_off(ufs->phy);
>         phy_exit(ufs->phy);
>  }
> @@ -1728,8 +1734,10 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>         if (ufs->drv_data->suspend)
>                 ufs->drv_data->suspend(ufs);
>
> -       if (!ufshcd_is_link_active(hba))
> +       if (!ufshcd_is_link_active(hba) && ufs->phy_powered_on) {
>                 phy_power_off(ufs->phy);
> +               ufs->phy_powered_on = false;
> +       }
>
>         return 0;
>  }
> @@ -1737,9 +1745,17 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>  static int exynos_ufs_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>         struct exynos_ufs *ufs = ufshcd_get_variant(hba);
> +       int err;
>
> -       if (!ufshcd_is_link_active(hba))
> -               phy_power_on(ufs->phy);
> +       if (!ufshcd_is_link_active(hba) && !ufs->phy_powered_on) {
> +               err = phy_power_on(ufs->phy);
> +               if (err) {
> +                       dev_err(hba->dev, "Failed to power on PHY: %pe\n",
> +                               ERR_PTR(err));
> +               } else {
> +                       ufs->phy_powered_on = true;
> +               }
> +       }
>
>         exynos_ufs_config_smu(ufs);
>         exynos_ufs_fmp_resume(hba);
> diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
> index abe7e472759e..683b9150e2ba 100644
> --- a/drivers/ufs/host/ufs-exynos.h
> +++ b/drivers/ufs/host/ufs-exynos.h
> @@ -227,6 +227,7 @@ struct exynos_ufs {
>         int avail_ln_rx;
>         int avail_ln_tx;
>         int rx_sel_idx;
> +       bool phy_powered_on;
>         struct ufs_pa_layer_attr dev_req_params;
>         struct ufs_phy_time_cfg t_cfg;
>         ktime_t entry_hibern8_t;
> --
> 2.43.0
>

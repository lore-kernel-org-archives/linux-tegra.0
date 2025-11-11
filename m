Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B8525F975
	for <linux-tegra@vger.kernel.org>; Tue, 11 Nov 2025 01:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825161; cv=none; b=S4+kTTWNJVUfdCaD5ErbCf5DFiH/ncPH/i/C8TfwPmYiFoiNmcyatwWMfeQkSjT7ehrRKi5Y3cGrSC2r7pDhtLa/KTR8VZMv+EIQJWCIA83BHDTjlZUoo0Zn8NBMwumvH2Y8w4LDfF7EUNjiIX+Nf0oSmROZxRINsS6IWppBN3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825161; c=relaxed/simple;
	bh=fvwFoq0gImqhWs/uGmAkMzEp/a3GodXI2N7RdQuDsd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kE9Bsmc/tpRxNAQaAlJwjkltckzMx5KVJm5Dwr1IXfWebPmnO96S0EnY5op8zMt808Z+99+atR/5Jy9ZmN3XUOmVWpa23jDzdeVv+GNU+rIqkXUaLeTysQLgsz9M5oY1EJRHjJg1AU71YgX83CiAt6Z97akWWnMos8DiodaCtng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ada+ciGL; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ada+ciGL"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-591ec7af7a1so3188941e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 17:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762825156; x=1763429956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjcYut8mRbJ+0NSwSCXDTcCxzwARv5RKrw9qEU6ZPVw=;
        b=Ada+ciGLTRpOFndzcSUqGbCDaL6GRIHbSPcXoHw01IZbEn/xUSykZ2O+WTRWXHK4Qh
         da6gdEwu8jRZjb0Kks4hcdutZ2u5e5mrzFKxEo9clZuBp6tCDECKrHrjOMhAv9Dpk19c
         XiIlMxkWPkwuHriM0MgvqJZowFfj7sMX2UgA/Rz7Dc36shJ8F/qW/RnBLDJiqikC6vnM
         NHIPSRl/M+mn0ffEG6pBXHmaylRQHYviIb72rKkwg06l/4j6fOGohmmL20CZPvPT8bT1
         LW2hghwnFa/uXBVlizk5YGOwSelxgyac7X5GF4CAJ1eqkn+YkeVHJcdg2idkbqr+hkAb
         MyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762825156; x=1763429956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VjcYut8mRbJ+0NSwSCXDTcCxzwARv5RKrw9qEU6ZPVw=;
        b=um9JL56m6s1KQYo8xENbM+VlCFaBfYc/30e26V8nlk4sOJnnna3gb6kr7+GoKeDiPO
         8bbgPXynP/jfFvztJ5dWHgWhtIUCdq6EGSW/zF3af8EHUzHYoS/TjEHIjds/Pzpi9Kqm
         IaQuw5yqNlO3BSEG4ssQx8ZjVLnV1R/wV4D+eRPM7Pejsfk5XKCb0NuT3uQZy2LlF+zR
         QqfD0u8oPVvPa5pupBloUficOpo4DWOWTaj1Gs+Kt8b0m1NQFwn5InKyUC8SIL2gCW/S
         vBTMDQ/Cn8OdT4FpgQn204J6jbxmx3PsDsj8r2AZnxdkeSD/U5bIgngYSG1lJeQdeerd
         tRBw==
X-Forwarded-Encrypted: i=1; AJvYcCWdc3N/K163IuqiDdL2BSNBG+L3YKt2k5jGqaJstm95xnHLLBfs1nu86+g9WPjWq4WIiZlPS7i5j4ubVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcnfzaIYjKIusevBnTNC/JDjs76glpeZV/JG30qFr/epNy7d/
	S8x0f+Qon+oekzF6Vz/GTYFysh0nOLMroTkqGsJe6FdQfPTew5NyWNQN5XtSrypsvDZby3Akm0M
	+1kSbreWMcM9Nt7Gcy/3HVT8jEK9G1jA=
X-Gm-Gg: ASbGncsUygTFbAIFwhg26oSAEJNrxJV8SEZtFUvnm5cUfwSerximSTpWZ7bCpEDO0Zk
	e/GWnnI5lcjLJ57x2ABXzuUcfobNuL6Kpr/2/0JeQOiW1KQR2k7VCYhwq366Xdx8YMQok8l6LKy
	ECbTi4JQSv9IPnp7XqfMgtNGMi67ddpvKA1m5X1ZY6TJS2WQA4Jssl717zuh7XgGmdsoX0IoO0R
	zlvIbZemW5FaTVR0a+Y+Ik7e4SgP/HkUd1Axb5HqW281uRAgySVeI330LrD
X-Google-Smtp-Source: AGHT+IEhImSP6xd5JDndxNfD3dM5Fv9ktgq6QQM4H7U2o/38q6/GJM+SH8kLSOHnhbLX0bLIVVmq69pxx3NQ+9d8IHM=
X-Received: by 2002:a05:6512:158b:b0:594:2d3a:ac3a with SMTP id
 2adb3069b0e04-5945f1cbad0mr3388082e87.50.1762825156065; Mon, 10 Nov 2025
 17:39:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com> <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
In-Reply-To: <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 10 Nov 2025 19:39:04 -0600
X-Gm-Features: AWmQ_bniIgBfNBUUe3XT27DkKk0oRrjwOmlAqGlN-teWyJ6LnH1WV5-UL2Cz7WA
Message-ID: <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 3:55=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Mon, Nov 10, 2025 at 3:25=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
> >
> >
> > On 27/10/2025 18:55, Aaron Kling via B4 Relay wrote:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > This adds support for dynamic frequency scaling of external memory on
> > > devices with bpmp firmware that does not support bwmgr.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >   drivers/memory/tegra/tegra186-emc.c | 132 +++++++++++++++++++++++++=
++++++++++-
> > >   1 file changed, 130 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/teg=
ra/tegra186-emc.c
> > > index 9959ad5804b444b269456d1fbae87b4bc111661b..74be09968baa7a0fbdce4=
359f470ce56b18acb10 100644
> > > --- a/drivers/memory/tegra/tegra186-emc.c
> > > +++ b/drivers/memory/tegra/tegra186-emc.c
> > > @@ -18,6 +18,17 @@ struct tegra186_emc_dvfs {
> > >       unsigned long rate;
> > >   };
> > >
> > > +enum emc_rate_request_type {
> > > +     EMC_RATE_DEBUG,
> > > +     EMC_RATE_ICC,
> > > +     EMC_RATE_TYPE_MAX,
> > > +};
> > > +
> > > +struct emc_rate_request {
> > > +     unsigned long min_rate;
> > > +     unsigned long max_rate;
> > > +};
> > > +
> > >   struct tegra186_emc {
> > >       struct tegra_bpmp *bpmp;
> > >       struct device *dev;
> > > @@ -33,8 +44,90 @@ struct tegra186_emc {
> > >       } debugfs;
> > >
> > >       struct icc_provider provider;
> > > +
> > > +     /*
> > > +      * There are multiple sources in the EMC driver which could req=
uest
> > > +      * a min/max clock rate, these rates are contained in this arra=
y.
> > > +      */
> > > +     struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
> > > +
> > > +     /* protect shared rate-change code path */
> > > +     struct mutex rate_lock;
> > >   };
> > >
> > > +static void tegra186_emc_rate_requests_init(struct tegra186_emc *emc=
)
> > > +{
> > > +     unsigned int i;
> > > +
> > > +     for (i =3D 0; i < EMC_RATE_TYPE_MAX; i++) {
> > > +             emc->requested_rate[i].min_rate =3D 0;
> > > +             emc->requested_rate[i].max_rate =3D ULONG_MAX;
> > > +     }
> > > +}
> > > +
> > > +static int emc_request_rate(struct tegra186_emc *emc,
> > > +                         unsigned long new_min_rate,
> > > +                         unsigned long new_max_rate,
> > > +                         enum emc_rate_request_type type)
> > > +{
> > > +     struct emc_rate_request *req =3D emc->requested_rate;
> > > +     unsigned long min_rate =3D 0, max_rate =3D ULONG_MAX;
> > > +     unsigned int i;
> > > +     int err;
> > > +
> > > +     /* select minimum and maximum rates among the requested rates *=
/
> > > +     for (i =3D 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
> > > +             if (i =3D=3D type) {
> > > +                     min_rate =3D max(new_min_rate, min_rate);
> > > +                     max_rate =3D min(new_max_rate, max_rate);
> > > +             } else {
> > > +                     min_rate =3D max(req->min_rate, min_rate);
> > > +                     max_rate =3D min(req->max_rate, max_rate);
> > > +             }
> > > +     }
> > > +
> > > +     if (min_rate > max_rate) {
> > > +             dev_err_ratelimited(emc->dev, "%s: type %u: out of rang=
e: %lu %lu\n",
> > > +                                 __func__, type, min_rate, max_rate)=
;
> > > +             return -ERANGE;
> > > +     }
> > > +
> > > +     err =3D clk_set_rate(emc->clk, min_rate);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     emc->requested_rate[type].min_rate =3D new_min_rate;
> > > +     emc->requested_rate[type].max_rate =3D new_max_rate;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int emc_set_min_rate(struct tegra186_emc *emc, unsigned long =
rate,
> > > +                         enum emc_rate_request_type type)
> > > +{
> > > +     struct emc_rate_request *req =3D &emc->requested_rate[type];
> > > +     int ret;
> > > +
> > > +     mutex_lock(&emc->rate_lock);
> > > +     ret =3D emc_request_rate(emc, rate, req->max_rate, type);
> > > +     mutex_unlock(&emc->rate_lock);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int emc_set_max_rate(struct tegra186_emc *emc, unsigned long =
rate,
> > > +                         enum emc_rate_request_type type)
> > > +{
> > > +     struct emc_rate_request *req =3D &emc->requested_rate[type];
> > > +     int ret;
> > > +
> > > +     mutex_lock(&emc->rate_lock);
> > > +     ret =3D emc_request_rate(emc, req->min_rate, rate, type);
> > > +     mutex_unlock(&emc->rate_lock);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > >   /*
> > >    * debugfs interface
> > >    *
> > > @@ -107,7 +200,7 @@ static int tegra186_emc_debug_min_rate_set(void *=
data, u64 rate)
> > >       if (!tegra186_emc_validate_rate(emc, rate))
> > >               return -EINVAL;
> > >
> > > -     err =3D clk_set_min_rate(emc->clk, rate);
> > > +     err =3D emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
> > >       if (err < 0)
> > >               return err;
> > >
> > > @@ -137,7 +230,7 @@ static int tegra186_emc_debug_max_rate_set(void *=
data, u64 rate)
> > >       if (!tegra186_emc_validate_rate(emc, rate))
> > >               return -EINVAL;
> > >
> > > -     err =3D clk_set_max_rate(emc->clk, rate);
> > > +     err =3D emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
> > >       if (err < 0)
> > >               return err;
> > >
> > > @@ -217,6 +310,12 @@ static int tegra186_emc_get_emc_dvfs_latency(str=
uct tegra186_emc *emc)
> > >       return 0;
> > >   }
> > >
> > > +static inline struct tegra186_emc *
> > > +to_tegra186_emc_provider(struct icc_provider *provider)
> > > +{
> > > +     return container_of(provider, struct tegra186_emc, provider);
> > > +}
> > > +
> > >   /*
> > >    * tegra186_emc_icc_set_bw() - Set BW api for EMC provider
> > >    * @src: ICC node for External Memory Controller (EMC)
> > > @@ -227,6 +326,33 @@ static int tegra186_emc_get_emc_dvfs_latency(str=
uct tegra186_emc *emc)
> > >    */
> > >   static int tegra186_emc_icc_set_bw(struct icc_node *src, struct icc=
_node *dst)
> > >   {
> > > +     struct tegra186_emc *emc =3D to_tegra186_emc_provider(dst->prov=
ider);
> > > +     struct tegra_mc *mc =3D dev_get_drvdata(emc->dev->parent);
> > > +     unsigned long long peak_bw =3D icc_units_to_bps(dst->peak_bw);
> > > +     unsigned long long avg_bw =3D icc_units_to_bps(dst->avg_bw);
> > > +     unsigned long long rate =3D max(avg_bw, peak_bw);
> > > +     const unsigned int ddr =3D 2;
> > > +     int err;
> > > +
> > > +     /*
> > > +      * Do nothing here if bwmgr is supported in BPMP-FW. BPMP-FW se=
ts the final
> > > +      * Freq based on the passed values.
> > > +      */
> > > +     if (mc->bwmgr_mrq_supported)
> > > +             return 0;
> > > +
> > > +     /*
> > > +      * Tegra186 EMC runs on a clock rate of SDRAM bus. This means t=
hat
> > > +      * EMC clock rate is twice smaller than the peak data rate beca=
use
> > > +      * data is sampled on both EMC clock edges.
> > > +      */
> > > +     do_div(rate, ddr);
> > > +     rate =3D min_t(u64, rate, U32_MAX);
> > > +
> > > +     err =3D emc_set_min_rate(emc, rate, EMC_RATE_ICC);
> > > +     if (err)
> > > +             return err;
> > > +
> > >       return 0;
> > >   }
> > >
> > > @@ -329,6 +455,8 @@ static int tegra186_emc_probe(struct platform_dev=
ice *pdev)
> > >       platform_set_drvdata(pdev, emc);
> > >       emc->dev =3D &pdev->dev;
> > >
> > > +     tegra186_emc_rate_requests_init(emc);
> > > +
> > >       if (tegra_bpmp_mrq_is_supported(emc->bpmp, MRQ_EMC_DVFS_LATENCY=
)) {
> > >               err =3D tegra186_emc_get_emc_dvfs_latency(emc);
> > >               if (err)
> > >
> >
> >
> > FYI, this patch is causing a boot regression on Tegra194 devices. I
> > noticed that tegra194-p2972-0000 and tegra194-p3509-0000+p3668-0000 are
> > no longer booting and bisect is pointing to this. I will have a closer
> > look and try to see why this is.
>
> Interesting. Both were booting for me during my verification, though
> my use case involves the dt changes that I don't believe have been
> picked up yet. Thought I had explicitly verified without the dt
> changes too, though. Since I was asked to do so on this or one of the
> other similar series. I will try to check linux-next as-is soon.

I just built next-20251110 using the standard arm64 defconfig and
flashed the resulting Image and dtb's to p2972 and p3518 (p3509+p3668)
and both booted to cli on a barebones busybox ramdisk. I do not see
any errors from tegra-mc, and the only error I see from tegra186-emc
is that it can't find the opp tables, which is expected without the dt
changes, and is not fatal.

Aaron

Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28A2E7F03
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 21:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762811734; cv=none; b=ZihWPywh3y5nqOKziGFFdHmpdkMd3vtH64sQci9OY7FhRdBun9IX8d5ORBOxCMPCd1fbdO9gnl9z6+n3Aem5N3d9lJr8NnkJuF2Fq5n94EnJVLee+BCfCp+F+QGZqCKFAWgDNi6mzVWIpzIRtQGmoDm1H50sev0ouicoVczeQ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762811734; c=relaxed/simple;
	bh=ObSsB7738pOMEqJYJlXGe5i/m6TYZQwPOJNWMg4oBrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdKR2V2kEQybBcuAlp1LtRimW+HZkzV3KMSrsV5wJbmct6cIlAmJvTgIYmYp7dOXcSeahZKIHP/zR50GsSIIcl0aaYteTah0cA6y4BB/ByRR6h39v8pLZbOjbWSjY7qlOCkJIAABaznLKVUGNwmqmb5xhVeBLc4qMJvCE/3K1OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5Mg0PhK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5Mg0PhK"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-591ec7af7a1so3067767e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 13:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762811730; x=1763416530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75zkR/UZ6TOt6Wc437IRuw+KGuA25dggT8vLsbM0934=;
        b=G5Mg0PhKFXkSttuyCwB4VSyZZdz7nMIyOX8q0lK8/IYRc2QZ0anF/vook14ra5TbNu
         7KtV4wBBq/GF+WXZGCHPxwBewqjAUUxVZXc1GTTGbInUTpzGYIEntbwl7iFUV96hj8YB
         7Q0+R5Zb1+zpElLkzTAT/qmsKPRIG/d0Au8IXeRIEJ7lZwwk15G62t0g0FhB+Hx5nDzg
         cEasd1LFE40kUiiXMSLkkK4K3Z688ibhKeWKxYx5EYvu1DliCvQL+uBEDShxvwKddbdS
         b8FjRVfxxKSDGZM8MCpIsariSSisU9+7C1a7Rci30YYSjcaaHwGgNKPVSiIl55bFTmT0
         xAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762811730; x=1763416530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75zkR/UZ6TOt6Wc437IRuw+KGuA25dggT8vLsbM0934=;
        b=AfD2j+ofxLGAFZn/al3MEGKuHL2T/q0wvk3H9hkF/Oo3URMIuyHPCYai6kyzC2C5i6
         4E8Ll4BKDB1ugY+HwXFgCcoFVGEc3+7IHGnh0fvbSLCz5dK7GVRe+KbmvVM+ymTUD5Kx
         L7p6HB7VJgRK6mkc1CZ/ft1zAnmqDPTp4oQgVQxmCDxeyER7vWPOx7s1n+ZtlV3E/fla
         SqqrvtNnRKnPItaimwGOwM5QsMgem0ufdFGAn82bysjJLd/hDVGBOgLTi6+PwiuUk8as
         xKTvf62AXovG8X9R5rWCrAImHDyoZRlkcf05tn4jVbt33BRVZOtKagh0Q4wJt9gR0Eaj
         hWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNIj2+0x78P68cMv/r9+YIt5/t33jwbOwN3Gh+k85Sj/7wp8ITkNXwlwbaWo0fxJGJQVGQ19oKvUnDyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysnuBm4wEjG3b61pRV2IWqkx1IlhJjP9E1Wq0vc3E7yCiURpox
	xHwhwGaYEeujNRI9cS6tptzYqVqHM7B0aCD94RAPDXgfpj4WrfoLzpIktktMdWNpAGnJ2CnaNtQ
	XDScGpGG9+UZ9lIoc+PGO+xdCzpe+SZY=
X-Gm-Gg: ASbGnct10uJ+78/4HfbTy1xHwPlbrQK9WMek6Lpb4CokRNw3rxXzo3NPEvyFshwTVR1
	3oKLSBNkSBVhzfjKsoJzeGpvDieUK1NAlVwmO3OfRzECVVjtTtgf+DCbzd4KBqjseRzZwaNxVjF
	WfOIqbEQU4QAO8G2V7Upph19Za71wn0MyWrI9xlSbiebtJIagxM02bTFskaVq1ZQGdBS8C5965A
	odTFy16YHBvvzf1dyBQxBSpg9Q2uyMMTW9H4lyXXyfpdFKo2blIn5J/hcu7
X-Google-Smtp-Source: AGHT+IHGiQpBuoltSAmsRa5cYFCPTxfS3hi7kI1V+OfnP7UhcRFGs7NRrD6L+fCJ0Ns0YLNDxAqXXNnXTspeBlSNLa8=
X-Received: by 2002:a05:6512:239a:b0:594:18cf:14c6 with SMTP id
 2adb3069b0e04-5945f15c1b6mr2432185e87.21.1762811730218; Mon, 10 Nov 2025
 13:55:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com> <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
In-Reply-To: <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 10 Nov 2025 15:55:17 -0600
X-Gm-Features: AWmQ_bmCgGj-BBdH4Veqo9w6LfhIAvjjDwwgCxeeYiZ0ZFChwSDrN20zwBdXnlQ
Message-ID: <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 3:25=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 27/10/2025 18:55, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This adds support for dynamic frequency scaling of external memory on
> > devices with bpmp firmware that does not support bwmgr.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >   drivers/memory/tegra/tegra186-emc.c | 132 +++++++++++++++++++++++++++=
++++++++-
> >   1 file changed, 130 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra=
/tegra186-emc.c
> > index 9959ad5804b444b269456d1fbae87b4bc111661b..74be09968baa7a0fbdce435=
9f470ce56b18acb10 100644
> > --- a/drivers/memory/tegra/tegra186-emc.c
> > +++ b/drivers/memory/tegra/tegra186-emc.c
> > @@ -18,6 +18,17 @@ struct tegra186_emc_dvfs {
> >       unsigned long rate;
> >   };
> >
> > +enum emc_rate_request_type {
> > +     EMC_RATE_DEBUG,
> > +     EMC_RATE_ICC,
> > +     EMC_RATE_TYPE_MAX,
> > +};
> > +
> > +struct emc_rate_request {
> > +     unsigned long min_rate;
> > +     unsigned long max_rate;
> > +};
> > +
> >   struct tegra186_emc {
> >       struct tegra_bpmp *bpmp;
> >       struct device *dev;
> > @@ -33,8 +44,90 @@ struct tegra186_emc {
> >       } debugfs;
> >
> >       struct icc_provider provider;
> > +
> > +     /*
> > +      * There are multiple sources in the EMC driver which could reque=
st
> > +      * a min/max clock rate, these rates are contained in this array.
> > +      */
> > +     struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
> > +
> > +     /* protect shared rate-change code path */
> > +     struct mutex rate_lock;
> >   };
> >
> > +static void tegra186_emc_rate_requests_init(struct tegra186_emc *emc)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < EMC_RATE_TYPE_MAX; i++) {
> > +             emc->requested_rate[i].min_rate =3D 0;
> > +             emc->requested_rate[i].max_rate =3D ULONG_MAX;
> > +     }
> > +}
> > +
> > +static int emc_request_rate(struct tegra186_emc *emc,
> > +                         unsigned long new_min_rate,
> > +                         unsigned long new_max_rate,
> > +                         enum emc_rate_request_type type)
> > +{
> > +     struct emc_rate_request *req =3D emc->requested_rate;
> > +     unsigned long min_rate =3D 0, max_rate =3D ULONG_MAX;
> > +     unsigned int i;
> > +     int err;
> > +
> > +     /* select minimum and maximum rates among the requested rates */
> > +     for (i =3D 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
> > +             if (i =3D=3D type) {
> > +                     min_rate =3D max(new_min_rate, min_rate);
> > +                     max_rate =3D min(new_max_rate, max_rate);
> > +             } else {
> > +                     min_rate =3D max(req->min_rate, min_rate);
> > +                     max_rate =3D min(req->max_rate, max_rate);
> > +             }
> > +     }
> > +
> > +     if (min_rate > max_rate) {
> > +             dev_err_ratelimited(emc->dev, "%s: type %u: out of range:=
 %lu %lu\n",
> > +                                 __func__, type, min_rate, max_rate);
> > +             return -ERANGE;
> > +     }
> > +
> > +     err =3D clk_set_rate(emc->clk, min_rate);
> > +     if (err)
> > +             return err;
> > +
> > +     emc->requested_rate[type].min_rate =3D new_min_rate;
> > +     emc->requested_rate[type].max_rate =3D new_max_rate;
> > +
> > +     return 0;
> > +}
> > +
> > +static int emc_set_min_rate(struct tegra186_emc *emc, unsigned long ra=
te,
> > +                         enum emc_rate_request_type type)
> > +{
> > +     struct emc_rate_request *req =3D &emc->requested_rate[type];
> > +     int ret;
> > +
> > +     mutex_lock(&emc->rate_lock);
> > +     ret =3D emc_request_rate(emc, rate, req->max_rate, type);
> > +     mutex_unlock(&emc->rate_lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static int emc_set_max_rate(struct tegra186_emc *emc, unsigned long ra=
te,
> > +                         enum emc_rate_request_type type)
> > +{
> > +     struct emc_rate_request *req =3D &emc->requested_rate[type];
> > +     int ret;
> > +
> > +     mutex_lock(&emc->rate_lock);
> > +     ret =3D emc_request_rate(emc, req->min_rate, rate, type);
> > +     mutex_unlock(&emc->rate_lock);
> > +
> > +     return ret;
> > +}
> > +
> >   /*
> >    * debugfs interface
> >    *
> > @@ -107,7 +200,7 @@ static int tegra186_emc_debug_min_rate_set(void *da=
ta, u64 rate)
> >       if (!tegra186_emc_validate_rate(emc, rate))
> >               return -EINVAL;
> >
> > -     err =3D clk_set_min_rate(emc->clk, rate);
> > +     err =3D emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
> >       if (err < 0)
> >               return err;
> >
> > @@ -137,7 +230,7 @@ static int tegra186_emc_debug_max_rate_set(void *da=
ta, u64 rate)
> >       if (!tegra186_emc_validate_rate(emc, rate))
> >               return -EINVAL;
> >
> > -     err =3D clk_set_max_rate(emc->clk, rate);
> > +     err =3D emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
> >       if (err < 0)
> >               return err;
> >
> > @@ -217,6 +310,12 @@ static int tegra186_emc_get_emc_dvfs_latency(struc=
t tegra186_emc *emc)
> >       return 0;
> >   }
> >
> > +static inline struct tegra186_emc *
> > +to_tegra186_emc_provider(struct icc_provider *provider)
> > +{
> > +     return container_of(provider, struct tegra186_emc, provider);
> > +}
> > +
> >   /*
> >    * tegra186_emc_icc_set_bw() - Set BW api for EMC provider
> >    * @src: ICC node for External Memory Controller (EMC)
> > @@ -227,6 +326,33 @@ static int tegra186_emc_get_emc_dvfs_latency(struc=
t tegra186_emc *emc)
> >    */
> >   static int tegra186_emc_icc_set_bw(struct icc_node *src, struct icc_n=
ode *dst)
> >   {
> > +     struct tegra186_emc *emc =3D to_tegra186_emc_provider(dst->provid=
er);
> > +     struct tegra_mc *mc =3D dev_get_drvdata(emc->dev->parent);
> > +     unsigned long long peak_bw =3D icc_units_to_bps(dst->peak_bw);
> > +     unsigned long long avg_bw =3D icc_units_to_bps(dst->avg_bw);
> > +     unsigned long long rate =3D max(avg_bw, peak_bw);
> > +     const unsigned int ddr =3D 2;
> > +     int err;
> > +
> > +     /*
> > +      * Do nothing here if bwmgr is supported in BPMP-FW. BPMP-FW sets=
 the final
> > +      * Freq based on the passed values.
> > +      */
> > +     if (mc->bwmgr_mrq_supported)
> > +             return 0;
> > +
> > +     /*
> > +      * Tegra186 EMC runs on a clock rate of SDRAM bus. This means tha=
t
> > +      * EMC clock rate is twice smaller than the peak data rate becaus=
e
> > +      * data is sampled on both EMC clock edges.
> > +      */
> > +     do_div(rate, ddr);
> > +     rate =3D min_t(u64, rate, U32_MAX);
> > +
> > +     err =3D emc_set_min_rate(emc, rate, EMC_RATE_ICC);
> > +     if (err)
> > +             return err;
> > +
> >       return 0;
> >   }
> >
> > @@ -329,6 +455,8 @@ static int tegra186_emc_probe(struct platform_devic=
e *pdev)
> >       platform_set_drvdata(pdev, emc);
> >       emc->dev =3D &pdev->dev;
> >
> > +     tegra186_emc_rate_requests_init(emc);
> > +
> >       if (tegra_bpmp_mrq_is_supported(emc->bpmp, MRQ_EMC_DVFS_LATENCY))=
 {
> >               err =3D tegra186_emc_get_emc_dvfs_latency(emc);
> >               if (err)
> >
>
>
> FYI, this patch is causing a boot regression on Tegra194 devices. I
> noticed that tegra194-p2972-0000 and tegra194-p3509-0000+p3668-0000 are
> no longer booting and bisect is pointing to this. I will have a closer
> look and try to see why this is.

Interesting. Both were booting for me during my verification, though
my use case involves the dt changes that I don't believe have been
picked up yet. Thought I had explicitly verified without the dt
changes too, though. Since I was asked to do so on this or one of the
other similar series. I will try to check linux-next as-is soon.

Aaron

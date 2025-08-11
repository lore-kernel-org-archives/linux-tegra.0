Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621492D3755
	for <linux-tegra@vger.kernel.org>; Mon, 11 Aug 2025 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754914301; cv=none; b=WliCeahKqOnextrmSIwQAYBOF/PCTE1nVAMwNyuKPCXTJHwPtVZ8VUCZZw28e4HkiAEP+EJCVUbtk8cqXvGsClL52cNbUFSH2RVwHnuruRO2UvWLxd4XNtGhKFSXe939FXMpbpoOyAUqV4wIYYBE+6zImVSQLraSvppcD6Rqr68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754914301; c=relaxed/simple;
	bh=FMBflEgyu2zzYW/76/uBzy1KMkgr26r6YycYcOX43po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVwgtAxaB/UvpahsG7BK1N29InrptBYiLEWH19I7gg8XVXzFYJR82EtumTPLholNWaiARR0IUd5CcRsU0JglHXWz6691NRba7pDPnXS/D+QwktxcyG5rxeUSIxFzFTYYB9QbykfdP+2xw1/BbmVChUJ6SBXuIkAwiHxjrPe5S4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0GZ093D; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0GZ093D"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71bfdf75cd2so15748887b3.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 Aug 2025 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754914298; x=1755519098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yzaS0HPLQ+JNoWDWc+qdmiWk51Wkp8ZaIZKSPb/Tu1s=;
        b=r0GZ093DzH45obxjIGTuS3+ogzAieVZwbrWTWg96/UhTSc5IQYF/kwjOUVm5fPcX59
         LwFPLn6dqVZwpRDfSeZ3BnfOot3QvEO6zPNnAFnlpLBkzIXrZqcX1/3xt5z3so+JM6jM
         EMlYOajxZAhuPwkDb4dFU86gOq+XNDutQJC5a0uuy70XkLm2p0NdYP3DpvuRATvGGN2u
         NaQuN92axv6LVCfmTBhKTHm4SohouGaB2Je2SLMXbgTTT3G533XMj/zJG5FClz9/mXfD
         Nbyp0YCHm941UCFn9lfrsMdEfIs77qptm6roxgmcAnMZp7eH2BosqOew9hP2gd2LaIEU
         UaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754914298; x=1755519098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzaS0HPLQ+JNoWDWc+qdmiWk51Wkp8ZaIZKSPb/Tu1s=;
        b=MsK9zjUCsVgNC9HkcLITQWfSu7AheZm6FMxyazEX9MkocBAiLB3qRNfZQn2cIjPXIL
         3/8ythzvRtP6OGKjNQbCTwi8pk7YWCVF3oT7FyXdX9EoLKnyMP6jMy/d4+F5fv/5JL7n
         NeCf6+ph8hps/wnvB+Bl6U7iDMYjgLwtunDT2FZk/zdd8SK7xRrbRsn8reqTLpvCdSxc
         iZArTl0MaiV/+ae2KZ32CEuWFuIk0zj3TM3U4PcN+8DpiPZZMWgRxD1228Yul1gYhMYe
         jsh/BB+/YzCn4LGiiYTynvwFWQfpunn5jlfRYy5p/zaDPEVSRwcEZv4gYHF8nh/1rGK/
         2E6w==
X-Forwarded-Encrypted: i=1; AJvYcCWavp9HNo6UvIs461KdttSQ6AAP+qJywvANP0oz51F1GQ70G36WXrbFVgaXVhU5gDHDyoKsrdz570D3gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxPHQwyIrMfH/wR4bJ3zF/UlAI6jLjL5e5jdCjto4Uj1xYiEtc
	sWN0dXgeK/LnWQSmMsTQyLr58bsxZnq9iM/wWCvpbFd/LIrSvSFlpiQqm1WT3KQ3PYcNhiHjxyz
	bYDtg7a0OhFb2bOWMXra2QhoXrucwsmuxAcKZ3vFavQ==
X-Gm-Gg: ASbGncumvNB2ZdhXL07BX9Zx/Kcoq4QAQQOAUxP71pngyLo6zO4hwxHDI0mrdybjpJG
	OPvGOuI21RWNCK6twF0zEcx+wpwwUsIognSPRAQZBUmC04H4JR2hZB+4AO+FcOQxugH3W+11tn8
	HRgqmqQLGb+wOpJBVocmRzt/3Esx0vyWXxAcElWqOVAJXQK7pAg6BnaMBXC1oxkj3eB2jkFamBv
	Xw+i3sp0Xrp0NvQ2XY=
X-Google-Smtp-Source: AGHT+IFMbaZrjleZ5vGz4D0X/pSaNmB18k653oOaNMk9YxEBIuCeDG7q8giRICX/XDvm2Zo/8TtZ5RzGGv6KOI1cErc=
X-Received: by 2002:a05:690c:4b89:b0:71b:7126:65a with SMTP id
 00721157ae682-71bf1a9c5admr150740997b3.2.1754914298150; Mon, 11 Aug 2025
 05:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-21-ulf.hansson@linaro.org> <4478f28b-47f8-4049-bf17-b7fc95cfac65@nvidia.com>
In-Reply-To: <4478f28b-47f8-4049-bf17-b7fc95cfac65@nvidia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Aug 2025 14:11:02 +0200
X-Gm-Features: Ac12FXyNISadS8h7_-q3TDdgflMKzfkI6TZV-B6W1wySvd9OmSLdra87f6EZkBk
Message-ID: <CAPDyKFqSyP3e=JRFYEuFefWVN5SYJWULU8SKzXmrThvyiVGXgg@mail.gmail.com>
Subject: Re: [PATCH v3 20/24] pmdomain: core: Default to use
 of_genpd_sync_state() for genpd providers
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
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

On Thu, 31 Jul 2025 at 17:07, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Ulf,
>
> On 01/07/2025 12:47, Ulf Hansson wrote:
> > Unless the typical platform driver that act as genpd provider, has its own
> > ->sync_state() callback implemented let's default to use
> > of_genpd_sync_state().
> >
> > More precisely, while adding a genpd OF provider let's assign the
> > ->sync_state() callback, in case the fwnode has a device and its driver
> > doesn't have the ->sync_state() set already. In this way the typical
> > platform driver doesn't need to assign ->sync_state(), unless it has some
> > additional things to manage beyond genpds.
> >
> > Suggested-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >   drivers/pmdomain/core.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index ca47f91b9e91..5cef6de60c72 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2600,6 +2600,11 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
> >       return ret;
> >   }
> >
> > +static void genpd_sync_state(struct device *dev)
> > +{
> > +     return of_genpd_sync_state(dev->of_node);
> > +}
> > +
> >   /**
> >    * of_genpd_add_provider_simple() - Register a simple PM domain provider
> >    * @np: Device node pointer associated with the PM domain provider.
> > @@ -2628,6 +2633,8 @@ int of_genpd_add_provider_simple(struct device_node *np,
> >       if (!dev && !genpd_is_no_sync_state(genpd)) {
> >               genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
> >               device_set_node(&genpd->dev, fwnode);
> > +     } else {
> > +             dev_set_drv_sync_state(dev, genpd_sync_state);
> >       }
> >
> >       put_device(dev);
> > @@ -2700,6 +2707,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
> >       dev = get_dev_from_fwnode(fwnode);
> >       if (!dev)
> >               sync_state = true;
> > +     else
> > +             dev_set_drv_sync_state(dev, genpd_sync_state);
> >
> >       put_device(dev);
> >
>
> Following this change I am seeing the following warning on our Tegra194
> devices ...
>
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 17000000.gpu
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 3960000.cec
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 15380000.nvjpg
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 154c0000.nvenc
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 15a80000.nvenc
>
> Per your change [0], the 'GENPD_FLAG_NO_SYNC_STATE' is set for Tegra
> and so should Tegra be using of_genpd_sync_state() by default?

This is a different power-domain provider (bpmp) in
drivers/firmware/tegra/bpmp.c and
drivers/pmdomain/tegra/powergate-bpmp.c.

For the bpmp we don't need GENPD_FLAG_NO_SYNC_STATE, as the
power-domain provider is described along with the
"nvidia,tegra186-bpmp" compatible string. In the other case
(drivers/soc/tegra/pmc.c) the "core-domain" and "powergates" are
described through child-nodes, while ->sync_state() is managed by the
parent-device-node.

In the bpmp case there is no ->sync_state() callback assigned, which
means genpd decides to assign a default one.

The reason for the warnings above is because we are still waiting for
those devices to be probed, hence the ->sync_state() callback is still
waiting to be invoked. Enforcing ->sync_state() callback to be invoked
can be done via user-space if that is needed.

Did that make sense?

>
> Thanks
> Jon
>
> [0] https://lore.kernel.org/all/20250701114733.636510-10-ulf.hansson@linaro.org/
> --
> nvpublic
>

Kind regards
Uffe

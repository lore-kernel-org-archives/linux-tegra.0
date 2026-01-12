Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65176283FCD
	for <linux-tegra@vger.kernel.org>; Mon, 12 Jan 2026 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222197; cv=none; b=RI5v1k8IMao3d5rpxnVyd7+hlhFZi/p7EFaWroD631HKt+h4fpueerdXO0xzQGM9Pb1ptSojB4mvBqnQgPqU9qkw0alIgXyH4CRFGp0kPJeF5dms5XARJow3oVg+jsRbTeZDswFDaxj2Duxl4pUrl8iD9nS/9MlOmmG7UbhQvT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222197; c=relaxed/simple;
	bh=k6CuEvapSJzan3n5FbnxsmbcgLhFr7TYoO6c3KMexFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lp2UAtuUd1RR8ZGIIyg5EzMlyi/11Rl6Kxw9psqqinS18Ojrnln6zzOth/UWBA0jgrWapMhUfV7S2ZFCfqpzi8cpiz4ILJp/6v13G61eAwMNXOvZ5cezAnTG/SdqyeA73UU4XuvSDUYKiOVZPAEYwgbtO4Eom3oZ7Xz8ufQTO+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+OJ5vxo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+OJ5vxo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477632d9326so38371105e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 12 Jan 2026 04:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768222194; x=1768826994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OdnGGL/RXOJtS5w4R7RZPmgrr+FeiavZ0n9LQeOAkZQ=;
        b=I+OJ5vxob8nHvD9KdJv+ug7wmTIvVCWQOt2LCvNImLAveybzCh4R/BJHJjwk2Fc8Yi
         wfeeAi9qV2HOeofqsdXZjT5zst6lfQfWXL+IvMqdsLH5tPiitB7SzC5EFpWpALxzt7fr
         GqE4NE8fhxAFhFjCxOiUCasMJT5VxcjyUxMvHOiGfU7vf2JeSD9BD+osPZuQAp7lKOdq
         z+RnSAxitMRMMLUgZKwTNC69ZM4uijJ2BPXlANMOm0Coe43Q+tMAQIMPFHSxx/GxuIyx
         lzESN3I1xIwIX89wJBJk2MzcGzu4i5pw1dHHbUuNOWOkBvIDjoEKWmE3UzOU88Ru0Wkz
         nTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222194; x=1768826994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdnGGL/RXOJtS5w4R7RZPmgrr+FeiavZ0n9LQeOAkZQ=;
        b=jvU75eV72Dzt4gWHOCd62W98IAzsux9I6khmrRduUhiMRKDESXtzoVursJDlnQB9IF
         mgyMMFcXC6CM1HOWyEwJPNaarpGvPluROmgGyeiKsF873+111ILMddvEnRqqepmdwbGQ
         0C08mwBGEu8jO6/Mu8equ0Qg9X5Z2YUyqDeCZVPdgM+wJDpBaf4Byse3ygZVXOLnWzzp
         QVZIHf6rdH8Ss1bX+lIPjfjJYgXM2cczOdmi3k3MjjAsHcqFH2/GgDPNSQPmNq3p6xqx
         B1AzIb7zkeJ7m8itdbpj+D8qKJIAr/4f3hE7E1euKaORfZegkRF4IMS9dIRHtbwE/zBc
         Islg==
X-Forwarded-Encrypted: i=1; AJvYcCVg0Ua05GfXcJyrEoV/RxZAfKVVvyuvDZpK1iHx18Xl1vqWwFShPEk5Rp1A/S/2iYI7TekhuKCoWeiXkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq4xYgL8BAaC2sMJWyZuM40lQ2j7XqsC8/Maqsn0TvFjC26Nwn
	950DOzW3CUBmOXFrmuxFquYEedhQaq2B2woEgeZV3jUWnddAn8OiDgk0
X-Gm-Gg: AY/fxX4gD+p8OT7XeTe3KrK7jWuBuqMJt8MbwZspKctrt5vem0w14eD6vKO3Wqlbyoa
	9ZQm/GXIkg5dDywylVIQpRm5nYcrJP1WK0ORSoKRhaWR4xZeR7livB2qe+uz5qzoCAYefd+Jh2X
	AmjAFDir2mEayHsy9QsnR731hI6zOoUzTv0LjHZfnSAXI95VrKC6DLyg4ZStD2GoS6oXvKZMNpn
	HaifTEnCJ4Dpdh2qoMdTThkO5l5wskivYKeAa+5LdhDUOG8wF0CLLHKnquiaMwx5tJ+qMGWcQAC
	sw7JNSaSDTnCJkOyDBMBgeXLfUrtfqlR5UzL9nPlJ9gHSwkOTjqSJZL09Andmcyq1Jb66ZVBg2D
	hnvefoHnxLQ9Ha4PEt/N0DnHkp61vxFaLMJp7yx5q7hctCK6KUdr7lPMRGzy13hvNGA5coXNuhl
	90NEH9OGbv6aSZ++MVXV5jJkDdml0ORMEiL/bKR+xM/mPgXshnyBEM6ghNvHEw6ZTreYKHFpDzf
	Q==
X-Google-Smtp-Source: AGHT+IHPYcxcbvPgNwHAnOLaq9BDJKoiZKTVLzIp9Vnbuwu0Fww8JDn5hMZo3lQq/ca9sxMAf7a0aQ==
X-Received: by 2002:a05:600c:3e8e:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-47d84b18596mr207867735e9.10.1768222193302;
        Mon, 12 Jan 2026 04:49:53 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f418538sm353730975e9.5.2026.01.12.04.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:49:52 -0800 (PST)
Date: Mon, 12 Jan 2026 13:49:50 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ketan Patil <ketanp@nvidia.com>
Cc: krzk@kernel.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 4/4] memory: tegra: Add MC error logging support for
 Tegra264
Message-ID: <aWTZBalnJQEBZnVn@orome>
References: <20251219114354.2727906-1-ketanp@nvidia.com>
 <20251219114354.2727906-5-ketanp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hu2ktmx2rhux7m3y"
Content-Disposition: inline
In-Reply-To: <20251219114354.2727906-5-ketanp@nvidia.com>


--hu2ktmx2rhux7m3y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 4/4] memory: tegra: Add MC error logging support for
 Tegra264
MIME-Version: 1.0

On Fri, Dec 19, 2025 at 11:43:54AM +0000, Ketan Patil wrote:
> In Tegra264, different components from memory subsystems like Memory
> Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
> and MC Channels have different interrupt lines for receiving memory
> controller error interrupts.
>=20
> Add support for logging memory controller errors on Tegra264.
> - Add MC error handling flow for MCF, HUB, HUBC, SBS and MC Channel.
> - Each of these components have different interrupt lines for MC error.
> - Register interrupt handlers for interrupts from these different MC
> components.
> - There is no global interrupt status register in Tegra264 unlike older
> Tegra chips.
> - There are common interrupt status registers in case of MCF, HUB, HUBC
> from which figure out the slice number or hub number responsible for
> generating interrupt and then read interrupt status register to find out
> type of violation.
> - Introduce new SoC specific fields in tegra_mc_soc like interrupt mask
> values for MCF, HUB, HUBC etc., which are SOC specific.
>=20
> Signed-off-by: Ketan Patil <ketanp@nvidia.com>
> ---
>  drivers/memory/tegra/mc.c       |  49 +++-
>  drivers/memory/tegra/mc.h       |  78 +++++-
>  drivers/memory/tegra/tegra186.c |  10 +-
>  drivers/memory/tegra/tegra194.c |   2 +
>  drivers/memory/tegra/tegra20.c  |  10 +-
>  drivers/memory/tegra/tegra234.c |   2 +
>  drivers/memory/tegra/tegra264.c | 439 +++++++++++++++++++++++++++++++-
>  drivers/memory/tegra/tegra30.c  |   2 +
>  include/soc/tegra/mc.h          |   7 +
>  9 files changed, 569 insertions(+), 30 deletions(-)

Hi Ketan,

I share Jon's concerns about this becoming overwhelmingly complex to
understand and review. Let me try to provide a few ideas below on how we
could potentially improve this.

> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
[...]
> @@ -976,11 +976,36 @@ static int tegra_mc_probe(struct platform_device *p=
dev)
>  			}
>  		}
> =20
> -		if (mc->soc->num_channels)
> -			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
> -				     MC_INTMASK);
> -		else
> -			mc_writel(mc, mc->soc->intmask, MC_INTMASK);
> +		if (mc->soc->ops->num_interrupts > 1) {
> +			/* Unmask MCF interrupts */
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->mcf_intmask, MCF_INTM=
ASK_0);
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->mcf_intmask,
> +				MCF_INTPRIORITY_0);
> +
> +			/* Unmask HUB and HUBC interrupts */
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hub_intmask,
> +				MSS_HUB_INTRMASK_0);
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hub_intmask,
> +				MSS_HUB_INTRPRIORITY_0);
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hubc_intmask,
> +				MSS_HUB_HUBC_INTMASK_0);
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hubc_intmask,
> +				MSS_HUB_HUBC_INTPRIORITY_0);
> +
> +			/* Unmask SBS interrupts */
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->sbs_intmask,
> +				MSS_SBS_INTMASK_0);
> +
> +			/* Unmask MC channel interrupt */
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->mc_ch_intmask,
> +				MC_CH_INTMASK_0);
> +		} else {
> +			if (mc->soc->num_channels)
> +				mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
> +					MC_INTMASK);
> +			else
> +				mc_writel(mc, mc->soc->intmask, MC_INTMASK);
> +		}

This isn't all that bad, but I think we could probably extract this into
a per-SoC operation that is called from here instead. If for nothing
else it would help with the indentation level.

Something like mc->ops->setup_interrupts() or whatever other flavour you
prefer should do.

>  	}
> =20
>  	if (mc->soc->reset_ops) {
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index 06ae3dd37a47..fabbebf8a36c 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -25,6 +25,7 @@
>  #define MC_INT_DECERR_MTS				BIT(16)
>  #define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
>  #define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
> +#define MC_INT_DECERR_ROUTE_SANITY_GIC_MSI		BIT(21)
> =20
>  #define MC_INTMASK					0x04
>  #define MC_GART_ERROR_REQ				0x30
> @@ -63,6 +64,60 @@
> =20
>  #define MC_GLOBAL_INTSTATUS				0xf24
> =20
> +/* Registers for MSS HUB */
> +#define MSS_HUB_GLOBAL_INTSTATUS_0			0x6000
> +#define MSS_HUBC_INTR					BIT(0)
> +
> +#define MSS_HUB_HUBC_INTSTATUS_0			0x6008
> +#define MSS_HUB_INTRSTATUS_0				0x600c
> +#define MSS_HUB_HUBC_INTMASK_0				0x6010
> +#define MSS_HUB_HUBC_SCRUB_DONE_INTMASK			BIT(0)
> +
> +#define MSS_HUB_HUBC_INTPRIORITY_0			0x6014
> +#define MSS_HUB_INTRMASK_0				0x6018
> +#define MSS_HUB_COALESCER_ERR_INTMASK			BIT(0)
> +#define MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK		BIT(1)
> +#define MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK		BIT(2)
> +#define MSS_HUB_MSI_ERR_INTMASK				BIT(3)
> +#define MSS_HUB_POISON_RSP_INTMASK			BIT(4)
> +#define MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK		BIT(5)
> +#define MSS_HUB_RESERVED_PA_ERR_INTMASK			BIT(6)
> +
> +#define MSS_HUB_INTRPRIORITY_0				0x601c
> +#define MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0		0x6020
> +#define MSS_HUB_MSI_ERR_STATUS_0			0x6024
> +#define MSS_HUB_POISON_RSP_STATUS_0			0x6028
> +#define MSS_HUB_COALESCE_ERR_STATUS_0			0x60e0
> +#define MSS_HUB_COALESCE_ERR_ADR_HI_0			0x60e4
> +#define MSS_HUB_COALESCE_ERR_ADR_0			0x60e8
> +#define MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0		0x638c
> +#define MSS_HUB_RESERVED_PA_ERR_STATUS_0		0x6390
> +#define MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0		0x63b0
> +
> +/* Registers for MC Channel */
> +#define MC_CH_INTSTATUS_0				0x82d4
> +#define MC_CH_INTMASK_0					0x82d8
> +#define WCAM_ERR_INTMASK				BIT(19)
> +
> +#define MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0		0xbc74
> +
> +/* Registers for MCF */
> +#define MCF_COMMON_INTSTATUS0_0_0			0xce04
> +#define MCF_INTSTATUS_0					0xce2c
> +#define MCF_INTMASK_0					0xce30
> +#define MCF_INTPRIORITY_0				0xce34
> +
> +/* Registers for SBS */
> +#define MSS_SBS_INTSTATUS_0				0xec08
> +#define MSS_SBS_INTMASK_0				0xec0c
> +#define MSS_SBS_FILL_FIFO_ISO_OVERFLOW_INTMASK		BIT(0)
> +#define MSS_SBS_FILL_FIFO_SISO_OVERFLOW_INTMASK		BIT(1)
> +#define MSS_SBS_FILL_FIFO_NISO_OVERFLOW_INTMASK		BIT(2)
> +
> +/* Bit field of MC_ERR_ROUTE_SANITY_STATUS_0 register */
> +#define MC_ERR_ROUTE_SANITY_RW				BIT(12)
> +#define MC_ERR_ROUTE_SANITY_SEC				BIT(13)
> +
>  /* Bit field of MC_ERR_STATUS_0 register */
>  #define MC_ERR_STATUS_RW				BIT(16)
>  #define MC_ERR_STATUS_SECURITY				BIT(17)
> @@ -70,12 +125,22 @@
>  #define MC_ERR_STATUS_WRITABLE				BIT(26)
>  #define MC_ERR_STATUS_READABLE				BIT(27)
> =20
> +#define MC_ERR_STATUS_GSC_ADR_HI_MASK			0xffff
> +#define MC_ERR_STATUS_GSC_ADR_HI_SHIFT			16
> +#define MC_ERR_STATUS_RT_ADR_HI_SHIFT			15
> +
>  #define MC_ERR_STATUS_TYPE_SHIFT			28
>  #define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
>  #define MC_ERR_STATUS_TYPE_MASK				(0x7 << 28)
> +#define MC_ERR_STATUS_RT_TYPE_MASK			(0xf << 28)
> +#define MC_ERR_STATUS_RT_TYPE_SHIFT			28
> =20
>  #define MC_ERR_STATUS_ADR_HI_SHIFT			20
> -#define MC_ERR_STATUS_ADR_HI_MASK			0x3
> +
> +#define ERR_GENERALIZED_APERTURE_ID_SHIFT		0
> +#define ERR_GENERALIZED_APERTURE_ID_MASK		0x1F
> +#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT	5
> +#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK	0x1F
> =20
>  #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
>  #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
> @@ -188,15 +253,18 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
> =20
>  #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
>      defined(CONFIG_ARCH_TEGRA_194_SOC) || \
> -    defined(CONFIG_ARCH_TEGRA_234_SOC) || \
> -    defined(CONFIG_ARCH_TEGRA_264_SOC)
> +    defined(CONFIG_ARCH_TEGRA_234_SOC)
>  extern const struct tegra_mc_ops tegra186_mc_ops;
>  #endif
> =20
>  irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
>  extern const irq_handler_t tegra30_mc_irq_handlers[];
> -extern const char * const tegra_mc_status_names[32];
> -extern const char * const tegra_mc_error_names[8];
> +extern const char * const tegra20_mc_status_names[32];
> +extern const char * const tegra20_mc_error_names[8];

I nearly wonder if these should be extracted into a per-SoC field like
mc->ops->status_names and mc->ops->error_names. I think we didn't do
this at the time because they were isolated to individual SoC
generations via the error handling functions, but if they are exposed
like this in the header, might as well abstract them out for a bit more
cleanliness, even if it's not going to be a great win.

> +int tegra186_mc_probe(struct tegra_mc *mc);
> +int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev);
> +int tegra186_mc_resume(struct tegra_mc *mc);
> +void tegra186_mc_remove(struct tegra_mc *mc);

Looks like the only reason why we need to export these is so that we can
override the IRQ handlers for Tegra264. Have you considered maybe moving
the IRQ handlers into tegra_mc_soc? It looks to me like that would be an
equally good fit now. It's no longer really an "op" in the sense that we
use the others, but rather just another collection of pointers that are
different from chip to chip.

> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra=
186.c
> @@ -916,5 +916,7 @@ const struct tegra_mc_soc tegra186_mc_soc =3D {
>  	.ch_intmask =3D 0x0000000f,
>  	.global_intstatus_channel_shift =3D 0,
>  	.mc_regs =3D &tegra20_mc_regs,
> +	.mc_addr_hi_mask =3D 0x3,

Can we perhaps derive the new values for this from the existing
num_address_bits? Also, is this the correct value for Tegra186? We use
the same value for Tegra20

> +static const char *const tegra264_mc_status_names[32] =3D {
> +	[6] =3D "EMEM address decode error",
> +	[8] =3D "Security violation",
> +	[12] =3D "VPR violation",
> +	[13] =3D "Secure carveout violation",
> +	[16] =3D "MTS carveout violation",
> +	[17] =3D "Generalized carveout violation",
> +	[20] =3D "Route Sanity error",
> +	[21] =3D "GIC_MSI error",
> +};

Comparing this to tegra20_mc_status_names[] there's significant overlap.
So I think maybe a better way to deal with this would be to complete the
list of status names and use them across all SoC generations. If for
some reason we really want to exclude certain ones for a given SoC
generation, it might be better to use some sort of validity mask or
whatever, rather than use different subsets of strings here.

I'm curious: if we look at something like "EMEM arbitration error" (9)
on Tegra20, which is not available here for Tegra264. Does it mean that
these errors don't exist on Tegra264 (i.e. they cannot happen)? We have
a few in tegra20_mc_status_names[] that no longer apply for even Tegra30
(such as the "GART page fault" (7)). I guess what I'm asking is if there
is a potential problem with listing all of the possible errors in one
table, since there's evidently no conflict in the enumeration values.

> +/*
> + * MC instance aperture mapping for hubc registers
> + */
> +static const int mc_hubc_aperture_number[5] =3D {
> +	7, 8, 9, 10, 11
> +};

I don't fully understand what this means. In the code this array is only
indexed into with constants from the individual IRQ callbacks, no loops
are iterating over this. So I think there's potential for improvement
here. For example, the indexed nature of these arrays doesn't provide
any context as to what they are. It's merely mapping one integer to
another, so it's both error prone and difficult to understand/review.

Instead, maybe we can define what a HUBC aperture is. If it's currently
only an "ID" or index, maybe it can be as simple as:

	struct tegra_mc_aperture {
		unsigned int index;
	};

	static const struct tegra_mc_aperture tegra264_mc_aperture_disp =3D {
		.index =3D 7,
	};

	static const struct tegra_mc_aperture tegra264_mc_aperture_system =3D {
		.index =3D 8,
	};

	static const struct tegra_mc_aperture tegra264_mc_aperture_vision =3D {
		.index =3D 9,
	};

	...

	static const struct tegra_mc_aperture tegra264_mc_apertures =3D {
		&tegra264_mc_aperture_disp,
		&tegra264_mc_aperture_system,
		&tegra264_mc_aperture_vision,
		...
	};

	static const struct tegra_mc_soc tegra264_mc_soc =3D {
		...
		.apertures =3D tegra264_mc_apertures,
		.num_apertures =3D ARRAY_SIZE(tegra264_mc_apertures),
		...
	};

This looks verbose at first and perhaps somewhat unnecessary, but I
think it adds so much more extra context. And I'm sure we'll run into
other data that can be added into these structures.

> +static void mcf_log_fault(struct tegra_mc *mc, u32 channel, unsigned lon=
g mcf_ch_intstatus)

First a couple of observations.

> +{
> +	unsigned int bit;

This could be called something like "interrupt" or "irq" to better
reflect what it does. It's also slightly confusing that we first iterate
over these bits in mcf_ch_intstatus to then convert back to a mask so
that we can match against the MC_INT_* definitions.

It would probably be better to do something similar to the apertures
above and collate all of the related information into some sort of
structure.

> +
> +	for_each_set_bit(bit, &mcf_ch_intstatus, 32) {
> +		const char *error =3D tegra264_mc_status_names[bit] ?: "unknown";
> +		u32 intmask =3D BIT(bit);
> +		u32 status_reg, status1_reg =3D 0, addr_reg, addr_hi_reg =3D 0;
> +		u32 addr_val, value, client_id, i, addr_hi_shift =3D 0, addr_hi_mask =
=3D 0, status1;
> +		const char *direction, *secure;
> +		const char *client =3D "unknown", *desc =3D "NA";
> +		phys_addr_t addr =3D 0;
> +		bool is_gsc =3D false, err_type_valid =3D false, err_rt_type_valid =3D=
 false;
> +		u8 type;
> +		u32 mc_rw_bit =3D MC_ERR_STATUS_RW, mc_sec_bit =3D MC_ERR_STATUS_SECUR=
ITY;
> +
> +		switch (intmask) {
> +		case MC_INT_DECERR_EMEM:
> +			status_reg =3D mc->soc->mc_regs->mc_err_status;
> +			addr_reg =3D mc->soc->mc_regs->mc_err_add;
> +			addr_hi_reg =3D mc->soc->mc_regs->mc_err_add_hi;
> +			err_type_valid =3D true;
> +			break;
> +
> +		case MC_INT_SECURITY_VIOLATION:
> +			status_reg =3D mc->soc->mc_regs->mc_err_status;
> +			addr_reg =3D mc->soc->mc_regs->mc_err_add;
> +			addr_hi_reg =3D mc->soc->mc_regs->mc_err_add_hi;
> +			err_type_valid =3D true;
> +			break;

These two are exactly the same, so they could be combined.

> +
> +		case MC_INT_DECERR_VPR:
> +			status_reg =3D mc->soc->mc_regs->mc_err_vpr_status;
> +			addr_reg =3D mc->soc->mc_regs->mc_err_vpr_add;
> +			addr_hi_shift =3D MC_ERR_STATUS_ADR_HI_SHIFT;
> +			addr_hi_mask =3D mc->soc->mc_addr_hi_mask;
> +			break;
> +
> +		case MC_INT_SECERR_SEC:
> +			status_reg =3D mc->soc->mc_regs->mc_err_sec_status;
> +			addr_reg =3D mc->soc->mc_regs->mc_err_sec_add;
> +			addr_hi_shift =3D MC_ERR_STATUS_ADR_HI_SHIFT;
> +			addr_hi_mask =3D mc->soc->mc_addr_hi_mask;
> +			break;
> +
> +		case MC_INT_DECERR_MTS:
> +			status_reg =3D mc->soc->mc_regs->mc_err_mts_status;
> +			addr_reg =3D mc->soc->mc_regs->mc_err_mts_add;
> +			addr_hi_shift =3D MC_ERR_STATUS_ADR_HI_SHIFT;
> +			addr_hi_mask =3D mc->soc->mc_addr_hi_mask;
> +			break;
> +
> +		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
> +			status_reg =3D mc->soc->mc_regs->mc_err_gen_co_status;
> +			status1_reg =3D MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0;
> +			addr_reg =3D mc->soc->mc_regs->mc_err_gen_co_add;
> +			addr_hi_shift =3D MC_ERR_STATUS_GSC_ADR_HI_SHIFT;
> +			addr_hi_mask =3D MC_ERR_STATUS_GSC_ADR_HI_MASK;
> +			is_gsc =3D true;
> +			break;
> +
> +		case MC_INT_DECERR_ROUTE_SANITY:
> +			status_reg =3D mc->soc->mc_regs->mc_err_route_status;
> +			addr_reg =3D mc->soc->mc_regs->mc_err_route_add;
> +			addr_hi_shift =3D MC_ERR_STATUS_RT_ADR_HI_SHIFT;
> +			addr_hi_mask =3D mc->soc->mc_addr_hi_mask;
> +			mc_sec_bit =3D MC_ERR_ROUTE_SANITY_SEC;
> +			mc_rw_bit =3D MC_ERR_ROUTE_SANITY_RW;
> +			err_rt_type_valid =3D true;
> +			break;
> +
> +		case MC_INT_DECERR_ROUTE_SANITY_GIC_MSI:
> +			status_reg =3D mc->soc->mc_regs->mc_err_route_status;
> +			addr_reg =3D mc->soc->mc_regs->mc_err_route_add;
> +			addr_hi_shift =3D MC_ERR_STATUS_RT_ADR_HI_SHIFT;
> +			addr_hi_mask =3D mc->soc->mc_addr_hi_mask;
> +			mc_sec_bit =3D MC_ERR_ROUTE_SANITY_SEC;
> +			mc_rw_bit =3D MC_ERR_ROUTE_SANITY_RW;
> +			err_rt_type_valid =3D true;
> +			break;

These last two are also the same and can be combined.

> +
> +		default:
> +			dev_err_ratelimited(mc->dev, "Incorrect MC interrupt mask\n");
> +			return;
> +		}
> +
> +		value =3D mc_ch_readl(mc, channel, status_reg);
> +		if (addr_hi_reg) {
> +			addr =3D mc_ch_readl(mc, channel, addr_hi_reg);
> +		} else {
> +			if (!is_gsc) {
> +				addr =3D ((value >> addr_hi_shift) & addr_hi_mask);
> +			} else {
> +				status1 =3D mc_ch_readl(mc, channel, status1_reg);
> +				addr =3D ((status1 >> addr_hi_shift) & addr_hi_mask);
> +			}
> +		}
> +
> +		addr <<=3D 32;
> +		addr_val =3D mc_ch_readl(mc, channel, addr_reg);
> +		addr |=3D addr_val;
> +
> +		if (value & mc_rw_bit)
> +			direction =3D "write";
> +		else
> +			direction =3D "read";
> +
> +		if (value & mc_sec_bit)
> +			secure =3D "secure";
> +		else
> +			secure =3D "non-secure";
> +
> +		client_id =3D value & mc->soc->client_id_mask;
> +		for (i =3D 0; i < mc->soc->num_clients; i++) {
> +			if (mc->soc->clients[i].id =3D=3D client_id) {
> +				client =3D mc->soc->clients[i].name;
> +				break;
> +			}
> +		}
> +
> +		if (err_type_valid) {
> +			type =3D (value & mc->soc->mc_err_status_type_mask) >>
> +					MC_ERR_STATUS_TYPE_SHIFT;
> +			desc =3D tegra264_mc_error_names[type];
> +		} else if (err_rt_type_valid) {
> +			type =3D (value & MC_ERR_STATUS_RT_TYPE_MASK) >>
> +				MC_ERR_STATUS_RT_TYPE_SHIFT;
> +			desc =3D tegra_rt_error_names[type];
> +		}
> +
> +		dev_err_ratelimited(mc->dev, "%s: %s %s @%pa: %s (%s)\n",
> +				    client, secure, direction, &addr, error, desc);
> +		if (is_gsc) {
> +			dev_err_ratelimited(mc->dev, "gsc_apr_id=3D%u gsc_co_apr_id=3D%u\n",
> +					    ((status1 >> ERR_GENERALIZED_APERTURE_ID_SHIFT)
> +					    & ERR_GENERALIZED_APERTURE_ID_MASK),
> +					    ((status1 >> ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT)
> +					    & ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK));
> +		}
> +	}
> +
> +	/* clear interrupts */
> +	mc_ch_writel(mc, channel, mcf_ch_intstatus, MCF_INTSTATUS_0);
> +}

To further refactor this, here's another observation: this function is
split up into three steps: 1) collect a number of register offsets, bit
positions and flags, 2) perform some operations based on these
parameters, extract additional information and 3) generate a report of
the collected information.

I think one option for refactoring this would be to make this more data
driven. This is somewhat difficult because we have these SoC parameters
that we cannot easily put into another structure, but I think we can
employ a trick to get the same results. If we look at the above sequence
of steps, we can split this into three (or possibly even two or just
one) callbacks per type of interrupt:

	struct tegra_mc_error_handler {
		unsigned int id;
		const char *name;
		void (*get_offsets)(...);
		void (*collect_info)(...);
		void (*report)(...);
	};

If we can make the output of .collect_info() generic enough, we could
probably get rid of .report() and make that completely generic, taking
the generic output as input.

We might even be able to make .get_offsets() optional and have
=2Ecollect_info() handle everything itself. We can then define a table
such as this:

	static const struct tegra_mc_error_handler[] =3D {
		{
			.id =3D MC_INT_DECERR_EMEM_BIT,
			.name =3D "external memory decode error",
			.collect_info =3D tegra_mc_emem_collect,
		},
		...
	};

That said, we might even be able to derive the tegra_mc_error_names from
that new table instead of keeping a separate one.

With all of the above, we now have the means to simply iterate over the
bits set in the top-level interrupt status, find the handler
corresponding to each one and run the appropriate sequence.

Moving the code for this into separate functions will decrease the
complexity of each function and make this a *lot* easier to review and
understand in my opinion. We will need to take some care to reduce
duplication (since we have a few cases in the switch above that share
the same content, I suspect we'll be able to create .collect_info()
callbacks that can be reused multiple times, or we might be able to
split these callbacks into smaller pieces that can be more easily
reused).

> +
> +static irqreturn_t handle_mcf_irq(int irq, void *data)
> +{
> +	struct tegra_mc *mc =3D data;
> +	unsigned long mcf_common_intstat, mcf_intstatus;
> +	unsigned int slice;
> +
> +	/* Read MCF_COMMON_INTSTATUS0_0_0 from MCB block */
> +	mcf_common_intstat =3D mc_ch_readl(mc, MC_BROADCAST_CHANNEL, MCF_COMMON=
_INTSTATUS0_0_0);
> +	if (mcf_common_intstat =3D=3D 0) {
> +		dev_err(mc->dev, "No interrupt in MCF\n");

I'd think this would be better as a warning than an error.

> +		return IRQ_NONE;
> +	}
> +
> +	for_each_set_bit(slice, &mcf_common_intstat, 32) {
> +		/* Find out the slice number on which interrupt occurred */
> +		if (slice > 4) {

This looks like it should be parameterized from the start.

> +			dev_err(mc->dev, "Invalid value in registeer MCF_COMMON_INTSTATUS0_0_=
0\n");

Make this more useful by adding the invalid value to the message. Also,
no need to be specific about the register name, since nobody will know
what that means. We also know quite specifically why the value is
invalid. A better error message would be:

	dev_err(mc->dev, "slice index out of bounds: %u\n", slice);

> +			return IRQ_NONE;
> +		}
> +
> +		mcf_intstatus =3D mc_ch_readl(mc, slice, MCF_INTSTATUS_0);
> +		if (mcf_intstatus !=3D 0)
> +			mcf_log_fault(mc, slice, mcf_intstatus);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void hub_log_fault(struct tegra_mc *mc, u32 hub, unsigned long hu=
b_intstat)
> +{
> +	unsigned int bit;
> +
> +	for_each_set_bit(bit, &hub_intstat, 32) {
> +		const char *error =3D tegra_hub_status_names[bit] ?: "unknown";
> +		u32 intmask =3D BIT(bit), client_id;
> +		const char *client =3D "unknown";
> +		u32 status_reg, addr_reg =3D 0, addr_hi_reg =3D 0;
> +		u32 value, addr_val, i;
> +		phys_addr_t addr =3D 0;
> +
> +		switch (intmask) {
> +		case MSS_HUB_COALESCER_ERR_INTMASK:
> +			status_reg =3D MSS_HUB_COALESCE_ERR_STATUS_0;
> +			addr_reg =3D MSS_HUB_COALESCE_ERR_ADR_0;
> +			addr_hi_reg =3D MSS_HUB_COALESCE_ERR_ADR_HI_0;
> +			break;
> +
> +		case MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK:
> +			status_reg =3D MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK:
> +			status_reg =3D MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_MSI_ERR_INTMASK:
> +			status_reg =3D MSS_HUB_MSI_ERR_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_POISON_RSP_INTMASK:
> +			status_reg =3D MSS_HUB_POISON_RSP_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK:
> +			status_reg =3D MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_RESERVED_PA_ERR_INTMASK:
> +			status_reg =3D MSS_HUB_RESERVED_PA_ERR_STATUS_0;
> +			break;
> +
> +		default:
> +			dev_err_ratelimited(mc->dev, "Incorrect HUB interrupt mask\n");
> +			return;
> +		}
> +
> +		value =3D mc_ch_readl(mc, hub, status_reg);
> +		if (addr_reg) {
> +			addr =3D mc_ch_readl(mc, hub, addr_hi_reg);
> +			addr <<=3D 32;
> +			addr_val =3D mc_ch_readl(mc, hub, addr_reg);
> +			addr |=3D addr_val;
> +		}
> +
> +		client_id =3D value & mc->soc->client_id_mask;
> +		for (i =3D 0; i < mc->soc->num_clients; i++) {
> +			if (mc->soc->clients[i].id =3D=3D client_id) {
> +				client =3D mc->soc->clients[i].name;
> +				break;
> +			}
> +		}
> +
> +		dev_err_ratelimited(mc->dev, "%s: @%pa: %s status:%u\n",
> +				    client, &addr, error, value);
> +	}
> +
> +	/* clear interrupts */
> +	mc_ch_writel(mc, hub, hub_intstat, MSS_HUB_INTRSTATUS_0);
> +}

Similar comments apply to this as to mcf_log_fault().

> +
> +static irqreturn_t handle_hub_irq(int irq, void *data, int mc_hubc_apert=
ure_number)
> +{
> +	struct tegra_mc *mc =3D data;
> +	unsigned long hub_global_intstat, hub_intstat, hub_interrupted =3D 0;
> +	unsigned int hub_global_mask =3D 0x7F00, hub_global_shift =3D 8, hub;

I think you can shorten a lot of these variables by dropping the hub_
prefix. It's in a handle_*hub*_irq() function, so you don't need extra
context.

> +
> +	/* Read MSS_HUB_GLOBAL_INTSTATUS_0 from mc_hubc_aperture_number block */
> +	hub_global_intstat =3D mc_ch_readl(mc, mc_hubc_aperture_number, MSS_HUB=
_GLOBAL_INTSTATUS_0);

We seem to have different names for the same thing here. We use the
"memory controller channel read register" function and pass the aperture
number in as the channel number. Maybe we should settle on one name and
use that going forward?

Or are these different things historically? Are we reusing channels from
earlier chips for apertures on newer chips?

> +	if (hub_global_intstat =3D=3D 0) {
> +		dev_err(mc->dev, "No interrupt in HUB/HUBC\n");

Again, this can probably just be a warning, no need for an error.

Thierry

--hu2ktmx2rhux7m3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlk7eoACgkQ3SOs138+
s6FX0g/8C1FEPWb9GcPei+/fyauRvxEvonCIbA7bGcOwtA0uS1C4zpz2UZ11B7xi
1z9UGGp7cKWYUO/aHXYAF8P4Sq37vxEysr18mpP/tDuDzrSYKgiDHv8/zKzWS11S
B9TPCPJpxfy8nS95d5kjYAuoE2VN5FJ1QFidM69BTmnGV67TicnVFO7clJqv26h8
FLbKyudWgXGz8El1AKWUcpjqAnUIelqTWTmsU9T+XwcEqg+h7q3SG7QkRyLHpU/A
PH/rqPKkI80nWT87vC6f6EdYn9zoAY6gMnVNwEWmXMwK01E6Z6yI2FebsJ/67v+5
Fd5BXMcjRQTOMqRgvrBsIf3vq5Uih0nTch6sD681etf74sf0xIuNI8bg0Xv9WJR3
sadn6P8WGgtLxrrcuMjqWsbTqzsiOTukSwg+WItQGG9kzY3QxkOeJ7BKe703z+Kw
fUDoj3UOtq3Kiixdm75TJv/NZ74MeE17GZASjV2WRe277lv24PaCvKd18SvARVUf
vxpmg+KH3shcbuFIEOHE+nCWAlIcIr0BcTNwSCvMoXzXigj2nPiwm+yhorTLI2Wr
FUPJYWVL/ct87rTQeyo54NFbUjEBocD2EjwWIJ1WmVdbP5ekER5YLhu1qnUSpTS0
YnHK2PfpWk3qZwFkJdRHZEkuNp3CJvNcLB6RvRjbcoBMh2IYpQk=
=9fBt
-----END PGP SIGNATURE-----

--hu2ktmx2rhux7m3y--

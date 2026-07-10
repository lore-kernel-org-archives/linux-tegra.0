Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057833F1AD1
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678092; cv=none; b=mG4jLEyco5OAp60X2SxPo0H7aYBQq+d10p6Hu3m6M20MJoRonqS+yzl+PDQ7DGXzGwdmw2yf80+7kDSOIfWS0X2HlUIfS1z5hM6MIhHrU8S/ZoC2FOjSah8+WjB3arLobBnPMA9zKkKnw8eK5VQf1nZVMQMkwCeVnlJKgo2DUBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678092; c=relaxed/simple;
	bh=nXxhLm7BKVdr8uzxMervIEA4kwriD81plKd3cKegBew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPhH2KH2Fd7S1rXloLgTmvPqyqDqEy++kJq8dvPcx5ftYdSYaN8p5OH8OMZe2Wt0FPwv6Tg2VlmU1Y7ns4HsDTwPl7nBmwZyvM8N3rtKvd/c3bllLInocFIZhY5l44PiJeX8L+86gFDCmLfW4yAUgRy/sucfnsdbq3PyxtMrDQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KawRZw35; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KawRZw35"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso1259470a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 03:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678088; x=1784282888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lpw2Yck+OG4hOiY/EKNQW88l+r3Hq+reSMVqVtT7/jo=;
        b=KawRZw35QsawMd1WLToaqF8IcUcdQVm2BRWZ2nDlfL00t+y6Lr7eizwuSy17BrtW/J
         GHvwTt/WCq3ogrL44nwzyCs6p0gBy31ucEMU5Ho68KpTenHk2+tV88MsCYXgLwx5AOPs
         Vw5DQYURZ4+4qOhiqBQ4f7QlXoXkKCMykD365YyG7gRLzXfapzksisHvKSYJMb4s4K51
         4kxYfiCkVnmxBl2YiafJ6lrF0WtG1h0a84SWEyLWN/ZDp+kM0su1PN2IqJa/kVXn9tes
         VeK02Dx+zmzawISGXdsxL+pX3W6x/jBIMJnuhEpi8cJRdbejFVry5nKhc1zBe6XW9HW3
         Tz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678088; x=1784282888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lpw2Yck+OG4hOiY/EKNQW88l+r3Hq+reSMVqVtT7/jo=;
        b=m33z9qdHJgmz7cxhD4etAJi0iLv+swTeWgc9ZML0hT9PcqbqxagngBa2UwANwznOiZ
         ZxTZzCn669x3iR3zfFCmQ/mXz6+6NhBb9L6sD/Mk8fhC+lOvKUPI8zccah2h5dDs+lUx
         7thTlayPfPf9j5hm/Hr4/PIIDq+ispFtQ9l//QzQEhm5H+t0CrNaav809ZNUHNjX3RO6
         abihwukLtZ/lYyTZN677LlguKyMSjg/74FKufNst9bOE/vIHJQdAF5BsGL1P+i+Ks6J8
         rF5Bgp7slo1IApOPXAm93hLTyQy6rBxxOyo8vxSdMjeFzGR50gi1G8tZiEfhLUIPIyme
         vSEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVMrB57ernvND8lhkbmsK+yjo4YIOeMS51AT0DdQxFMhSZcKQyhTpNv4cQX/rSKXsmBQUaaDYf/TMRGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KFuUAVrNYtBvsDfFC7hmvGvXO6Q+uVsHdw1BlX+c8lZDtcUa
	feal21ezQB2GZHWwZkN5x6X0XxSocDQdwklO1BS4gErUpeM4iqKpc3Cb
X-Gm-Gg: AfdE7ckerqMVhQxmP8Xd6T7iCV2PmCzJDIeADzwUsA70H2j7B9iZ16OCzLkDoGwz1Vc
	OJQjCZORVSAmg9+iktfIwqto85w5k9q+Rs3awHUTr2yp7FGJmBGtM59Umw4m+d91ZL6d7QKmzbL
	xfmp7LCOpkOGEiwPzNkRhp7vtanHyJDYI/ArJABcbjC0pkKYKySgGAMzmr7hOkp0zVfbFnCSVCC
	DicL7XRhoJAtd5a+vD6vBPFeU3oMOTj4/XMu7G0Jp5bhoLJAKMU4olEFMbzWUtDxO0fLuh0jj2k
	sj6dGhLLUBrTNCjJ7YStw0/m1jnqFQHXeAEKa2PY3wJseubYws4E+Jj/Mr+RywpwD/qMm3Y936g
	TUidjGKQRleYqdEvqhemOvMLE1V+rtKODg15+dp+tkW0IjXrPBn2PaoKeWieeDaTACDnM31td6R
	1ci2pZNmKIhg6vyi6u2Xrf63xNi2ylTxSDBedfEqn8Vok1I5Mc97DcbBUMmDwmcq3anaPht7qcy
	Mc=
X-Received: by 2002:a05:6402:a29c:10b0:698:5d0:2a61 with SMTP id 4fb4d7f45d1cf-69c24eb9356mr810742a12.0.1783678088036;
        Fri, 10 Jul 2026 03:08:08 -0700 (PDT)
Received: from orome (p200300e41f023e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f02:3e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm6311637a12.29.2026.07.10.03.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:08:05 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:08:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] firmware: tegra: bpmp: Add ACPI support
Message-ID: <alDAOqx9wi4wRBgP@orome>
References: <20260615083731.888055-1-anrao@nvidia.com>
 <20260615083731.888055-4-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4xrbe6o7zgxdqwgp"
Content-Disposition: inline
In-Reply-To: <20260615083731.888055-4-anrao@nvidia.com>


--4xrbe6o7zgxdqwgp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/6] firmware: tegra: bpmp: Add ACPI support
MIME-Version: 1.0

On Mon, Jun 15, 2026 at 08:37:28AM +0000, Aniruddha Rao wrote:
> Add required changes in the Tegra BPMP driver to make it compatible with
> ACPI based platforms.
>=20
> On ACPI systems, IPC is handled through the AML method instead of the
> core kernel framework using mailboxes and IVC.
>=20
> Keep the existing TEGRA_BPMP Kconfig dependency on TEGRA_HSP_MBOX
> and the TEGRA_IVC selection unchanged. The driver remains a single
> implementation shared by Device Tree and ACPI platforms, and the
> Device Tree mailbox/IVC transport is still built unconditionally. ACPI
> systems bypass channel and resource initialization, MRQ registration,
> and mailbox transfers at runtime while the existing Device Tree
> transport and build model remain unchanged.

That entire paragraph is not needed. If you really want to, you can move
the bits about what's being bypassed into the paragraph below, but
generally don't describe what has not changed. Describe what's changed
and why.

>=20
> Bypass clock, reset and powergate init calls as these are not
> controlled by the Linux drivers on ACPI based systems.
>=20
> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
> ---
>  drivers/firmware/tegra/bpmp-private.h |   9 ++
>  drivers/firmware/tegra/bpmp.c         | 178 ++++++++++++++++++++++++--
>  2 files changed, 173 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/teg=
ra/bpmp-private.h
> index 07c3d46abb87..ebde0e36ae20 100644
> --- a/drivers/firmware/tegra/bpmp-private.h
> +++ b/drivers/firmware/tegra/bpmp-private.h
> @@ -26,4 +26,13 @@ struct tegra_bpmp_ops {
>  extern const struct tegra_bpmp_ops tegra186_bpmp_ops;
>  extern const struct tegra_bpmp_ops tegra210_bpmp_ops;
> =20
> +/* Maximum ACPI BPMP mailbox data buffer size. */
> +#define TEGRA_BPMP_ACPI_BMRQ_DATA_SZ   3960U
> +
> +struct tegra_bpmp_acpi_message {
> +	u64 status;
> +	u8 *data_ptr;
> +	u8 data[TEGRA_BPMP_ACPI_BMRQ_DATA_SZ];
> +};
> +
>  #endif
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index 16ca0d104c1d..e9c0d6d3e24d 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/clk/tegra.h>
>  #include <linux/genalloc.h>
>  #include <linux/mailbox_client.h>
> @@ -13,6 +14,7 @@
>  #include <linux/pm.h>
>  #include <linux/semaphore.h>
>  #include <linux/sched/clock.h>
> +#include <linux/slab.h>
> =20
>  #include <soc/tegra/bpmp.h>
>  #include <soc/tegra/bpmp-abi.h>
> @@ -343,12 +345,113 @@ static ssize_t tegra_bpmp_channel_write(struct teg=
ra_bpmp_channel *channel,
> =20
>  static int __maybe_unused tegra_bpmp_resume(struct device *dev);
> =20
> +#ifdef CONFIG_ACPI
> +static int tegra_bpmp_transfer_acpi(struct tegra_bpmp *bpmp,
> +				    struct tegra_bpmp_message *msg)
> +{
> +	acpi_status status;
> +	union acpi_object params[2];
> +	struct acpi_object_list param_list;
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	struct tegra_bpmp_acpi_message *pkg;
> +	struct acpi_buffer format =3D { sizeof("NB"), "NB" };
> +	struct acpi_buffer extract;
> +	size_t rbuf_len, rdata_len, rx_size;
> +
> +	if (!tegra_bpmp_message_valid(msg))
> +		return -EINVAL;
> +
> +	params[0].type =3D ACPI_TYPE_INTEGER;
> +	params[0].integer.value =3D msg->mrq;
> +
> +	params[1].type =3D ACPI_TYPE_BUFFER;
> +	params[1].buffer.length =3D msg->tx.size;
> +	params[1].buffer.pointer =3D (u8 *)msg->tx.data;
> +
> +	param_list.count =3D 2;
> +	param_list.pointer =3D params;
> +
> +	status =3D acpi_evaluate_object(ACPI_HANDLE(bpmp->dev), "BMRQ",
> +				      &param_list, &output);
> +	if (ACPI_FAILURE(status)) {
> +		acpi_evaluation_failure_warn(ACPI_HANDLE(bpmp->dev), "BMRQ",
> +					     status);
> +		kfree(output.pointer);
> +		return -ENODEV;
> +	}
> +
> +	obj =3D (union acpi_object *)output.pointer;
> +	/* Validate returned type */
> +	if (!obj || obj->type !=3D ACPI_TYPE_PACKAGE) {
> +		dev_err(bpmp->dev, "Invalid BMRQ data\n");
> +		kfree(output.pointer);
> +		return -ENODATA;
> +	}
> +
> +	if (obj->package.count < 2 ||
> +	    obj->package.elements[1].type !=3D ACPI_TYPE_BUFFER) {
> +		dev_err(bpmp->dev, "Invalid BMRQ data\n");
> +		kfree(output.pointer);
> +		return -ENODATA;
> +	}

These two blocks of checks seem redundant because acpi_extract_package()
already checks for them.

> +
> +	rdata_len =3D obj->package.elements[1].buffer.length;
> +	rbuf_len =3D sizeof(u64) + sizeof(u8 *) + rdata_len;
> +	if (rbuf_len > sizeof(*pkg)) {
> +		dev_err(bpmp->dev, "BMRQ: reply buffer too large (%zu)\n", rbuf_len);
> +		kfree(output.pointer);
> +		return -EINVAL;
> +	}
> +
> +	pkg =3D kzalloc(sizeof(*pkg), GFP_KERNEL);
> +	if (!pkg) {
> +		kfree(output.pointer);
> +		return -ENOMEM;
> +	}

Given the number of times we have to repeate kfree(output.pointer) it
might be worth extracting this into an error unwind path. It's not going
to reduce the number of lines because we need to assign err =3D ECODE, but
still worth it, in my opinion.

> +
> +	extract.length =3D rbuf_len;
> +	extract.pointer =3D pkg;
> +
> +	status =3D acpi_extract_package(obj, &format, &extract);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(bpmp->dev, "BMRQ: failed to parse package (%s)\n",
> +			acpi_format_exception(status));
> +		kfree(pkg);
> +		kfree(output.pointer);
> +		return -EINVAL;
> +	}
> +
> +	msg->rx.ret =3D (int)pkg->status;
> +	if (msg->rx.data && msg->rx.size) {
> +		rx_size =3D min_t(size_t, msg->rx.size, rdata_len);
> +
> +		memset(msg->rx.data, 0, msg->rx.size);

Why is this necessary? When would we expect to be copying less memory
than we asked for. Should that be considered an error?

> +		memcpy(msg->rx.data, pkg->data, rx_size);
> +	}
> +
> +	/* Free memory allocated by ACPI core */
> +	kfree(pkg);
> +	kfree(output.pointer);
> +	return 0;
> +}
> +#else
> +static int tegra_bpmp_transfer_acpi(struct tegra_bpmp *bpmp,
> +				    struct tegra_bpmp_message *msg)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
>  			       struct tegra_bpmp_message *msg)
>  {
>  	struct tegra_bpmp_channel *channel;
>  	int err;
> =20
> +	if (WARN_ON(ACPI_HANDLE(bpmp->dev)))
> +		return -EOPNOTSUPP;
> +
>  	if (WARN_ON(!irqs_disabled()))
>  		return -EPERM;
> =20
> @@ -389,16 +492,13 @@ int tegra_bpmp_transfer_atomic(struct tegra_bpmp *b=
pmp,
>  }
>  EXPORT_SYMBOL_GPL(tegra_bpmp_transfer_atomic);
> =20
> -int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
> -			struct tegra_bpmp_message *msg)
> +static int tegra_bpmp_transfer_channel(struct tegra_bpmp *bpmp,
> +				       struct tegra_bpmp_message *msg)

I'd prefer something like a __ prefix rather than the _channel suffix
which isn't really meaningful in this context.

>  {
>  	struct tegra_bpmp_channel *channel;
>  	unsigned long timeout;
>  	int err;
> =20
> -	if (WARN_ON(irqs_disabled()))
> -		return -EPERM;
> -
>  	if (!tegra_bpmp_message_valid(msg))
>  		return -EINVAL;
> =20
> @@ -428,6 +528,18 @@ int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
>  	return tegra_bpmp_channel_read(channel, msg->rx.data, msg->rx.size,
>  				       &msg->rx.ret);
>  }
> +
> +int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
> +			struct tegra_bpmp_message *msg)
> +{
> +	if (WARN_ON(irqs_disabled()))
> +		return -EPERM;
> +
> +	if (ACPI_HANDLE(bpmp->dev))
> +		return tegra_bpmp_transfer_acpi(bpmp, msg);
> +	else
> +		return tegra_bpmp_transfer_channel(bpmp, msg);
> +}
>  EXPORT_SYMBOL_GPL(tegra_bpmp_transfer);
> =20
>  static struct tegra_bpmp_mrq *tegra_bpmp_find_mrq(struct tegra_bpmp *bpm=
p,
> @@ -506,6 +618,9 @@ int tegra_bpmp_request_mrq(struct tegra_bpmp *bpmp, u=
nsigned int mrq,
>  	struct tegra_bpmp_mrq *entry;
>  	unsigned long flags;
> =20
> +	if (ACPI_HANDLE(bpmp->dev))
> +		return -EOPNOTSUPP;
> +
>  	if (!handler)
>  		return -EINVAL;
> =20
> @@ -531,6 +646,9 @@ void tegra_bpmp_free_mrq(struct tegra_bpmp *bpmp, uns=
igned int mrq, void *data)
>  	struct tegra_bpmp_mrq *entry;
>  	unsigned long flags;
> =20
> +	if (ACPI_HANDLE(bpmp->dev))
> +		return;
> +
>  	spin_lock_irqsave(&bpmp->lock, flags);
> =20
>  	entry =3D tegra_bpmp_find_mrq(bpmp, mrq);
> @@ -606,11 +724,17 @@ static int tegra_bpmp_ping(struct tegra_bpmp *bpmp)
>  	msg.rx.data =3D &response;
>  	msg.rx.size =3D sizeof(response);
> =20
> -	local_irq_save(flags);
> -	start =3D ktime_get();
> -	err =3D tegra_bpmp_transfer_atomic(bpmp, &msg);
> -	end =3D ktime_get();
> -	local_irq_restore(flags);
> +	if (ACPI_HANDLE(bpmp->dev)) {
> +		start =3D ktime_get();
> +		err =3D tegra_bpmp_transfer_acpi(bpmp, &msg);
> +		end =3D ktime_get();
> +	} else {
> +		local_irq_save(flags);
> +		start =3D ktime_get();
> +		err =3D tegra_bpmp_transfer_atomic(bpmp, &msg);
> +		end =3D ktime_get();
> +		local_irq_restore(flags);
> +	}
> =20
>  	if (!err)
>  		dev_dbg(bpmp->dev,
> @@ -635,6 +759,9 @@ static int tegra_bpmp_get_firmware_tag_old(struct teg=
ra_bpmp *bpmp, char *tag,
>  	if (size !=3D TAG_SZ)
>  		return -EINVAL;
> =20
> +	if (ACPI_HANDLE(bpmp->dev))
> +		return -EOPNOTSUPP;

Might as well move this check up before the size check so we don't waste
the extra comparison if we know the operation isn't supported anyway.

> +
>  	virt =3D dma_alloc_coherent(bpmp->dev, TAG_SZ, &phys,
>  				  GFP_KERNEL | GFP_DMA32);
>  	if (!virt)
> @@ -737,6 +864,9 @@ static int tegra_bpmp_init_channels(struct tegra_bpmp=
 *bpmp)
>  {
>  	size_t size;
> =20
> +	if (ACPI_HANDLE(bpmp->dev))
> +		return 0;
> +
>  	INIT_LIST_HEAD(&bpmp->mrqs);
>  	spin_lock_init(&bpmp->lock);
> =20
> @@ -777,6 +907,9 @@ static int tegra_bpmp_init_resources(struct tegra_bpm=
p *bpmp)
>  {
>  	int err;
> =20
> +	if (!bpmp->dev->of_node)
> +		return 0;
> +

Like I mentioned earlier, I think we can drop this check (and the
ACPI_HANDLE check in tegra_bpmp_init_channels() above) and just move the
conditional to tegra_bpmp_probe() instead.

>  	err =3D of_platform_default_populate(bpmp->dev->of_node, NULL, bpmp->de=
v);
>  	if (err < 0)
>  		return err;
> @@ -824,10 +957,12 @@ static int tegra_bpmp_probe(struct platform_device =
*pdev)
>  			return err;
>  	}
> =20
> -	err =3D tegra_bpmp_request_mrq(bpmp, MRQ_PING,
> -				     tegra_bpmp_mrq_handle_ping, bpmp);
> -	if (err < 0)
> -		goto deinit;
> +	if (!ACPI_HANDLE(bpmp->dev)) {
> +		err =3D tegra_bpmp_request_mrq(bpmp, MRQ_PING,
> +					     tegra_bpmp_mrq_handle_ping, bpmp);
> +		if (err < 0)
> +			goto deinit;
> +	}

This can then go into the same conditional.

> =20
>  	err =3D tegra_bpmp_ping(bpmp);
>  	if (err < 0) {
> @@ -949,10 +1084,25 @@ static const struct of_device_id tegra_bpmp_match[=
] =3D {
>  	{ }
>  };
> =20
> +static const struct tegra_bpmp_ops tegra_bpmp_acpi_ops =3D { };
> +
> +static const struct tegra_bpmp_soc tegra_bpmp_acpi_soc =3D {
> +	.ops =3D &tegra_bpmp_acpi_ops,
> +};

This empty tegra_bpmp_ops struct is useless. Just add checks where
appropriate to make it optional.

Thierry

> +
> +static const struct acpi_device_id tegra_bpmp_acpi_match[] =3D {
> +	{
> +		.id =3D "NVDA3001",
> +		.driver_data =3D (kernel_ulong_t)&tegra_bpmp_acpi_soc,
> +	},
> +	{ }
> +};
> +
>  static struct platform_driver tegra_bpmp_driver =3D {
>  	.driver =3D {
>  		.name =3D "tegra-bpmp",
>  		.of_match_table =3D tegra_bpmp_match,
> +		.acpi_match_table =3D tegra_bpmp_acpi_match,
>  		.pm =3D &tegra_bpmp_pm_ops,
>  		.suppress_bind_attrs =3D true,
>  	},
> --=20
> 2.43.0
>=20

--4xrbe6o7zgxdqwgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpQxIEACgkQ3SOs138+
s6FephAAiUUA3+YBjAgaqqRFe6/1AW8QIybnS0nGFiOOxkeqRT/2K0oC2Yi4iwrC
A7YHxHVifL1cS61ONdXRlA9QDssr24ASAnlE8AXS74u2BNY1xD4rWtTIMN+m2Lkk
e6yjZYRU0F/XkWrgez1i2Dbo3OnaNUvWJkWeSwtcaWgloOJQ0fxBxKmpgUGbioHP
bwPc9KSvxQlfXYPqBfwixlxswkRqRD0Yjl2HIYFusrqYqXSKjIYtnmrmpDUWg7NN
0zuGPhtugoY9dwCsG+DA8emD+RmRb8KrNHqujglBOqhh1Uu5lkO4qE4jG9t1Fepo
Nl23COENt8axwkzKYrQsBTMxw9d05GemPbAR3QsHXtsi0ABGYB5mUlcqaU3MG/nK
c8BaUMU7HQX2JkeRH4ZvNzYB0bk+upGYwvePPeLFiujyoixHK2RGs13/eODOMjiG
KiOR3Mf2En8yTvTbZKtqii5XbdJ8GhCfjdT1xfWdSI7rZBlKxUIqoVeDJU6MC7Xt
SDTkPhIZlnJ2Jg/lfHA/Pk2r4HVCLtNoXpB7UpE1FUVleEF1EV52yUazAHzwO3pK
S+5NW/z1bcRpZNIxn31Gdo+0nJkFuHR133iDoJ3aE9tb1klZKbTzYdxbSfti5mUB
F5QyD+++o10tTHCTi+RhJHKHw8swCyFkSuGwAGvOlw+ssjflRwE=
=Ufex
-----END PGP SIGNATURE-----

--4xrbe6o7zgxdqwgp--

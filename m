Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794059680;
	b=ClgYme9Y8MWvoq8jzuo/Jb6d5FJ3hN7uoWwR0LClTiqFNc//PIUYKtSORSkhWC9QEJT/
	 YmSQ16ZVYd7u9x8OSvjKlfO6OBBn9D5pdMVZWGhR9UtIJQK9ndRX1VmI3/iThbz5un+d0
	 4HqB7mTfzqlkdtVI5BzZqJX1BCMTKW6E2//y7v9/4rXont+okePFZu9t5i+x7bvWVXBCw
	 PIH39/PRiup+eQbPhchK7NOhC16DGuPJuuzzTHXBjwOVG2ZiPI+73t61czh4L6pMFfuvB
	 zOpyK8/fdF0NVI/6FRGpWgp9kD4qGV+61rpQRwzN9iaNAW8pOkTEYTA6wSNlfgHz9wA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
	b=F/lF8oGGfDLU7JF1h0mBD60hZ4zmUnQk0UkbOg9G1/VTgcmQ6LrJvAQCC9G9JqWaMy1J
	 bCffSE/b5AfXkiuc/U7yfq8xFLBpdoCgCth/jFPeRCt4+fYMls0PbQjBUTJSN3kBUG2Cy
	 3hAHCSq77QsGf4PAJT07KoWePj0ykuK+WZC/HD2SUIDmB2hn4WU0QX+OyH1s3yeSBIYzv
	 +r4aZwaDtVsju6kmjlDkF8T4it2SOZHOmMsBqBtFOycPk8Ko1+5Q2Ug1eC8f/cIfU3MBj
	 yt1Vfv/QfkyvZOmncrE1DQh3b2uw2jXFnlZhgaX7+EtMed255xs/3Q3YyIp5jT0AhtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycSfE5T9;
	arc=fail smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B308606A32C
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 13:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B308606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycSfE5T9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36dbde64409so2134805eec.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 05:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059679; cv=none;
        d=google.com; s=arc-20260327;
        b=qsDlP4f9GlQzwcRg45e+QODXq7ZqJTLu382HH5CTSIOk1rTqZaSBLAijW26xW99muM
         Fji5Sq9tAtRVaFOCPpils1VqJKNib8YFJSl/3JfZXXYD/X4MXZ08tkbiiSZa70PDbBSZ
         1i8/xSXiebmXILi2wZbVMUL8/F+Sbbvz+28vLmjweYchKYH1x5po1fwTmDUqZBh9Nz06
         ltoU23wRO1+eGFvv23E9IvnjEW7NgCSYknDVazsxhECHjbn3U0BclDHDzQ/XbMsR68sm
         Yu8oyISv6/CwRSisZHYmipNc0ojBw74jga3jLCv7ksj68uZ3f1XJpbT3eNIKTMwqYSx/
         amuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
        fh=Qs6WLt8NbbiqBjM9pxqs2v+jrTGPU9pnEBT/TxIgmBs=;
        b=KcL492PQia76StJ+SzW2F7O5KMAwQ/5wiEwx3R0BXLK5Fi71JwEFzs+ejLyg2uCds6
         3E3+sOJd9+OKT49xxn/0+NmR4Gk6oIivRRrOJ9r/qRB/ZPKhIvdSYTHUZVItTlYFrN3E
         dsIB4KAsri2DjGKCZB++8VC86vTNuscqqqNfX2XKVQ0Hn2U9JUyJg/X9SgFHEX75ZEr3
         9YncT7dmuT3Ot1eSHw437NjCo0Au61Q2FCnuJh5bKkIxcTMwiTs3G8SKTEtjjYSqF6Kf
         5uXGnTianpvp0UtO7NdAQEM+Mc8YRvu+P6MiSqUaFr0fCSf7iVv16BOwxoJtquiNQ0yi
         UIsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059679; x=1794664479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
        b=ycSfE5T9N+tV8tdFDOw77jY11VyiDapgPTfbsh1Vj9BIFylqw+j3WWpeaDXIp/MKz0
         dSZL89QRvQh3oayMXqCttEIOdfeFaU4nC1pEFv9sczOxY1iYGhJdhaXNGKvufX03WVqo
         C9VU64ue/ENINEQetea26uNmPsnBde6xxxWehhkTWpYhqCCgKwEcl+f0BJoIXTyErynl
         xuwuSSYZncUPh3UUXDsebLk9cvhy90ouFYs7/uiUpM/xP8bwrb8yu7EnZhT6Jd6LmtqG
         QZMUXLuU5NIxB/Wo7P/+ZabZy0j/CZP9BQ/p8srjtGpmDyUFMetzG8bQ2fq+mZZX6w19
         2q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059679; x=1794664479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
        b=ypFcdHXg9L6EwV9Sidqxze72Kh37qEDvaGIv9wgYJOi1Ehc0fTF2gGNuRrpRMjFRY3
         igM7OCfyDWWvUii7//eDp9gMomVm2p6GnVa60L+/+aeJ0kgaTRiNDQdkFCv0UFOJ1H/n
         3ETyqMzXJLIEnpdTLrxIBUqzXDUKFPOGkpCMC7hy3m7OS2PwfUki37AeAm9OwwrDnz/R
         Suih6f/IQD7ObEv15eP6b+iTfRLoL5J3o7pTwsT4fAGWy9tA0sNAhnN5Ft/KKuIIilMX
         MPkoCLLko7TYQEWvHPhKzImA8XT9fRMAE/aRAntgucFooPU9+Hxlq3emNIgvdxPnCp45
         kbiQ==
X-Forwarded-Encrypted: i=1; AL+hErFkBt5KpcKWNVTwGSOIU+prrbkpIPcNTAGvSqKo+EofEDuQ6LesdMiFIONyPNO8V3BggFdfIGhQ0vSdSQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ovudozSmsL//ZRx3GPG1YIO0A4Kot29tvFzC9LsI9zL2G63vA
	E0nxYdwjDfkx1l48kZHMKpMcRbR9zcbxCPLxNG4MQKiKDtR5pqFvqLceW+VYm64vR16WX26qfTj
	ifvt9E0ZPBCbagARrpm2gvPlYGxtHKd4=
X-Gm-Gg: AYBFou3OI3ZPcilQ9SY02VIrQEbESPwo6odrgjZDyLKc5xmK2JAroJfF2fcAtpQZEvY
	TcIRIBQlh1in4pGKjAGaJ5RrO1ccymT6pI2VUnXOg1zSMmkpaaXe9Z9XQyneFJ+TvEEb5RsFIKa
	0dd2dqdZ+/cmQxFHTHu//A8y1HSRgcpQ/tBZfjdeaq4swK+0Ep6zPXi/jiNWRcc9BHGuFEMj+/v
	f2gOgE2y91OHUu1BKy6G9b9r3TrRRvohPV2jcDZRlTWFl+mDMNm613rxm2K5FXs9KqWNcphmbCC
	UZQuJu+tCz4e3U7Lmd7TRxaa9Ho2hRfHg0FK0ccvVeOhz9VQGYHxgEXb8HSFXnGVhX0P1HhHkUv
	budKzhDv96LHTyG4nD1HGFzPlDMFYMjCa67ohZLMe3FC/sJ41FzATYdiOZMwd+hsGFocBY5Yr19
	HhmOOvTilWb23wI6YXZ+oWqHTVGjFvUQ==
X-Received: by 2002:a05:7300:ed13:b0:370:121a:b2f with SMTP id
 5a478bee46e88-370121a13b0mr8606853eec.11.1794059679071; Sat, 07 Nov 2026
 05:54:39 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-2-clamor95@gmail.com>
 <au3NWsXz-hg2LNr_@orome> <CAPVz0n3_oRz8aMr1W=8K7dnHhM=vuGpHjpq6+=80oXiFj5wfSg@mail.gmail.com>
 <au3telUE9A43PDWv@orome>
In-Reply-To: <au3telUE9A43PDWv@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 15:54:27 +0200
X-Gm-Features: AclHuK8lORI9v0DJ7PzJIhwANBCoAngQBMqPQ00GdlIqFV0vGLKb_MHLVYVyoL8
Message-ID: <CAPVz0n0z36TnRJ87itGALHLUvNQJ7+NoOAKdhU=PyKpJhB8WFg@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] drm: Add MIPI DBI bus support for MIPI DBI Type
 A and B
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:19=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 06, 2026 at 03:59:05PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
5:14 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Nov 05, 2026 at 04:05:01PM +0200, Svyatoslav Ryhel wrote:
> > > [...]
> > > > diff --git a/drivers/gpu/drm/drm_mipi_dbi_bus.c b/drivers/gpu/drm/d=
rm_mipi_dbi_bus.c
> > > [...]
> > > > +/**
> > > > + * devm_mipi_dbi_device_register() - create a managed MIPI DBI dev=
ice
> > > > + * @dev: device to tie the MIPI-DBI device lifetime to
> > > > + * @host: DBI host to which this device is connected
> > > > + * @np: device tree node associated with the panel MIPI DBI device
> > > > + *
> > > > + * This function is called by DBI host driver to create panel devi=
ce.
> > > > + * It automatically calls mipi_dbi_device_unregister() when @dev i=
s
> > > > + * unbound. It does not automatically free passed device node poin=
ter,
> > > > + * it must be put manually.
> > > > + *
> > > > + * Returns:
> > > > + * A pointer to the newly created MIPI DBI device, or, a pointer e=
ncoded
> > > > + * with an error.
> > > > + */
> > > > +struct mipi_dbi_device *
> > > > +devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_=
host *host,
> > > > +                           struct device_node *np)
> > > > +{
> > > > +     struct mipi_dbi_device *dbidev;
> > > > +     int ret;
> > > > +
> > > > +     if (!host || !host->dev || !host->dbi || !host->dbi->command =
||
> > > > +         !host->ops || !host->ops->attach || !host->ops->detach ||=
 !np)
> > > > +             return ERR_PTR(-EINVAL);
> > >
> > > Do we want dev->of_node to serve as a fallback for !np?
> > >
> >
> > No we don't dev->of_node is hosts node, and np is panel node.
>
> Fair enough. The parameter name is a bit generic, but I guess if you
> read the documentation it becomes clearer what it means.
>
> > > > +
> > > > +     if (!of_device_is_available(np))
> > > > +             return ERR_PTR(-ENODEV);
> > > > +
> > > > +     dbidev =3D kzalloc_obj(*dbidev);
> > > > +     if (!dbidev)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     if (of_node_test_and_set_flag(np, OF_POPULATED)) {
> > > > +             kfree(dbidev);
> > > > +             return ERR_PTR(-EBUSY);
> > > > +     }
> > > > +
> > > > +     dbidev->host =3D host;
> > > > +     dbidev->dbi =3D host->dbi;
> > > > +     device_initialize(&dbidev->dev);
> > > > +     dbidev->dev.parent =3D host->dev;
> > > > +     dbidev->dev.bus =3D &mipi_dbi_bus_type;
> > > > +     dbidev->dev.release =3D mipi_dbi_device_release;
> > > > +     device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np=
)));
> > > > +
> > > > +     ret =3D dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->de=
v), np->full_name);
> > > > +     if (ret)
> > > > +             goto put_device;
> > > > +
> > > > +     ret =3D device_add(&dbidev->dev);
> > > > +     if (ret)
> > > > +             goto put_device;
> > > > +
> > > > +     ret =3D devm_add_action_or_reset(dev, mipi_dbi_device_unregis=
ter,
> > > > +                                    &dbidev->dev);
> > > > +     if (ret)
> > > > +             return ERR_PTR(ret);
> > > > +
> > > > +     return dbidev;
> > > > +
> > > > +put_device:
> > > > +     of_node_clear_flag(np, OF_POPULATED);
> > > > +     put_device(&dbidev->dev);
> > > > +     return ERR_PTR(ret);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
> > >
> > > Don't we need to of_node_put() here on failure? Otherwise we're leaki=
ng
> > > the reference that we obtained inside the device_set_node() argument.
> > >
> >
> > This is fully repeats device_register logic of drm_mipi_dsi.c so
> > unless DSI framework has leak, this should be correct
>
> Nobody said that drm_mipi_dsi.c is correct. I'm reviewing this patch and
> it seems like it's wrong. If drm_mipi_dsi.c does the same thing it
> probably is wrong, too.
>

May anyone from DRM maintainers clarify this please. I would like to
know if I need to change here anything. Thank you.

> > > > +static int mipi_dbi_drv_remove(struct device *dev)
> > > > +{
> > > > +     struct mipi_dbi_driver *drv =3D to_mipi_dbi_driver(dev->drive=
r);
> > > > +     struct mipi_dbi_device *dbidev =3D to_mipi_dbi_device(dev);
> > > > +
> > > > +     drv->remove(dbidev);
> > > > +
> > > > +     return 0;
> > > > +}
> > >
> > > Might as well make drv->remove() return an error and propagate that
> > > here.
> > >
> >
> > Have you even checked the code? remove() callback is and should be void=
.
>
> I don't know what you're trying to say here. Yes I can see that the
> remove callback returns void. My point is that device_driver.remove does
> *not* return void and since this is merely a wrapper around it for DBI
> it could also just return int for symmetry.
>
> But there's also continuous work trying to convert all driver remove
> callbacks to return void, so that's eventually going to get "fixed" here
> anyway, so might as well leave it like this.
>
> Thierry

Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD8410D26
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 10:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680397; cv=none; b=MYkYH7fa7rgVMqPYg2iqjJJCTQmJCKJPBMPARZUe+qrISjEJ5zEDLzRZ8XwXS1BvVDxZkSrS3zm5Zgc/e7ukq75ytI6/Hurayz3XQBU8Hu+6iaFyTiruvIOkbxc6ksPjs1i/5s1KF7S/Pxy+3+KTpgAufOpTekXlFcGzHE/9exM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680397; c=relaxed/simple;
	bh=+rV7PZKbLr8DFNWwQEVanMgO/xa7DxfzJbcdxI/paaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Es7z3IISjUoP1djl/hDrMhwrjiJG+Dz5HM/5GPJ1dqUmJXzQtK8MySg5FrK0f62WyQOVmUoFbwCz5EO1P42t4rpruIEhRxogfypejzyqIRpRlVD/esfK3m4wtDD66WwiBL4LirTbqk2X+n/bfIfvbdqAj2un8oLt2RM9cjWifs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOg8aj8o; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOg8aj8o"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15b1da6b82so89097266b.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680393; x=1784285193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77zjuw3Nk9PJ95lsgCHvxVCQTioIj8bo/QkTRQfe7Os=;
        b=mOg8aj8oLJaWlRaEY+xFBhMrZQ0UV/hXHiEsAbBARdKjM9Y/kxZNAsB209/PvJrMl/
         5qrjlvPyLjChapqMqu6GBXdYOUbc7uYWL8RnpC0l/zsvvdVaTdvLOvxf4Uji8gXWZ6Mx
         qvNcGIKAqdf+jsuM+Vc30xtJ67qs/40dnaMNH/72GwUMmvLIG9Uvv2wFkXRa+KP1Aozs
         S9wcYGaYMP7YZkJB8xfgLYvSdtGHNBkz2+zkvovmaZg66Xcy2IWM8EP0q921q9YkINfV
         m/3qqZAT61Beafs5zGxf7xZPNLeNeOLXsqM7hlM7hnOerfS+tVfSJUXtzqeKcpbnFKMN
         YA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680393; x=1784285193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77zjuw3Nk9PJ95lsgCHvxVCQTioIj8bo/QkTRQfe7Os=;
        b=JnOwLdP+a6VxHJ4XuyPhes7tucvNDlyR5+sBE230MyueZ79N5Lwa/eisn75SwMMWZw
         IrlGPTiYZsZW/mpmVO6NLPU3+kRKyjY1ala0c6j6zik8DfDwWOcdim9q/P0wCI0SRFig
         Oyv80WtJFFoUH4fS9c5mlgJ1BGQoAyX55Swz369Jw+SwEpvxpG+RCaypczMoJsgvxTEM
         FZWA+cwxrpktGED+NBXOtOwReCFqTnuoLukld1GkgOUXqilynIQGZz62WmIddeJlWwiZ
         pSZKNnsXwKrndFUA1P4AwuNzkzwp5sBzEh1qvBJwx7ff+jIyuq0br8AzeluQc8b8vLad
         Tj9A==
X-Forwarded-Encrypted: i=1; AHgh+RrHyvjUt8K1hIVPD87ZI7IV1i01F+x+PyLJIPyrWj5y/orpArVDlWK3jgYmpMheFZo/j2AFk/ROLKBzUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7OOUgmOY6XqFF93yqFPQH1kuLNOMVDxqLkghFqE2LCYssjaTn
	C+fcbTMNQKoXWfegmYAUUpXT2fKVquL4oaLeTYaJYdEXbkzAh7OS4eSk
X-Gm-Gg: AfdE7cmBbsylyTZDY7lCQf4GxwG4Zvo93qmUGDq0oNn+OF4bJwhKWRBzex0md2i9xUp
	8sWNYwNZF9EHtcAhFDgLItExzvXjfJrNeH9llvAdVYwIL3qM6VA9NIjNB04Hlt6rQzCxWcjiqaS
	KZ0tS7VNs8jtprRDSUIeYFnA8oEsjiogXTIzl61no34ZBWPIHtow3ZUaZBz3CblLEsXgTNB5j2I
	z8kOTysxu4dwGs8JYgt8siHhskg5stJdPTxhEudm8vuHB1WfopAj5lbS/c234hqm+EzMhgdw4Tl
	cMyP/zPNoapxybJp883aPdztenore0Ga9cJNrH7y8ZntJZGH8lV+r9fI2DdvyGQQaDMyrZIWXSy
	0F1PIF6eZtpZ1onhuTvwKZZd/9c/Sj9ur7KJXPCCj6KHx7PQ8RFVsGUNg+Hc/usgbYnLiG55PBR
	XGZuwt9OM9wKJdbPiuwafbMzcRTTjSMx4cDzQEXrIEqYPa9lD0d/VOFtvYnxiRehMup2QLAl4Wl
	LE=
X-Received: by 2002:a17:907:a286:b0:c12:f81:661f with SMTP id a640c23a62f3a-c15ce130541mr471056866b.51.1783680392884;
        Fri, 10 Jul 2026 03:46:32 -0700 (PDT)
Received: from orome (p200300e41f023e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f02:3e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa6dba523sm5264662a12.0.2026.07.10.03.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:46:31 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:46:29 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] firmware: tegra: bpmp: Add Tegra410 MBWT sysfs
 interface
Message-ID: <alDJNTtLG77CganC@orome>
References: <20260615083731.888055-1-anrao@nvidia.com>
 <20260615083731.888055-7-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hc3cetaspwsavdkq"
Content-Disposition: inline
In-Reply-To: <20260615083731.888055-7-anrao@nvidia.com>


--hc3cetaspwsavdkq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/6] firmware: tegra: bpmp: Add Tegra410 MBWT sysfs
 interface
MIME-Version: 1.0

On Mon, Jun 15, 2026 at 08:37:31AM +0000, Aniruddha Rao wrote:
> Different workloads can place different memory-bandwidth demands on the
> system. Selecting an appropriate bandwidth limit depends on the runtime
> workload mix and on the devices carrying that traffic, such as PCIe
> devices or a GPU connected over chip-to-chip link (Nv-Clink). That
> information is not available to the kernel.
>=20
> Tegra410 provides Memory Bandwidth Throttler (MBWT) controls for PCIe
> and GPU connected over chip-to-chip link (Nv-Clink) traffic on the path
> to DRAM. Each PCIe bandwidth group has a single shared cap for all
> traffic in that group. A group may contain only PCIe devices, only a GPU
> over Nv-Clink, or both PCIe and GPU traffic in a bifurcated topology.
> Bandwidth for a group can be set per traffic type (PCIe Read, PCIe
> Write, GPU over Nv-Clink).
>=20
> Add a sysfs attribute on the tegra-bpmp platform device to expose a
> narrow userspace interface/tuning knob for MBWT control.
>=20
> A write to the attribute accepts a comma-separated tuple of
> instance,vc_type,bandwidth. The instance field identifies the PCIe
> bandwidth group. The vc_type field selects PCIe read, PCIe write, or GPU
> over Nv-Clink traffic for that group, and bandwidth specifies the target
> bandwidth limit to program. A read from the attribute queries firmware
> for each documented instance and vc_type combination and returns one
> tuple per line. Reads do not depend on a previous write. If firmware
> returns an error for any GET_BW request, the read fails with that error.
>=20
> For example, writing 0,1,100 programs a 100 GB/s cap for PCIe write
> traffic in PCIe bandwidth group 0. A subsequent read reports the
> firmware-returned tuples, including the bandwidth value reported by
> firmware for PCIe write traffic in group 0.
>=20
> Since Tegra410 is an ACPI-only platform, register the attribute only on
> ACPI systems and only when BPMP firmware reports support for the MBWT
> GET_BW and SET_BW requests through its query ABI.

I think we should make this purely feature based and not tie this to
ACPI. We might end up with needing this on non-ACPI systems at some
point, and even if we don't it's generally clearer to bind functionality
to features, especially if they can be detected at runtime like in this
case.

>=20
> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
> ---
>  .../ABI/testing/sys-platform-tegra-bpmp       |  51 +++++
>  drivers/firmware/tegra/Makefile               |   1 +
>  drivers/firmware/tegra/bpmp-private.h         |   2 +
>  drivers/firmware/tegra/bpmp-tegra-sysfs.c     | 210 ++++++++++++++++++
>  drivers/firmware/tegra/bpmp.c                 |   6 +
>  5 files changed, 270 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sys-platform-tegra-bpmp
>  create mode 100644 drivers/firmware/tegra/bpmp-tegra-sysfs.c
>=20
> diff --git a/Documentation/ABI/testing/sys-platform-tegra-bpmp b/Document=
ation/ABI/testing/sys-platform-tegra-bpmp
> new file mode 100644
> index 000000000000..2c08051ac39d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sys-platform-tegra-bpmp
> @@ -0,0 +1,51 @@
> +What:		/sys/bus/platform/devices/<bpmp-device>/bandwidth
> +Date:		June 2026
> +KernelVersion:	7.1
> +Contact:	Aniruddha TVS Rao <anrao@nvidia.com>
> +Description:
> +		Provides access to the Tegra410 Memory Bandwidth Throttler
> +		(MBWT) control exposed by BPMP firmware for PCIe and GPU
> +		connected over chip-to-chip link (Nv-Clink) traffic on the
> +		path to DRAM.
> +
> +		The attribute is present only on ACPI-based Tegra410 systems
> +		and only when BPMP firmware reports support for the MBWT
> +		GET_BW and SET_BW requests through its query ABI.
> +
> +		Each PCIe bandwidth group has a single shared cap for all
> +		traffic in that group. A group may contain only PCIe devices,
> +		only a GPU over Nv-Clink, or both PCIe and GPU traffic in a
> +		bifurcated topology. Bandwidth for a group can be set per
> +		traffic type (PCIe Read, PCIe Write, GPU over Nv-Clink).
> +
> +		A write accepts a comma-separated tuple of
> +		"instance,vc_type,bandwidth". Spaces around comma-separated
> +		fields are allowed.
> +
> +		instance identifies the PCIe bandwidth group. Valid values are
> +		0-5, where 0 =3D pcie0, 1 =3D pcie1, ..., 5 =3D pcie5.
> +
> +		vc_type selects the traffic type for the selected group:
> +		0 =3D PCIe read
> +		1 =3D PCIe write
> +		2 =3D GPU over Nv-Clink
> +
> +		bandwidth specifies the target bandwidth cap in GB/s. Values
> +		outside 1-110 (inclusive) are rejected by the driver before
> +		issuing MBWT_SET. Firmware may still reject values within
> +		that range.

If firmware is already filtering, I don't think we should filter in
software at all. That's just going to lead to a situation where we need
to keep both in sync manually.

> +
> +		A read queries firmware for each documented instance and
> +		vc_type combination, and returns one tuple per line. Reads
> +		do not depend on a previous write. If firmware returns an
> +		error for any GET_BW request, the read fails with that error.
> +
> +		Example:
> +			echo 0,1,100 > .../bandwidth
> +			cat .../bandwidth
> +			0,0,100
> +			0,1,100
> +			...
> +
> +Users:		Platform integration and bandwidth tuning on ACPI-based
> +		Tegra410 systems (PCIe and GPU over Nv-Clink caps).

I recall that this is evolved from a prior sysfs interface and was
changed to this based on earlier input (including from me). I'm having
second thoughts about this particular iteration, though. The sysfs
documentation is pretty clear that attributes should be simple values
that don't need a lot of parsing. The comma-separated list here doesn't
adhere to that.

This particular format also has the downside of requiring a lot of
implicit knowledge.

I think we could address both issues with a hierachy that might look
somewhat like this:

	<bpmp>
	|-- mbwt/
	|   |-- pcie0/
	|   |   |-- read
	|   |   |-- write
	|   |   |-- gpu
	|   |-- pcie1/
	|   |   |-- read
	|   |   |-- ...
	|   ...
	|   |-- pcie5/
	|   |   |-- ...

Note that this is different from the first iteration in that it allows
requests to be atomic. It also has the benefit of making the number of
groups and virtual channels discoverable (i.e. the driver knows them
based on SoC generation and userspace can probe by simply walking the
sysfs hierarchy).

The value written (or read) is then simply the bandwidth in GB/s.

> diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Mak=
efile
> index 4310cc0ff294..2fd060c66523 100644
> --- a/drivers/firmware/tegra/Makefile
> +++ b/drivers/firmware/tegra/Makefile
> @@ -5,6 +5,7 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+=3D bpmp-tegra18=
6.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_410_SOC)	+=3D bpmp-tegra410.o
> +tegra-bpmp-y			+=3D bpmp-tegra-sysfs.o

I think this needs to be conditional on CONFIG_SYSFS.

>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_DEBUG_FS)	+=3D bpmp-debugfs.o
>  obj-$(CONFIG_TEGRA_BPMP)	+=3D tegra-bpmp.o
> diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/teg=
ra/bpmp-private.h
> index c3f466ae5979..ae26cc203aa4 100644
> --- a/drivers/firmware/tegra/bpmp-private.h
> +++ b/drivers/firmware/tegra/bpmp-private.h
> @@ -66,4 +66,6 @@ static inline bool tegra410_bpmp_mbwt_cmd_is_supported(=
struct tegra_bpmp *bpmp,
>  }
>  #endif
> =20
> +int tegra_bpmp_sysfs_register(struct tegra_bpmp *bpmp);
> +
>  #endif
> diff --git a/drivers/firmware/tegra/bpmp-tegra-sysfs.c b/drivers/firmware=
/tegra/bpmp-tegra-sysfs.c
> new file mode 100644
> index 000000000000..150c189ba8da
> --- /dev/null
> +++ b/drivers/firmware/tegra/bpmp-tegra-sysfs.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, NVIDIA CORPORATION.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/kstrtox.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +
> +#include <soc/tegra/bpmp.h>
> +#include <soc/tegra/bpmp-abi.h>
> +
> +#include "bpmp-private.h"
> +
> +/* Documented sysfs / ABI bounds; firmware may still reject a request. */
> +#define TEGRA_BPMP_MBWT_INSTANCE_MAX	5U
> +#define TEGRA_BPMP_MBWT_VC_MAX		2U
> +#define TEGRA_BPMP_MBWT_BW_MIN		1U
> +#define TEGRA_BPMP_MBWT_BW_MAX		110U
> +
> +struct tegra_bpmp_mbwt_sysfs {
> +	struct device_attribute dev_attr;
> +	struct tegra_bpmp *bpmp;
> +	/* Serializes bandwidth I/O. */
> +	struct mutex lock;
> +};
> +
> +static struct tegra_bpmp_mbwt_sysfs *
> +tegra_bpmp_mbwt_sysfs_from_attr(struct device_attribute *attr)
> +{
> +	return container_of(attr, struct tegra_bpmp_mbwt_sysfs, dev_attr);
> +}
> +
> +static int tegra_bpmp_mbwt_valid_tuple(unsigned int instance,
> +				       unsigned int vc_type,
> +				       unsigned int bandwidth)
> +{
> +	if (instance > TEGRA_BPMP_MBWT_INSTANCE_MAX)
> +		return -EINVAL;
> +	if (vc_type > TEGRA_BPMP_MBWT_VC_MAX)
> +		return -EINVAL;
> +	if (bandwidth < TEGRA_BPMP_MBWT_BW_MIN ||
> +	    bandwidth > TEGRA_BPMP_MBWT_BW_MAX)
> +		return -EINVAL;

These checks (except maybe the bandwidth minimum and maximum) become
completely irrelevant with the new sysfs interface because there's
simply no way to pass invalid values.

> +
> +	return 0;
> +}
> +
> +static int tegra_bpmp_mbwt_parse(const char *buf, size_t count,
> +				 unsigned int *instance,
> +				 unsigned int *vc_type,
> +				 unsigned int *bandwidth)
> +{
> +	unsigned int values[3];
> +	char *copy, *cur, *tok;
> +	unsigned int i =3D 0;
> +	int err =3D 0;
> +
> +	copy =3D kmemdup_nul(buf, count, GFP_KERNEL);
> +	if (!copy)
> +		return -ENOMEM;
> +
> +	cur =3D strim(copy);
> +	while ((tok =3D strsep(&cur, ",")) !=3D NULL) {
> +		if (i >=3D ARRAY_SIZE(values)) {
> +			err =3D -EINVAL;
> +			goto out;
> +		}
> +
> +		tok =3D strim(tok);
> +		if (!*tok) {
> +			err =3D -EINVAL;
> +			goto out;
> +		}
> +
> +		err =3D kstrtou32(tok, 0, &values[i]);
> +		if (err)
> +			goto out;
> +
> +		i++;
> +	}
> +
> +	if (i !=3D ARRAY_SIZE(values)) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	*instance =3D values[0];
> +	*vc_type =3D values[1];
> +	*bandwidth =3D values[2];
> +	err =3D 0;
> +
> +out:
> +	kfree(copy);
> +	return err;
> +}
> +
> +static ssize_t bandwidth_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct tegra_bpmp_mbwt_sysfs *mbwt;
> +	unsigned int instance, vc_type, bandwidth;
> +	ssize_t len =3D 0;
> +	int err;
> +
> +	mbwt =3D tegra_bpmp_mbwt_sysfs_from_attr(attr);
> +
> +	mutex_lock(&mbwt->lock);
> +	for (instance =3D 0; instance <=3D TEGRA_BPMP_MBWT_INSTANCE_MAX; instan=
ce++) {
> +		for (vc_type =3D 0; vc_type <=3D TEGRA_BPMP_MBWT_VC_MAX; vc_type++) {
> +			err =3D tegra410_bpmp_mbwt_get(mbwt->bpmp, instance,
> +						     vc_type, &bandwidth);
> +			if (err) {
> +				mutex_unlock(&mbwt->lock);
> +				return err;
> +			}
> +
> +			len +=3D sysfs_emit_at(buf, len, "%u,%u,%u\n", instance,
> +					     vc_type, bandwidth);
> +		}
> +	}

I suppose there's some benefit in this type of overview to get a quick
look at what's been programmed. We can still add a "summary" type of
file to the top-level that shows this, though I'd go with a slightly
different format, maybe something that mirrors the tree hierarchy of the
attributes.

> +	mutex_unlock(&mbwt->lock);
> +
> +	return len;
> +}
> +
> +static ssize_t bandwidth_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct tegra_bpmp_mbwt_sysfs *mbwt;
> +	unsigned int instance, vc_type, bandwidth;
> +	int err;
> +
> +	err =3D tegra_bpmp_mbwt_parse(buf, count, &instance, &vc_type,
> +				    &bandwidth);
> +	if (err)
> +		return err;
> +
> +	err =3D tegra_bpmp_mbwt_valid_tuple(instance, vc_type, bandwidth);
> +	if (err)
> +		return err;
> +
> +	mbwt =3D tegra_bpmp_mbwt_sysfs_from_attr(attr);
> +
> +	mutex_lock(&mbwt->lock);
> +	err =3D tegra410_bpmp_mbwt_set(mbwt->bpmp, instance, vc_type, bandwidth=
);
> +	mutex_unlock(&mbwt->lock);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static void tegra_bpmp_mbwt_sysfs_teardown(void *data)
> +{
> +	struct tegra_bpmp_mbwt_sysfs *mbwt =3D data;
> +
> +	device_remove_file(mbwt->bpmp->dev, &mbwt->dev_attr);
> +}
> +
> +int tegra_bpmp_sysfs_register(struct tegra_bpmp *bpmp)
> +{
> +	struct tegra_bpmp_mbwt_sysfs *mbwt;
> +	int err;
> +
> +	if (!ACPI_HANDLE(bpmp->dev))
> +		return 0;
> +
> +	if (!tegra_bpmp_mrq_is_supported(bpmp, MRQ_SOCHUB_MBWT))
> +		return 0;
> +
> +	/*
> +	 * MRQ_QUERY_ABI only confirms that the MBWT MRQ is implemented. The
> +	 * firmware reports GET_BW / SET_BW support through the MBWT ABI query.
> +	 */
> +	if (!tegra410_bpmp_mbwt_cmd_is_supported(bpmp, CMD_SOCHUB_MBWT_GET_BW) =
||
> +	    !tegra410_bpmp_mbwt_cmd_is_supported(bpmp, CMD_SOCHUB_MBWT_SET_BW))
> +		return 0;
> +
> +	mbwt =3D devm_kzalloc(bpmp->dev, sizeof(*mbwt), GFP_KERNEL);
> +	if (!mbwt)
> +		return -ENOMEM;
> +
> +	mbwt->bpmp =3D bpmp;
> +	mutex_init(&mbwt->lock);
> +
> +	sysfs_attr_init(&mbwt->dev_attr.attr);
> +	mbwt->dev_attr.attr.name =3D "bandwidth";
> +	mbwt->dev_attr.attr.mode =3D 0644;
> +	mbwt->dev_attr.show =3D bandwidth_show;
> +	mbwt->dev_attr.store =3D bandwidth_store;
> +
> +	err =3D device_create_file(bpmp->dev, &mbwt->dev_attr);
> +	if (err)
> +		return err;
> +
> +	err =3D devm_add_action(bpmp->dev, tegra_bpmp_mbwt_sysfs_teardown, mbwt=
);
> +	if (err) {
> +		device_remove_file(bpmp->dev, &mbwt->dev_attr);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index e9c0d6d3e24d..f637bdaa57cd 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -982,6 +982,12 @@ static int tegra_bpmp_probe(struct platform_device *=
pdev)
>  	if (err < 0)
>  		goto free_mrq;
> =20
> +	err =3D tegra_bpmp_sysfs_register(bpmp);

Maybe stick with the convention set by debugfs and call this
tegra_bpmp_init_sysfs().

> +	if (err < 0)
> +		dev_err(&pdev->dev,
> +			"Failed registering sysfs attribute to the BPMP platform device: %d\n=
",

And similarly for this error message.

Thierry

> +			err);
> +
>  	err =3D tegra_bpmp_init_debugfs(bpmp);
>  	if (err < 0)
>  		dev_err(&pdev->dev, "debugfs initialization failed: %d\n", err);
> --=20
> 2.43.0
>=20

--hc3cetaspwsavdkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpQzYIACgkQ3SOs138+
s6EVZA/9GBabxhWjukDaQ7BMJf4DIOaGZ+KMhZZX9B1n3rp6JFKsVuJhME/W1Lb/
B6lfD1tMrPx96aPw1r6Ewi6zhYppD2my/J4vmC5Mypi806pSDE7OX46UPcDTM1Js
RWvv/KNavySsj6LovSOuSFtgRcV5xDdAfQcBd/6Pxbq3R3t3QVbHN17QcO9Szy1K
L2jPqezxzivhDDE0joEjiWyhneJsyFDiYz9D8XpXeJdV77f6MI8+ERP2ubu0yayA
bcVbK3GRH66uITnJbmWFsK6VnSLrXrxugW5mAg0C4fU2P+XmzXEaQELerp33Nkor
4eEQonMeCEPpQX1mN+/9l8sfjSu83a6WKfFRNyGKQDqCJI8jWbE989cW5TCEgZJo
Em+Waqh49J2UVk8vkC9XxSHlBf2+0LOSbbw7n7D3h6hOYAmEQRR/uNUjeQ06Zl4W
uygF5aj5jDZjdvwZ3A9rbBpdBIfMuVKqyyjrkgq9AaDRXKiN1lRioe9/Its6L64p
IoaxH7sub4uwM9ns/+QR6BpHlbdrEF03nzdngKI7Hlkr8rvBntyNnwXAz68L6+Ex
6GT2z29KYsE1JXInVuvjAniKMSDfs/y8kee76n7wEU8f8EyS2Cct5MOI1iZZzGuv
x2CAzRIJ1Zu0OCYLCKLBsxQ+v6/X0tSNEF1TnTknva44lS2+j8Q=
=yHf3
-----END PGP SIGNATURE-----

--hc3cetaspwsavdkq--

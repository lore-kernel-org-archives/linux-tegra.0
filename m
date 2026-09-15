Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B21370AFB;
	Tue, 15 Sep 2026 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481643; cv=none; b=r4313QIo6GxdwYOm3F/PLhwJlL8BGA3LBkCyHCOAtW5rbCu2OsBHMfnj1XrBj5uiPCX9XAYbKJ3KmOmdUBghHJ061BC52g93MfAKltsG3oWOzR4/McmxNDyydguTo/vbl8Dxyx1A76Cyonhd+bIe6DrryVCS1UlKCzZX3OkRqAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481643; c=relaxed/simple;
	bh=WxKz1XjXKeWWmUOze983N5crkiXjAn33b8I1zUvC4bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRzzziT0uFI8NkYCW+mxVj+1FncgfliUxg0eVTSgPRC4T7cZ+dVFZ4rMvcoDQ3oeaxbaEsZbS+P0i0QZj0QKFdnIpeTGuhR2goGPP0H8Ymp5iakMLbWWFntReXCzcrnSW0PFu6cFJM2qusy3EO+6U6NokBTzX4qLjh4ZCnlId5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aH6JAlZ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aH6JAlZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC0E1F000FF;
	Tue, 15 Sep 2026 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789481640;
	bh=9tuBLot3qHflaL2nXy1mV27KmiWuyFNCp0yLJQbg5Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aH6JAlZ9Y6b7+dWNKrOhciPHDdZkQ6Xe34yt2ZkCifhwZjIMi4jrA/P9g9ZADO3KD
	 qHVI0DrRRoUuhT1YnWg8wl1iWbun2IAUDOptzDhtZH6IsqsuxjF/G9s1EoT9cFdhNy
	 WQExJBKVF6tT7IHTZ2CtpPwWg+232fVIfTIfwG3AhhIAMbcb4VXPHxy5tz3gsWc3x2
	 R0UQ7lI3jO0//+GcPx4PLCs8Zj5sN/DseiyW6uBlk3hn0105uQ7+yl1h2nhpjtuTew
	 LjuVEIOSrdLH40wI90y4TWtmonZnMZwtO24VLHSmNNMpLN5ZIMvhdjXiDm5b33e2M0
	 gAMkTZqMRLw2w==
Date: Tue, 15 Sep 2026 16:13:57 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] firmware: tegra: bpmp: Add MBWT sysfs interface
Message-ID: <aqlSR8I7hJEiKAwI@orome>
References: <20260910085919.2522241-1-anrao@nvidia.com>
 <20260910085919.2522241-6-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywkpvxjezfcsqofj"
Content-Disposition: inline
In-Reply-To: <20260910085919.2522241-6-anrao@nvidia.com>


--ywkpvxjezfcsqofj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 5/5] firmware: tegra: bpmp: Add MBWT sysfs interface
MIME-Version: 1.0

On Thu, Sep 10, 2026 at 08:59:19AM +0000, Aniruddha Rao wrote:
[...]
> diff --git a/drivers/firmware/tegra/bpmp-sysfs.c b/drivers/firmware/tegra/bpmp-sysfs.c
> new file mode 100644
> index 000000000000..f56836fa3314
> --- /dev/null
> +++ b/drivers/firmware/tegra/bpmp-sysfs.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, NVIDIA CORPORATION.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kobject.h>
> +#include <linux/kstrtox.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +
> +#include <soc/tegra/bpmp.h>
> +#include <soc/tegra/bpmp-abi.h>
> +
> +#include "bpmp-private.h"
> +
> +#define TEGRA_BPMP_MBWT_NUM_GROUPS	6
> +#define TEGRA_BPMP_MBWT_NUM_VCS		3
> +
> +struct tegra_bpmp_mbwt_attr {
> +	struct kobj_attribute attr;
> +	struct tegra_bpmp_mbwt_sysfs *mbwt;
> +	unsigned int instance;
> +	unsigned int vc_type;
> +};
> +
> +struct tegra_bpmp_mbwt_sysfs {
> +	struct tegra_bpmp *bpmp;
> +	struct kobject *root;
> +	struct kobject *group[TEGRA_BPMP_MBWT_NUM_GROUPS];
> +	struct kobject *vc[TEGRA_BPMP_MBWT_NUM_GROUPS]
> +			  [TEGRA_BPMP_MBWT_NUM_VCS];
> +	struct tegra_bpmp_mbwt_attr attrs[TEGRA_BPMP_MBWT_NUM_GROUPS]
> +				       [TEGRA_BPMP_MBWT_NUM_VCS];

Should these be dynamically allocated? If there's a remote chance that
we'll see other sets of groups and VCs, this should probably be
parameterized by some SoC-specific data.

Thierry

--ywkpvxjezfcsqofj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqpUqUACgkQ3SOs138+
s6F4rw/+Lx/nzIbwSs4ZLYrBDFbFHhxgRBD3neKXQ4oVTVvQOnZk2RYDvJ8+TYtJ
cqOlYgZIsbQXdMtanZq5b8iV3KCV+oDBisTx4j2WgG7aY/dUqYk/sS3xzqw81z7D
SG+gywJXJQBuMXXhlufDc70F/BU9uYa7I8g4JKZ5BCMBg3V0fhwzOrHWXZ+WfzZx
HpV3eY51gVsidtztE5XjGqFovymul6xB6tHqiMKtzTicKNBZhEJ6uUTMETZ/3GCf
GhD3d+EXy8RpA2vxXfsNBHIGzdCG+mK4Xlqm8EzJuokAT2lxzwriXBaZnnDATIEV
tf1r9ZGEbElYZrPdhGrVDEpACocYbUVmzDgs9Lr/svDBp425W6Z3TEKRjmvxXVV3
SQdJhhQanP25JDe/dWlPN1Q2g4AddeTCy+adDsVuSk8mF0qeVB91TwtecUzQZZ86
UvBlwCpjp9wvb0/8FiYDcx1luAX8ZgbJ+uxiCgWyFTY6NV7iNmh8RemI2Cd7t6nY
ULaJtwO8hGK1LFiCf2n9y+PhNxTTmS7P0zyjlWUaOql/miJyi12IBOfNCCpsBHwa
nCKTHYk69Vr/ao28Lab9Gen8JvYVvNOZgmHcp6UNDHADADBTAxB5CSW2ux0eg6ZC
lcOLNeEYpnw6dRBz9jOB5dxJlZtaFSbH7+cmMujTJB8uBYHzjiE=
=02Qs
-----END PGP SIGNATURE-----

--ywkpvxjezfcsqofj--

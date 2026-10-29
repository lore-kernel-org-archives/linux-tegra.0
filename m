Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793316116;
	b=gNEg6TNGidrmLgZkN5tkSFwsjCTSiSkUI3ww12S4lu6thcK/fZ1zZ4tBB4ebGH7ZNGdP
	 orOa9/Uup9zZ83PjSPynh65m7dsqV8+GRqQLuJ52l9XL5vsx6AQCWh8FofCoJY8+lcci6
	 4a2RmNGD/GzOkknUWyoxKJ4Rc1L5+WtT2yGYZkF2VSwMu25EbA1/4DAX+H4CpqdrTYIYq
	 t7txbDULPKyl8FvCWMbnGKiKrsSsZlNFUc1LjXYUtcSWEI7VN45P4hcP2rbuOQy5bAWPs
	 06Ep9igky1bGfa2WBqDR89rhWjcjHK9w6Osj/hCJDh98ngd3s39Bk1t9VSM5yYoAggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316116;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=N3gRoLc7yvRB1yDkBERo6UVcw5vuu8Tzkngj57Vi0dE=;
	b=T9/qlPhYTcawym2106FmdPAi7FI7cjgJZW0ZqDFJA3ejCaDOiX9vkdhILLuNqLhfHvq4
	 yJIEvbl3rFT82ffrDohKd9ntrYTeM6iT3EZeXYQt1umoyLJw15C5fyHCz30ZBosHTR1sZ
	 rwtwR0uVDnfORQydiDY6lhe/pSLcN2GEFEehtwHrEmdS2xl5ivxvM5yljieqMsuKoI49h
	 KgUDS7T9GD0rOA6HsJdqTpLx2lSabeeY76DhaeEtxMejwG0gZcr+EaZc+shs6FL/xDcSE
	 9D6OVyC9mLXiXC0xhjBTiQb9Ig7h+iQ930NcFzbzDzCfBwisJmH+XWr1hvk6i+mu7Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OeDHMRkV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77795606A332;
	Thu, 29 Oct 2026 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OeDHMRkV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E901F01816;
	Thu, 29 Oct 2026 23:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793316116;
	bh=N3gRoLc7yvRB1yDkBERo6UVcw5vuu8Tzkngj57Vi0dE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OeDHMRkVizcxRN9N3vVP2Rr6664f8SXA17luor+yEvb3CmNZbugi9FU7GDecXQiRf
	 9qaUXqbPJ3rA7Dmadxspz7WfJCXoz4/60BO7EXgYSDQxIBhHhXYQ5VUi95AOqYEMgc
	 yqdS2lhGSX1wbAXHl+O0WkoUVXbCQv4bMGvm+kxdVqANphliT50iJweStI0d/CRJrZ
	 QN25FBK5i87iVpvu6c4F5z09Ci3tnzlpttoRzjueyUii4cjW6YL9AM8ohmw3rtq7Vw
	 AlUGm2eibkPKCAJIpLafywkPbuqkAYFDXz6C/q5YyQv6hxTFx9knt12QlVYMU6YrS+
	 PHxJebv/xBnuQ==
Date: Thu, 29 Oct 2026 23:21:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
	jic23@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	andre.przywara@arm.com, aneesh.kumar@kernel.org,
	Souvik.Chakravarty@arm.com, treding@nvidia.com,
	jonathanh@nvidia.com, bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/2] cache: add SMCCC-backed cache invalidate provider
Message-ID: <20261029-feline-monastery-07bf67308136@spud>
References: <20261021224557.1827361-1-smadhavan@nvidia.com>
 <20261021224557.1827361-3-smadhavan@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fabG0ZF/qX/zSjOV"
Content-Disposition: inline
In-Reply-To: <20261021224557.1827361-3-smadhavan@nvidia.com>

--fabG0ZF/qX/zSjOV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:45:57PM +0000, Srirangan Madhavan wrote:
> Add a cache maintenance provider for the cache clean+invalidate interface
> defined by Arm DEN0028 v1.7.
>=20
> Register the interface attributes function as an SMCCC device and bind the
> provider through the SMCCC bus. The provider reads the firmware attributes
> during probe and serializes cache maintenance calls. It handles transient
> BUSY and RATE_LIMITED responses with bounded retries. It also registers
> with the generic cache coherency framework used by memregion callers.
>=20
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

I acked this on v3, but I don't see it here or a reason for why it
isn't. Ultimately, you're only harming yourself but still.


Unless the arm64 guys pipe up and expect me to take this,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
because it's so tied to arm architectural stuff.

Cheers,
Conor.


> ---
>  drivers/cache/Kconfig           |  11 +++
>  drivers/cache/Makefile          |   2 +
>  drivers/cache/arm_smccc_cache.c | 156 ++++++++++++++++++++++++++++++++
>  drivers/firmware/smccc/smccc.c  |   5 +
>  4 files changed, 174 insertions(+)
>  create mode 100644 drivers/cache/arm_smccc_cache.c
>=20
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 1518449d47b5..57fd1823dec5 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -42,6 +42,17 @@ menuconfig CACHEMAINT_FOR_HOTPLUG
> =20
>  if CACHEMAINT_FOR_HOTPLUG
> =20
> +config ARM_SMCCC_CACHE
> +	bool "Arm SMCCC cache maintenance provider"
> +	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
> +	help
> +	  Enable support for the Arm SMCCC cache clean+invalidate
> +	  interface as a provider for memory hotplug-like cache
> +	  maintenance operations.
> +	  The provider registers only when firmware advertises the
> +	  SMCCC calls and attributes, so systems without firmware support
> +	  continue without this registered provider.
> +
>  config HISI_SOC_HHA
>  	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
>  	depends on (ARM64 && ACPI) || COMPILE_TEST
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index b3362b15d6c1..55736a032d6f 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -4,4 +4,6 @@ obj-$(CONFIG_AX45MP_L2_CACHE)		+=3D ax45mp_cache.o
>  obj-$(CONFIG_SIFIVE_CCACHE)		+=3D sifive_ccache.o
>  obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+=3D starfive_starlink_cache.o
> =20
> +# Providers below depend on CACHEMAINT_FOR_HOTPLUG.
> +obj-$(CONFIG_ARM_SMCCC_CACHE)		+=3D arm_smccc_cache.o
>  obj-$(CONFIG_HISI_SOC_HHA)		+=3D hisi_soc_hha.o
> diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_ca=
che.c
> new file mode 100644
> index 000000000000..abe6881f3de3
> --- /dev/null
> +++ b/drivers/cache/arm_smccc_cache.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 NVIDIA Corporation
> + *
> + * Arm SMCCC cache maintenance provider using the cache clean+invalidate
> + * interface defined by Arm DEN0028 v1.7.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/arm-smccc-bus.h>
> +#include <linux/cache_coherency.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/math.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nmi.h>
> +#include <linux/time64.h>
> +#include <linux/types.h>
> +
> +#define SMCCC_CACHE_MAX_RETRIES		5
> +#define SMCCC_CACHE_DEFAULT_DELAY_US	1000UL
> +#define SMCCC_CACHE_MAX_DELAY_US	20000UL
> +
> +struct smccc_cache {
> +	/* Must be first member */
> +	struct cache_coherency_ops_inst cci;
> +	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
> +	u64 rate_limit;
> +};
> +
> +static int smccc_cache_status_to_errno(s32 status)
> +{
> +	switch (status) {
> +	case SMCCC_RET_SUCCESS:
> +		return 0;
> +	case SMCCC_RET_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case SMCCC_RET_INVALID_PARAMETER:
> +		return -EINVAL;
> +	case SMCCC_RET_RATE_LIMITED:
> +		return -EAGAIN;
> +	case SMCCC_RET_BUSY:
> +		return -EBUSY;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +static unsigned long smccc_cache_delay_us(const struct smccc_cache *cach=
e)
> +{
> +	unsigned long delay_us =3D 0;
> +
> +	if (cache->rate_limit)
> +		delay_us =3D DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
> +
> +	/*
> +	 * Firmware may not advertise a rate limit; use a small bounded backoff
> +	 * instead of retrying in a tight loop.
> +	 */
> +	if (!delay_us)
> +		delay_us =3D SMCCC_CACHE_DEFAULT_DELAY_US;
> +
> +	return min(delay_us, SMCCC_CACHE_MAX_DELAY_US);
> +}
> +
> +static int smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
> +			     struct cc_inval_params *invp)
> +{
> +	struct smccc_cache *cache =3D container_of(cci, struct smccc_cache, cci=
);
> +	unsigned long delay_us =3D smccc_cache_delay_us(cache);
> +	struct arm_smccc_res res =3D {};
> +	int ret;
> +
> +	if (!invp->size)
> +		return -EINVAL;
> +
> +	/*
> +	 * Serialize the full retry sequence. With the default bounds, a caller
> +	 * may hold the mutex across up to five 20ms backoff sleeps.
> +	 */
> +	guard(mutex)(&cache->lock);
> +
> +	for (unsigned int i =3D 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
> +		/* Long firmware operations can trigger watchdog checks. */
> +		touch_nmi_watchdog();
> +
> +		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
> +				     invp->addr, invp->size, 0UL, &res);
> +
> +		ret =3D smccc_cache_status_to_errno((s32)res.a0);
> +		if (!ret)
> +			return 0;
> +
> +		if (ret !=3D -EBUSY && ret !=3D -EAGAIN)
> +			return ret;
> +
> +		fsleep(delay_us);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct cache_coherency_ops smccc_cache_ops =3D {
> +	.wbinv =3D smccc_cache_wbinv,
> +};
> +
> +static int smccc_cache_probe(struct arm_smccc_device *sdev)
> +{
> +	struct arm_smccc_res res =3D {};
> +	struct smccc_cache *cache;
> +	int ret;
> +
> +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
> +			     &res);
> +	if ((s32)res.a0)
> +		return -ENODEV;
> +
> +	cache =3D cache_coherency_ops_instance_alloc(&smccc_cache_ops,
> +						   struct smccc_cache, cci);
> +	if (!cache)
> +		return -ENOMEM;
> +
> +	mutex_init(&cache->lock);
> +	cache->rate_limit =3D res.a3;
> +
> +	ret =3D cache_coherency_ops_instance_register(&cache->cci);
> +	if (ret) {
> +		mutex_destroy(&cache->lock);
> +		cache_coherency_ops_instance_put(&cache->cci);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct arm_smccc_device_id smccc_cache_id_table[] =3D {
> +	{ .func_id =3D ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(arm_smccc, smccc_cache_id_table);
> +
> +static struct arm_smccc_driver smccc_cache_driver =3D {
> +	.name =3D KBUILD_MODNAME,
> +	.probe =3D smccc_cache_probe,
> +	.id_table =3D smccc_cache_id_table,
> +};
> +module_arm_smccc_driver(smccc_cache_driver);
> +
> +MODULE_IMPORT_NS("CACHE_COHERENCY");
> +MODULE_AUTHOR("Srirangan Madhavan");
> +MODULE_DESCRIPTION("Arm SMCCC cache maintenance provider");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smcc=
c.c
> index 5dc768ac4143..5a5d50d17410 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -100,6 +100,11 @@ static const struct smccc_device_info smccc_devices[=
] __initconst =3D {
>  		.requires_smc   =3D true,
>  		.device_name    =3D "arm-rsi",
>  	},
> +	{
> +		.func_id        =3D ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
> +		.requires_smc   =3D false,
> +		.device_name    =3D "arm-smccc-cache",
> +	},
>  };
> =20
>  static bool __init smccc_probe_smccc_device(const struct smccc_device_in=
fo *smccc_dev)
> --=20
> 2.43.0
>=20

--fabG0ZF/qX/zSjOV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauPVDgAKCRB4tDGHoIJi
0mfRAQCmWplBj+uJLhevvjcZpPZZVUEo3u8T6l+XEmAL47JPcgD/XT0XcZ3HQlZt
DKZLu6y2ey7JrDaZXiFf98GZrWyYggk=
=Sesk
-----END PGP SIGNATURE-----

--fabG0ZF/qX/zSjOV--

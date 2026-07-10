Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB749282F06
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678795; cv=none; b=c15tKFqLq8LUKOBmiztgybtQerJ8UyFJ0h1aGFeJa4ucF++qD44a2B17+6IEsVqRiitq06EtBQAItn1jwdPtN+YOtM+VcMlsNX5Pjt/0w7Pn3oJDlQVKdd03YQjZAIqJflbEnFBjSHb9pF4UYnZq7hlSmtcJq9GSNbEZihmXYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678795; c=relaxed/simple;
	bh=q9Hy2TgH3madf8IC3T2QwU/u5k6WUON3nq/qIY91qDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpdQR7+KIJudR6IiwWHhLPJcPKRvBsuc9pdpLqzgfi2/4RDGf281UDULSGiCGpwl0pCfzGi0+phyDDmTV+H605WVMdQSGP/3N1vOryr+us3BcXIyVy1SxzCepwLoEFJZQ3B15PeodNnEO78wLrYtB64rO3TjzNTLscGk0vk+Jbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gACUj3at; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gACUj3at"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15c7c07a57so113850466b.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678792; x=1784283592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAkOkuickC1FfxJI2jEJ+KCNfYVzR0zR1QQfc0v2ndw=;
        b=gACUj3at1FZBP0rFZjwUCxqCMSKZ7deHmvMpoyqsyI8qH8QtNMACUrEVFoNPcaMa+X
         YtCcvsdoq2QeAHbK8BtiTZ6togJIBc639tnv7gMEmYHnmPkayd1owo7TVfq21qm8DtIi
         COcCtuBOo3hBoV+ULZXyFglwS3Ht/GvXjvAPpm9fgd2kjiMS+oXUzBqyhMunha4cZixK
         K6x68y5cYSx+lQP85oW2TPED2/n5UGsYUrAO/SsodoDPc5yPiVC+1nQTsXIlubuDXLkH
         1lw/Mtv4lKmhVymPh5hGHCP8xEk0pYmRrweZstM9IGMKlOmDjDbmJ7Eo1XEAoP6qcZC6
         Xd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678792; x=1784283592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAkOkuickC1FfxJI2jEJ+KCNfYVzR0zR1QQfc0v2ndw=;
        b=a9mT8Ushfx4el6c0hmxBOSGNxPyz3FOgUfMhY3uihhGU/0h7ZXzLGei8HzK8w0ocz2
         p87rHjvd1saYXL5McBKekI7dmfQEJGROAyRKfMlSJ5yqaL1BC8A446unCZNTXdz00O/D
         F3zeS+apY8k/DX1YBVPBR3P5m5cILt1YssbXC8WtAU8RNL3I8qQKOBalwYzvzWW+HO2V
         auqWDUP8DjHiMifAfbJV5wITmzX/u1rRY/NH0tbw0K3/ApqCO4hDnE6W05BrTLt3RgS9
         sQvJ9XooCZe5Fu6cRfDJiYxAkNEIaYqMHaQYzJ6lLxNnvA52EYZP0qyLjFb7q2a3bCj4
         OaCg==
X-Forwarded-Encrypted: i=1; AHgh+Rrm/l76L/3dqbEOG1agC73y1DplHAKOLqVjD/7An38H5VUIGs/U9GvmGajSXpQoAjvDf05KzWsTOgyb6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqBL9Gc2RYFkhX4uMh2KmadpnXAGbjLYIt6Lx4tS0htq1ZrLo4
	zpfiNRVKaXJpNZWKUho8VVC3yQV5fh7lv3WBTfTcpVOwa6l3Ogmie0Oc
X-Gm-Gg: AfdE7ckjIvHymBmkYgVKqoRHG0fq/kYAOveb2JSAFylnkLOBYEGf3QRCDvkzMXEDi3z
	uKeU+o0CNGkCGBEcj664lmTjIUXSaxceVt0u1lie+LxUg7378vzc0g1aj7VaGIIaDHpcskZ9FEc
	s89kAQdspMvDFpmDegoxf9G4RLdRpCMImQAtX9jGAN5T93SD9pCSZA3t/AcKFvrqclxpMQJ8EfH
	SZ9APaGuP1OKzPXd47YEzgwl0eomfZqBBkDBY9WmaxBpbCNKdiRoRrS7H4tHZsXE8WuAnjaxFQc
	JoBhJSTsmJuiqRb6cCYQXNz6kSuaqQ8ftxezNmIIdwbNMwHqWsWlGIAOacnWEMU9/nc1VWaFt52
	CLIYrthEU/5YpVq7LRa17hPfy74aeZCELLcs0rh0iiAak2Rf02dsvlDzK2K1KdgJJkxqLPuttwn
	xyrMjbEQMoENSuV2mAMFcP1o3Zu910ZFa2gev9NRe4eb8gsTCy9zvFTWz8FS5Zb3mNc+43U5TDS
	EI=
X-Received: by 2002:a17:907:e155:b0:c12:e23d:ba18 with SMTP id a640c23a62f3a-c15ce0712a3mr271790166b.7.1783678792019;
        Fri, 10 Jul 2026 03:19:52 -0700 (PDT)
Received: from orome (p200300e41f023e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f02:3e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15eb1dbdc9sm209356766b.10.2026.07.10.03.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:19:50 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:19:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] firmware: tegra: bpmp: Add Tegra410 MBWT BPMP helpers
Message-ID: <alDGXqtZfA_6O_6d@orome>
References: <20260615083731.888055-1-anrao@nvidia.com>
 <20260615083731.888055-6-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rkg4gljm4yzozdsk"
Content-Disposition: inline
In-Reply-To: <20260615083731.888055-6-anrao@nvidia.com>


--rkg4gljm4yzozdsk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/6] firmware: tegra: bpmp: Add Tegra410 MBWT BPMP helpers
MIME-Version: 1.0

On Mon, Jun 15, 2026 at 08:37:30AM +0000, Aniruddha Rao wrote:
> Add helper functions that send MBWT requests to BPMP firmware on
> Tegra410.
>=20
> The helpers implement the GET_BW and SET_BW operations and provide a
> QUERY_ABI-based probe for command availability.

I'd rather not make this Tegra410 specific. We might need it on future
chips, too.

In fact, given the size, I'd be inclined to just include this
unconditionally in the BPMP driver.

> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
> ---
>  drivers/firmware/tegra/Makefile        |   1 +
>  drivers/firmware/tegra/bpmp-private.h  |  31 +++++++
>  drivers/firmware/tegra/bpmp-tegra410.c | 108 +++++++++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 drivers/firmware/tegra/bpmp-tegra410.c
>=20
> diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Mak=
efile
> index 41e2e4dc31d6..4310cc0ff294 100644
> --- a/drivers/firmware/tegra/Makefile
> +++ b/drivers/firmware/tegra/Makefile
> @@ -4,6 +4,7 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+=3D bpmp-tegra21=
0.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+=3D bpmp-tegra186.o
> +tegra-bpmp-$(CONFIG_ARCH_TEGRA_410_SOC)	+=3D bpmp-tegra410.o

Just make this bpmp-mbwt.o or maybe even stick it into bpmp.c. It's
barely 100 lines of proper code.

>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_DEBUG_FS)	+=3D bpmp-debugfs.o
>  obj-$(CONFIG_TEGRA_BPMP)	+=3D tegra-bpmp.o
> diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/teg=
ra/bpmp-private.h
> index ebde0e36ae20..c3f466ae5979 100644
> --- a/drivers/firmware/tegra/bpmp-private.h
> +++ b/drivers/firmware/tegra/bpmp-private.h
> @@ -35,4 +35,35 @@ struct tegra_bpmp_acpi_message {
>  	u8 data[TEGRA_BPMP_ACPI_BMRQ_DATA_SZ];
>  };
> =20
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_410_SOC)
> +int tegra410_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instanc=
e,
> +			   unsigned int vc_type, unsigned int bandwidth);
> +int tegra410_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsigned int instanc=
e,
> +			   unsigned int vc_type, unsigned int *bandwidth_out);
> +bool tegra410_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
> +					 unsigned int cmd_code);
> +#else
> +static inline int tegra410_bpmp_mbwt_set(struct tegra_bpmp *bpmp,
> +					 unsigned int instance,
> +					 unsigned int vc_type,
> +					 unsigned int bandwidth)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int tegra410_bpmp_mbwt_get(struct tegra_bpmp *bpmp,
> +					 unsigned int instance,
> +					 unsigned int vc_type,
> +					 unsigned int *bandwidth_out)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline bool tegra410_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp=
 *bpmp,
> +						       unsigned int cmd_code)
> +{
> +	return false;
> +}
> +#endif

We can then drop the 410 from the prefix and get rid of the dummy
implementations.

Thierry

> +
>  #endif
> diff --git a/drivers/firmware/tegra/bpmp-tegra410.c b/drivers/firmware/te=
gra/bpmp-tegra410.c
> new file mode 100644
> index 000000000000..87c5dfab864b
> --- /dev/null
> +++ b/drivers/firmware/tegra/bpmp-tegra410.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, NVIDIA CORPORATION.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +
> +#include <soc/tegra/bpmp.h>
> +#include <soc/tegra/bpmp-abi.h>
> +
> +#include "bpmp-private.h"
> +
> +bool tegra410_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
> +					 unsigned int cmd_code)
> +{
> +	struct mrq_sochub_mbwt_request request;
> +	struct tegra_bpmp_message msg;
> +	int err;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.cmd =3D CMD_SOCHUB_MBWT_QUERY_ABI;
> +	request.query_abi.cmd_code =3D cmd_code;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.mrq =3D MRQ_SOCHUB_MBWT;
> +	msg.tx.data =3D &request;
> +	msg.tx.size =3D sizeof(request);
> +
> +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> +	if (err || msg.rx.ret)
> +		return false;
> +
> +	return true;
> +}
> +
> +int tegra410_bpmp_mbwt_set(struct tegra_bpmp *bpmp,
> +			   unsigned int instance,
> +			   unsigned int vc_type,
> +			   unsigned int bandwidth)
> +{
> +	struct mrq_sochub_mbwt_request request;
> +	struct tegra_bpmp_message msg;
> +	int err;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.cmd =3D CMD_SOCHUB_MBWT_SET_BW;
> +	request.set_bw.instance =3D instance;
> +	request.set_bw.vc_type =3D vc_type;
> +	request.set_bw.bw =3D bandwidth;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.mrq =3D MRQ_SOCHUB_MBWT;
> +	msg.tx.data =3D &request;
> +	msg.tx.size =3D sizeof(request);
> +
> +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> +
> +	if (err) {
> +		dev_err(bpmp->dev, "MBWT set bandwidth transfer failed: %d\n", err);
> +		return err;
> +	}
> +	if (msg.rx.ret < 0)
> +		return msg.rx.ret;
> +
> +	return 0;
> +}
> +
> +int tegra410_bpmp_mbwt_get(struct tegra_bpmp *bpmp,
> +			   unsigned int instance,
> +			   unsigned int vc_type,
> +			   unsigned int *bandwidth_out)
> +{
> +	struct mrq_sochub_mbwt_request request;
> +	struct mrq_sochub_mbwt_response response;
> +	struct tegra_bpmp_message msg;
> +	int err;
> +
> +	if (!bandwidth_out)
> +		return -EINVAL;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.cmd =3D CMD_SOCHUB_MBWT_GET_BW;
> +	request.get_bw.instance =3D instance;
> +	request.get_bw.vc_type =3D vc_type;
> +
> +	memset(&response, 0, sizeof(response));
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.mrq =3D MRQ_SOCHUB_MBWT;
> +	msg.tx.data =3D &request;
> +	msg.tx.size =3D sizeof(request);
> +	msg.rx.data =3D &response;
> +	msg.rx.size =3D sizeof(response);
> +
> +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> +	if (err) {
> +		dev_err(bpmp->dev, "MBWT get bandwidth transfer failed: %d\n", err);
> +		return err;
> +	}
> +	if (msg.rx.ret < 0)
> +		return msg.rx.ret;
> +
> +	*bandwidth_out =3D response.get_bw.bw;
> +
> +	return 0;
> +}
> --=20
> 2.43.0
>=20

--rkg4gljm4yzozdsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpQx0QACgkQ3SOs138+
s6EgYg//YjjYlIYnW//gJAzkDSqfZOgdU5gMlmSCQ8VbWhtX9PjB28FYfBJKOvkQ
+b1twd9BIaAYqSBdWIoVIb/4T9Rty74OFaefAqd/m2AIJ+5OdjhOEIB5R6lYtGxK
oOv0myFIq8kKfnA9PllPx0TfZyV1DPNEpA47v8EAxbI4W5KAU7tuOmXZpVshWZLJ
hTU8HeLImDA3HDNTzWCOfXnPZK1y7FRJeFQ2ZWVrIR95z+y2jzZxElHwKlFuxKxn
Xgb4ccAL2v5hcmQozEzDXD5pDK1q2DzHffdyftleIsF7svG560JRx6cE7XnW13JW
RxhD7TvgYEo3vbrbY23SpnzyHHOAsJPoQc0vXBfUfAEMlcxf8d2Aj0PmH3VD1RZi
38lE5XhbaNmFWgv/h9IPMDQwt7k7xWAX+MdmmNvtQYl2jRk87yZCD001Ks+QlFv5
IuU93+FjEZADRjrIemNVlyOjpIFWOwXdmn/E/VZXz68T+Dd8RDIAEXCwHKhavMlf
BFfAG5+j5fzOMZMSVtfO7j0jCm2wLidz8XBzceXCDkqakqoStw/S5yHVM2uCiZg1
olQn/uG6h2xoOGQwgm+hV48GnOfZ0obEOGLUXAztpKDxw2I1agrqdYf84Tvjek9/
FJmP1nC8K750/benCtKt44bU0ujQqzXgxhHd/n+z9xaX+sJiyQg=
=t8wh
-----END PGP SIGNATURE-----

--rkg4gljm4yzozdsk--

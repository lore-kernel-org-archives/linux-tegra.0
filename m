From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: thermal: tegra: add thermtrip function
Date: Wed, 6 Apr 2016 17:01:25 +0800
Message-ID: <5704D065.4050507@nvidia.com>
References: <20160402055045.GA23902@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160402055045.GA23902@mwanda>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thanks for your check, I will send out patch to fix it.

Thanks.
Wei.


On 2016=E5=B9=B404=E6=9C=8802=E6=97=A5 13:50, Dan Carpenter wrote:
> Hello Wei Ni,
>=20
> This is a semi-automatic email about new static checker warnings.
>=20
> The patch ee6d79f202a4: "thermal: tegra: add thermtrip function" from=
=20
> Mar 29, 2016, leads to the following Smatch complaint:
>=20
> drivers/thermal/tegra/soctherm.c:226 thermtrip_program()
> 	 warn: variable dereferenced before check 'dev' (see line 222)
>=20
> drivers/thermal/tegra/soctherm.c
>    221	{
>    222		struct tegra_soctherm *ts =3D dev_get_drvdata(dev);
>                                             ^^^^^^^^^^^^^^^^^^^
> Dereference inside function.
>=20
>    223		int temp;
>    224		u32 r;
>    225=09
>    226		if (!dev || !sg)
>                     ^^^^
> Too late.
>=20
>    227			return -EINVAL;
>    228=09
>=20
> regards,
> dan carpenter
>=20

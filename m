From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
Date: Tue, 10 Jul 2012 14:44:36 +0100
Message-ID: <20120710134436.GD9409@opensource.wolfsonmicro.com>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org>
 <4FE80413.6070001@nvidia.com>
 <4FE87FE3.1080608@wwwdotorg.org>
 <4FE882A5.3080504@nvidia.com>
 <20120625222646.GB30406@opensource.wolfsonmicro.com>
 <4FE8EFC4.3090509@wwwdotorg.org>
 <4FFC190A.2040800@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FFC190A.2040800-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 10, 2012 at 05:29:06PM +0530, Laxman Dewangan wrote:

> Looked tps6586x-regulator driver and it has the platform data which
> is regulator_init_data.
> So for adding the vin-supply similar to what we have in fixed or
> tps6591x regulator to pass through the desc.supply_name, we are not
> having option here in platform data which can work for DT and non-DT
> case.

> So if still want to have the DT and non-DT case similar, we can add
> one tps6586x_regulator_platform_data as

The supply names are not supposed to be conditional (I realise they are
for your current DT patch, I let that in because I just want to see an
end to all this DT stuff).

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP/DG+AAoJEBus8iNuMP3d6fQP/1fFo9pDWssu3fhwhvtjyNBL
rX7gnVwaYSOmvWP8ZJvYvqgcJLIeTepQn5BU7WJfm8bE/OIZSSbRHPd6+NpyIdPu
VaEPdCRSWcif9TEgI+Oin8Mn/0TyMs/nsQtYflmAsPONRBJ1RtY7Mrodblyjaz6p
xvuDYfZQv6EKXyO7LFNtBvjRKQHJfwuBqkuFzcWdyxFlLE8ZG7hiy166IWxpLNr8
tdSPjk4Ho4STHp+DOsx37csXUzvcQmWnfRkfM24T20SxOQSlQJh2y8/Ayj3KdZv8
29/2jYE9C45oyoKXHXHXh0ISXFIvzpKUP9H+wdiR/pjFzdCt25J9ib0VfMQC4pDa
PH+kE78v1cri3OjWa2YYZhZL/eTkVCLHL8JNAgEkM3HwuhQrPQp49DdmHr4FGSdt
BT3LnEvOhhG/OIOVzlccL50MtD5ZmWzb968yXoIQ13+dGI7ndLTbl75m4jiGmCwk
VhxZA8td2DovrrBiAKS1dzym/NsFa3WwsP+JwxABELUwBPR3Ivze31q+YwHHnE8M
OBNadmdsTRc1WeNbTz58o/4hr4BaY1nYo1LJOhcUWAZs8+yY0DUS0HLdIGkOkZs/
0iE+bLB7pnEnDr5oCmKO/O/JQJZBv6TeA6g7VfUSAfkdiz9w8XsEiWgUKXFK5JpP
P/E1Zkdj9lTAiJNyIUG4
=Qv9e
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--

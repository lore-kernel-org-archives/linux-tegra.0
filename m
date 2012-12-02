From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH -next] drm: tegra: fix missing unlock on error
Date: Sun, 2 Dec 2012 22:12:14 +0100
Message-ID: <20121202211214.GA22265@avionic-0098.adnet.avionic-design.de>
References: <CAPgLHd-UekVrvc8gwNUFaoNtcFcZCNC559GW1wfrmUVHidsiOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd-UekVrvc8gwNUFaoNtcFcZCNC559GW1wfrmUVHidsiOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 02, 2012 at 05:25:05AM -0500, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>=20
> Add the missing unlock before return from function host1x_drm_init()
> and host1x_drm_exit() in the error handling case.
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/host1x.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/host1x.c b/drivers/gpu/drm/tegra/host1=
x.c
> index bdb97a5..39629e6 100644
> --- a/drivers/gpu/drm/tegra/host1x.c
> +++ b/drivers/gpu/drm/tegra/host1x.c
> @@ -176,6 +176,7 @@ int host1x_drm_init(struct host1x *host1x, struct drm=
_device *drm)
>  				dev_err(host1x->dev,
>  					"DRM setup failed for %s: %d\n",
>  					dev_name(client->dev), err);
> +				mutex_unlock(&host1x->clients_lock);
>  				return err;
>  			}
>  		}
> @@ -203,6 +204,7 @@ int host1x_drm_exit(struct host1x *host1x)
>  				dev_err(host1x->dev,
>  					"DRM cleanup failed for %s: %d\n",
>  					dev_name(client->dev), err);
> +				mutex_unlock(&host1x->clients_lock);
>  				return err;
>  			}
>  		}

Acked-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQu8QuAAoJEN0jrNd/PrOhABMQAMKm1sXd34ABe3h4U7ON3q0o
onRSzvTFjjoFdJD3vV/ZNEOiHyCtuNzKVo2P2/HfzohEkUpE4UiCvg6luuuo0Tc1
RA58dfotVXo9oqn841sLEt9GGb550vRNkSoCHL4A6NhI3MmjiDELaH0mjGVMW9DK
EJPP9WvvPJWkpEmWccAN8XvNlb9d85hVyqlJ1ycCWZ3ku+olsqqk3Dqke5N9KO+1
w5NhujuwZM55vl9NYHn2njX92mzFtBPedZuTL6Utcv+2XXOYfxbZryDAdBt3KAfe
BpGM91KVhbuT7oYFJrinfKbwjFRWt0WWiheTTk2duSRQULig8TKQEYz7tMwNYsXT
NXcPrCLUlm2c7v81ElJQXXlYx1snWerCX1n+FKaqX+siojAPafM8mE0SjZPrmTbp
DsQVEv9aLPRzc84sxEf+iys7PE7lY9cH85S9bmsOGG6I9ceKTbKZ5iORdjNCbsO7
gUJCho3D2whq8MLV4WgyFPLmI8SUzq8+A2ZuGIoQKaB2j540wa5vDvSw1XyEu7Eo
boDlDRKUw73dZX7m3ATCbJzc3o1MMKHSQ5zLy6j19VrSlE9ZIByF8Tj+4towsOXr
V34/r2Kl8ZJWUsbUbFm8cLiWEcchEl8+eYMiX8V4xtM+Sxy74CrmtWByszkwlANy
1TrYnBvSlMt0hJAGTZS0
=BMKg
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] i2c: tegra: Remove suspension check
Date: Thu, 17 Jul 2014 16:59:59 +0200
Message-ID: <20140717145958.GA32534@ulmo>
References: <1405608520-5644-1-git-send-email-hechtb@gmail.com>
 <1405608520-5644-5-git-send-email-hechtb@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405608520-5644-5-git-send-email-hechtb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bastian Hecht <hechtb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-SH <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomoya MORINAGA <tomoya.rohm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "open list:TEGRA ARCHITECTUR..." <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 04:48:40PM +0200, Bastian Hecht wrote:
[...]
>  #ifdef CONFIG_PM_SLEEP
> -static int tegra_i2c_suspend(struct device *dev)
> -{
> -	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> -
> -	i2c_lock_adapter(&i2c_dev->adapter);
> -	i2c_dev->is_suspended =3D true;
> -	i2c_unlock_adapter(&i2c_dev->adapter);
> -
> -	return 0;
> -}
> -
>  static int tegra_i2c_resume(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> @@ -842,14 +827,12 @@ static int tegra_i2c_resume(struct device *dev)
>  		return ret;
>  	}
> =20
> -	i2c_dev->is_suspended =3D false;
> -
>  	i2c_unlock_adapter(&i2c_dev->adapter);
> =20
>  	return 0;
>  }
> =20
> -static SIMPLE_DEV_PM_OPS(tegra_i2c_pm, tegra_i2c_suspend, tegra_i2c_resu=
me);
> +static SIMPLE_DEV_PM_OPS(tegra_i2c_pm, tegra_i2c_resume);

Shouldn't this be:

	static SIMPLE_DEV_OPS(tegra_i2c_pm, NULL, tegra_i2c_resume);

instead?

Thierry

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTx+TuAAoJEN0jrNd/PrOhaWwP/AgRxS2d+EecHKjm411ljsiD
JwHW+gL42M9tkTIZPTPA1KgiQr+DSAXTBh6Zke621iUDkbMzFsUv4wYYP8tZLXC4
iEL2GaVX1bry8PhwFBe89660oSgnqjpugeM1X7hvXly+Hl89p79JqOkQvdBqa7RO
yYPQufIyPhkJzUCu1swiGhoMJGcDjsQAu1ujzSnYhDZNRNf+Bj2Z5mKar4aQy0B6
Y444hBKUZ6zRrnpD/URLBI2963CArwEVBvmO+Pk5xAcWqFYVKjAL1Ot0gUI0tPm1
5RpkZ0mwAMajGbVZAIm8xN5CjP3Ed/MPvACH77dU/PHPxULF7A5Clq3Ev2A3AOnK
yvy9fpkiSgaXBXVppxjfmMYNz1NzwdbHmTLNq9RWe9aEslHDod2/inBbsUA3kDMY
9eTVogq27RGgZL9jmtj0FqKp81UQ7up4kRMVmco9XC5245jivBhwhRdgbDGT9LNl
SwVh4W/zowGhz432X5uP5llujBgXVFuis9NUcYFYPy6Uw6LXAydEEQKGtlD2UamU
sOw6J8+9bSfdwoJLoh+GaH9CGuVIGd7PUMSlxauke+hHHSwBU5BISVNr877XZouD
5f8Qeb2+LRBcxSZigI7FSOZDfZoXIdUURHaPSDDTQEystMCqEE4/4aRNttaH/Mj3
aVAn/fZc2RN2hYaJt/pr
=Vn9M
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--

From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v8 1/3] i2c: tegra: use readx_poll_timeout after
 config_load reg programmed
Date: Sun, 19 Jun 2016 19:21:37 +0200
Message-ID: <20160619172136.GE2933@tetsubishi>
References: <1464356224-10339-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464356224-10339-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		err = readx_poll_timeout(readl, i2c_dev->base + reg_offset,
> +					 val, val == 0, 1000,
> +					 I2C_CONFIG_LOAD_TIMEOUT);

Any reason we can't use readl_poll_timeout() here?


--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXZtSgAAoJEBQN5MwUoCm2n+cP/1qVfJnVtBlrikKTTSWbd2Qk
/86t9xtiyIxtl2rX8aTY9Ecgb1zZFg7RMfsaiKcIGjDlHlnm/AMWvgOwjME+MjT4
vCBRVGjRVR1elOvN+szrWQ6PTSP5osG1SMkM/EGMMozxvo8SferUcd8l4gSOIKKJ
fo+H+3EdlYh8HNhvV2nOMKqaAnlbLDsi3Uae3EP72dyprL0wvF7sTOQTCZ3j0J4x
MzbLVxqJ/Pf9aVawelH1ciqs2DHO3HMmoS/s6sTYit4/3TTKoVAXxs0h56+ZYLLd
4xBru5+/oeMjVF6c/lz/UvNJWQMQZEXrAZja1ByOLEv/NypkZgUoSKoLdcftj+pw
JKcYWAE7AfhwoJ0d6/trj5szwLGYeavHdTBz1Mro6G7porAbTtU2qm17xKa0aHDi
ApP3I23BiepnTOIkPa155OtiYM828lKsJTpQSzK/hBy2Gj4l8JOnDkUD1kpL/TH7
GjqFtb8JjzeqLdqNcnSngP3UuZrbpA5KIS7AgxV8ONy4qfYBpxQeWk2QpeFsTht8
TGYvL8h0M3tTPQ7DOD1RT1BPEtfEfgL0NiU9doG5kfMGcJ5QX+nZINmByjgEvoy8
Mecqfk5YaSho8vwKkMkmdRyElfWLDaQDxmTfZnEKV6cWmRgk+DWE6mdyHGWbtKhq
h4RsoOtcx/xsMQTMJSKI
=bF6q
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--

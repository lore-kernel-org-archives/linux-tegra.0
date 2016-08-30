From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v10 3/4] i2c: tegra: use atomic poll function during
 configuration
Date: Tue, 30 Aug 2016 22:30:40 +0200
Message-ID: <20160830203039.GB3645@katana>
References: <1472584279-19924-1-git-send-email-smohammed@nvidia.com>
 <1472584279-19924-3-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472584279-19924-3-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 12:41:18AM +0530, Shardar Shariff Md wrote:
> Use readl_poll_timeout_atomic() function as *wait_for_config_load()
> function can be called from atomic context.
>=20
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

    CHECKPATCH
ERROR: do not use in_atomic in drivers
#23: FILE: drivers/i2c/busses/i2c-tegra.c:460:
+		if (in_atomic() || irqs_disabled())


--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxezvAAoJEBQN5MwUoCm29+oQAIo5eAg1PXKJ84sy/SkvQ6N8
lO5KrRcbP1WdiTGo138wJB+w2eOvovEY77nqDudoZGlfulRH82agh6JsKxOhLYsO
WgEE48WS40ihF+E4nLbSXZTTVDxKoymDcStwG7Jt3C9JisROJU6bViN5juFmDXq3
qjBDiWoF7piH6wtSVhG1bjB+ZuJ6oO+jJDXLFMcaWt6jqqHOoAW68cNATCMykt08
8GXJ7QFfsRkt8KKeIZplCRftBTslvJi5R1atimJgRIcF/ZdVW+7nimz9p94u5mPo
L2Z594OccDisLHVuOGbgr0uYa+TRF8WMgauhsit5V28j4x5EfgCM7bUxs+J+tZGm
7KymXJlT0/bJxA6NQbFjxNTb0bhCKTrl8jsXgS3FcN0MexmemXywX8Sj0EhOVidv
7NX+fm6Jme+Hz+XvQEzYLoOa9l/Gy8FgVl72ZonxuexzNL+N2mWGLToNrUsONkGM
qXJqj7wpaISUQe3dyPy3lYgd3x62egVVOGNT81+QVoyNk/WkgyZ0kvquNmwobFVE
hiJZQfxUZFafRHD5+yq/YWX2ZWmAS/afvR0SnzSUQur//ife28wcWciCfIp/dPx8
uHamcqrpdv3U3HeUC6TnA8U/+0jtwf838BeDOBghaAydqY3WeP0wpdye22/+Q2rt
zssAt06a2RwFWj4XiC0a
=cMWV
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--

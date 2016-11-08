From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [tegra:for-4.10/bus 4/4] drivers/bus/tegra-gmi.c:97:11: error:
 'dev' undeclared
Date: Tue, 8 Nov 2016 11:47:47 +0100
Message-ID: <20161108104745.GA3154@ulmo.ba.sec>
References: <201611080158.Q53HGK2q%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201611080158.Q53HGK2q%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 01:44:03AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git f=
or-4.10/bus
> head:   4f95e6a5c9e433197244c91dd25102a85dbb7877
> commit: 4f95e6a5c9e433197244c91dd25102a85dbb7877 [4/4] bus: Add support f=
or Tegra Generic Memory Interface
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.g=
it/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 4f95e6a5c9e433197244c91dd25102a85dbb7877
>         # save the attached .config to linux build tree
>         make.cross ARCH=3Darm=20
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/bus/tegra-gmi.c: In function 'tegra_gmi_parse_dt':
> >> drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in t=
his function)
>       dev_err(dev, "no child nodes found\n");
>               ^~~
>    drivers/bus/tegra-gmi.c:97:11: note: each undeclared identifier is rep=
orted only once for each function it appears in
>=20
> vim +/dev +97 drivers/bus/tegra-gmi.c
>=20
>     91		struct device_node *child;
>     92		u32 property, ranges[4];
>     93		int err;
>     94=09
>     95		child =3D of_get_next_available_child(gmi->dev->of_node, NULL);
>     96		if (!child) {
>   > 97			dev_err(dev, "no child nodes found\n");
>     98			return -ENODEV;
>     99		}
>    100=09

Sorry, this is my bad. I forgot to enable TEGRA_GMI in the default
configuration and that caused my build tests not to pick up the new
driver. Fixing it now.

Thierry

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIa1OAAoJEN0jrNd/PrOhm2YQALW+hx5R3bYDfMoxigLbVctC
OKNXEgqIsP63cJ7dsI5pRAvTMeOEhHKS93IEChRxsMQda2SpaLpsyKktvihwel1E
Mlb7T2TIv5KJz4imuWJqRe2D/AcYw+gY2oAuk4rOSwDyRV1AKpuhEnDimbAnAXEW
LajgsvSpqQOVLbGJDN9tzZX8rrKCtaeK9ygTSdfWeoeSX4cqMqHYyb19Rm5yW2KA
U/DC3ETmdbEs7zG6L4rYz60Tpj/2UcpTYmy/q06U5v8oFzOvB9A8R5Rh+enEbfBh
m+vuR8AmR/+32U5UomFcnrvvyiGe27NWjhMMrIAxM/sc5CNFTeLFcGy5yz08Z2sZ
I1T7Gvl/nsXLT7wIc8W21WQbqhdVQmkA/QXwX3uSykooATEDs2zD2mnwxKFzR1L5
QgnRKVgOjPHUoTPewZ9eQDcNVAR9q0hXOR8ARxmvEe1IhqwXJstVK0TUm+AV9ZgX
hxP7qC1gqGOSKtkPftZTKd9+Drfl833X1LwXzOcfs565O6sSKT8UP1cqXkg7tDmr
y6kgD7QdUkT00K8HMK/UZX+A+OzdAscImkOpGbx1PabQCHS5OtCHbwaIiqv8DFKE
H0GJXL/j7ZzJNKkRP4m/Le42eQRieDVCDUBnl+PnFPeBJoBwc6kcz+v/De9eqqkq
IdEX3/ApGGwofV3JK/xv
=VaeE
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

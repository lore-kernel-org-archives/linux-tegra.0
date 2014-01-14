From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/7] drivers/gpu/host1x/drm: don't check resource with
 devm_ioremap_resource
Date: Tue, 14 Jan 2014 14:40:57 +0100
Message-ID: <20140114134026.GB10936@ulmo.nvidia.com>
References: <1389700739-3696-1-git-send-email-wsa@the-dreams.de>
 <1389700739-3696-3-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389700739-3696-3-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2014 at 12:58:54PM +0100, Wolfram Sang wrote:
> devm_ioremap_resource does sanity checks on the given resource. No need to
> duplicate this in the driver.
>=20
> Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> Reviewed-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Should go via subsystem tree
>=20
>  drivers/gpu/drm/tegra/hdmi.c | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thierry

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS1T5KAAoJEN0jrNd/PrOhAqoP/1t1xG3nJ1NJhb/HzVGI0q7c
sj+vPaiUyBYzh3W+vVxzBS1l+WXTKNm/EnbpswK5j8pWeg6k4F4cfmzaF6X0xuia
hQ612bxFkFkQeBDgrZuOcOqxOUqLoDqYJnFA6Ay67n+P98ct+tfsDaSugPymCwse
IDWhwXeHp2bsZ17/DwiXAN6XLP+F/CwVlLwEe/4/fK0wNhG1UjGPuwUg2z91mFoQ
1Qoi8APACa85EPe6h6gfUyBTr7UegcPmuMo/b3hZcTiwQE1OVoGyIbHqYp+yRKjQ
KBPsJk68oaTCShsMknlvPv2igXQk6Td3Ta1WJoZ7I2tt0h0b1SYrDl4WujoH+ON9
ltTsOxO0hVMNwfsHejMKQQLCVvbRVweucqlm/7spiap21Ajkmurax54LF5D+qYkv
+lmlYYkSuCDXrVcD6gLuX1pgcHmjbvBokH8V6s8oBsI6A2jRkKgdDPLCUSrKsGxy
HH7JLHh7SUda8M+aFjAAmgBhOegwEX5+toyWYtoUkdzYWhnMOr4RsAc6pApkqiAP
bFgGq2Du6nba4bENTd7m0S3r+vEjCMac86HXhM6HU3IB2ZBCzpvd7+xkw/YzyAnY
n//fW5H+bpOaz7J/dDDvLkN2Vd632m0RyGQiRv3iU0xEXnI/97eW/PxpiHDSLbwn
cO2TCBbQmHIEWCHjhEI9
=647i
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--

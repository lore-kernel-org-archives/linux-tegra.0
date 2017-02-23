From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: Add Tegra BPMP I2C proxy driver
Date: Thu, 23 Feb 2017 17:18:50 +0100
Message-ID: <20170223161850.GA15601@ulmo.ba.sec>
References: <20170220165234.29299-1-thierry.reding@gmail.com>
 <20170220165234.29299-2-thierry.reding@gmail.com>
 <20170220181747.lykox7o4ik6d5snu@ninjato>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170220181747.lykox7o4ik6d5snu@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 07:17:47PM +0100, Wolfram Sang wrote:
> On Mon, Feb 20, 2017 at 05:52:34PM +0100, Thierry Reding wrote:
> > From: Shardar Shariff Md <smohammed@nvidia.com>
> >=20
> > Add Tegra BPMP I2C driver. The BPMP is the boot and power management
> > processor embedded in Tegra SoCs. In newer SoC versions, access to one
> > of the I2C busses goes via the BPMP, requiring a different "proxy" I2C
> > driver that accesses the bus via the real I2C driver embedded in the
> > BPMP firmware.
> >=20
> > Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Applied to for-next, thanks (will be in for 4.11)!

Thanks for fast-tracking this!

Thierry

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlivC2gACgkQ3SOs138+
s6EVdg//QawdgVW+mjTkZ0KtT4ad1NVDhAssm2buvUQ0EulQpNkfnwgiICLCJyom
sZk5spjy+ZkVpg2OjGru6Cgahn9YY0NTvoycjkygBAZXMI1ZlfgE/RhF5dpzL9r8
hZ9ikr+FLM2Jlw5BRvpJrW5pLk/j02GaKVstGqeYLXrtfGEGmMdRZcphhzUnju5K
KV6gPTTresWpVGZlq6W/ZMQiWqTMzbykxnfdR731Vh7cGLF1qQp4xA0CyaJedW2t
fZazlI8CZHROAgg1nAzY8tLtqQ+n9NyEDxL7Te3e7srXi5VRGGBuxNckxtRyGW/G
e4RjvUWp0a0lK9KqmvyeSfqB6rQw4VszfNbxIlyttScoPhXoXLLwV675WBFds5oE
4Sq2cQsgugdppyGcmmW1vk9sNOFIS49+vHlTXQmDqoa5XI+XaHuKQZ95XaRMppnx
zsugQZ2N4Bm64YtEjTTE6wciOgn5XvqewsqbIvGRb2PW6FFywCFCQqBH12K5k8KV
8Zd75fPg1sz3hOuv3tH/0WcI5uluP57gEpqtPO4zcauGwSAx+a//4memkF5I90Oa
Q+qEC6CD24gGqYS6AS6NVlav27JUIaJv8W5wuTl7Wgh8gN7aoHV/v2PYf/bSp7HH
2OjEn8aSDAwnr8ogSaIqnOLw+QvF4hkS6f8IOM4ZT47KeLkIE8A=
=MxH9
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

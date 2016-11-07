From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] serial: tegra20-hsuart: fix typo in dmas DT binding
 description
Date: Mon, 7 Nov 2016 14:01:03 +0100
Message-ID: <20161107130103.GC12559@ulmo.ba.sec>
References: <1468787481-27753-1-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468787481-27753-1-git-send-email-mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 10:31:21PM +0200, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> The description for dmas references a second property, which should be
> "dma-names" instead of "clock-names".
>=20
> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIHsPAAoJEN0jrNd/PrOhji4P/3fLEqsdDaIQSjRLrRcpqGIU
A9Y+nIIDuK27FbxpH5dJgD8sS+LPT+F2eKSQ98e3Bm+eU35P8YVllfPbVdFUBTrG
VLhebsAKNihI3fKHidvpCT+1vb2I7TGNZJbPKSU799GLkXs4+KhxIKEkIO/5jYqM
OF8Gn6rFHs5AaPlVDuNwHfdSEooipBAJGvx7oG+r4Q2zqNewAWf524KCCAhB35kH
5oYWrFPqLzRcqAIATbJ4VRZ+39qGZ1t0uyiZGy4neYcJpQzaezEnx9ZGi5oukUzA
NrQ9c8ztvED2+ewEnQ10Vtyax15UXSp9Zp+oM8c8CRT7S2o45ZEqwgoUsURTyggD
4iTD7h9USyuJf9luS9vhMpVVgdFBxHUn68eCec00FXJJNAd3N3ZEI8rY1I1a1b+y
5TlfFyNgmsBhq7JpJvSrWbpryYbTiknP59MV67kELSLp5wbR+FL2EncBdgrVhQzi
76bMu/30eH0NTAHd9W/iU2OTFRC+NqRh+FH4GyHLR+xtEsY2PZCav5bn1ICEYNbH
nTgWCIYycflc6ADuFCvBEa15LyZ4H+8dE7ho3gLcv/9MSIgBI+PtzJepH4Pr2+ov
mh17ojNQi1rkk7Mu/NDQthD+rA73Raz3PKkj6StptaeceucTX/LqzWEjplgfHeBa
XbrNOQFF9ksmLv8mzXlz
=BGjm
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--

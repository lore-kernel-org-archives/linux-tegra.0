From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/6] usb: host: xhci-tegra: Add Tegra194 XHCI support
Date: Wed, 2 Oct 2019 11:40:52 +0200
Message-ID: <20191002094052.GC3716706@ulmo>
References: <20191002080051.11142-1-jckuo@nvidia.com>
 <20191002080051.11142-3-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002080051.11142-3-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: gregkh@linuxfoundation.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 04:00:47PM +0800, JC Kuo wrote:
> This commit adds Tegra194 XUSB host mode controller support. This is
> very similar to the existing Tegra124/Tegra210/Tegra186 XHCI, except
>   1. the number of ports and PHYs differs
>   2. the IPFS wrapper being removed
>   3. mailbox registers address changes
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UcKQACgkQ3SOs138+
s6HHLA//YBnOoAm2X3mFPUPSTtCfo7+h1y4hsbXuPMvKd1Fkl26dAr+L5f00ZUNW
zZQg5WJqV1c+ZzUebxtcfPbBSjDpoqvBqAW8heJSBX700v/nJmIyETStDaApUbmd
wkCNGpwik68b2s1+B99y5vDr2btCspIDBkVq0U5rrNC3dbb7TZW4oGKWis3Iuo6K
Qh0qSpwy8lLult05RkzLENTjwtpzG4bN+K9MksdmI2gVFpSOxyGE5imHXIpSHSwJ
P4IAd/pGZOvsTwT/LGIq7bNt/mAMigD46AGjtaE3w+owvzMSH8GRYtJuQeFjjCyg
6Hf4WITjYVFJA5K2DaklvwSSNCsjWiwTB+Rfeds9CG5hYTbGIv+b4lTj8HYPzY+t
67EpqDT0OsFrg7VjzHNvIzoDkTnG2Kh+DBFVUjkJoqcFQY714+ek1VT0M4UWTpJe
JbmCjUC3GrosVC/wPl2hjS3jsoDFSwZwK5TMYzkTw3r8GX7oTJ4HBxZgFdbqqC9D
NPVREICBVqDq/AdTqxf3YEyB19blCIBUGvuq8CNTRwSrPFkAaqAQD8G/zAx8ETr4
nKEq3jmqPRIc0Yn4H3PYavEGOlNpDvMEtJixwBibkC0ujivV5tnsTuYT1BXlOSgZ
2fIMYaYL3isOYsscCSiJIz2S52NLMAfRSdtC3oxUehiVlXIKZhg=
=NBTc
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--

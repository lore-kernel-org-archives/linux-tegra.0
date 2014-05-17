From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/tegra: Enable HDMI_5V_CON regulator
Date: Sat, 17 May 2014 23:34:57 +0200
Message-ID: <20140517213456.GF1046@mithrandir>
References: <1400350881-22008-1-git-send-email-dgreid@chromium.org>
 <1400350881-22008-2-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1632924324=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400350881-22008-2-git-send-email-dgreid@chromium.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dylan Reid <dgreid@chromium.org>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, swarren@wwwdotorg.org
List-Id: linux-tegra@vger.kernel.org


--===============1632924324==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Content-Disposition: inline


--65ImJOski3p8EhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2014 at 11:21:21AM -0700, Dylan Reid wrote:
> The DDC bus uses this for it's supply, enable it so EDID can be read.
> This eliminates I2C read timeouts on Venice2 and EDID can be verified
> with i2cdump.
>=20
> Signed-off-by: Dylan Reid <dgreid@chromium.org>
> ---
>  drivers/gpu/drm/tegra/hdmi.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Like I said in reply to 1/2, this should be fixed by:

	0d6696438d2c drm/tegra: hdmi - Add connector supply support

Thierry

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTd9YAAAoJEN0jrNd/PrOhnIwP/3/bVF6nL74+9G89PiBZG+nQ
9NRnn+9wm7ZgeeKc5HweLMYcSRZNzb2dnFm6AFW2aVETvt5764I+Tst6TGrgfLQL
iTbIo1map55cJ4BfoIdMa67o3m+BFRZjAUWAAPiySFjxC45A/UUwc7dl+OoTxdL7
Q77PkzKvpJt/0QvXz/ta4/ry11bZ7U5IXCy9c2YsYmEWb6s0puh7G8h7UgfdQcy/
UXGqu1//mkTWqS0URGwXeUMmorwbz6xLUFC8mm7bpeEaqVHEEf+dBVfuHltji0wE
57slgqLEfzH38lNz/umdENO/6ocxXBDogfQ0wJrGU81ZE1oqUai9ZX7kLuKp7azW
dpPvaKZc7l4ohv0Yx4emPXeTAFtfa1pkY+hBI0ZBCPFecqiZrNbmIup9qLOCWLkF
EZ0ZSkGf4kXddcpnKfQwaubzLeEPO77NTiuQbkcrXnD9qMQHBwpfhbz2db4ixMHF
yAA0TauiJKv4UZyW9E1JSPA2XwSyEcQNdDmUVdQHcWmkF4KDBuE4x6PcwXR1IWqh
rpb8bJIQAz+VvirObs31bmlJ0z6laNy1tDsZeA2s54ovRDqm/yJrwbUrE/CkuK3U
Hl10eJBTwPDzh8mXMdw1+6sZZJGDDzo1GFNkiXlSdl7bFrpnIFmabWGuAVbYTGY4
I0w+focEF+QIbaUi142X
=IeAE
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--

--===============1632924324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1632924324==--

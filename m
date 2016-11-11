From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/4] drm/tegra: Set sgt pointer in BO pin
Date: Fri, 11 Nov 2016 15:38:59 +0100
Message-ID: <20161111143859.GD4967@ulmo.ba.sec>
References: <20161108175135.32004-1-mperttunen@nvidia.com>
 <20161108175135.32004-4-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0478187774=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161108175135.32004-4-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0478187774==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 07:51:35PM +0200, Mikko Perttunen wrote:
> Fix tegra_bo_pin to set the parameter sgt pointer.
> Host1x job pinning requires the sgt to determine
> physical memory addresses of gathers.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied with a slightly reformatted commit message. Please use all of
the 72 columns to avoid "squeezed" commit messages.

Thanks,
Thierry

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYJdgDAAoJEN0jrNd/PrOhmF8QAKk5IdknR2knHIqAxiGxjx08
GHzH5lcYJsD4ozfVABkovSh5QGlUZeioD2qvFaHvbIgY5hc//mglMTsvUeL5rHv8
FiNKSnNoMQDHdDqqgvuUbDblT8M+kq8ULOm+x+9LV4zOMjZBx2sujII0bbIHEcLe
hd5bsVQil3PsaEdBitCGWfKBFu8xoSEaZkzsZNpSBHAmmfouYWRTqqQ972jedoz5
HgEEQUBvl3OH0AnUUlHTeZ4yLiK3vPcRuxEwcnxU1gdfbsRhlDTkYU56DRHFuDg5
kTgtmONAehlc13NpDomV4avUgbDxxz2nFHhCa4ewttoCOayxS/Uqkw1xwZ2i1sKM
f3oMLoCFTRcLdeH6It73s/xuF5pYiMsI0EZ5fTaEv/lxP0RUTuEIjsn/Q9mfLkVU
8R+HZpXhTu7bfJIel7GKCMbJ7LYEFzR2Vkiu5EhgbmNKf/Nvd6ArMO+s7DWq/Xgs
Mz3is7ZCwcfja9JBS48iUczBZt2A1ATQWu1cob7aBUY01BIkmzawCNhXVYrMIqnJ
gfUeX8SOicYDfkISxn+qOC2nuPp51Cm1mctT+DvpXuBgc0LkJhPEyx+CXik0dZXR
i1mpansQcq4cx8b8SoHI+aa9eR5mdy4aew3+6YFhKRJXxwuYJODVMOewAsttNCfs
QJzjTzifB27zULFYESjh
=qwF5
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--

--===============0478187774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0478187774==--

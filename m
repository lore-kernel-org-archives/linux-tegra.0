From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 142 boots: 2 failed, 130 passed with 7
 offline, 3 conflicts (next-20181129)
Date: Thu, 29 Nov 2018 11:57:19 +0000
Message-ID: <20181129115719.GE10570@sirena.org.uk>
References: <5bffcc4f.1c69fb81.ee2e8.b541@mx.google.com>
 <20181129114413.GC10570@sirena.org.uk>
 <20181129115413.GA28224@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0752872404=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181129115413.GA28224@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel-build-reports@lists.linaro.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============0752872404==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Content-Disposition: inline


--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 29, 2018 at 12:54:13PM +0100, Thierry Reding wrote:

> This looks like the same issue that I was seeing a couple of weeks ago.
> There's a fix for this here:

> 	http://patchwork.ozlabs.org/patch/993812/

> Not sure if Ben's picked that up yet, though.

It's certainly not visible in -next and the issue is showing so guessing
not.

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlv/1B4ACgkQJNaLcl1U
h9BD4wf/TDRSfgqSqVmqEcvgDsExpYAN5GhtMgQ/Mpg6M8O0LiHDxHBJSc52hrMI
YpA6n2juoaTWyAw6rejWy4puoOFfgAjUbfghMD1GWru+qsaW1zQlgDKpOBai44Ti
sOCpGSx8qyABKbSJGrffQvxiZKQovVlQYD603HZVdPCyiswizFbI0sl4NpYtu7Hn
P97aW34fGRkcE2G2mhggBCDiqmaYrGlgJjN0Ct19Rxb1WnI/oqzb64VFbayxzKhJ
6f3PeuoaalXIGy79XxMaL9nRCZ9/VxApDZ3vPobjBSMjZzfrqj3asLBy5ELDOmqx
aRnF3T4EgwqO3MVF5Pj15O8EG9Usqw==
=JQ3e
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--

--===============0752872404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0752872404==--

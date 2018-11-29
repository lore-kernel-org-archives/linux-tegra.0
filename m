From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 142 boots: 2 failed, 130 passed with 7
 offline, 3 conflicts (next-20181129)
Date: Thu, 29 Nov 2018 11:44:13 +0000
Message-ID: <20181129114413.GC10570@sirena.org.uk>
References: <5bffcc4f.1c69fb81.ee2e8.b541@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1491054572=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5bffcc4f.1c69fb81.ee2e8.b541@mx.google.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-tegra@vger.kernel.org


--===============1491054572==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 29, 2018 at 03:23:59AM -0800, kernelci.org bot wrote:

Today's -next crashes on Jetson TK1 when the Nouveau module is loaded if
it can't find firmware:

[    7.617291] nouveau 57000000.gpu: Linked as a consumer to regulator.33
[    7.624037] nouveau 57000000.gpu: NVIDIA GK20A (0ea000a1)
[    7.629880] nouveau 57000000.gpu: imem: using IOMMU
[    7.635013] nouveau 57000000.gpu: Direct firmware load for nvidia/gk20a/fecs_inst.bin failed with error -2
[    7.644726] nouveau 57000000.gpu: Direct firmware load for nouveau/nvea_fuc409c failed with error -2
[    7.653960] nouveau 57000000.gpu: Direct firmware load for nouveau/fuc409c failed with error -2
[    7.662916] nouveau 57000000.gpu: gr: failed to load fuc409c
[    7.669694] Unable to handle kernel NULL pointer dereference at virtual address 0000006c

This has been there for ~30 days but obscured by other issues.  Full
log and other info can be found at:

    https://kernelci.org/boot/id/5bffa74b59b5148342fddd64/

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlv/0QwACgkQJNaLcl1U
h9DpFwf/XpGYSRyxJo51nt01usoNzd9Qck8cJZUoG2pgAm/i3EBhnoc/TN23xMFx
aKhpHHgokR99c23+AfAg+yAzzzX5ZTwtYsvMLbnpz/NfSESr9eiyIqyU1VQpM6w8
osNIFuIdF/Yx4tnRjCl0NY54eyt85zLdU4l7Akxq0qYaeCqisbCpvwtyPiLsf1sf
5vx4C8Ahmc1urhkjEFJ7I/pBcG3QM6vHGuLwgC1LjTWDDTCxXuY+smCPAnppZCBi
wRIcdoEJsPmjhwK+R6dQrJni72EXNiwlcpdH7ZY4gdlvfpK8VMWg+lEJUEz8yG+m
y82xf0yXjuFInNXvBNwpZdo/9M5lig==
=E0Ch
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--

--===============1491054572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1491054572==--

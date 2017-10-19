From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 5/6] gpu: host1x: Add Tegra186 support
Date: Thu, 19 Oct 2017 13:39:45 +0200
Message-ID: <20171019113945.GP9005@ulmo>
References: <20170905084306.19318-1-mperttunen@nvidia.com>
 <20170905084306.19318-6-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1414125039=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170905084306.19318-6-mperttunen@nvidia.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dnibade@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, sgurrappadi@nvidia.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, digetx@gmail.com, amerilainen@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1414125039==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s2lX4GznBIrto1wi"
Content-Disposition: inline


--s2lX4GznBIrto1wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2017 at 11:43:05AM +0300, Mikko Perttunen wrote:
> Add support for the implementation of Host1x present on the Tegra186.
> The register space has been shuffled around a little bit, requiring
> addition of some chip-specific code sections. Tegra186 also adds
> several new features, most importantly the hypervisor, but those are
> not yet supported with this commit.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/host1x/Makefile                    |   3 +-
>  drivers/gpu/host1x/dev.c                       |  60 +++++++-
>  drivers/gpu/host1x/dev.h                       |   4 +
>  drivers/gpu/host1x/hw/cdma_hw.c                |  49 ++++---
>  drivers/gpu/host1x/hw/debug_hw.c               | 137 +------------------
>  drivers/gpu/host1x/hw/debug_hw_1x01.c          | 154 +++++++++++++++++++=
++
>  drivers/gpu/host1x/hw/debug_hw_1x06.c          | 133 ++++++++++++++++++
>  drivers/gpu/host1x/hw/host1x01.c               |   2 +
>  drivers/gpu/host1x/hw/host1x02.c               |   2 +
>  drivers/gpu/host1x/hw/host1x04.c               |   2 +
>  drivers/gpu/host1x/hw/host1x05.c               |   2 +
>  drivers/gpu/host1x/hw/host1x06.c               |  44 ++++++
>  drivers/gpu/host1x/hw/host1x06.h               |  26 ++++
>  drivers/gpu/host1x/hw/host1x06_hardware.h      | 142 +++++++++++++++++++
>  drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h |  32 +++++
>  drivers/gpu/host1x/hw/hw_host1x06_uclass.h     | 181 +++++++++++++++++++=
++++++
>  drivers/gpu/host1x/hw/hw_host1x06_vm.h         |  47 +++++++
>  drivers/gpu/host1x/hw/intr_hw.c                |  29 ++--
>  18 files changed, 880 insertions(+), 169 deletions(-)
>  create mode 100644 drivers/gpu/host1x/hw/debug_hw_1x01.c
>  create mode 100644 drivers/gpu/host1x/hw/debug_hw_1x06.c
>  create mode 100644 drivers/gpu/host1x/hw/host1x06.c
>  create mode 100644 drivers/gpu/host1x/hw/host1x06.h
>  create mode 100644 drivers/gpu/host1x/hw/host1x06_hardware.h
>  create mode 100644 drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h
>  create mode 100644 drivers/gpu/host1x/hw/hw_host1x06_uclass.h
>  create mode 100644 drivers/gpu/host1x/hw/hw_host1x06_vm.h

Applied, thanks.

Thierry

--s2lX4GznBIrto1wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnojwEACgkQ3SOs138+
s6G8jRAApcU9JJukKmS0x6FM7PRU8Xz+5PALni6PLFX9qYyp0I+30HYIJ1mMb6wW
TsRAIS8NYwx9moFNqIGvm+CkL3eeJ20u2v2VT0AJ7zG48bnsPZpCUdf/CEiJgYY1
IacowcIPRgz1cd7eyxanzfi+8zUFCezO/XrY0h8LDItHooi46aryIMVY+k5U/MrQ
oLZeYSSP9g5m1a8Xsi+VHvlnJLKnyZeXenarYwc6yCAuJN5feyZYHJRJiRNZqop9
mrYJv0S8IVUyBx1L6kzelt8yQEdBMXMEViXFcswu692+1vkS8eXukD404ujZ5gcL
Oei7Ih8rOfEEvm4ahNh54xo7hG0/2ZZcJNzXhsQ+/YIo01Z7viBEWjYRBcvnL0jx
5DAMLTGXgIeDm3pWrGPJ+XPS8zAVVmSf/N1A+RNk65qGb8/GlcXvmYCy4FmWaew4
1PosI6vH7ksGTrIPDamvUElZZNL9T5hglrLuKPKhKuvczXrZFQKrjTxF7SuJ1f5D
Xv+v56QxtSdKJ7psyckN0Znu68eooMgDLD5QGB8hJEQaEO6hHSP6irgwRYHcjw68
WwTaqI3RiiCmohp2y34UH6s8MNyDdtUQqOjrBDcStIvpIMLvXVn+mDGOIcy35Fr9
yh5fDt8K9ogD52nA6BOMoJFVuFolfKVaa5ESWUipr21aS/kKUXM=
=MZzh
-----END PGP SIGNATURE-----

--s2lX4GznBIrto1wi--

--===============1414125039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1414125039==--

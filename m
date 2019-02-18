From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 0/8] Support Trusted Foundations firmware on Tegra30
Date: Mon, 18 Feb 2019 09:51:14 +0100
Message-ID: <20190218085114.GC19363@ulmo>
References: <20190218001726.16785-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190218001726.16785-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 03:17:18AM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This patchset adds support for the Trusted Foundations firmware on
> NVIDIA Tegra30. Pretty much all of Tegra30 consumer devices have that
> firmware and upstream kernel can't boot on those devices without the
> firmware support.
>=20
> Changelog:
>=20
> v4:     - Fixed Thumb2-kernel hanging on Tegra20, turned out it was not a
>           good idea to switch CPU into Thumb2 mode right after jumping in=
to
>           the reset handler.
>=20
>         - Moved LP2-mode-set firmware call invocation to a later stage to
>           better replicate what downstream kernel does. This change was
>           suggested by Robert Yang and fixes system hang on Ouya game
>           console.
>=20
>         - Added references to the original work made by Micha=C5=82 Miros=
=C5=82aw
>           into commit messages of the relevant patches.
>=20
> v3:     - Implemented suspend-resume support.
>=20
>         - Reworked arm/firmware/trusted_foundations.c a tad. Now cache
>           is getting properly initialized, cache enabling / disabling is
>           supported.
>=20
> v2:
>         - The "Don't apply CPU erratas in insecure mode" patch got some
>           cleanup, in particular resolved the messiness in
>           __tegra_cpu_reset_handler_data.
>=20
>         - Added a comment to tf_cache_write_sec(), justifying the warning
>           message.
>=20
> Dmitry Osipenko (8):
>   ARM: trusted_foundations: Implement L2 cache initialization callback
>   ARM: trusted_foundations: Make prepare_idle call to take mode argument
>   ARM: trusted_foundations: Provide information about whether firmware
>     is registered
>   ARM: tegra: Set up L2 cache using Trusted Foundations firmware
>   ARM: tegra: Don't apply CPU erratas in insecure mode
>   ARM: tegra: Always boot CPU in ARM-mode
>   ARM: tegra: Support L2 cache maintenance done via firmware
>   ARM: tegra: Add firmware calls required for suspend-resume
>=20
>  arch/arm/firmware/trusted_foundations.c    | 80 +++++++++++++++++++++-
>  arch/arm/include/asm/firmware.h            |  2 +-
>  arch/arm/include/asm/trusted_foundations.h | 13 ++++
>  arch/arm/mach-tegra/cpuidle-tegra114.c     |  3 +-
>  arch/arm/mach-tegra/pm.c                   | 50 ++++++++++++++
>  arch/arm/mach-tegra/reset-handler.S        | 52 ++++++++++----
>  arch/arm/mach-tegra/reset.c                |  3 +
>  arch/arm/mach-tegra/reset.h                |  9 ++-
>  arch/arm/mach-tegra/sleep-tegra20.S        |  4 ++
>  arch/arm/mach-tegra/sleep.S                | 11 +--
>  arch/arm/mach-tegra/tegra.c                | 10 +++
>  11 files changed, 214 insertions(+), 23 deletions(-)

Hi Russell,

I'm not sure if this is something that you have a vested interest in. It
looks like Tegra is the only platform that uses this, and usage is
limited to two generations (Tegra30 and Tegra114). Do you mind if I pick
this up into the Tegra tree and send this as part of the pull requests
for v5.2?

Actually, Trusted Foundations is the only firmware implementation left
in arch/arm/firmware, so how about we move this file over to
drivers/firmware (perhaps even the tegra subdirectory given that nobody
else seems to be using it) and get rid of arch/arm/firmware?

I can prepare a patch that does that on top of this series, just let me
know how you want to handle this.

Thanks,
Thierry

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxqcgIACgkQ3SOs138+
s6GX/w//W+g1W1nxSBXL3svlE2qwDtpUVy7dQayozIareXJOzKQtUWv024Df4KKN
nbP841bAkpdJ60BQTAsmBg22uHgSU0EMm+lEUoqw1PlUXxTip4z3EEvqCShA+489
bDRwXYFFW0vC9b4ModO6o10DMeqcbpUn8kHRXtKXcK9W/H6XHbyDxNArwu9iov7t
AFT+1g+tNctC9BTHmuk982IPpP677Kf+DWoTnfaSROylxGL4vVLi6pgc8LSDPG/N
mQssOAFbZygKdFk6Ee4cxfKxjIy3D91AG7jk2NYeD6+8N4CtsaDQVgL60KOjjQdJ
oruj/k7vD72ol4SvX+PIJouV6orgauRGQOAVBQuLta1GoXF5XXF+n0U7/VhhPW8y
A6knDLy6RqvWtW1sD/mTOTH9TSuS1ru/DFBiOZXsnA2qAxiYt6vw0K22wwn30rFW
9LxqS29GRhu0Xh4UCV567pBMpOpa0qIpJ175OWTu8Bm9ai+ac9UYpPINfamaTLIp
j9grXhklN4mJ062zuTPV1SO37zcRhzfeMp+Ci1b52CZdnUl0gkFYzjdvWMSyu6PI
fN/lrKI4oEEPB4HuwYX0nsXbB96pFAEks2da6tgG2FTMN8uyUGZaZv1xuHqqJkG/
dWu+JEuOmD8JjPddH2fPZ6/JhpZxMUmhFhdQw+cADQTB4v50v7g=
=FU2G
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--

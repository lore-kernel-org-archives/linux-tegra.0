From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/5] usb: xhci: tegra: Add genpd support
Date: Fri, 12 Oct 2018 12:27:32 +0200
Message-ID: <20181012102732.GD9162@ulmo>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-4-git-send-email-jonathanh@nvidia.com>
 <20181011164753.GA7393@ulmo>
 <248afd79-1a7d-7342-5939-6fa998d04d5b@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <248afd79-1a7d-7342-5939-6fa998d04d5b@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 12, 2018 at 09:41:35AM +0100, Jon Hunter wrote:
>=20
> On 11/10/18 17:47, Thierry Reding wrote:
> > On Fri, Sep 28, 2018 at 03:11:48PM +0100, Jon Hunter wrote:
> >> The generic power-domain framework has been updated to allow devices
> >> that require more than one power-domain to create a new device for
> >> each power-domain required and then link these new power-domain
> >> devices to the consumer device.
> >>
> >> Update the Tegra xHCI driver to use the new APIs provided by the
> >> generic power-domain framework so we can use the generic power-domain
> >> framework for managing the xHCI controllers power-domains. Please
> >> note that to maintain backward compatibility with older device-tree
> >> blobs these new generic power-domain APIs are only used if the
> >> 'power-domains' property is present and otherwise we fall back to
> >> using the legacy Tegra APIs for managing the power-domains.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >> ---
> >>  drivers/usb/host/xhci-tegra.c | 89 ++++++++++++++++++++++++++++++++++=
+++------
> >>  1 file changed, 77 insertions(+), 12 deletions(-)
> >=20
> > It'd be nice if we could eventually get rid of the legacy Tegra APIs,
> > but that's a separate issue, and this patch looks fine as-is:
>=20
> Unfortunately, I don't think it is possible as it will break DT backward
> compatibility. However, one way to do it would be to force on all power
> domains on boot if PM is not supported.

Yeah, that sounds like a good option. If we don't support PM the I
imagine there's little use in keeping some of the partitions disabled.
But let's investigate that at a later time.

Thierry

--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvAdxEACgkQ3SOs138+
s6HEeQ/8DVIf2eg1G5hJC72lJiV/i9fJdcLKgaiS8Q9mFu44m1Ut0QETHgeNfyV9
yg1sfy5+FB+4PTNoaHZb3X2sWVvXXxjsgi+56tu4P1Hji4S1yeuJ9KAc3Bgn9bth
4RDwwBGdKiI6gZmkJnI4AM+m7Scb3rmb64TH6uwaET/hl/V1cKT7hnzYSk86Ku+X
syjjSFMAlTNkZrcLFVgobrIV67HGre8CKaP4AtAITM+OzcWSggBpragg09gRVfSm
D/sLVkoCVtlFTgpE0LUYKltYAn+hEig8Rk82i/IUiEuG3L5tpM7+nsYOmtIKhAR8
ApSFvk2PIIsGpOwCom4s/lIK/ONR/j8lauaMLQrWF96jQ4WCzRpZwxV+U80L/8YN
JMG3y3800jpORx/IAp0lfDIznT1KcClfGMQu1zA//DoBnxo4ek8m0He3H0E4Jr6l
WwjJXYpvbswHEosxWUp3NYJEedVoqzU+IXLyOA7O9OVFXFgcIX/RQbItZ+RcEr/S
WW56sNVzbWuO54M3F35hAVP0Ue56hFxEfvPT/MBvT0x/YrdJOt7tTmD9ndYksg79
5I3Cy7SwDeoX+incSMXifhJqUmalsxF/gB5Rb91bXfcB7igZzjS8imvKyeH3tT44
XTS+Erd2PeU8QDWL9h9iLVv+RDXwXXQeSActlHKzbKiAGubeSWw=
=hVM5
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--

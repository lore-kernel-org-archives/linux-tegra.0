From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/5] usb: xhci: tegra: Add genpd support
Date: Thu, 11 Oct 2018 18:47:53 +0200
Message-ID: <20181011164753.GA7393@ulmo>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538143910-24400-4-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2018 at 03:11:48PM +0100, Jon Hunter wrote:
> The generic power-domain framework has been updated to allow devices
> that require more than one power-domain to create a new device for
> each power-domain required and then link these new power-domain
> devices to the consumer device.
>=20
> Update the Tegra xHCI driver to use the new APIs provided by the
> generic power-domain framework so we can use the generic power-domain
> framework for managing the xHCI controllers power-domains. Please
> note that to maintain backward compatibility with older device-tree
> blobs these new generic power-domain APIs are only used if the
> 'power-domains' property is present and otherwise we fall back to
> using the legacy Tegra APIs for managing the power-domains.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 89 +++++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 77 insertions(+), 12 deletions(-)

It'd be nice if we could eventually get rid of the legacy Tegra APIs,
but that's a separate issue, and this patch looks fine as-is:

Acked-by: Thierry Reding <treding@nvidia.com>

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlu/frYACgkQ3SOs138+
s6FKUw//UiZXqBWAdR5Ot6XX321n53Ig86IZzDMLB7iDWbzi+BtsKGGDqs+AwnY3
ETXJdwG7YI0WfdiPhh3gjE6uOx6/l0fvwLz82oFIxetwbsxb7QqbQWZJoVxm3Hcp
RhaB+mgN8PmFdd8TgaL6K0wmLyE1qA+XcBJPYqRHhQoFVp4K6bn2Rl0Gl5XshnS+
tUfyLMiJy15Zr25NIkhWBu+BfqmDHjqf6jdyp94p1vbXUlw4ApGcYlED82eLVn91
1yTKuOCG4xGKDpL7fQs2HF9KdPCgbKu8LvawLSkRVbNXBavLmWblOuPBWPa4Sm0a
g6eAJOssYStmznwNWT88+DvC2xfmi4eKlNhJt7fxykOsPKsQ2cOOw6yfco1R2GPf
B1Sfulqbx3/w3jBpzrwUn8dLmTP6Dxb8fhQqL/EkaB+bPL5qQWFjADAgRsDDLFZY
sbb7tvjx9OBSQ93LyzkbsYDavdUiAFjDjtRj6XPk3KEY2FSfbsXF8zmOk3OrTwJ9
eCfQw0en8RKpBdQgd81Utq0y24guei8lYbVho5pO+ehNXEyA2x1WrLVhkM4TH+ZP
kXdmamgVhc+MmKGpOaYkAQakA6f2UWd9VErCWoRNnLDzMlks/BFvYcZeyutuKJOe
NLf9Vb+t5qwQgl3Qj0LFYoTdG7LsQ3G9Eygl/QeIFL0p1Jzp71g=
=pzTh
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--

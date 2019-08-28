From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/6] PCI: tegra: Enable PCIe C5 controller of Tegra194 in
 p2972-0000 platform
Date: Wed, 28 Aug 2019 11:10:28 +0200
Message-ID: <20190828091028.GB2917@ulmo>
References: <20190826073143.4582-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190826073143.4582-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2019 at 01:01:37PM +0530, Vidya Sagar wrote:
> This patch series enables Tegra194's C5 controller which owns x16 slot in
> p2972-0000 platform. C5 controller's PERST# and CLKREQ# are not configure=
d as
> output and bi-directional signals by default and hence they need to be
> configured explicitly. Also, x16 slot's 3.3V and 12V supplies are control=
led
> through GPIOs and hence they need to be enabled through regulator framewo=
rk.
> This patch series adds required infrastructural support to address both t=
he
> aforementioned requirements.
> Testing done on p2972-0000 platform
> - Able to enumerate devices connected to x16 slot (owned by C5 controller)
> - Enumerated device's functionality verified
> - Suspend-Resume sequence is verified with device connected to x16 slot
>=20
> Vidya Sagar (6):
>   dt-bindings: PCI: tegra: Add sideband pins configuration entries
>   arm64: tegra: Add configuration for PCIe C5 sideband signals
>   PCI: tegra: Add support to configure sideband pins
>   dt-bindings: PCI: tegra: Add PCIe slot supplies regulator entries
>   arm64: tegra: Add PCIe slot supply information in p2972-0000 platform
>   PCI: tegra: Add support to enable slot regulators

Hi Vidya,

when you resend with review comments addressed, can you please reorder
the patches slightly? I think it's more natural to order them like this:

    dt-bindings: PCI: tegra: Add sideband pins configuration entries
    PCI: tegra: Add support to configure sideband pins
    dt-bindings: PCI: tegra: Add PCIe slot supplies regulator entries
    PCI: tegra: Add support to enable slot regulators
    arm64: tegra: Add configuration for PCIe C5 sideband signals
    arm64: tegra: Add PCIe slot supply information in p2972-0000 platform

Or perhaps even like this:

    dt-bindings: PCI: tegra: Add sideband pins configuration entries
    dt-bindings: PCI: tegra: Add PCIe slot supplies regulator entries
    PCI: tegra: Add support to configure sideband pins
    PCI: tegra: Add support to enable slot regulators
    arm64: tegra: Add configuration for PCIe C5 sideband signals
    arm64: tegra: Add PCIe slot supply information in p2972-0000 platform

That makes it more obvious that patches 1-2 need an Acked-by from Rob
and patches 1-4 need to go through Lorenzo's tree and that I'll pick up
patches 5-6.

Thierry

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1mRQQACgkQ3SOs138+
s6GoKg//c0Y8aNQgON5iL5nm5/UbKfGB8YDwT6hVWpzkOowmnglV2QSXZG73j4mx
hjXJuiSrXTTDgdhKhDYSv+xxG+SB3sUMCtxG6BkPxjMgElw8PuLo/qfjTzHIGN7P
4OzB/u3fInyfoO4lrb1bVqR/DysGqpyuX/eoGHtAD99UKvuaCoPq/YuRMuEJB9uM
P/iNX66JVhfYRag1BTGdkawWxTHhZUujAIXWJRyDvNN43xA30Y401ZZIzrKnvqCg
BLv7/bCXpx1i9jN5WtvTwjp1MbgjrKrTI5eMe0yrHyI/JuFC7mqWEIW+pNuO7GYB
taA7C27Yod+pvaGbiacVpzRFZMXaiDxhE3/DuxjQ3wD4decVzPGMh3adHmAhISCM
LMwHxo0IwTZTZPubNkLRuymqy+r5bGYNd8LkNdy2pVs0awL/JkfkIQTNkMD97/O9
9giB1qsTILOXPeD2nI/xHlQvYu8nmwldvefoh+c815Ym17IaVRrXCZwqzudVBuvu
+xUM2rpbLEXtqrIK6g18q8rWdpO4wHFJcqrcjX8fzdaMOPpSDVxD7TESYLt8rQ70
IwylYJxXWR7yR2YfOAv5x8tLTzbxkju/NU8TXBooVDoqiZGl9wNOFbsjhr2VCxQs
u97ZCPtSZ3x4a2yFlVMHBStYPz4XZUA451oncHfju3K8tviyaTQ=
=Y3Mi
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--

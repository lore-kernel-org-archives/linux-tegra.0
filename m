From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 03/10] PCI: dwc: Move config space capability search API
Date: Thu, 28 Mar 2019 13:33:20 +0100
Message-ID: <20190328123320.GA5518@ulmo>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-4-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553613207-3988-4-git-send-email-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@socionext.com, yue.wang@amlogic.com, shawn.lin@rock-chips.com, xiaowei.bao@nxp.com, linux-pci@vger.kernel.or
List-Id: linux-tegra@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 08:43:20PM +0530, Vidya Sagar wrote:
> move PCIe config space capability search API to common designware file
> as this can be used by both host and ep mode codes.
> It also adds extended capability search APIs.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 37 +------------
>  drivers/pci/controller/dwc/pcie-designware.c    | 73 +++++++++++++++++++=
++++++
>  drivers/pci/controller/dwc/pcie-designware.h    |  3 +
>  3 files changed, 78 insertions(+), 35 deletions(-)

Just out of curiosity: is there any reason why this driver needs to
reimplement this? Couldn't this be made to work using the standard
pci_find_next_capability() function?

Other than that it might be a good idea to split this into two patches,
one that moves the existing functionality to the common code and another
that adds the extra functionality.

Thierry

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlycvwQACgkQ3SOs138+
s6FSHRAAiqfW9pZdlTMf93D0kyVYmJif0pMQT9zO40TPg/fOvnaoMv0VQaSweuGk
GuZEgZFflhDhQlpu+p9FC58xyabumnSxpuo9Zqlo9VMoClzkmOmNMng4kYFSGcmG
zKyzoVCOlwgp1yuDeZYJsXfpCcH+IFcnnYGp0+WO4HGqMcGM1VfYhNJs98TFJHaj
QrUdDrlw54VTiZzZKlqHDAEPtT9QW/u1jHhjPGESPkkW7gJiK3k718eEhNATx1DJ
cE+fMzbhitGvPB2sNJFWqFRIw43ff8qnsdKqKVTK6Fcx+13wSRz3GPtiGqbu3lwe
hkz6mo0GT/VKXRlkes8y6n93sUqlndeJAg2WJKhBahgqJVitl9aVzWt/8qzr+FDG
a4Anyw8h88Mc1MYdBhNE3Fedsm/q324bqCpmcmemLPZmy4tVCeMAu8XuagZq3txg
HZGzugRI2Avuvq4iJ9hqc6EAPOOja48OUVzQNO7H6ht2qLKeGVeEq9hGuqI0/dYW
H7djABdlbJTk4qL0Y1aEzc2y66mDkYrAniRbtH7wBcoVJ8kcNT7l+k99hkSDQUxQ
HZA4HbWEEaOhP7vHs9JWgwtLpgIDAy7gMRJ4drabe02YlSgm5+RAO7SqlIxD9Trh
t0QXl1CjjHzbqF1coa8XLFirUWskW9p9Y3H86pkuULFyCbjMllI=
=OOta
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--

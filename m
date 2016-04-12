From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: tegra: Rename some bindings for
 consistency
Date: Tue, 12 Apr 2016 17:08:21 +0200
Message-ID: <20160412150821.GC25160@ulmo.ba.sec>
References: <1460383086-26957-1-git-send-email-thierry.reding@gmail.com>
 <1460383086-26957-2-git-send-email-thierry.reding@gmail.com>
 <570C4F2F.8050407@nvidia.com>
 <570C5CD6.2090700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570C5CD6.2090700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2016 at 08:26:30PM -0600, Stephen Warren wrote:
> On 04/11/2016 07:28 PM, Joseph Lo wrote:
> > On 04/11/2016 09:58 PM, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > Device tree binding for NVIDIA Tegra have traditionally carried the
> > > "nvidia," vendor prefix in the filename. A couple of odd ones don't, =
so
> > > fix them up for consistency.
> > >=20
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >   .../devicetree/bindings/ata/nvidia,tegra-ahci.txt  |  32 ++
> > >   .../devicetree/bindings/ata/tegra-sata.txt         |  32 --
> > >   .../bindings/dma/nvidia,tegra20-apbdma.txt         |  44 +++
> > >   .../devicetree/bindings/dma/tegra20-apbdma.txt     |  44 ---
> > >   .../memory-controllers/nvidia,tegra-emc.txt        | 374
> > > +++++++++++++++++++++
> > >   .../bindings/memory-controllers/tegra-emc.txt      | 374
> > > ---------------------
> > >   .../bindings/thermal/nvidia,tegra-soctherm.txt     |  67 ++++
> > >   .../devicetree/bindings/thermal/tegra-soctherm.txt |  67 ----
> > >   8 files changed, 517 insertions(+), 517 deletions(-)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.txt
> > >   delete mode 100644 Documentation/devicetree/bindings/ata/tegra-sata=
=2Etxt
> > >   create mode 100644
> > > Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt
> > >   delete mode 100644
> > > Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
> > >   create mode 100644
> > > Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-emc=
=2Etxt
> > >   delete mode 100644
> > > Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
> > >   create mode 100644
> > > Documentation/devicetree/bindings/thermal/nvidia,tegra-soctherm.txt
> > >   delete mode 100644
> > > Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> > >=20
> >=20
> > Hi,
> >=20
> > Could we use the "-M" and "-C" option to detect the difference if this
> > is just rename or copy from the original file? That way we can still
> > remain the connection of the history log that we can still check the
> > file history by "git blame".
> >=20
> > If we do this by deleting and recreating the same file content with
> > renamed filename, we will lose the history log.
>=20
> When this is applied, git will actually realize it's a move not a delete/=
add
> and maintain the history just fine. It only looks like a delete/rename in
> the "git format-patch" output when -M/-C isn't used.

I've resent v2 generated with -M to make it obvious that there aren't
any changes to the binding text.

Thierry

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDQ9iAAoJEN0jrNd/PrOhzysQAIEdgNIUae7PHel3eil0uhJq
EspUa+3MK74Hlah00Z/th0Pb2+XniDxd5bIkGTvIbJrrOroV5nG8eqCKUCMOl3mn
LhiiCTqJUQLUFKEyz34xPj3bTFc0PoAxsWPmtY60iempLtHAwKSGU+cKU3Vx/59h
GFfhkKfrc6yPGGTaRUz20QG2thySDc7ivx9LOOPehqXAdRWi/6vGonNsbjm8Kwqp
sHBsPBjf7oiL4cLhvAroTw9jn/GcPFBKE+8JfYyq2i49PBn4CpDzDC1Ms/kOhTcZ
et68qHT92KYj1lL7jU2PdhGnMgA2HwSrFewz3HMtgbCE6XANTONgolntcoBJw9/6
O+yQ1ennVM7FPnsziKajKYcWUV5cXNuoHwfiXdjy2oDiD+149yIri9G7usmKPGC0
1sUn9oSZniuNRc+WWQli5FbTUbtYsKIGuz2XnaQz9prK+xe61UxAC8wuKIas55dZ
IykfU9XTG18ygQsgk0vHms59oTJtGsv/+t0NevrsAujko1T7rtk/4PAV/Sc8MgEd
ZVhsMEV1J/qLmVuwoxJ/fm+3JuoHzVtXC7lwLvf/FtNQXwhk7fGcL+QNzqVjKSmG
Zzf/mxMNcBp4u3/y//ySWfRWAMiQhFMpaa5Hm1k+zdR/x8adUN3uswgdv4yj73wC
ayzAp5lc1nRNnvd4a1J7
=xVZh
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--

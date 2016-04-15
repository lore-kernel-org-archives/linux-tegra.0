From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: tegra: Remove 0, prefix from
 unit-addresses
Date: Fri, 15 Apr 2016 15:41:02 +0200
Message-ID: <20160415134102.GB3472@ulmo.ba.sec>
References: <1460473656-27209-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460473656-27209-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 05:07:35PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> When Tegra124 support was first merged the unit-addresses of all devices
> were listed with a "0," prefix to encode the reg property's second cell.
> It turns out that this notation is not correct, and the "," separator is
> only used to separate fields in the unit address (such as the device and
> function number in PCI devices), not individual cells for addresses
> with more than one cell.
>=20
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt    | 2 =
+-
>  Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt              | 2 =
+-
>  .../devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt      | 6 =
+++---
>  Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt  | 4 =
++--
>  .../devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt     | 6 =
+++---
>  Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt      | 2 =
+-
>  Documentation/devicetree/bindings/thermal/tegra-soctherm.txt        | 2 =
+-
>  7 files changed, 12 insertions(+), 12 deletions(-)

Hi Rob,

Is this (and patch 2/2) something that you could pick up into the DT
tree, or would you rather have me take it through the Tegra tree?

Thierry

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXEO9uAAoJEN0jrNd/PrOhSRAP/0cm7E0E2Mwj8NLMf9I6n96A
wbhN1BhSZ3y3CGpykY9enQoeRZsVaAhONQwP8bdkgOYdB6R8rcUsPeFun3CNRNTZ
UtLfj86x82V0yQqF/Ca+UrLJYM6OLbKimMYII3NLbOOZH6XrnHrJQsiWWR9Q1Pww
39C02pPQ9NNC7NwK/OYJyqMiRbdi88ytd2xeCYytoVNW8vCbgXlgCfoEW2TJcMGm
7tHDLFh2xIcn4NTYXD86MfozMX6F3Q309gvYt9ZwJQSk6Mir6sJnanTxe/Nqkihq
4ztC+cSeaJUUN/0JGKxubf2gim5ybj4WAHoTJdBPeT0ttX6pmgJ1aN9366yY1a4S
7vp6/8NkiZTrwfoJcn0ngZOf3wae2r4vX0eKc50Ze0+BrBdQy2RjrEAvDMvhewpo
WhssgY7M2bkBuLPth+tbqt3fgQAdV6mGfeYYnBzEzdsMEnSxcaRErDq9+c7NjfOv
342Nu8zVGCEDwXrac1hNNT/3JF2nF9xcNPdW/QbqzyO7kUON0l0gp+ffQOQFttd/
WquNJQenrw7Cd3uDnZg94G/AnEy1vE0Iurh6I4L2GCDm3YwhCujJY5P/BIFsgi78
9vrtfLWKyLVkpObeeHwpycxrosrdEn1yb/lPydndA3oI23cbp1VZcFCtHw862Nnt
hGpH5AfgjFx1ROq2jktP
=Iemu
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--

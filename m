From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 03/12] drm/panel: add support for Samsung LTN140AT29
 panel
Date: Tue, 24 Mar 2015 11:27:09 +0100
Message-ID: <20150324102708.GC18115@ulmo.nvidia.com>
References: <1426672363-30667-1-git-send-email-tomeu.vizoso@collabora.com>
 <1426672363-30667-4-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426672363-30667-4-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-tegra@vger.kernel.org, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2015 at 10:52:18AM +0100, Tomeu Vizoso wrote:
> From: St=C3=A9phane Marchesin <marcheu@chromium.org>
>=20
> This panel is used by the Nyan Blaze board and supported by the simple-pa=
nel
> driver.
>=20
> Signed-off-by: St=C3=A9phane Marchesin <marcheu@chromium.org>
> [tomeu.vizoso@collabora.com: add device tree binding document]
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Acked-by: Stephen Warren <swarren@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  .../bindings/panel/samsung,ltn140at29-301.txt      |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,ltn14=
0at29-301.txt

Applied, thanks.
Thierry

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVETv8AAoJEN0jrNd/PrOh3N0QAJFXOILy5yQWubjFj6FVGkXV
ZCS+BeTB5+x2mRDnhDqyqU2cQPmcgbC5p5OqZSVW/JBKeKxfyDMVbvctXSeAeHBz
a7pIdpvJkBzZtX6DZ/1keGgWy/Sj+oKvo1clYtaFinuufIRNyN2HRB8nHoB1NNFx
kYQRij9vEXNWoKOpILWSo8ZfTFdWxQMXhDB+NJuL3G/ySLHUx6FqIHzLHOd2dCec
gER8GgQoARtd2uVO7j/Ch3nF4/WLHw8Sr2HinlZUYuJj65okUQ/xufBhmuzQfioU
hG4yX2dw3cu3I4bC5QuXJjNetdkijMly7EFi90ZxEWADHIap0bCeoXjd+6kqJSzL
O5Fi5dkUFd+8BHL3ZSgLrdDTP0sXqqd+oFIvb3ML9z/I8JkqpoxeoKquHtldTnub
X9tr4qP2LzR6TAg0KvrsRszlHHUBu/AIoNK1DJyqXubwl+vkaNqmOdWyYBBmjmIW
4I5ulKBChMDTGAzcXOZ8RfL4bP6HRnml0MnhvgG/YBNY9rRne3B3eGBBaKkfVIhU
Askfx5+nly5KphqQSR2p5H8ra0SYL72z+9982Bshkh4yBmCWBlXqIA2xyKEjyICW
eHhw+AqYD1t9xEeS1EyEbrmdsqdvls90G+P7jNvWeuKGAywd4wMsXKvFucN2PiqY
86yZuq+GehLSr4aIs6cS
=VKDr
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--

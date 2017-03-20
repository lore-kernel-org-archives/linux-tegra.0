From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: add Tegra210 special resets
Date: Mon, 20 Mar 2017 14:21:15 +0100
Message-ID: <20170320132115.GI22463@ulmo.ba.sec>
References: <1489582774-22217-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MFZs98Tklfu0WsCO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489582774-22217-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--MFZs98Tklfu0WsCO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 02:59:32PM +0200, Peter De Schrijver wrote:
> Tegra210 has 2 special resets which don't follow the normal pattern:
> DVCO and ADSP. Add them in this patch.
>=20
> Changelog:
>=20
> v2: add DT bindings file
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c         | 85 ++++++++++++++++++++++++++=
++++++
>  include/dt-bindings/reset/tegra210-car.h | 13 +++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 include/dt-bindings/reset/tegra210-car.h

Applied to for-4.12/clk, thanks.

Thierry

--MFZs98Tklfu0WsCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP10sACgkQ3SOs138+
s6GG3A//bWuGqGDLQcz7JjgQsAIQ584xtwX9xcvsF/aRJYwFyBq7YL+/h3b10Oeo
7Ggyg0gWdnUKg19wACRS0cJY9efE1stc0HE2PBJb6brWSN6geazoDacvp3zV6w76
ugjta6zmvd17A150faXamCdlzQGWjOH1/2zOyxOeyWNzfl84+G+lGnXaZtnt75t8
vTj6uPY2/Rd17PsfC/fsK73iMvlrdAyqSDp232XdyzrgbzUPdWJ7CWz8zf9I75Y5
QOPXvFrz1NGXvU4mjtatQOVTGjKLCX87e3gnY57PwCiMBY9U7LH7q4pM5wYGoobf
3MhrjoU31ZWSauOjRASiwI1n2W/r8llLBvZ2NbBKtR2uT5Dd3C6C5xZ3W4OcyRNm
b4dE78c3VELVkAU3bhTJARpL9kME3L1y6UHCI1ApWJCBJZyWX+QLMisFwDi9BgB5
xbE2vEuueIbENX9veQKaehPXQCqushfG7THPHK1iMADHGNxalmMhO1VtY9udEvee
dagiW2SUqWP7GjW14YVDlzfN6poTsDRVLCL+1PAE/ma4JRj1Sa67LV6mRiEXerZN
4pxDAaztKsnUEQMd6SQjCnQDG5WljWslLWHeJSZbTPko0zHxPs6HOTM6BEIs49RJ
ZPDMBc2PbxSJ0jLf10fL8tgeqT+aPeRgQSkD7NqYSoR/yjvHLjk=
=aJ1q
-----END PGP SIGNATURE-----

--MFZs98Tklfu0WsCO--

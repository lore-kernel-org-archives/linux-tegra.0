From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 08/21] clk: tegra: periph: Add restore_context support
Date: Mon, 12 Aug 2019 11:50:35 +0200
Message-ID: <20190812095035.GG8903@ulmo>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-9-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0qt3EE9wi45a2ZFX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565308020-31952-9-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--0qt3EE9wi45a2ZFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 04:46:47PM -0700, Sowjanya Komatineni wrote:
> This patch implements restore_context support for clk-periph and
> clk-sdmmc-mux clock operations to restore clock parent and rates
> on system resume.
>=20
> During system suspend, core power goes off and looses the context
> of the Tegra clock controller registers.
>=20
> So on system resume, clocks parent and rate are restored back to
> the context before suspend based on cached data.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-periph.c    | 18 ++++++++++++++++++
>  drivers/clk/tegra/clk-sdmmc-mux.c | 12 ++++++++++++
>  2 files changed, 30 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--0qt3EE9wi45a2ZFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RNmsACgkQ3SOs138+
s6HEfQ/+JkYMY0To8C0BvVEMjYOAPMPeZFfx7/M8IkLM4JwPwvZw244rHygPAm77
lhurKqNDxH+H9j4UCGHv+h65jojQnYjBr+o7vgX5XObgj77QINiiKDFqW7shzgtl
DiYq8icVRt5m7G4S5SurfoYq1iNWfFI63OxwLGMjTl9pGaewRtlDp09QWt/0gs32
Es6aFmFXuJj9hirNLbaIHNpoN6xh1zrkLTTzLIh77DCRwvPVHZLenYpKoCeuPV1w
+IYQGpG+uIIQEDGnPcCJrotPTIQ0+V9dKDuavpznm7TuHqacAwJLQiDCVFcssddG
kGSINiKeQv2hVgQMY2/PUVkwA5rNa0ClMlTkuQzYXuN/HpjW9hqDxgNtm5xE1Pbi
Au/T2Y8ejd+032DrW+E/pKOt8pS9vLXbIol1EOl7XMnjlOprbq85r/hKzIdbVOoz
84IQKIPEZAL3HEe3KkWlOzf3by1j6uCl3L4gUccHQIjCF3WsagRjsGgq+00pm38a
yGJ5qMqHt0FYsIw5WiTNCVThqxLdFHBLvm1dOT2s50dWvdmw6yJeY+aWcP4sGC3L
U9fd8JFRJ/c3BDBFL4dxtI8EPwc7LpnywrSYxjzjn1ZSkvnkqiqwYWxIPv97tOS8
r7WKKz/v6EfGGVRYYuav/O1x+LNrhi5a9wPtOS8e8JZaJ32fTD8=
=ISLx
-----END PGP SIGNATURE-----

--0qt3EE9wi45a2ZFX--

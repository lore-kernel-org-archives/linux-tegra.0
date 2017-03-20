From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: fix disable unused for clocks sharing enable
 bit
Date: Mon, 20 Mar 2017 14:15:02 +0100
Message-ID: <20170320131502.GF22463@ulmo.ba.sec>
References: <1488460925-16793-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488460925-16793-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--AH+kv8CCoFf6qPuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 03:22:05PM +0200, Peter De Schrijver wrote:
> In case 2 clocks share an enable bit and one of them is enabled by a driv=
er
> and the other one is not, CCF will think it's enabled because it will only
> look at the hw state. Therefor it will disable the clock and thus also
> disable the other clock which was enabled. Solve this by reading the
> initial state of the enable bit and incrementing the refcount if it's set.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-periph-gate.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thierry

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP1dUACgkQ3SOs138+
s6GkSw//W+tuYVVMEFwpdzx5QO1c55tW27vjpjogjh15EFaJvkJkmWBY6jfStHQe
T9l/pYl93dwTzP5UcRIZRAOMjABsorVn6cR9EA6uR6mqjsKm2oMotDPYcIZp1c/D
pyJkO51DAMhMye6RqH/hJNdT6zaftn1nwyTjGuoSvavTmC58juKQCpmt8YvQ6OdF
sK1AiGRk4juKlIUpSd5OyKnEYgpRQJyhEaUfs22N4rHsGK5wGAkVPizJg06alOuG
KQbrMaemt5bSWfrqSzIQW6X1slMKr1ASRKO4c1VHSJBQDXq8VF7wXlLRTMiPWbZZ
lTXBzt3V5NqcaCmuEzqcRzAxBZzvJ8vuoCDQBpL3LoXLzr7CO7d37zC3MvYYOdPo
PLJArFU+p/B3plzb2jFbXME/eqMCiXEYMYnU2CZQk8O6PvM5P7fIqqMlHFIOM5vR
SRLTe7bj9uSbO/Qf3wN9gkilfkJ0Gsj7W59FuoyhQEpeH+rGrDn6KLGothpoNmYR
AWRi2aZJ9ZtYVEUeO/vqdhgwL3YqYaqXNW5wGFLsFts0Ymn4d2WQPGnExwaXQxnL
Udg9ACMgMsU79gGdo0RAkorX+77zHQ6X3qSWN/bYcbVz+a0EX0D5rpsEdy1NU7UL
n6tMEcD9TLnl0oUbj06IIDk842jN9DxtRN2Vgjlcqu5mMALSF+U=
=zat5
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--

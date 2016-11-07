From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
Date: Mon, 7 Nov 2016 12:27:53 +0100
Message-ID: <20161107112753.GA28616@ulmo.ba.sec>
References: <1478507405-13204-1-git-send-email-mirza.krak@gmail.com>
 <1478507405-13204-2-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6423845510374872831=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1478507405-13204-2-git-send-email-mirza.krak@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mirza Krak <mirza.krak@gmail.com>
Cc: mark.rutland@arm.com, gnurou@gmail.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, swarren@wwwdotorg.org, linux-kernel@vger.kernel.org, pdeschrijver@nvidia.com, sboyd@codeaurora.org, linux@armlinux.org.uk, jonathanh@nvidia.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-tegra@vger.kernel.org, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============6423845510374872831==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 09:30:00AM +0100, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>=20
> Add TEGRA20_CLK_NOR to init table and set default rate to 92 MHz which
> is max rate.
>=20
> The maximum rate value of 92 MHz is pulled from the downstream L4T
> kernel.
>=20
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>=20
> Changes in v2:
> - no changes
>=20
> Changes in v3:
> - Added comment in commit message where I got the maximum rates from.
>=20
> Changes in V4:
> - no changes

Applied, thanks.

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIGU2AAoJEN0jrNd/PrOht9AP/0roeEvmAvdXBNDHsabHt6md
rTyHNMy4pyI/nrV6UJCqDZdsyd90r02hclwT8wSzRUqlb8Nb6MkoV399An5TjDp7
iuIj/ENZ2U2Zy/wsiDuOvs+j9Yx5AII9fabPc635rkjgarTkTmgVXOh4i7KWfqEC
dAogdbbcsVNnmigmU/MY0nHwMyRqTQg/0oifcSnnncdtHq/U8UFkqx78GAmAI6gp
7hecLkzALHq133LzFD+d4w9iAH+yuNac0L5/IgzMFlSul7Bna1Wq3sIxtanMhYCu
2ff6l7GXfF2m2hNG5W3MrN6dh3LjoXkqCQLWoeYCbI63js3c49UvPdg2si2VIP9I
Weqx8/RKafOCwkcCSdCYCjatoA7ru6lrnv0ZQeuNg+bNEUEWYuBQbnhnQtx4PNXc
O5xlw0Fw3nJ6ga8A46AUdqRvOk+Qv1wNaAU6Grx8Mw69dVmsuxXqsE9v5TCFwotZ
M2zliYjMsKO3/pk8U4R2Z3CbagG91FNs9nJyaM1av3tp/lU6OzWWmbKQfEQ8lepZ
Q3BlnsehHJ65CvIbx3GLp789q0QfllyL9D3tYMkm8wFn3vQ/yDDH19R2ONsGiN87
PLLI13BmK96omNhq8sTaPxb1vNnIJjtewoyavHJTjbyL1ygCrpAVCeAyieM7+Rh1
CzaYifKKB3m4BEDWInb9
=CBbR
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--


--===============6423845510374872831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6423845510374872831==--

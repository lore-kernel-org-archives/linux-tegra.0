From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: tegra: Add supply for temperature sensor on P2888
Date: Wed, 3 Apr 2019 18:44:38 +0200
Message-ID: <20190403164438.GB1837@ulmo>
References: <1551197275-8977-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4886747560968068056=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551197275-8977-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============4886747560968068056==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2019 at 04:07:55PM +0000, Jon Hunter wrote:
> The VCC supply property is not populated for the temperature sensor on
> the P2888 board and so the following warning is observed on boot ...
>=20
>  lm90 0-004c: 0-004c supply vcc not found, using dummy regulator
>=20
> On the P2888 board, the VCC supply for the temperature sensor is
> connected to the 'vdd_1v8ls' rail. Add the 'vcc-supply' property for
> the temperature sensor to prevent this warning message from occurring.
>=20
> Fixes: 8b457812f54b ('arm64: tegra: Add temperature sensor on P2888')
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.2/arm64/dt, thanks.

Thierry

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyk4vYACgkQ3SOs138+
s6FUEQ//YuT+Fpg6a53SNAHGjxJG1EySQgWf7edGCG8qaJZeOy54tpJfCz/EJBk7
2LP63gFfkJzdwpPRgh2jJABHaKBrTJwYihuHj5vfIvzlhrg3hgLN8Qx6Ki523y5L
fRVnTww43Wa7j+4fSxoYHyqsfe1ong0dbWbCVlayLAtoXnhPWC31xDT0rq2UanTs
idUNr19yiVaHxs+Wo0gLcR33BfZi2oa+RjrpsrySnyy71iG33EjjLTUH4Xq56YQk
yeJeSPyscvteQkzYgber7+FNT8hC/LtCcDkLtAu95/dyoqVrQbBSQqsIoMSLe0ol
ZdGidhN5a/SErsaq1Qe3gOkwztvg58bztFJZr7/cwJcZvb+fHU94hlNRVNkq+mIR
dFWH7qkvTHN10A+KEsbqayMOfFVfJA6elg3ufdp3udPV6jNZiBufHE6UlAO1ELuA
gCIh+UoV8Bj6YGKPlu73wLwH2UnhsPMvCDmpszBICJ8AcT2ctfKYvOTFvLifB6JD
7mlDbYgVQPLVMoVZNeyaJSAZ55zcJDCZNFbGMQFYpZFR/ZRvXDA7afMd0uqOC2ZE
r1A06L8dGvQs7LGOPvNYnpxGN8NYLrCxcNETlf/Aipsbu3Zn7AxMZ3P7zvkcn1hd
RbeT7uIAbE9kPfClm14se08Jh1oXRez2/vUYQl7BzJbRuU0TgKo=
=Tq16
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--


--===============4886747560968068056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4886747560968068056==--

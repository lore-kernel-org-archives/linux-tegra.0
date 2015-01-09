From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: Fix unit address for Cortex-A9 TWD timer
Date: Fri, 9 Jan 2015 11:46:33 +0100
Message-ID: <20150109104632.GH27845@ulmo>
References: <1420719873-9820-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0655706930618802186=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420719873-9820-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============0655706930618802186==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Gk0KcsbyUMelFU1"
Content-Disposition: inline


--/Gk0KcsbyUMelFU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 01:24:33PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The Cortex-A9 TWD timer has registers at address 0x50040600, but the
> unit address was 50004600, most likely a typo.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 2 +-
>  arch/arm/boot/dts/tegra30.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I've applied this to the for-3.20/dt branch.

Thierry

--/Gk0KcsbyUMelFU1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUr7GIAAoJEN0jrNd/PrOhf4MQAJXfPT+qJvWSyJVAkrMC0tU7
Mbn6+x3N+wNnaSfirpgcieM8xkcNf/xAw07zYimnLNtIKustFiP6ror93zcEhTIM
lDVCbax9Au0epx50eKmCLx6r+0S7Sn6cOjFHmdrWx1PijfLstPuY8lMqd4JUfpi+
NU3IN/keofjANmZQ/Vy7I3KrVk5joK40RLwPjD0gPhvf7hB957jlveYEBcZkGns6
kXWa8Ln32juz/KFyKf1rjgc+8VZznTfwk1xv1E282cbln7pbICnTXIcxL8XG0axV
cRZEz73ExEugZq2ICcuZ5LnroTSzPONDNb5dkDv+/+lcf2l5TfQzIyikCCyGlyv9
Fxp4qjn1HSBSJcTWHmFpTgkVvljMyAvakzfas4QuCFcxTkqTo2wjX1LZWnrZwJb+
D4/nHh1rMu4UaWny2FLqkiweLslP3OTPCC++nlPvcezpnL8KaT2BCSXZ3BpcLbup
vSpIY8dq2xHxcAoGvRFsWWOwviIzuUOW+SGrc40xOllh18k+1f5+uzpZEhAwcVmR
6h8IWkVPkV7zJbBW3belRPk0qVzeza/ewpvxxOXAnIw7uXRuAP095/ma1DGPjiDs
VDeHzMDPVPh/AGQQ/AJOYrw1wcGToyjR+Yz6wpYksgpebJY10Nc0ZTFcFY9/TP1b
WsWbkl1VNp3gnnHS6CMu
=hv9N
-----END PGP SIGNATURE-----

--/Gk0KcsbyUMelFU1--


--===============0655706930618802186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0655706930618802186==--

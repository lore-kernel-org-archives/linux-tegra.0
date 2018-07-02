From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/5] arm64: tegra: Enable card detect for SD card on P2888
Date: Mon, 2 Jul 2018 15:56:51 +0200
Message-ID: <20180702135651.GK13096@ulmo>
References: <20180620125406.11906-1-mperttunen@nvidia.com>
 <20180620125406.11906-4-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8142629256813893886=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180620125406.11906-4-mperttunen@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: mark.rutland@arm.com, vbhadram@nvidia.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8142629256813893886==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M0YLxmUXciMpOLPE"
Content-Disposition: inline


--M0YLxmUXciMpOLPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 03:54:05PM +0300, Mikko Perttunen wrote:
> Now that we have a GPIO controller, enable the card detect GPIO for
> the SD card slot.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

Thierry

--M0YLxmUXciMpOLPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAls6LyMACgkQ3SOs138+
s6FUOBAAlL/tHs+wse55njWbh66T6971yYYpsySgdbfQelXZrVzvJKUlXw17wWIh
xKWd2/Z4vMGkct8ENoqskyC5/3d8RrHJvcesUcZfG2MyGFuZx6GrKO6hMqZYF6m6
jnoaOOxC9rqkZLvnyH6TvdI5KSXJjQeByrhnVpmx05QBwFYeDmMy+gOqdlQ/ecLD
Fy+c9YCfVmNbQvxEa7tBbqfEFUeQIGoW2Q8lO35+RPwyaGAlGriteq5RHDu1fAXY
zOhiaObpwQ4sSKMGGCOJLULVkaCO7dIFcVmjVYYA5tFBK6PMCM+WCVQRNrSxh2l9
oVhUEHrAoi29xvm9uZ977wdhtjcr89Des5a4qLsmVNGcBrKzrp6AAjc03uuinVUK
VfmhMa6+4AOxiZ0LBLnz5d4DaBce3Z54ZHX2L0PMOOQ1S9Z1CNa0XLqDmsV3GEn1
4gJ/C4m2aNAvhIJg/A2cQdDUFjh4I/Oh86JB6wyTmxHO2ASewxE48yBbatxjHdcx
Dhnw905fhjM2/gFdi9ZMKYovVDWwFMdMQGPFd/bVMsZlr1cVR/9m4E13Tq8dcOrc
a8UJdu/Qbq66uOzct/2sY+3/PibVUyVBuF5dKVLjdIvcUN0sHckDMUiQlX+cE4as
UsM/hGpLnGrH/PvYa0Jft4soPIVKjGIMZq/18cyhRG8R281VcFU=
=/j+E
-----END PGP SIGNATURE-----

--M0YLxmUXciMpOLPE--


--===============8142629256813893886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8142629256813893886==--

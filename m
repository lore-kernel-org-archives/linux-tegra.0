From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Add PWM Fan support
Date: Wed, 3 Apr 2019 18:48:22 +0200
Message-ID: <20190403164822.GC1837@ulmo>
References: <1551282819-27274-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5877716074636556494=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551282819-27274-1-git-send-email-jonathanh@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============5877716074636556494==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2019 at 03:53:39PM +0000, Jon Hunter wrote:
> The Tegra194 Jetson AGX Xavier board includes a PWM based fan. Enable
> PWM fan support in the ARM64 defconfig to support the fan on this board.
> Please note that the device-tree PWM fan node is already present for
> this board.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.2/arm64/defconfig, thanks.

Thierry

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyk49UACgkQ3SOs138+
s6ExUQ//S48YrC9/uUpJwxQSFMXG+8pIxs/tDgml6xtBdNdZoEZupYOTEA3gQ6TD
Rv7Lu/k1Xw/I2GJtfiTejafvf99lBC7HxbveSYqC62YGDu6fuf1N4oBKLBYPd+g0
LeVnI/CjxJiQpzOr8KxfY7tmlQyW3UdNY3TJcb4ZSmLb9s1deWg7AVw0wxjvOKqF
kLTgo4MzVi2LjsAg/pv8tT8CbvRZMJna/R4ndJDTfCw5QLE1GqRMztu6uTSajp1r
uBkGmO+hLz1Yz9c0+mBHDDbYWI2li0fUxymjEOYI8lL4JDhKv8224+PMS6zomVoW
tsZcdgl804DyjZm3diAK8ZpDe3RqFRhPGSmOzZcH6JhbHFI2KCjQtKfJcgbPhyuH
gY43VgHxeZvZywMqPobza89e1eaavsns1q83wW35g6xit7cDb0nfpFU5070EYlPr
9eKSkJduwDd6MYk2QSRxt1TWIiGtnlh/9c70iq8ccm+uZOU4SqM52BJsuXE1qCcs
eRvlZ2JpNxBw9A4ywjAeOm9KR3FzTAlh3RS/HkN72xFNOJdVUfjufjpB2odX256/
QCJ5+eg9HQ1OmRZgPUxPczxgevE9QHXmwegM0uXyXskwdJngSvP8ugHLIjPY/DAn
x70z2TAX4hfheG9VuP7dDKkLgPgoUccA3Mmm98J2kAASRbVaqMU=
=tPoX
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--


--===============5877716074636556494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5877716074636556494==--

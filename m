From: Thierry Reding <treding@nvidia.com>
Subject: Re: next-20190215 build: 2 failures 19 warnings (next-20190215)
Date: Mon, 18 Feb 2019 16:08:54 +0100
Message-ID: <20190218150853.GA21119@ulmo>
References: <E1gukSa-0003kX-JD@optimist> <20190218113217.GA10794@sirena.org.uk>
 <20190218120921.GA11524@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5074390175044677547=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190218120921.GA11524@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Jassi Brar <jaswinder.singh@linaro.org>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

--===============5074390175044677547==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 01:09:21PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 18, 2019 at 11:32:17AM +0000, Mark Brown wrote:
> > On Fri, Feb 15, 2019 at 08:51:48PM +0000, Build bot for Mark Brown wrot=
e:
> >=20
> > The build failure with mbox_fush() in the tegra-tcu driver that was
> > initially reported two weeks ago is still present in -next (this report
> > is from Friday but it's also present today):
> >=20
> > > 	arm64-allmodconfig
> > > ERROR: "mbox_flush" [drivers/tty/serial/tegra-tcu.ko] undefined!
> > >=20
> > > 	arm-allmodconfig
> > > ERROR: "mbox_flush" [drivers/tty/serial/tegra-tcu.ko] undefined!
> >=20
> > Is there any progress on getting a fix merged?
>=20
> I can take the fix in my tty tree if I get an ack from the mbox
> maintainer...

Maybe we can do the below until Jassi picks up the proper fix. There is
no hardware currently where we'd want to build the TCU driver as a
loadable module, so that would be fine for now.

It's a bit of churn because I'd want to revert that later on, but it's
not too bad and would get linux-next back on track.

Thierry

--- >8 ---
=46rom 5086e2ac9359c8d24d88ce1beeb7651e00401e1e Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Mon, 18 Feb 2019 16:04:49 +0100
Subject: [PATCH] serial: tegra-tcu: Do not allow building as a module

The Tegra TCU driver relies on a function implemented in the mailbox
subsystem but is not exported. To avoid link errors in builders, don't
allow the driver to be built as a module. The proper fix is to export
the mailbox API, but until that happens, use this quick fix.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/tty/serial/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 72966bc0ac76..e46a285fb8bb 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -336,7 +336,7 @@ config SERIAL_TEGRA
 	  and better performance.
=20
 config SERIAL_TEGRA_TCU
-	tristate "NVIDIA Tegra Combined UART"
+	bool "NVIDIA Tegra Combined UART"
 	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
 	select SERIAL_CORE
 	help
--=20
2.20.1


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxqyoIACgkQ3SOs138+
s6FavA//ZGQbR41Zzxv8ddgHuU1y7idmziGiXRwq674B42BoR0Q8EwjF0QIAvIbc
gub66MtH1VjnnWKp3cuLG4viwZARyerqYrgHkKFwEyPEEjvi5wTQTy4ZiQtktj39
CtazwNdXFXyNXuuQMS+/3IVg6zotewXvaezwFJ6699j7IN8a1GIT+IVO1AYTRotv
RCHupMM2rVkNRcX1dTUWVpcX4zmSIItGjd6R2nad5gi6Dj4wjwlxzMQC5pnFiAkh
QlCyGB03mogKEk0MKfyy0Xr/ohgIN6M78BGgunukFy3JixyJclpB+8zVJ6a+cKPj
EuN9E41OXGFXpVdCnhmmAR1scYdD0+MAEDl4bBc7Hp7O7A9qmHTNACLOqqTvhG02
8bpZU5sjjdfvAl8OqZggadad5UrS8aj3JBVcEX5LEy53EoIzfz3B2O215MCHj20W
npPEZL7Fk/6Op+Dzy4PCQHIF5Iw4EE/+3Ca6t124zESD0pWXbyIeTmRJgLDajX54
UyBIipZabLxCUVX2Pc8/oR3zaFaF/06r7R2ZQMNSOg1bhhS2Bq58/U6E43AHV4D5
6YVJ/wqhlG+k6e/o3AgWsrZ6zHKmjHvlDjEjx/CkWXmAN4FT4llwVRgJE/TYdGb/
ba3iVtbQJPZYUArxuAruZatntgSFVKzJ/R84CqLzUaltuPQj+JA=
=sPxq
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--


--===============5074390175044677547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5074390175044677547==--

From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20190201 build: 2 failures 19 warnings (next-20190201)
Date: Sat, 2 Feb 2019 15:23:40 +0000
Message-ID: <20190202152340.GJ20797@sirena.org.uk>
References: <E1gpgTf-0002ZN-NF@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6822374599801915661=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gpgTf-0002ZN-NF@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <treding@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-tegra@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-tegra@vger.kernel.org


--===============6822374599801915661==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ONvqYzh+7ST5RsLk"
Content-Disposition: inline


--ONvqYzh+7ST5RsLk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 01, 2019 at 09:35:59PM +0000, Build bot for Mark Brown wrote:

Friday's -next fails to build an arm64 allmodconfig due to (among other
things):

> 	arm64-allmodconfig
> ERROR: "mbox_flush" [drivers/tty/serial/tegra-tcu.ko] undefined!

since that symbol isn't exported by the mailbox API.  Either the driver
shouldn't be using it or we need an EXPORT_SYMBOL_GPL() adding.

--ONvqYzh+7ST5RsLk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxVtfgACgkQJNaLcl1U
h9BsKAf/Z6iYF+BgN8DfIusRTt8yh7ByRZhzG/sbm/VGBbavEWTm3aYiYqQxqvAW
kBBM4m4+bLTtq5YJuDVbc3eycZHYVcVkfz8COH2jtg+Q5PbCmJUrR1o0QAzebBAe
wuwqPgitfFKY0tbwl3cR+HkW75iZTGiV/S7gyU10qZMbHga/ggMQAWqnnVgcdKkI
H3oZijOAI734uNepeFgHn4xhI0gn5KQyOFaTe6aE15cWQMPW1b64b99P+rnNwQin
UfO+2ZRtj40mm/+fnVJSTHAy0k3qRtPdpXDD4KdM8pOAWNl3Tw35Ba103g+phuom
y6EKFaSlL3YGQD5P/D3W1kdamn3dSw==
=3mWK
-----END PGP SIGNATURE-----

--ONvqYzh+7ST5RsLk--


--===============6822374599801915661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6822374599801915661==--

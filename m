From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20190206 build: 3 failures 22 warnings (next-20190206)
Date: Wed, 6 Feb 2019 18:24:31 +0000
Message-ID: <20190206182431.GH17630@sirena.org.uk>
References: <E1grRJi-0002vu-FB@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3402228840397754213=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1grRJi-0002vu-FB@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Christoph Hellwig <hch@lst.de>
Cc: linux-tegra@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-tegra@vger.kernel.org


--===============3402228840397754213==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cW+P/jduATWpL925"
Content-Disposition: inline


--cW+P/jduATWpL925
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 06, 2019 at 05:48:58PM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 defconfig and allmodconfig due to:

> ERROR: "dma_direct_free" [drivers/gpu/host1x/host1x.ko] undefined!
> ERROR: "dma_direct_alloc" [drivers/gpu/host1x/host1x.ko] undefined!

due to 7a0658caa44d01 (gpu: host1x: Use direct DMA with IOMMU API usage)
which adds usage of those non-exported functions.  Either the functions
need exporting, the driver needs to be built in or those functions can't
be used.

--cW+P/jduATWpL925
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxbJl8ACgkQJNaLcl1U
h9AY5ggAhWZA+Gg7sWeyjCK2NVsA0vfe0NshzyIG8YwPxzB3qnzHEiBPY0QbbnyC
uU10Eoa0QniVTyn/Ui4X91WTGlR0VuPqzRUmi618FuffvB1J9qVCEaz2nsWMEpnS
sq/kyGskh0c0aW7rsWvI4CaGZ4eXxAVMdHcQ2R1epIc+8z/VfyaP0+EMtPFmDUxb
+QvlXWub6BE8eg2hxxo0ZdqPbhPT+mjBiXPv9UwXLRRvjB5bSd5874CBZwcb3crW
WPmulLtUH7llC4aPGSuNsq6Bkv2bUu1+ZQiR6Gj+oxPxVqeYZoJS5huhvsXlgW7o
5RXZ4zwm3VWbvNM+RaNFoK3orfyjQQ==
=ZFJz
-----END PGP SIGNATURE-----

--cW+P/jduATWpL925--


--===============3402228840397754213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3402228840397754213==--

From: Mark Brown <broonie@kernel.org>
Subject: Boot failures in -next on Jetson TK1
Date: Sat, 26 May 2018 11:36:29 +0100
Message-ID: <20180526103629.GB1564@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6979172755071992187=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: Stephen Warren <swarren@nvidia.com>, kernel-build-reports@lists.linaro.org, khilman@baylibre.com, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============6979172755071992187==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Currently -next is failing to boot on Jetson TK1.  The problem looks to
be the Nouveau driver, during initialization it reports an address
decode error then starts printing error messages saying "nouveau
57000000.gpu: fifo: SCHED_ERROR 20 []" over and over again.

I've pasted the start of the errors below, you can see a full log and
more details at:

   https://kernelci.org/boot/id/5b0882a259b514339779a881/

The warnings about Spectre are a separate issue and don't seem to affect
the boot.

[ 15.194484] nouveau 57000000.gpu: NVIDIA GK20A (0ea000a1)
[   15.200109] udevd[109]: could not rename interface '3' from 'eth0' to 'enp1s0': Device or resource busy
[   15.206399] nouveau 57000000.gpu: imem: using IOMMU
[   15.315122] CPU2: Spectre v2: firmware did not set auxiliary control register IBE bit, system vulnerable
[   15.320021] nouveau 57000000.gpu: Direct firmware load for nvidia/gk20a/fecs_inst.bin failed with error -2
[   15.384841] nouveau 57000000.gpu: Direct firmware load for nouveau/nvea_fuc409c failed with error -2
[   15.393972] nouveau 57000000.gpu: Direct firmware load for nouveau/fuc409c failed with error -2
[   15.402679] nouveau 57000000.gpu: gr: failed to load fuc409c
[   15.409434] CPU1: Spectre v2: firmware did not set auxiliary control register IBE bit, system vulnerable
[   15.419398] CPU1: Spectre v2: firmware did not set auxiliary control register IBE bit, system vulnerable
[   15.482568] tegra-mc 70019000.memory-controller: gpusrd: read @0x00041200: EMEM address decode error (EMEM decode error)
[   15.491232] [TTM] Zone  kernel: Available graphics memory: 375202 kiB
[   15.502768] [TTM] Zone highmem: Available graphics memory: 1030050 kiB
[   15.509290] [TTM] Initializing pool allocator
[   15.513658] nouveau 57000000.gpu: DRM: VRAM: 0 MiB
[   15.518451] nouveau 57000000.gpu: DRM: GART: 1048576 MiB
[   15.526546] CPU1: Spectre v2: firmware did not set auxiliary control register IBE bit, system vulnerable
[   15.527290] tegra-mc 70019000.memory-controller: gpusrd: read @0x00072000: EMEM address decode error (EMEM decode error)
[   15.537050] CPU1: Spectre v2: firmware did not set auxiliary control register IBE bit, system vulnerable
[   15.546928] nouveau 57000000.gpu: fifo: SCHED_ERROR 20 []

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlsJOK0ACgkQJNaLcl1U
h9COzQf/dyCtDrq/S2RQZ9kMWqG3X6lurKydRHt+zj9KcPuxLYKWYYzrXWrWw49n
HPZDIx6bkRs/5cpMQzZ/PKCxtJUq2sd1IVAh64a6FMtmWveCzObqlf4pFx01fATt
nDT2qR5hdR+6LN1WVbfS+b5w8ALfPb218j+oXJBQ1NcJGH5fZNKJbCzeNbbGWHw8
T2KXk7hvFL8PxzO6IlxUsGQ1lYEYlNRODf5ZZAtPcnuyPi6p/jH2h1OQrsRGum//
hlTazyb6ekbqKP9hedLpSMecauQ0Ts0eDo7gTeA93eE4FE0PTe/7SzahfeUE8csu
3eGG7K3HIWYniAQ/M25pZoLXnqbAnA==
=g1T9
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--


--===============6979172755071992187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6979172755071992187==--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Date: Fri, 13 Dec 2019 16:10:45 +0100
Message-ID: <20191213151045.GB222809@ulmo>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1849416108=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============1849416108==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 12:25:33AM +0300, Dmitry Osipenko wrote:
> Hello Thierry,
>=20
> Commit [1] introduced a severe GPU performance regression on Tegra20 and
> Tegra30 using.
>=20
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?h=3Dv5.5-rc1&id=3Dfa6661b7aa0b52073681b0d26742650c8cbd30f3
>=20
> Interestingly the performance is okay on Tegra30 if
> CONFIG_TEGRA_HOST1X_FIREWALL=3Dn, but that doesn't make difference for
> Tegra20.
>=20
> I was telling you about this problem on the #tegra IRC sometime ago and
> you asked to report it in a trackable form, so finally here it is.
>=20
> You could reproduce the problem by running [2] like this
> `grate/texture-filter -f -s` which should produce over 100 FPS for 720p
> display resolution and currently it's ~11 FPS.
>=20
> [2]
> https://github.com/grate-driver/grate/blob/master/tests/grate/texture-fil=
ter.c
>=20
> Previously I was seeing some memory errors coming from Host1x DMA, but
> don't see any errors at all right now.
>=20
> I don't see anything done horribly wrong in the offending commit.
>=20
> Unfortunately I couldn't dedicate enough time to sit down and debug the
> problem thoroughly yet. Please let me know if you'll find a solution,
> I'll be happy to test it. Thanks in advance!

I suspect that the problem here is that we're now using the DMA API,
which causes the 32-bit ARM DMA/IOMMU glue to be used. I vaguely recall
that that code doesn't coalesce entries in the SG table, so we may end
up calling iommu_map() a lot of times, and miss out on much of the
advantages that the ->iotlb_sync_map() gives us on Tegra20.

At the same time dma_map_sg() will flush caches, which we didn't do
before. This we should be able to improve by passing the attribute
DMA_ATTR_SKIP_CPU_SYNC to dma_map_sg() when we know that the cache
maintenance isn't needed.

And while thinking about it, one other difference is that with the DMA
API we actually map/unmap the buffers for every submission. This is
because the DMA API semantics require that buffers be mapped/unmapped
every time you use them. Previously we would basically only map each
buffer once (at allocation time) and only have to deal with cache
maintenance, so the overhead per submission was drastically lower.

If DMA_ATTR_SKIP_CPU_SYNC doesn't give us enough of an improvement, we
may want to restore explicit IOMMU usage, at least on anything prior to
Tegra124 where we're unlikely to ever use different IOMMU domains anyway
(because they are such a scarce resource).

Thierry

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3zqfIACgkQ3SOs138+
s6EkaQ//bR2YjZwwKfYS0AbF9WisJVbGc2duOW0p2r2B2yUFBfc9z3iP2fSHrwLn
Xlgpjx7sfdkmMdGEKv0y1ApCeBvJPTIRSu8Oe/4mRxt6yy7iTf/eKGXCEuq7XPcp
0BpqQXNDSCIQ2dVEyJdO/QKEkjLivkjkBdHgc45sVCdZGIkn1l0roiSvu7RjVNRd
EP5dPJkz7kf7BB9C459+PHMnFAkGZH69HwTOyTN0onsny1VKS/qKneOqOcPXnMlj
WQMymiOeRJ0BsUw/bH4QwFMg4GT+LXjpaNmMUaycYJDUdSTHmIM6IL/tTvpW9Rgq
gNbrVhw1b2Txo24hk0ago8WN5HbzBsRIMbKOdIGSp8OQ0MAcIdoWszyQu7CjMUPb
TP1bHRf6qZSHvUoH52QjFxFeSD6yJrCjcUoUH69oImz9nUREJylh6+DcgVCPaq3X
1MPCNrDOb4rZn+2hs+i1H7CAaNwDmAePPad2UDtPew8ca2FS2/RBi/UJIIQPgbJV
XVOABeKINphN96S1i/UGsT9Axw5fHafo6iHycJ9NCxVmqWhaXfGqpX82chFt6zWv
zRIQyr27Imvh2hsL69tKN36YKs9biC6KWe4G7rpRb0GtosAgYS8LFBW/0SuU0plB
R0elDnXd2EW0J2ln4jVZmx6pKfk9YbHxHmVeLiRVZTHq/l9c/8A=
=MPqg
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--

--===============1849416108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1849416108==--

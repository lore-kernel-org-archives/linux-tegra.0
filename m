From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Boot failures in -next on Jetson TK1
Date: Tue, 29 May 2018 17:01:13 +0200
Message-ID: <20180529150113.GA16038@ulmo>
References: <20180526103629.GB1564@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1293253962=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180526103629.GB1564-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============1293253962==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 26, 2018 at 11:36:29AM +0100, Mark Brown wrote:
> Currently -next is failing to boot on Jetson TK1.  The problem looks to
> be the Nouveau driver, during initialization it reports an address
> decode error then starts printing error messages saying "nouveau
> 57000000.gpu: fifo: SCHED_ERROR 20 []" over and over again.
>=20
> I've pasted the start of the errors below, you can see a full log and
> more details at:
>=20
>    https://kernelci.org/boot/id/5b0882a259b514339779a881/
>=20
> The warnings about Spectre are a separate issue and don't seem to affect
> the boot.
>=20
> [ 15.194484] nouveau 57000000.gpu: NVIDIA GK20A (0ea000a1)
> [   15.200109] udevd[109]: could not rename interface '3' from 'eth0' to =
'enp1s0': Device or resource busy
> [   15.206399] nouveau 57000000.gpu: imem: using IOMMU
> [   15.315122] CPU2: Spectre v2: firmware did not set auxiliary control r=
egister IBE bit, system vulnerable
> [   15.320021] nouveau 57000000.gpu: Direct firmware load for nvidia/gk20=
a/fecs_inst.bin failed with error -2
> [   15.384841] nouveau 57000000.gpu: Direct firmware load for nouveau/nve=
a_fuc409c failed with error -2
> [   15.393972] nouveau 57000000.gpu: Direct firmware load for nouveau/fuc=
409c failed with error -2
> [   15.402679] nouveau 57000000.gpu: gr: failed to load fuc409c
> [   15.409434] CPU1: Spectre v2: firmware did not set auxiliary control r=
egister IBE bit, system vulnerable
> [   15.419398] CPU1: Spectre v2: firmware did not set auxiliary control r=
egister IBE bit, system vulnerable
> [   15.482568] tegra-mc 70019000.memory-controller: gpusrd: read @0x00041=
200: EMEM address decode error (EMEM decode error)
> [   15.491232] [TTM] Zone  kernel: Available graphics memory: 375202 kiB
> [   15.502768] [TTM] Zone highmem: Available graphics memory: 1030050 kiB
> [   15.509290] [TTM] Initializing pool allocator
> [   15.513658] nouveau 57000000.gpu: DRM: VRAM: 0 MiB
> [   15.518451] nouveau 57000000.gpu: DRM: GART: 1048576 MiB
> [   15.526546] CPU1: Spectre v2: firmware did not set auxiliary control r=
egister IBE bit, system vulnerable
> [   15.527290] tegra-mc 70019000.memory-controller: gpusrd: read @0x00072=
000: EMEM address decode error (EMEM decode error)
> [   15.537050] CPU1: Spectre v2: firmware did not set auxiliary control r=
egister IBE bit, system vulnerable
> [   15.546928] nouveau 57000000.gpu: fifo: SCHED_ERROR 20 []

This is a known issue that was introduced in v4.16 by a combination of
the 32-bit ARM DMA/IOMMU glue and an Tegra SMMU driver change.

There is a fix here:

	http://patchwork.ozlabs.org/patch/902830/

Which got remotely NAK'ed by the DMA API maintainer. I then came up with
this, based on feedback from Christoph:

	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D40853

But that's kind of blocked right now, awaiting feedback. I'll send out
another version, which will hopefully strike the right balance.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlsNazYACgkQ3SOs138+
s6F93hAAmWQ7b5BIzpsnzb+P0YqpqAUprcHqisy2nrmBwZU4kLvEhDGdEjn1rx3M
dBcyd5BvUPmJYVEdTBT5HjLDkrCJrzm5bm+WYs37xuS8znCFPAs0Vu+ao2qhNlKu
30JCTk+IXkum2KEwIHV/C7l0mfbVcqVDtFps7/eb10IjEY7JxRVGw+HhbQXIzM/u
+bOg6GEeaZeoWLWT5g9FGQ/YOOVMP1oCSKCA67fQAKWtAIcdx4UN1tXR1eABEYGL
x2ALdeg8+bkrXcrDNaHzk06E3hTgWEumsHhzmHNwld3C0xlaiYI2DgwAQc2mKCrL
T50PxYORzttgsBCc8RCwyCOr85vAOssN0Yw7ArxgjdTB2/eKguXw7bPRXR8SiWq0
8IRSRB1S++RGH9eBZlBSNQvt23AqGrW9QUaXeFz9IOa8Aqs1GVaDgvvOennIHzLq
SGlaQBmjfGiqWjRNEtIMoUl+IgIUho05fo80Ydl1pqyNk3CM1ZuXZP8yMUQgz9+w
BJ7t4kZgoTKqPdj2ZcQX4B8iLMQAlIyOzB/eDr5WQRAHrdVcjLrP1NXBKf1Jk8kd
EqPjZVw6fNY2j1qj+PLYik7ioQfPEc1AVznNY5zbpZXW71nAXD7DX7R5kZkWx6f0
e6OBIbo2DEkqS3cAaRvn0bjkMfPzNKYmP5PnFLadeb8E/XACVgU=
=Khnv
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--

--===============1293253962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1293253962==--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 08/16] gpu: host1x: Use correct semantics for
 HOST1X_CHANNEL_DMAEND
Date: Fri, 1 Feb 2019 15:10:06 +0100
Message-ID: <20190201141006.GC12829@ulmo>
References: <20190201132837.12327-1-thierry.reding@gmail.com>
 <20190201132837.12327-9-thierry.reding@gmail.com>
 <07572051-6189-5fae-f76f-b885d8454fa5@gmail.com>
 <20190201134134.GA12829@ulmo>
 <b2dee0f2-a159-62bd-272f-bf72cf2355a1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0148697219=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <b2dee0f2-a159-62bd-272f-bf72cf2355a1@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0148697219==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2019 at 04:48:56PM +0300, Dmitry Osipenko wrote:
> 01.02.2019 16:41, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Feb 01, 2019 at 04:37:59PM +0300, Dmitry Osipenko wrote:
> >> 01.02.2019 16:28, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The HOST1X_CHANNEL_DMAEND is an offset relative to the value written =
to
> >>> the HOST1X_CHANNEL_DMASTART register, but it is currently treated as =
an
> >>> absolute address. This can cause SMMU faults if the CDMA fetches past=
 a
> >>> pushbuffer's IOMMU mapping.
> >>>
> >>> Properly setting the DMAEND prevents the CDMA from fetching beyond th=
at
> >>> address and avoid such issues. This is currently not observed because=
 a
> >>> whole (almost) page of essentially scratch space absorbs any excessive
> >>> prefetching by CDMA. However, changing the number of slots in the push
> >>> buffer can trigger these SMMU faults.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/gpu/host1x/hw/cdma_hw.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/=
cdma_hw.c
> >>> index 485aef5761af..a24c090ac96f 100644
> >>> --- a/drivers/gpu/host1x/hw/cdma_hw.c
> >>> +++ b/drivers/gpu/host1x/hw/cdma_hw.c
> >>> @@ -75,7 +75,7 @@ static void cdma_start(struct host1x_cdma *cdma)
> >>> =20
> >>>  	cdma->last_pos =3D cdma->push_buffer.pos;
> >>>  	start =3D cdma->push_buffer.dma;
> >>> -	end =3D start + cdma->push_buffer.size + 4;
> >>> +	end =3D cdma->push_buffer.size + 4;
> >>> =20
> >>>  	host1x_ch_writel(ch, HOST1X_CHANNEL_DMACTRL_DMASTOP,
> >>>  			 HOST1X_CHANNEL_DMACTRL);
> >>> @@ -126,7 +126,7 @@ static void cdma_timeout_restart(struct host1x_cd=
ma *cdma, u32 getptr)
> >>>  			 HOST1X_CHANNEL_DMACTRL);
> >>> =20
> >>>  	start =3D cdma->push_buffer.dma;
> >>> -	end =3D start + cdma->push_buffer.size + 4;
> >>> +	end =3D cdma->push_buffer.size + 4;
> >>> =20
> >>>  	/* set base, end pointer (all of memory) */
> >>>  	host1x_ch_writel(ch, lower_32_bits(start), HOST1X_CHANNEL_DMASTART);
> >>>
> >>
> >> This seems fixes problem that was added by a previous patch in this
> >> series, "gpu: host1x: Support 40-bit addressing". What about to just
> >> squash the patches?=20
> >=20
> > This actually fixes a bug that's always been there. This just happens to
> > touch the same lines as an earlier patch as a result of some refactoring
> > that the earlier patch did.
>=20
> Oh, wow. Indeed! That's a bit unfortunate :) Though it's quite
> difficult to spot that bug by looking at the code, good that it got
> caught. Was this bug triggered by trying to move IOVA allocation to
> the end of the AS?

This was actually triggered because I noticed that we were using 512
slots in the push buffer, which means 4096 bytes, but then we needed
that extra 4 bytes for the RESTART opcode, which means that we're
currently allocating 8192 bytes of which only 4092 are being used.

So I thought: "Well, we should be able to live with 511 slots per push
buffer and save a full memory page. This is an easy optimization!" Boy
was I wrong... After making that change I started to see SMMU faults
for the address immediately after the push buffer mapping. I think the
same error happens regardless of where the push buffer is located. The
reason for the SMMU faults seem to be that CDMA happily keeps on pre-
fetching (a lot of) commands before it wraps around because of the
RESTART opcode. DMAEND is designed as a mechanism to prevent CDMA from
excessively fetching commands, but if you program a really large value
into it, it'll add that really large value to the DMASTART as offset
and the mechanism doesn't work anymore.

We don't currently see this because the 4092 bytes in the "scratch"
page of the push buffer allocation are enough to absorb the prefetching
that CDMA does.

We would also likely never see it happen in non-SMMU cases because the
CDMA would just keep on prefetching whatever memory happened to be after
the push buffer.

Thierry

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxUUz4ACgkQ3SOs138+
s6E6QBAAgSQflpg5HkDF/FwGTpaIxlMOQqjcflqQRoTYwlfzYLVUmJ+u54GnMUIP
s4utd5qxwCFS4dnGtxppM7ejFa0f71MTv4L7awxmN3q1Vg8HGBxjEaWGiM4umGL2
ibk/svufj81lZT8bNMRkAOKlf6RWWunsVubUOTJZDdFRNJi1mQ57kcVng+sR1YAv
b+ln+Mpad52vhMs7o9m5+ImdJKlJpbW6f2YdkJ5Zdzd0SUnnYI5H3+HlW0pQrTnf
GevIlTV3dt16nkLfEXvIEQ5ld6m1aCmncEoZEjCo7ltJLnjk8UTdgvBPOG9WVyuJ
R2ufs4mMDab8nQBjz3FblljmhGOuy8hKNbzM6jGhO/txYkl3DVNqjvdIMpRApsk2
4exCdDOHLCBEPSuW3e6sj3RcnYlhNhl/M6+EajhbNn+5d31wIk3W5VsbokOrQ7Qt
uAS7ha7AowByPqPc6HcaZLN/3mchr57QYXzuYckX9/4cp373wvXUDa3nNayKoKeH
5opjUtqVrZEAYifVC6dl35xQUGjV8w6qKrq1j583VOsaclOt9r+2YMSA8R/89+6w
NvUvWG0x7zkWhHeHhbHjT9Zm94mupm5qaJ04ys4Ugjml9+FUWKDemC/GtAhZJA1U
8nJR9EzbzezKOiApUT78tcmVEhEGjEV1QD9FsLhLWTtNxqQmjv4=
=K1hK
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--

--===============0148697219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0148697219==--

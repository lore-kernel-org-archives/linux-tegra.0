From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 03/13] gpu: host1x: Support 40-bit addressing
Date: Fri, 25 Jan 2019 10:20:55 +0100
Message-ID: <20190125092055.GA22320@ulmo>
References: <20190124180254.20080-1-thierry.reding@gmail.com>
 <20190124180254.20080-4-thierry.reding@gmail.com>
 <aafbdfcc-527a-132e-de12-9fa7eec5e1f0@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0595554697=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <aafbdfcc-527a-132e-de12-9fa7eec5e1f0@kapsi.fi>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0595554697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 11:13:41AM +0200, Mikko Perttunen wrote:
> On 24.1.2019 20.02, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Tegra186 and later support 40 bits of address space. Additional
> > registers need to be programmed to store the full 40 bits of push
> > buffer addresses.
> >=20
> > Since command stream gathers can also reside in buffers in a 40-bit
> > address space, a new variant of the GATHER opcode is also introduced.
> > It takes two parameters: the first parameter contains the lower 32
> > bits of the address and the second parameter contains bits 32 to 39.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/gpu/host1x/hw/cdma_hw.c           | 13 ++++++++---
> >   drivers/gpu/host1x/hw/channel_hw.c        | 28 +++++++++++++++++++----
> >   drivers/gpu/host1x/hw/host1x06_hardware.h |  5 ++++
> >   drivers/gpu/host1x/hw/host1x07_hardware.h |  5 ++++
> >   4 files changed, 44 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cd=
ma_hw.c
> > index ce320534cbed..6d2b7af2af89 100644
> > --- a/drivers/gpu/host1x/hw/cdma_hw.c
> > +++ b/drivers/gpu/host1x/hw/cdma_hw.c
> > @@ -68,20 +68,27 @@ static void cdma_timeout_cpu_incr(struct host1x_cdm=
a *cdma, u32 getptr,
> >   static void cdma_start(struct host1x_cdma *cdma)
> >   {
> >   	struct host1x_channel *ch =3D cdma_to_channel(cdma);
> > +	u64 start, end;
> >   	if (cdma->running)
> >   		return;
> >   	cdma->last_pos =3D cdma->push_buffer.pos;
> > +	start =3D cdma->push_buffer.dma;
> > +	end =3D cdma->push_buffer.dma + cdma->push_buffer.size + 4;
> >   	host1x_ch_writel(ch, HOST1X_CHANNEL_DMACTRL_DMASTOP,
> >   			 HOST1X_CHANNEL_DMACTRL);
> >   	/* set base, put and end pointer */
> > -	host1x_ch_writel(ch, cdma->push_buffer.dma, HOST1X_CHANNEL_DMASTART);
> > +	host1x_ch_writel(ch, lower_32_bits(start), HOST1X_CHANNEL_DMASTART);
> >   	host1x_ch_writel(ch, cdma->push_buffer.pos, HOST1X_CHANNEL_DMAPUT);
> > -	host1x_ch_writel(ch, cdma->push_buffer.dma + cdma->push_buffer.size +=
 4,
> > -			 HOST1X_CHANNEL_DMAEND);
> > +	host1x_ch_writel(ch, lower_32_bits(end), HOST1X_CHANNEL_DMAEND);
> > +
> > +#if HOST1X_HW >=3D 6
> > +	host1x_ch_writel(ch, upper_32_bits(start), HOST1X_CHANNEL_DMASTART_HI=
);
> > +	host1x_ch_writel(ch, upper_32_bits(end), HOST1X_CHANNEL_DMAEND_HI);
> > +#endif
> >   	/* reset GET */
> >   	host1x_ch_writel(ch, HOST1X_CHANNEL_DMACTRL_DMASTOP |
> > diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw=
/channel_hw.c
> > index ff137fe72d34..78fb49539e8c 100644
> > --- a/drivers/gpu/host1x/hw/channel_hw.c
> > +++ b/drivers/gpu/host1x/hw/channel_hw.c
> > @@ -64,11 +64,31 @@ static void submit_gathers(struct host1x_job *job)
> >   	for (i =3D 0; i < job->num_gathers; i++) {
> >   		struct host1x_job_gather *g =3D &job->gathers[i];
> > -		u32 op1 =3D host1x_opcode_gather(g->words);
> > -		u32 op2 =3D g->base + g->offset;
> > +		dma_addr_t addr =3D g->base + g->offset;
> > +		u32 op2, op3;
> > -		trace_write_gather(cdma, g->bo, g->offset, op1 & 0xffff);
> > -		host1x_cdma_push(cdma, op1, op2);
> > +		op2 =3D lower_32_bits(addr);
> > +		op3 =3D upper_32_bits(addr);
> > +
> > +		trace_write_gather(cdma, g->bo, g->offset, g->words);
> > +
> > +		if (op3 !=3D 0) {
> > +#if HOST1X_HW >=3D 6
> > +			u32 op1 =3D host1x_opcode_gather_wide(g->words);
> > +			u32 op4 =3D HOST1X_OPCODE_NOP;
> > +
> > +			host1x_cdma_push(cdma, op1, op2);
> > +			host1x_cdma_push(cdma, op3, op4);
>=20
> This will break if the first push goes as the last slot of the ringbuffer
> and the second push goes as the first slot of the ringbuffer.
>=20
> Otherwise looks good to me.

Why would that break? Isn't the purpose of a ringbuffer to behave as if
it was infinitely sequential? If this really is a problem, how do we fix
it? Would we have to stash NOPs into the pushbuffer until we wrap
around?

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxK1PQACgkQ3SOs138+
s6ERdg//aIEWMEAAiLEFoa7zWq4jZta2UqQlb925HUCWPGWQmtR9F3oMpRwOHyMd
LKHZ249vCpVvyAcX5+LylcWWtSkRBlFZi6DzbcmTGlfqFI2GIHKR0krAqvHiW4Xz
ihHqvM/UtUy85b+iPhlQ90D/Rp4u3Ger3qzfmlEvpdQe1JVyGa2KOsTZVIBMAuWU
ueA1VVwnBumgeE4jp9ZXtbaQJVG1q0gyckpioGurCpgTrRXctLSdnkgKRk5wWURG
kDc0q7k9WaeUqgqoezGhAn3eOcSwHT/cJlTvE3Ycvh/LpTHZ7FPxrsoeR3X/MFI6
aqXnfxnvgg3HY32YOAHER2175R2CuZVjYzDmQDYV7KSWUT4PjgAnm/IjxGCdDBrn
s8PtgrawWOeZA4/L9ewSjfVNEHfGGypYz2THNRCxlyMiUmbnn2MDjPJK31HdjZp1
yLvNStwCxUCNNN6cTbW7tFa5CU78tgNqveApVHuTsE52ri8vPGqdC98vmxDaanyy
SSoWrgGw/wG/PO7N71kj7iWOt8VNLCLXjLkP8h3mWdVQTmQNvuOBeJGaVacBsQLN
rQnmskvwC+tyMYoWi754k98+623L0cYyQ6FbTI9nm10g2V7oZVySMWgLS9ooXlO3
DjOYjPjGA/T3HD/3iDBhf1Xsmsb0foQrciou1jCEcGPijxJj/fE=
=PKlj
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

--===============0595554697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0595554697==--

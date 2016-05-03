From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra: crash fix observed during dma
 client(UART) stress testing
Date: Tue, 3 May 2016 17:17:40 +0200
Message-ID: <20160503151740.GB19539@ulmo.ba.sec>
References: <1462277698-11360-1-git-send-email-smohammed@nvidia.com>
 <5728B10C.1090608@nvidia.com>
 <ec7e4483c2d74e36ade15e26684a6ee8@bgmail102.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ec7e4483c2d74e36ade15e26684a6ee8-7W72rfoJkVlxWE4FnwvcdlaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Mohammed <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 02:44:49PM +0000, Shardar Mohammed wrote:
> Thanks for review. Please find my comments inline.
>=20
> > On 03/05/16 13:14, Shardar Shariff Md wrote:
> > > During DMA client(UART) stress testing, observed below crash:
> > >
> > > [  167.041591] Unable to handle kernel paging request at virtual
> > > address 00100108 [  167.048818] pgd =3D ffffffc0de7ee000 [  167.05222=
2]
> > > [00100108] *pgd=3D0000000000000000 [  167.056513] Internal error: Oop=
s:
> > > 96000045 [#1] PREEMPT SMP [  167.084048] Modules linked in:
> > > [  167.087126] CPU: 0 PID: 1786 Comm: uarttest Tainted: G        W   =
 3.10.33-
> > gb76f6f9 #5
> > > [  167.095040] task: ffffffc0a5ba6ac0 ti: ffffffc094380000 task.ti:
> > > ffffffc094380000 [  167.102529] PC is at tegra_dma_tasklet+0x50/0xf4 [
> > > 167.107148] LR is at tegra_dma_tasklet+0xc0/0xf4 [  167.111767] pc :
> > > [<ffffffc00044acc8>] lr : [<ffffffc00044ad38>] pstate: 800001c5 [
> > > 167.119155] sp : ffffffc094383a60 [  167.122469] x29: ffffffc094383a60
> > > x28: 0000000000000000
> >=20
> > This appears to be from quite an old kernel. I assume that this is stil=
l valid for
> > the latest mainline?
> [Shardar] Yes.

Please get into the habit of testing your patches against upstream
kernels. Merely testing that it applies is not enough.

All patches that are submitted for mainline inclusion must be *runtime*
tested against a mainline kernel.

Also it would be nice if you could offer steps on how to reproduce, that
way we can extend our testing to make sure we never regress.

Thierry

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKMEUAAoJEN0jrNd/PrOhepAP/iGLpKn5EVdHLIHXG/CYk67b
iYP9TMY+n5vtTRANplC9wDxQJ4qc7Cq52svd2s4bOznJetP5lt013yI5Sh+E5Vpx
H6pDtwI1Qj6CrTIK3o9TuRivCdyQtmU72swzgK71udFJ1I4/KiBUtW1KpROuG7Yf
l4k3ZEc4eoYVQ4B1wMQQvSLNvHCQkECL79Jn9cAoJuQLSImvtLNkfAQ+gqzvz9Sy
Pgi0gvlkXRylhfYNIupfhlt1wgXb9xx1dsu6ciqhQsRzBaWqcO/wzG/asA9hIB3Z
RdWkE0WLCfbMPQs2v/7l8V47fTTLHSxNc+VPfebUhgfvLWGWbJ2BNdsPtNL4WVOf
BMdRjLsQaL0VAsm6EGCDRnUoqpviByXoeFqtIywGshHKr4X+Em8VPkOe4I3pYYE1
LJd/Cx8ulwYnUxiDEdWhOoz1YN8X/UpyfhUCh3eSshRdmOa/lRU0GxdfcNjqx33+
0IwhQki66ulhcBP3Cu4MQYKvMEevO+IISePdDgpgsZ/Y+SfhfqUsgwLRNbaCij4v
9MRIfQCcnyb7Xes2VZ8DEiCXHjqooYY7qm886PBpsCoXJEb5imJNSpaKOSaz8n/W
9A4r365fk1I3H+1kHKEOvOrnfoGEhkbu4o3oRVbXhGJlqg7e0VBaprdiCpakZ43q
UrfcuVzpJ3kSyXc+exbT
=TylZ
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--

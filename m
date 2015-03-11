From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] instmem/gk20a: fix crash during error path
Date: Wed, 11 Mar 2015 10:01:39 +0100
Message-ID: <20150311090138.GD19577@ulmo.nvidia.com>
References: <1425969968-25691-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0945890223=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1425969968-25691-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============0945890223==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Content-Disposition: inline


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2015 at 03:46:08PM +0900, Alexandre Courbot wrote:
> If a memory allocation fails when using the DMA allocator,
> gk20a_instobj_dtor_dma() will be called on the failed instmem object.
> At this time, node->handle might not be NULL despite the call to
> dma_alloc_attrs() having failed. node->cpuaddr is the right member to
> check for such a failure, so use it instead.

Indeed. The DMA address handle is in fact the very opposite of 0 in the
failure case (DMA_ERROR_CODE).

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVAARyAAoJEN0jrNd/PrOhL6sQALO4aOdIQ0SBMoLZUSY9UJIF
h5T209li5yi1/ddk7kPyCpd6Bx5ytBPJkgDgfrLFJiMkTGEFhbFNv6qEnlWJhaGy
xG9lG2U8s2qgRCgnGRLTJIVAxb8AClj3bba8pA0cxJsIQWV1OomrxYFO0v9wBHcY
huGuRR62Owv8NEqbAH0/QfxdOBiZN25G3wQVc481+KgLAjvvaX1lHeoVjctt5uUk
eG56fenyI2LOp8xXJs1I9bBCVJAbTQ/N6cZ3QyYo+ENZCUR6n00paRCV1+y7lEtG
Y6+oQB69WsVvwaF2z46dOgsQprYGEiJ2bKSgfqa8UjfFQZvL0zmvqsz1WVYkcJpG
uB9Ib6Xjlm9hxmfq2GKG4fTAzAIONx315wplfbEQNIlTma/g4e5x1N2eJeUKCoe8
4T9Z3x1185UrxSjSUmBCHR8FyzIqccVZ4KmkblqnQd13TRnFMDk1uaum13aujVSF
pJi/tJuRecQsvGLHqMQ0jT2ntlgoVOt7WljdyTnkhWAu8wOZeRUzyw/CgQclNExj
jHUpUxiMg/qbIP8tQjP39vrbhSFwQAZ4CYUjiL8wbL180F97Jo3JCCSCL7Fqpy1U
tiHrNLupXhNo3zCECi7nIniZQACnxnwpwCymd+Pe2Z6esCFqScTm0qu3THP4HrrL
qRIqNycyKAsS97D9mhdm
=ZNwA
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--

--===============0945890223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0945890223==--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/12] drm/nouveau/graph: pad firmware code at
	load time
Date: Tue, 25 Mar 2014 00:02:06 +0100
Message-ID: <20140324230204.GH17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-10-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0807129249=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-10-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0807129249==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dMyqICaxQaaUjrCL"
Content-Disposition: inline


--dMyqICaxQaaUjrCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 24, 2014 at 05:42:31PM +0900, Alexandre Courbot wrote:
> Pad the microcode to a multiple of 0x40, otherwise firmware will fail to
> run from non-prepadded firmware files.

Perhaps this (and the comment in the code) should mention a unit. In
this case it's 0x40 words. Also, I think using a decimal number would
read easier here and in the comment. Furthermore, perhaps choosing a
byte as the unit would be even more intuitive.

But either way the code is correct, so:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--dMyqICaxQaaUjrCL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMLlsAAoJEN0jrNd/PrOhk7QQALNtccTf1u0Bn0ePaXsBV3NE
XdvlaXEgb672RSdouic04izlbQz6FDJlxm8jhw8n9E5tKYwnqrG68w5p1X2oz8uR
tXf+fVGwmBtBNgH54efoIB1pxqxYJWiKon64ag8FRBfCE3N7ItJ43NWodvISBaQ8
HHwZJ6u+JGQtSSGOQ+6+NxuEHy8R02gB9BKx36AXE+EaAZmnbLT6suxLrfoujdDk
gAcFE+ETdOKH1nuhjcYZNLBiGd+gm9H2yHE3/5BPSoMmmllJeUx23bcM30AaK1W0
f04rzMERRfcUMTNS7Mg3jaOV7MthycdJL0sAoBLyD+3mEPEv06DsrNGbsRQa3K+8
vbXjPKwbzTMbl8CuPyHc3RfuB0cZP4w6pchjUhy52f8mxmeuZXou86t3FbYQCBq6
9iUJWVAILhkDk/Q7jSNfURQpj01kC4WiFML33uNfjbxxkTMFH36Gv1lWC3/JOxnX
YXSWa99mUxXv0npayGG6JfPsfha07olY7b2WruBc84Nc2b40TJYYT1J/XSST1tJc
wxS6PjTrDWNYiLLyw+Y6C5ydiSQfTTopUIZHAYXI16WfBp1LPqDaDx0HtbBiPv4L
XyBR7oqE3wNGbj/enkFrjrcPuxZQlXLhvnX6yaxpjcZxNQR21hlNFbxAIPDQCmBO
rvipgCZ35CPpswfJpPXo
=xHpR
-----END PGP SIGNATURE-----

--dMyqICaxQaaUjrCL--

--===============0807129249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0807129249==--

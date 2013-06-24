From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix Beaver's PCIe lane configuration
Date: Mon, 24 Jun 2013 22:56:33 +0200
Message-ID: <20130624205632.GF7163@mithrandir>
References: <1371846232-31163-1-git-send-email-swarren@wwwdotorg.org>
 <20130622104545.GA15586@manwe>
 <51C7C933.7020600@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51C7C933.7020600-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2013 at 10:21:07PM -0600, Stephen Warren wrote:
> On 06/22/2013 04:45 AM, Thierry Reding wrote:
> > On Fri, Jun 21, 2013 at 02:23:52PM -0600, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>=20
> >> Beaver's PCIe lane configuration most closely matches x2 x2 x2
> >> rather than x4 x1 x1, since clocks 0 and 2 are used, and lanes 0
> >> and 5 are used, and the only way those align is with a x2 x2 x2
> >> configuration.
> >=20
> > Looking at the schematics again I have to agree. Thanks for
> > catching this.
> >=20
> >> Also, disable root port 1; there's nothing connected to it. Root
> >> port 0 is the on-board PCIe Ethernet, and port 2 is the mini-PCIe
> >> slot.
> >>=20
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- This is to
> >> be applied to Thierry's WIP PCIe driver branch.
> >=20
> > I've applied this to my tegra/next branch and will squash it into
> > the Beaver patch that's already there.
> >=20
> > You mention another fix that might be required for PCIe on Tegra30=20
> > (additional write to the PADS_REFCLK_CFG1) register. Did that turn
> > out to fix communication of the third port?
>=20
> Yes, I have the 3rd port working. I'm just waiting on some internal IP
> review in order to say something more useful in the commit description
> than "here's an opaque register write that fixes something".

Perhaps you should say something more useful in the comment rather than
the commit message, given that I'll probably squash the patch into one
of the others before submitting.

Thierry

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRyLKAAAoJEN0jrNd/PrOhfW4QAJZloqlCfU2eIo/dL7az9S3P
nRO+FJHXZMQ2jrON5UMCmsTZsXXk5/Z8GksCin+z0ZzHESdzx73g0eeT5EYetLYL
m7L3ZslVcCdOBCOlhZOkJhGWSR66f1m61TG3KSuQzq0CO4bINkhvWQAmB+SBDi9A
oexkKRXJjrN3vSllIskXFspJ2AaNM/vhPPEqyh6DPDxFdVigHDMdojJ/7bdFJ5HO
dXYTHtOZrv7TQoyJNGLQ79vcq+tLGGurIhtunumboT6b2dnZXXp1os+UhU/cJtbd
zYr1ORh7lEZ0tDcbNsJpIahUo2BBLemcUMdvb4A98EZp+yNxYxhH5YzkuX3BEGC4
D4WKXTXx+sQSD0Np7E4blB8Qljj0pFD0A+Foujl88FabVkUfHOPcE7bh7MV5p6ll
+25/WUaAXpLM9qPBWbIsAd2Y2GvTG9OQujxOz38OJ2G59BIXH/cvyye/ucoyJVU3
+KbBNv857SNWgh5nmHei4Y8+isxeJS8W+W6DsmgwdPS5/5O0Qfr7RBmaTSa1fo05
eqUlqoO+XNfjG/hHTcMMC0sWCSqXkT39QLQ9J7hJujQ7CRktWrBSmSQkAavzGPVT
D50hn233Y9IJru31ufHIVSyYPS79tzhIYSBEewbJuUCY1BMZJWAL3CAFm09AycxY
jfOq2O6wvsm6VoIY7PJx
=t3Xz
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--

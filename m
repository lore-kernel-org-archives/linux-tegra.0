From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 3/3] ASoC: soc-core: fix platform name
 vs. of_node assignement
Date: Wed, 9 Jan 2019 14:14:39 +0000
Message-ID: <20190109141439.GE10405@sirena.org.uk>
References: <20181218174040.k7u26vnnoplllnwb@camel2.lan>
 <952471da-b355-6471-6c19-5120d6704f81@nvidia.com>
 <87lg3vuc7p.wl-kuninori.morimoto.gx@renesas.com>
 <b5164c93-8be8-1c3d-9415-c895da6ad622@nvidia.com>
 <d1e41ed2-da7c-b46c-bc6d-64cf3e536771@nvidia.com>
 <865d2a3e-bf6b-1f30-1179-7e922c0d0641@nvidia.com>
 <87k1je38w7.wl-kuninori.morimoto.gx@renesas.com>
 <0660a471-3698-2059-4494-ad146518a4ed@nvidia.com>
 <20190109125340.GD10405@sirena.org.uk>
 <52f5f2cf-9260-f9c5-f73d-3c3d5debc86b@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1537846612041545402=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <52f5f2cf-9260-f9c5-f73d-3c3d5debc86b@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Matthias Reichl <hias@horus.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1537846612041545402==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 09, 2019 at 02:11:58PM +0000, Jon Hunter wrote:
> On 09/01/2019 12:53, Mark Brown wrote:

> >> Yes that is an alternative and I can convert all the Tegra machine
> >> drivers to use this now. However, that will not solve the problem for
> >> non-Tegra devices and everyone will have to do this.

> > We're going to have to go through another round of conversions that
> > touch everything at some point no matter what :/

> Do you have a preference here? Do you think that we can fix-up the
> soc-core or should I go ahead and migrate the Tegra machine driver to
> workaround this issue now?

We're going to need to migrate Tegra regardless so it'd be good to do
that whatever happens, I'm intending to try to properly review the patch
today.

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw2Ac4ACgkQJNaLcl1U
h9AjYgf9EvgU+L0fi5qtHIdBZBOJEXt8zxHplyCjLWZSQvJ9ZasVIZWn40mjttXT
JZ1PnMRftcHZ9OB3LEFRLVI27coE+bc9tAECVuWpIYsSih4pdLaFxz7RjlPnucwq
yd7ERUKkF8Z5dmqo+JaKoa3nzPsCynsBRN6ETD3u2zIDFbcYeA9Up0ImO/5G1TjD
jhkMDmZ/WqgRmF8IxnFQGYpNsW2n3GHr7Whbt75T/czieOw1/6DFBaxDc9JM3SKZ
8ac30r52eXFqtm6Pb1exD3MUEwblll1GeKZwA4BPiFSPsI8fM95rZ/J2Mli9WL04
xtSwIa0yvoHTkR6DgyqDu5dhfBTaUA==
=+KSw
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--

--===============1537846612041545402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1537846612041545402==--

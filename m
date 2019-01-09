From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 3/3] ASoC: soc-core: fix platform name
 vs. of_node assignement
Date: Wed, 9 Jan 2019 12:53:40 +0000
Message-ID: <20190109125340.GD10405@sirena.org.uk>
References: <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
 <20181021112301.GC8554@sirena.org.uk>
 <20181218174040.k7u26vnnoplllnwb@camel2.lan>
 <952471da-b355-6471-6c19-5120d6704f81@nvidia.com>
 <87lg3vuc7p.wl-kuninori.morimoto.gx@renesas.com>
 <b5164c93-8be8-1c3d-9415-c895da6ad622@nvidia.com>
 <d1e41ed2-da7c-b46c-bc6d-64cf3e536771@nvidia.com>
 <865d2a3e-bf6b-1f30-1179-7e922c0d0641@nvidia.com>
 <87k1je38w7.wl-kuninori.morimoto.gx@renesas.com>
 <0660a471-3698-2059-4494-ad146518a4ed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7329907036707495693=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <0660a471-3698-2059-4494-ad146518a4ed@nvidia.com>
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


--===============7329907036707495693==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 09, 2019 at 11:03:44AM +0000, Jon Hunter wrote:
> On 09/01/2019 01:51, Kuninori Morimoto wrote:

> > "multi platform" is no plan (?).

> I would like someone to explain what multi-platform means? Even if a
> soundcard supports multiple platforms, there is only one platform you
> are using at any time so ...

Platform in this case means DMA driver (for historical reasons I've
never entirely understood the DMA drivers got called the platform
drivers).  It is possible that a system might have multiple DMA
implementations in a single sound card but fortunately we don't seem to
run into that.

> > I want to which to modern style immediately and remove legacy style.
> > But as you know, we have too many ALSA SoC drivers now.
> > So, if I posted "switch legacy style to modern style" patch
> > for each (= for codec, for platform, for cpu), it will be patch-bomb,
> > and Lars-Petter/Mark don't like it.
> > Thus, I'm waiting "multi CPU" support patch.

> Sorry, I still don't understand the dependency on the multi CPU and why
> we need to wait.

I believe Morimoto-san's concern is to minimize the number of
refactorings of the drivers as that gets disruptive.  That's definitely
a valid concern but we can't postpone fixing bugs over releases, we need
things to work for people.

> > If CPU/Codec/Platform can be snd_soc_init_platform style,
> > then, we can switch to modern style for all drivers.
> > Then, all driver will have *static* platform.

> > # So, I guess if your driver can switch to use
> > # snd_soc_init_platform style directly, your problem can gone ?

> Yes that is an alternative and I can convert all the Tegra machine
> drivers to use this now. However, that will not solve the problem for
> non-Tegra devices and everyone will have to do this.

We're going to have to go through another round of conversions that
touch everything at some point no matter what :/

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw17tMACgkQJNaLcl1U
h9BKZwgAgiM09pC/S8pF3GuNtiVWeTFJvT4K9Ys03qD/pYCXjk4xmwhrfrvB736w
kvJwQz0WGCYh96IYskAJMAfMKh8jzneCBHswcVCM9IruT0bTDXZll0VpC+6W0N1F
yavk0QNgg8hWkQ61EMP1XQy3gS++DIoljTsNGT/7B87ikf/O3g+vA8e/tzrrxp9U
CQt5cQH9lRfkHS6LGKZxGnuFnadmk+pRushWhfWeDRIQZESV4r4Wf8hb73d9SUJA
B5ffkYQJmR9Ae39eQDVXEw0duXk/z3SChCfyKdh19yEpEKfan+9JATb8XDlVTFpE
W6BCTdiNcQtc+3gfAjTTD9MOE56JBw==
=zUC8
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--

--===============7329907036707495693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7329907036707495693==--

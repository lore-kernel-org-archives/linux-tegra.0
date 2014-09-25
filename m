From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [5/5] ARM: tegra: jetson-tk1: enable GK20A GPU
Date: Thu, 25 Sep 2014 18:41:11 +0200
Message-ID: <20140925164109.GA30382@ulmo>
References: <1400491450-19223-6-git-send-email-acourbot@nvidia.com>
 <20140925132717.GA13579@dusk.luon.net>
 <54243931.6050804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2061586432=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54243931.6050804@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: gnurou@gmail.com, Sjoerd Simons <sjoerd@luon.net>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============2061586432==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2014 at 09:48:01AM -0600, Stephen Warren wrote:
> On 09/25/2014 07:27 AM, Sjoerd Simons wrote:
> >Playing a bit with todays linux-next on my jetson, it seems this patch is
> >still required for enabling the GPU. Is there anything blocking it (firm=
ware
> >not available yet in liux-firmware?)
>=20
> I think initially I was waiting for the DRM patch "drm/nouvea: support for
> probing platform devices" to be applied, but it looks like that's been
> applied already, so only patches 4 and 5 in this series are still
> outstanding.
>=20
> Alex, wasn't there also some issue where the VPR register had to be
> programmed, and if it wasn't there'd be a hang when the GPU registers were
> touched? If we've added code to Nouveau/tegradrm to detect that and avoid
> the problem, then I guess we can commit these last two patches for 3.19. A
> resend after the 3.18 merge window might help.

A patch that programs VPR was merged into U-Boot (though I don't think
it's made it into master yet). I'm not sure we can reasonably check for
that in Nouveau, given that the register is somewhere completely
unrelated. In fact I think the U-Boot patch was triggered by some
discussion about how to solve this and it was decided that it shouldn't
be done in the kernel, but U-Boot should set it up.

That said, perhaps one solution would be to make U-Boot enable the gk20a
device if it's set up the VPR and disable it otherwise?

Thierry

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUJEWlAAoJEN0jrNd/PrOh3koP/0Jmu1Lr7ZB06FL8uJibYKuI
zJbW8b0hjOe+0viAtc4/wBoLmUakVFrPvim8590dOrnYxbEV5S3r2gGwXEFbpgtq
YPLzcanP+wKVL4jIxkfqjFEnu9TL61zCa2Y5tDN+6tmAunCh4VmuzUJSuDKptQM7
AJBe99PzNDsp6RMhwajqf/n1bJiKOTSlXlJswkPsx6sI7vIPxmF8ZM5gEpVImN03
tths8uVM8kONLjOnedb85F9RjaEFk2y0DBD4b3BPPh/Coiv9ory3sCrNay7TST/O
gWP7D6bphV3cKy4jW3ZWyZWd8aHVawfs0TaMjmuXnnOx8rBFla9M93mZrUd6oTkp
fn440P+2f3xMBiZbiE0AShuFhaee+806rMZ3cT5+VshrRVwE710PrYfuXk6/i6W1
sKCSGhp8qyeRSim0XpUKqMPqh/yM6WmSciXKbfl/bebRSKgGu4SFR+hpo/aBYkMW
WU5cQzD4FQe3oMJOHcWgY3/KgYnpvb2HlLIAv2MnyebienbS2LaB/jwiyyGu/ppF
WbUdzxiID9HmJCTW00ffW7lvzlu5/fiubeHm+LZEpDT3gXd88RWGSe2463bQVLQA
CNTpd+a7Qo/lt12C3Dj6zLjJC6wb4Pum9oIE+BOVoX2pM6sF5f8neM5GyQ/SRP4K
V+lXPvKVA8IFb8etC+hM
=qt6Z
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--

--===============2061586432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2061586432==--

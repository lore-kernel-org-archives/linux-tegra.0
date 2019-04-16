From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/3] ARM: Enable Trusted Foundations for multiplatform
 ARM v7
Date: Tue, 16 Apr 2019 09:44:44 +0200
Message-ID: <20190416074444.GA10907@ulmo>
References: <20190411091848.16949-1-thierry.reding@gmail.com>
 <20190411091848.16949-3-thierry.reding@gmail.com>
 <20190415172357.GC2839@atomide.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8800957599206004531=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190415172357.GC2839@atomide.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============8800957599206004531==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 10:23:57AM -0700, Tony Lindgren wrote:
> Hi Thierry,
>=20
> * Thierry Reding <thierry.reding@gmail.com> [190411 09:19]:
> > --- a/arch/arm/configs/multi_v7_defconfig
> > +++ b/arch/arm/configs/multi_v7_defconfig
> > @@ -141,6 +141,7 @@ CONFIG_ARM_CPUIDLE=3Dy
> >  CONFIG_ARM_ZYNQ_CPUIDLE=3Dy
> >  CONFIG_ARM_EXYNOS_CPUIDLE=3Dy
> >  CONFIG_KERNEL_MODE_NEON=3Dy
> > +CONFIG_TRUSTED_FOUNDATIONS=3Dy
> >  CONFIG_NET=3Dy
> >  CONFIG_PACKET=3Dy
> >  CONFIG_UNIX=3Dy
>=20
> I'm updating my branch for make savedefconfig clean-up
> for multi_v7_defconfig as posted earlier in thread
> "[PATCHv2 0/2] Update multi_v7_defconfig for dropped
> and moved options", looks like this commit causes
> a trivial merge conflict.
>=20
> Can we consider your branch immutable for commit
> 8b695aa58cc4 ("ARM: Enable Trusted Foundations for
> multiplatform ARM v7")?

In general, the for-next branch from the Tegra tree is not stable. The
individual branches that make up for-next are. In this case it would be
for-5.2/arm/defconfig. However...

> I'd like to merge that one in to avoid an unecessary
> merge conflict.

It's slightly tricky because I generated the multi_v7_defconfig on top
of a different branch (because the TRUSTED_FOUNDATIONS symbol moves
around in that branch), so if you base your update on top of my branch,
the symbol will likely get moved around again.

Perhaps better would be if you provide a stable branch with the update
and then I can rebase this patch on top.

Would that work for you?

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly1h+gACgkQ3SOs138+
s6HE2Q/9FsGgVyvShX5nYphDvhcHzgnw26JRSvrhFgvKkVwME7dRYbHUYnxWItcl
3rs53VQA++AdLg8eukk3YisYbcecXOt2Dk2EzHgiy8fsJyHe+DSHvQc04V+h8O0V
OgjgCpjmy6/tuUCsa7rKW0OL0vPBoNXurQgI4LCTRDzKE9WNl8SqhtJJ86Zo9Gcj
KaOaWipEGV/MKvRU3pp5nTHlPvyzdMtUGNZ+qGOkpA5wXC6hjkYHMlTgtRZxW2sR
h/d/tGGLTzJy3CJWJ2wCmhw9/GsHMSxtiFAfwxQ9WFybe+/e0PUichCNw10/QlCp
bA+7ibo7Qc+rIp61BN+CcKtFH4schqprhR4VHAszcOmOMEP8lPezWM8HLwQ+kEQF
93ro3X9Q9VdQk1Kq9Sts5KopW3soeN0LXXS+9uQ373K9hTh2Tqj/QqZUjhh9KqtL
C+ZzkmVDwWib+smmRDugfv23rdzLpoBw0QpwkZoOrjE7JwqnW9y/FWRbUzrnuqJl
DC1oXKf3imxHB9H2d0TC1QrG8jvq6wudzVY7PShZPABtGG35heaw7m+g4cJ1+uDu
AYDp2VX15Xd+2fv8CfLz2bw5GB0jPjE6VemRRj6udve9ERHgBYhf/ZqBaydUMFGH
19u3cNPRuqs//eREJurJ2p1pMgBABlPXxdytBuLuQqEreH3i/Kg=
=p3KJ
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--


--===============8800957599206004531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8800957599206004531==--

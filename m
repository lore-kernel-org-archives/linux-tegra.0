From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 0/4]  arm: tegra: implement NVEC driver using tegra
 i2c.
Date: Fri, 3 Apr 2015 21:46:35 +0200
Message-ID: <20150403194635.GC2016@katana>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Danin <danindrey@mail.ru>
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net, Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>
List-Id: linux-tegra@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2015 at 11:00:11PM +0300, Andrey Danin wrote:
> NVEC driver contains code to manage tegra i2c controller in slave mode.
> I2C slave support was implemented in linux kernel. The goal of this
> patch serie is to implement I2C slave mode in tegra drived and rework
> NVEC driver to use it.

Thanks. Looks pretty good already. If being I2C slave was the reason for
this driver being in staging, we soon need to think of a proper place
outside staging.


--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVHu4bAAoJEBQN5MwUoCm2RHMQAIIn0r1XaIbSrsOZ6uwTxPH+
A2BQ/EIrTttRV8gKJW7JifNpbF4MTW7sZuw2M/Uad8SnYm22ylFpvaYH34B9uPbt
5hwxhbYK82a9O6dTKj4mpKsR7X7sBFsLFm5bzty9EVKSOHwDgPFEn8T1ul8KGKAk
J7Xh5HlOuLgdMDb8rmJ1dHkEvAHZIHxBrd3TxTLfz81FRL7uE4pL1MluB2RWHkrp
rv+YFCmn92DsL3gu4brZ3DSg6vS/UuyI8adR2bgKuIDR9Y4pOkt/g6BTendvToZv
2uqEl/e3LJGeiwEqwV8hfOh7CEO6xQv69R+V64Lx2C3sB1v2+U9J/T5re2IjNssQ
Tw0p96yrjA18yo3fCd935aEVSZeTupJhqg9BjKFBqel5uSpFSiCD8U8U72zbhWdC
VxZbfH9QYGtbWJs98xX0on55g/StkbtY0D0PW/6idju6ZOBC3zq6KlK0qd5clrad
+xQfxvoQIyqOi4kGoo04mSP8XpmFS62yXtkIDIeuRLhgUhTV6N99FtMp2FFmGxm7
mQnjGxk/TeZni1AaQyvCHBhHOu/IHnd14OQq0F2Uf+3tOlUjMZke44UMjZzX4WRr
+dS+R8E7A9G2SBjEDeI/3Cp50dafhP6ISzED5E3i7FvNjOjglmUp4u+vQwzgIpOe
6vCNUzcJNFeutNpnPHUK
=z0tF
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--

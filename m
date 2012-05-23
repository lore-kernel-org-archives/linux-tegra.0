From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/5] ASoC: WM8903: init GPIOs during I2C
 probe not codec probe
Date: Wed, 23 May 2012 12:20:23 +0100
Message-ID: <20120523112022.GM4085@opensource.wolfsonmicro.com>
References: <1337724536-12349-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0874326782322325187=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1337724536-12349-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lrg@ti.com>
List-Id: linux-tegra@vger.kernel.org


--===============0874326782322325187==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wKTlTxfx0Fr6BT7S"
Content-Disposition: inline


--wKTlTxfx0Fr6BT7S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 22, 2012 at 04:08:52PM -0600, Stephen Warren wrote:

> This allows the GPIOs to be available as soon as the I2C device has

Applied all, thanks.

--wKTlTxfx0Fr6BT7S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPvMfwAAoJEBus8iNuMP3deKUQAI/pzFQf9is1YQ/vgQiq9OvW
j8pyqPlNfsJOk+ytkuhonkisP7KevOwnYHvJmoQgFQBZPq9J1UK10ZlS+MiI1nJA
KFmZgjn76lgYkd7kd5zBbsLs1U4CxJ1aofYkhKe2cjC7SFgTHzIk+UDv+rvGWeA5
XKFxBbGxLIhX1EbBnSQeP7DHxqrHczNxb4+ytTcHZpbG8zIB2qanf47W7Sncy3cj
vmLlXyiJOSHy12Oe566XA90GW7SUnKsG+2+53ZYT/ASscMlWjW+b/vX7glQVN7CP
L2aFnoTjBElYhPCUZZgrdZAJ1jtoDEV7TsUlciXa/cf8Pd1giAMQ6bMogukmK/D1
3p//BRQfAYx5tTYQoCpt4m5vgmUjySZKfQa6aiqGWknUzkaZCTl+4dQcHqFrSSPt
ZxXxoVVesEfcKc+dLQjPyCQBHv0a1EPiIVy4xZJFZzPZjFx4kotTqn1zMnJx/GHb
57vZfdz9QMyratKe8EwOwliT+rG1DF3790duYLzcHSFafXKkcQnqWUz2n6Z+ea4E
5B+vc7YyKxWMNcd/SC2M8J+frVMd5G5LqaUCnskZKkjvGb5TjMCsuNC5mIxnKFwm
QO9EBGL4zlTnOKiMVwyxmuKv+2PS+Kj/qpbELFhdIAwlLVIVUHxf+kWZbWW7EL/t
sBfTqA3GT+AaDGk9yp99
=ohEb
-----END PGP SIGNATURE-----

--wKTlTxfx0Fr6BT7S--

--===============0874326782322325187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0874326782322325187==--

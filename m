From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 0/5] Add device tree support of audio
 (ALC5632) on PAZ00 board
Date: Tue, 31 Jan 2012 19:42:54 +0000
Message-ID: <20120131194249.GF3429@opensource.wolfsonmicro.com>
References: <1327994757-26950-1-git-send-email-leon@leon.nu>
	<74CDBE0F657A3D45AFBB94109FB122FF178E124441@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0353425297465316699=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E124441@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "olof@lixom.net" <olof@lixom.net>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Leon Romanovsky <leon@leon.nu>, "lrg@ti.com" <lrg@ti.com>
List-Id: linux-tegra@vger.kernel.org


--===============0353425297465316699==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline


--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 31, 2012 at 10:00:45AM -0800, Stephen Warren wrote:

> (Olof may wish to comment on whether he wishes the patches split up to
> apply the Tegra/ASoC parts separately, or merge them into both trees,
> to avoid any potential merge conflicts on the .dts files)

I'm leaving the last two patches to see what Olof thinks; Leon, if you
get to it first splitting the DTS file update from the patch updating
the machine driver would avoid any issue.

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPKEPyAAoJEBus8iNuMP3dSqoP/2r/Z0Mc4PFvLzN6+k1Vimov
nS2Eri1PFyzneio2C85cDhu/krbxO7pi1W6eHmFjqFCJM0AzvUsa8UB6AmRbfAz0
GhcVPw9vV6mset1WVDjoXG0yBrbCamdU6qUZsfw1AkCeLjGQXe31d3b4hsJ1aZLW
VAfP3FHdhRJb6dkmQiUQakM8O6x2yKOOInJSboDdWvEEXdEL3yXmXFsrSlmpX18r
n/YFK/ddGKtSfiuRPREgjlfwDfgE1O8p/0pGmPVCjOnhTT9V1TFr0JxstNMl+ICu
aaCLLVkm6fYg87aroH+5JWPu66ssY3LDjGn7atPuWxV/uvhqKnxWJScLq9TskGnR
aTi5IrGNl52ymWOzxf29leLbL3uZJtZX2HSIIRjhaa0vfn4u7S4IFjb032QBhdXC
QCpPeTjwBwIUNcP9cWmYZToSrcLH7d8Y4PuZfkzdSzJ9M3mWjvI1feHIiyWD63EE
/O90zeMpWJDoEXzyssFc+8gIzmJn+ZE7VkHFpT6P3mlfaZ31sb73TXjw3cpji5Yx
Q3TgWsI9QQw0Y+CjMHUoxO1rZhZqqw+jJcPTPAhV9YCc7A91Q5gzK3zVcwLg5wVQ
l2qtRjIc/BKbucfC/Pbf+Xusf/p4pIQfeXtS6uWpxEMYvye72qQVb9ugHdHqYY4E
416Znocs/YwxUWIThRmV
=DsD2
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--

--===============0353425297465316699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0353425297465316699==--

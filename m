From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] ASOC: tegra: move AC97 clock defines
 to the controller node
Date: Wed, 24 Jul 2013 10:44:01 +0100
Message-ID: <20130724094401.GZ9858@sirena.org.uk>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
 <1374442132-24040-2-git-send-email-dev@lynxeye.de>
 <20130721233651.GZ9858@sirena.org.uk>
 <1374476927.1644.4.camel@tellur>
 <20130722094627.GK9858@sirena.org.uk>
 <1374510380.1574.3.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2893277176608076786=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1374510380.1574.3.camel@tellur>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Lucas Stach <dev@lynxeye.de>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============2893277176608076786==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SoGQxgZEULAMOcJz"
Content-Disposition: inline


--SoGQxgZEULAMOcJz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 22, 2013 at 06:26:20PM +0200, Lucas Stach wrote:
> Am Montag, den 22.07.2013, 10:46 +0100 schrieb Mark Brown:
> > On Mon, Jul 22, 2013 at 09:08:47AM +0200, Lucas Stach wrote:

> > > The clocks used by the Tegra ASoC utils were defined in the machine
> > > driver DT node for all boards, as this is were they get requested by the
> > > I2C and SPDIF Tegra audio drivers. Differently from those two the AC97

> > Why is the way the other devices are doing this sensible?

> Because they only need those clocks when actually playing audio, so
> requesting them late in the process when loading the machine driver is
> perfectly fine for them. The AC97 controller however already needs those
> clocks when initializing the controller and codec, so it has to request
> them earlier.

But why does it make sense to do that?  The clocks are directly
connected to the IP blocks in hardware after all..

--SoGQxgZEULAMOcJz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR76HeAAoJELSic+t+oim9WrwP/1dMFy4qKN2TL2D1Lr5guGYs
L138q9fqFCfW2JU3NnhqejeBgE4XjvZh3TnE2NaWtGRJOREopu74l7hXD34+srSF
hH/ryha29WQvD+kTNWQ/FJwHL1qGQpT0aV5YfLrsL4zE9llJOxy4XjkKAOkh+/EV
wII8mKUO4eEFtiudjKTJx/7jumDAghVYPVQgmy+tsVzM9sfboynpOeuMYoownIwb
9a8aC+8svrHoRw3UUNX07wAAZ+VK8TCjU76tZTXtpVFMcBL3B3WjoDj4OX2hEe5e
7WOHZBO/mMcKVzreMq5QncePlmj+ypgwPP9v7BVhSFmtFTA/TTy/K//n1wlahC0L
mH9/KVNC7QLXfAIR2QV1u1Dy1Bw4Iyf+fsfCtvgJ1KMIFYS5r3Xt19jrhT+x9yiH
Zb5G7DevPTmLXLzN6QZYxbXaa9GfikY3IpvZ7hUGbbEeX63MBesbcOnvHjQmFAXn
QjoVLx3NLYqK/e0O9cYvFDyA7HbvsbLIOntIaoQq7vL7U4K/BaCWDo8VB69soVvf
uH9Xg1WDuL1STkFg9pu9SJmgzfjXGtK0Kj22YaNDJ89DU8O/GYKozWI78YLeID9n
7fqB93tKm9HmN5IYEVptZiu5gFGrgPydfNZgZmtWJZiQo5Bqn7IM7uiP1iF3cRzZ
uEGeft64KJVRL5gJ3K1F
=570o
-----END PGP SIGNATURE-----

--SoGQxgZEULAMOcJz--

--===============2893277176608076786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2893277176608076786==--

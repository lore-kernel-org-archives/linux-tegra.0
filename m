From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: tegra20-ac97: Remove duplicate
	error message
Date: Sat, 29 Jun 2013 10:55:20 +0100
Message-ID: <20130629095520.GM27646@sirena.org.uk>
References: <1372449205-22231-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3880712307746083871=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1372449205-22231-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============3880712307746083871==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kpiHLpCjRhsX9c1O"
Content-Disposition: inline


--kpiHLpCjRhsX9c1O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2013 at 09:53:24PM +0200, Thierry Reding wrote:
> devm_ioremap_resource() already outputs an error message when any of the
> operations it performs fails, so the duplicate in the caller can be
> removed.

Applied both, thanks.

--kpiHLpCjRhsX9c1O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzq8EAAoJELSic+t+oim97+oP/3jFpp9D7t/f6GEot1wjUQH/
3ewjVuD0EympJb/E85omv6DAprW9j3y1ADabF9BQ8M6gERn/stGej9MdujX65OTy
dpbdcx9gq7aSpPPta1EnVzv2FijlpAZ9hyySyG0tO2AX7dtLxf7eT/1KjmZEpJUq
5ADiz6epkaW7zneH6n8gqJAe5ud2kT79wOm0cs+fz1WxTgOCTRFJz8dBDnCTw+s4
1/6fC8FZfFS3WNLZvf74pOe7z8td23pJBZGRZcroKxJZk5SjtHJlckWpGkaDzcwk
qpP1HCwgVsFxgbc1HAxSGvCAHkKWEMnzXjx34znXDk//FcVJg5Wu7EKUyzhsv60V
ZQSuJW8Wbw6QejzerATdM9j9k677GXGzHdK7UZiCh/XZhKLDlR4w03x2nwO5U3dE
KCvuFQ+F94YJHw4aP0PZD6rx1BeZZfNJG1oJfziTqVgRrPVeh0TJvN6uOOX+Oyui
sV2pDYTtulK2t209axGGlq1O9LBCqdtMOyrZgwY+7bDNb+QPYlauKeYFq4m/Z8SP
WQA8q/+k3XDAZ6gaZkvcwG+azH7K0CW2ZzrDZRl0PW3fc3nB0hvgfUAcSGTVRMyX
YN2sjkGPuakP+eJ3RX0auBkg7pBVZiRVHbBjMT+EJ6yK6JpUuG/SiiJX6b32Mb2g
uSFAL4zPaON82RJ142u4
=mM7B
-----END PGP SIGNATURE-----

--kpiHLpCjRhsX9c1O--

--===============3880712307746083871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3880712307746083871==--

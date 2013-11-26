From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 16/31] ASoC: tegra: use reset framework
Date: Tue, 26 Nov 2013 18:37:39 +0000
Message-ID: <20131126183739.GR14725@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-17-git-send-email-swarren@wwwdotorg.org>
 <20131116095529.GF15393@sirena.org.uk>
 <528A4C8C.3030200@wwwdotorg.org>
 <20131118183716.GR2674@sirena.org.uk>
 <5293C787.1030005@wwwdotorg.org>
 <20131126131410.GK14725@sirena.org.uk>
 <5294CCDD.30803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0308161566032948908=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5294CCDD.30803@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, pdeschrijver@nvidia.com, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, treding@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============0308161566032948908==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kPepdeVVZyud5ZkI"
Content-Disposition: inline


--kPepdeVVZyud5ZkI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 09:31:25AM -0700, Stephen Warren wrote:

> ... so, I thought you were OK with that one issue. Were there other
> issues you didn't mention before?

Probably not but I'd need to reread it, I don't think I got that much
further than noticing that there weren't any clock changes (the fact
that the clock dependency was getting added in a DMA series set off
alarm bells).  To be honest given the number of revisions that seem to
be required I'd been expecting to see a respin of the series, the ASoC
generic DMA changes did need a respin before they can be merged and I do
want to get them into the ASoC tree.

--kPepdeVVZyud5ZkI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlOpvAAoJELSic+t+oim9eCsP/3la/QbYFgSjuUOyCNwjsehu
hzH7NfY3YVdFcC8AxHOudh24DfjEwfoKE6F4vjSVyhYx91w2K97LI5EKoikwiwav
kmYW+PlHcPhrZaBmMe8imtNOs3ZeNzR1Bd1o9oY7wg4QxgUlHHvDrPBaPVxeLyXW
F5Zjb6++mlwfYunF8v+g/zG/UNLp4SW6DsYtd9M4Po48NudS/RlBYkTrimiBu1ps
a9AfYxaJBt+QoDc2SZp3Ve4gsYsSfajWj17sMOslCNf0108kuifwkDYrm3ZJNtBN
/FMp3wA0cmPW+3s5rEkQHKKj/Gaz4HMCkmGnm9rP9qEsV+1QgE/GoSEj8qRFSWCR
IyB7B0qWbeD2STdU+VrVrL52T2qF9RixnlyyR3xo+o8fXRckWWJjBhn/8J23DUSu
Jb7Q6yF7hBj/FcSo9j46ED/RkCzQIRRGDLcUbLQnTYqvqrvduFLBlNq9o939cDDW
85MkiKNomAWbyCag6XVf2ZwkrxlTi4J+rmitTRMp0ZY6k2AmgG8wMojfowA3DpmR
1VdYBVQ04fnFIMzFdwjlBftNRLtFzmvA85zgLn/Gh7j1FycO3bRvEuk1kOX8R7F3
RPoWqS8unmWbJzFz/kzrE2GtTZ/5cJXs0Qkpdw7VEhzWTrMDsMQp2AbLaheMvgkF
OBnag6UyM68VtWcttspp
=wo4g
-----END PGP SIGNATURE-----

--kPepdeVVZyud5ZkI--


--===============0308161566032948908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0308161566032948908==--

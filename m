From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 9/9] ASoC: tegra_sgtl5000: fix platform
 name vs. of_node assignement
Date: Wed, 17 Oct 2018 20:16:33 +0100
Message-ID: <20181017191633.GL24097@sirena.org.uk>
References: <20181016104730.4598-1-marcel@ziswiler.com>
 <20181016104730.4598-10-marcel@ziswiler.com>
 <35848cb7-36ee-6698-ff17-7f0e73567914@nvidia.com>
 <1539786500.6233.58.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1670522209369127453=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1539786500.6233.58.camel@toradex.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1670522209369127453==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t5C3/nrmPumNj5sH"
Content-Disposition: inline


--t5C3/nrmPumNj5sH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 17, 2018 at 02:28:22PM +0000, Marcel Ziswiler wrote:

> Some questions:

> - How exactly are devm allocations supposed to work concerning probe
> deferrals?

Probe deferrals are just normal probe errors, any devm_ allocated stuff
gets unwound.

> - Does or should the platform get cleared during a probe deferral
> cycle?

> - If so, why does that not work?

Is something writing to static data when it should be writing to
dynamically allocated data?  That's what this sounds like, we shouldn't
be modifying any static data and any data dynamically allocated during
probe ought to be being discarded.

> - Or is some special implicit probe deferral handling missing in soc-
> core?

Like I say a probe deferral is just a normal error.

--t5C3/nrmPumNj5sH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvHipAACgkQJNaLcl1U
h9BkSAf/SouRZpX4VQqudTnmOiqKqZkMRbwM6NBQpPpPsCCRtMqnI+WEN+LE8snt
yn/nMdP7g3m6uAV15M486uYS+qkFI3eQ1hYt7bWfi01kclqsZS7JUqaMgKvziM05
Uphkd15nbTHBTyHuhznZPy3+tkRbdfb7cGzBJR9xagor/WfDCnjQdkwV9TIn3l/K
7LhBs+XluSRL0A0Jq5MYuEIuKV1X4iPrNCdpTYO01Y4APrSend4SYL3vqY4MxzCX
MQiaUvEO/XYxFQHhKmvwwku4cgq0cFZLm+qARMuxY9CA+XzlE/IXnQDe8pF1XtsN
qx4q0cnhCClRQ/uXiDX0GHgpLtWGaA==
=V209
-----END PGP SIGNATURE-----

--t5C3/nrmPumNj5sH--

--===============1670522209369127453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1670522209369127453==--

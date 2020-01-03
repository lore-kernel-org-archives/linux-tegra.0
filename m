From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1] ASoC: rt5640: Fix NULL dereference on module unload
Date: Fri, 3 Jan 2020 00:54:24 +0000
Message-ID: <20200103005424.GF3897@sirena.org.uk>
References: <20191229150454.2127-1-digetx@gmail.com>
 <20191231001719.GC3897@sirena.org.uk>
 <03ccf221-697e-bc34-f4ba-bf191aecd675@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V4b9U9vrdWczvw78"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <03ccf221-697e-bc34-f4ba-bf191aecd675@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>, Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--V4b9U9vrdWczvw78
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2020 at 06:57:14PM +0300, Dmitry Osipenko wrote:
> 31.12.2019 03:17, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > Please think hard before including complete backtraces in upstream
> > reports, they are very large and contain almost no useful information
> > relative to their size so often obscure the relevant content in your
> > message. If part of the backtrace is usefully illustrative then it's
> > usually better to pull out the relevant sections.

> Yeah, perhaps it's not really useful to have backtrace in the commit's
> description for the case of this patch in particular. But in general it
> is very useful to have backtraces somewhere near the patch such that
> online search engines, like google, could pick it up. I'll move the
> backtrace below --- in v2, thanks.

Right, this is more directed at just pasting in the entire
backtrace (which can be huge with lots of generic bits before the
small number that are relevant) but some edited highlights can
definitely be helpful for search engines and for explaining the
problem.  I'll modify what I'm saying there to clarify this.

--V4b9U9vrdWczvw78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4OkLwACgkQJNaLcl1U
h9BL0gf/bBWZbW0DvZqYZ84Y2N8XEhFRF5QQ+NS5MBAvcrqzNDvh/KAHA0Vzm9Xq
NBM3uErwYTIgr+uRQSMbu6MQ+YeG5nptjZoPv3c0rWN5jT5ZXjmxIfFlE9EFuAn0
tq3Jhi1U8fGT8oopIMLKQPWvF3FGE242LyYR1C1PLprQk9VMxf6iP0OBRfhG/thu
MzDgxHjbqlsDY6eWnAt2ViTL8MG+1TobCEGkifo6j2kLk8ARy0C1ThkdVGDIc970
xvKX7QouOf94TT3C+2kfdV6TyCEG7BtYfjkirDuMRgOddz0QhAuXC3yi4f7lympq
k7w6IV//x/B7qbVREWl06hP7/HpKBg==
=1GRG
-----END PGP SIGNATURE-----

--V4b9U9vrdWczvw78--

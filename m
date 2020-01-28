From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Date: Tue, 28 Jan 2020 15:26:32 +0000
Message-ID: <20200128152632.GF4689@sirena.org.uk>
References: <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
 <62cea895-c1f1-a833-b63c-050642bb8a79@codethink.co.uk>
 <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 01:19:17PM +0000, Jon Hunter wrote:
> On 28/01/2020 08:59, Ben Dooks wrote:
> > On 27/01/2020 19:23, Dmitry Osipenko wrote:
> >> 27.01.2020 22:20, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> 24.01.2020 19:50, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>
> >>>> On 23/01/2020 19:38, Ben Dooks wrote:
> >>>>> On 07/01/2020 01:39, Dmitry Osipenko wrote:
> >>>>>> 06.01.2020 22:00, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>>> On 05/01/2020 10:53, Ben Dooks wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> >> I also suspect that s32 may need some extra patches and thus could be
> >> worthwhile to stop advertising it as well.

> > As far as I am aware that works and we can hit the audio rates for it.

> I ran a test on Tegra124 Jetson-TK1 and 24-bit playback seems to work as
> Ben has indicated. So I don't think it is broken.

> Can you try Ben's testcase on Tegra30 (ie. generate a tone using sox and
> use aplay to play)?

Another test application that's quite useful for this sort of stuff is
speaker-test, it generates audio data directly in arbatrary formats and
it's part of alsa-utils so if you've got aplay and friends you may
already have it already installed.

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4wUqcACgkQJNaLcl1U
h9B6zwf/bk3qZHsSK2RLEgZKCG2/3BpReS1NgtJgzDzuTw0u3kGyEKE9Q0j3VCfH
B9C4tiFnJuE2wA8p/AvUQJgN3QfJ0HRkNSJJ2hmYYVoIb8TfSSo/YGOjw/heTKNH
ZS+BixlzZq9j8NueNO/IvR5iC6l1llkzVk/qWmVKL5nJ2KQXbQ8vc4PA/8kZONgj
ANqDiMzgz/Blsh6HS0sZG9eq2i631rqNdtHUo53ik2KpAF860XiUWtWirTqwpBZ3
ID1PjemWQ1qcivZql2rhDT2ZiQ7gcqSk/oZT+dZnhwUIDXRYtrv52tp0gLRcME2w
ljW6U5CNV6GT5egrDAU5mKLeG0J8lg==
=sDvO
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--

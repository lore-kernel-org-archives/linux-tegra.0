From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5.2 00/20] 5.2.6-stable review
Date: Mon, 5 Aug 2019 13:48:21 +0200
Message-ID: <20190805114821.GA24378@ulmo>
References: <20190802092055.131876977@linuxfoundation.org>
 <20190802172105.18999-1-thierry.reding@gmail.com>
 <20190803070932.GB24334@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190803070932.GB24334@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 03, 2019 at 09:09:32AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Aug 02, 2019 at 07:21:05PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > On Fri, 02 Aug 2019 11:39:54 +0200, Greg Kroah-Hartman wrote:
> > > This is the start of the stable review cycle for the 5.2.6 release.
> > > There are 20 patches in this series, all will be posted as a response
> > > to this one.  If anyone has any issues with these being applied, plea=
se
> > > let me know.
> > >=20
> > > Responses should be made by Sun 04 Aug 2019 09:19:34 AM UTC.
> > > Anything received after that time might be too late.
> > >=20
> > > The whole patch series can be found in one patch at:
> > > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.2=
=2E6-rc1.gz
> > > or in the git tree and branch at:
> > > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc=
=2Egit linux-5.2.y
> > > and the diffstat can be found below.
> > >=20
> > > thanks,
> > >=20
> > > greg k-h
> >=20
> > All tests passing for Tegra ...
> >=20
> > Test results for stable-v5.2:
> >     12 builds:	12 pass, 0 fail
> >     22 boots:	22 pass, 0 fail
> >     38 tests:	38 pass, 0 fail
> >=20
> > Linux version:	5.2.6-rc1-gbe893953fcc2
> > Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
> >                 tegra194-p2972-0000, tegra20-ventana,
> >                 tegra210-p2371-2180, tegra30-cardhu-a04
>=20
> Great!  Thanks for testing all of these and letting me know.

Hi Greg,

I stumbled across something as I was attempting to automate more parts
of our process to generate these reports. The original test results were
=66rom a different version of the tree: 5.2.6-rc1-gdbc7f5c7df28. I suspect
that's the same thing that you were discussing with Pavel regarding the
IP tunnel patch that was added subsequent to the announcement.

Just for my understanding, does this mean that the patch still makes it
into the 5.2.6 release, or was it supposed to go into 5.2.7?

One problem that I ran into was that when I tried to correlate the test
results with your announcement email, there's no indication other than
the branch name and the release candidate name (5.2.6-rc1 in this case),
so there's no way to uniquely identify which test run belongs to the
announcement. Given that there are no tags for the release candidates
means that that's also not an option to uniquely associate with the
builds and tests.

While the differences between the two builds are very minor here, I
wonder if there could perhaps in the future be a problem where I report
successful results for a test, but the same tests would be broken by a
patch added to the stable-rc branch subsequent to the announcement. The
test report would be misleading in that case.

I noticed that you do add a couple of X-KernelTest-* headers to your
announcement emails, so I'm wondering if perhaps it was possible for you
to add another one that contains the exact SHA1 that corresponds to the
snapshot that's the release candidate. That would allow everyone to
uniquely associate test results with a specific release candidate.

That said, perhaps I've just got this all wrong and there's already a
way to connect all the dots that I'm not aware of. Or maybe I'm being
too pedantic here?

Thierry

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1IF4MACgkQ3SOs138+
s6FfvhAAtYLaFxO1ZbDWTHEzD+V/FdBAPgHumvCme5NQJ20moeJtzbRfs6dg05s5
2a0J0GXUUXEKyiX/fOtWnHikUDy45SBgLUeQs7zKrlal+wcpHAU4ILU24y+zvzA5
ur6QFpcoQOOB8YLUYdvo8YkLXzZein8CHMc4BztmxV22h25UKM6VXhazYRpQZNEK
sK0nEal97hvbjNa+ljMu59NdcG18cYAc3jjfGdH8aKoSAMAqcJOAROeyslhYrxt9
GpvQz5ukO/TGh6DE6PX8LVPByN7VB6mhsXu1RDoXABwTmLDlYZKBjdbpQH0NLK7K
rAVjSUeMHNTRXtVLJ3xvLI0ji2S4EA44UlbiMpXmjVC9J5QRA5SE+6Tvy3Yf3B4D
bReO6RYeMab4P10/9kuwOTOfHu+RaJVOP8U+bS29zv2oP8vck7wpMhRYo7irRInD
1aLnmlPH7kT/m7EDOcUpEh+DOFAwva8+7nF9vi8Kq/jIdjoTlHVhNXriw1vI0+2K
Hzu9VdfMBsehOhbrSf1Cx2Vp8aaMunxsUyYICiuPINO5+R4fTTx1kuNxJPR2W6Jl
ZN2YoE92ZLJ00+S6BJbCU+3u+f+Oj3o2zKDlYw9w1uzYCP46Ce9EF8R7cPeD5e9j
QFOFa4QwfsiBcrAR/0fTReb5rBq3H/dk6ys8nbPWbw3lo8W1yeE=
=YQnS
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

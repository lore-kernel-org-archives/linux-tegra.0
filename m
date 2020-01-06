From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] mmc: tegra: fix SDR50 tuning override
Date: Mon, 6 Jan 2020 14:37:03 +0100
Message-ID: <20200106133703.GE1955714@ulmo>
References: <245d569e4c258063dbd78bd30c7027638b30f059.1577960737.git.mirq-linux@rere.qmqm.pl>
 <20200106120718.GA1955714@ulmo>
 <20200106122745.GA3414443@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+JUInw4efm7IfTNU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200106122745.GA3414443@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lucas Stach <dev@lynxeye.de>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--+JUInw4efm7IfTNU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 01:27:45PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 06, 2020 at 01:07:18PM +0100, Thierry Reding wrote:
> > On Thu, Jan 02, 2020 at 11:30:50AM +0100, Micha=C5=82 Miros=C5=82aw wro=
te:
> > > Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
> > > broke SDR50 tuning override. Use correct NVQUIRK_ name.
> > >=20
> > > Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
> > > Depends-on: 4f6aa3264af4 ("mmc: tegra: Only advertise UHS modes if IO=
 regulator is present")
> > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > ---
> > >  drivers/mmc/host/sdhci-tegra.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Oh my... good catch!
> >=20
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> >=20
> > I also ran this through our internal test system and all tests pass, so
> > also:
> >=20
> > Tested-by: Thierry Reding <treding@nvidia.com>
> >=20
> > I'm not sure if that "Depends-on:" tag is anything that's recognized
> > anywhere. It might be better to turn that into an additional "Fixes:"
> > line. Adding Greg to see if he has a standard way of dealing with this
> > kind of dependency.
> >=20
> > Greg, what's your preferred way to handle these situations? I think the
> > intention here was to describe that the original error was introduced by
> > commit 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes"), but then commit
> > 4f6aa3264af4 ("mmc: tegra: Only advertise UHS modes if IO regulator is
> > present") moved that code around, so this patch here will only be back-
> > portable until the latter commit, but should be backported until the
> > former.
>=20
> The stable kernel rules document says how to handle this, but the
> "depends on" commit id in the comment to the right of the stable@k.o cc:
> line in the changelog area.

That only mentions "static" prerequisites needed by the patch, but what
if the prerequisites change depending on version?

Could I do something like this:

	Cc: <stable@vger.kernel.org> # 4.4.x: abcdef: ...
	Cc: <stable@vger.kernel.org> # 4.9.x: bcdefa: ...
	Cc: <stable@vger.kernel.org>

Would that mean that the patch is selected for all stable releases
(because of the last line with no version prerequisite) but when applied
for stable-4.4 the abcdef patch gets pulled in and for stable-4.9 the
bcdefa dependency is applied before the patch?

I suppose this is perhaps a bit of an exotic case, but it might be good
to document it specifically because it might be fairly rare. I can draft
a change if you think this is useful to add.

Thierry

--+JUInw4efm7IfTNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4TN/0ACgkQ3SOs138+
s6Gf6A/8DvUkX7G3C3SRLThd/KInbrXQTvY5GaqwhZeQCwWJc+qXeyxc4SSbHOig
90ipVBR0VmEtT5ti3g365UWoQf0hxFZ/+0nIU105pjbtCJ1JwUtF2mvBvRJ3906D
fTtqJeb6FvdAVAeweLiifczATkfFQHqOy3k+ChfKyAauaDoBi/eErkwYFWvMywZo
oLxEBMjiSdbPUxqJnzhEuoq64aGHxqsqOulRSvalGfAUwaFJCsqXx0zsW4TXMWwv
q0Nm5qSnZ5zXVeNX2xHIXv+L7/a9FBFp4E5wY/awZvqH8EZIH3Ms6tlkwitG1WsW
HHtjlJ1wgGPMeqoDBIkfoQLm+i8kDiei83fsQR3aIr+SR0RBVt8aisb4v/Jz4FMY
TGiOY4ugVe8tQUUQlydJ3Wc5tN33/8kqYBDlxTLb6U5kYvapDg86S9ejWIUk3Qdj
IhejPfTn14qSookBpUpAWp1C4uvAKiqEeVxf0hb1TJXP3ZekfVpOQSj71Poj4ybz
X872X94OKhBJFvv654mMB34WfQ3WePQC0PqAU1Z8usrQAAWWUl6cvonD2LWKr6jK
6YOoFuFHL6fhZoyahVvVAuYhX8HjJnCsP5k0HYc/enDHICTW5a1U2B0dSOpbHpjQ
ZUjyyLiMaY14zDVzIVWJp7U5dT9YVks3cN9h2BqZ0RRzKdDBeBA=
=GeZw
-----END PGP SIGNATURE-----

--+JUInw4efm7IfTNU--

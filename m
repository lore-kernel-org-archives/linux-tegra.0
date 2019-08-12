From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5.2 00/20] 5.2.6-stable review
Date: Mon, 12 Aug 2019 11:05:53 +0200
Message-ID: <20190812090553.GA8903@ulmo>
References: <20190802092055.131876977@linuxfoundation.org>
 <20190802172105.18999-1-thierry.reding@gmail.com>
 <20190803070932.GB24334@kroah.com>
 <20190805114821.GA24378@ulmo>
 <20190809085253.GA25046@kroah.com>
 <20190809130449.GA27957@ulmo>
 <20190809154959.GD22879@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809154959.GD22879@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 05:49:59PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Aug 09, 2019 at 03:04:49PM +0200, Thierry Reding wrote:
> > On Fri, Aug 09, 2019 at 10:52:53AM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Aug 05, 2019 at 01:48:21PM +0200, Thierry Reding wrote:
> > > > Hi Greg,
> > >=20
> > > Sorry for the delay, this got pushed down my queue...
> > >=20
> > > > I stumbled across something as I was attempting to automate more pa=
rts
> > > > of our process to generate these reports. The original test results=
 were
> > > > from a different version of the tree: 5.2.6-rc1-gdbc7f5c7df28. I su=
spect
> > > > that's the same thing that you were discussing with Pavel regarding=
 the
> > > > IP tunnel patch that was added subsequent to the announcement.
> > > >=20
> > > > Just for my understanding, does this mean that the patch still make=
s it
> > > > into the 5.2.6 release, or was it supposed to go into 5.2.7?
> > > >=20
> > > > One problem that I ran into was that when I tried to correlate the =
test
> > > > results with your announcement email, there's no indication other t=
han
> > > > the branch name and the release candidate name (5.2.6-rc1 in this c=
ase),
> > > > so there's no way to uniquely identify which test run belongs to the
> > > > announcement. Given that there are no tags for the release candidat=
es
> > > > means that that's also not an option to uniquely associate with the
> > > > builds and tests.
> > > >=20
> > > > While the differences between the two builds are very minor here, I
> > > > wonder if there could perhaps in the future be a problem where I re=
port
> > > > successful results for a test, but the same tests would be broken b=
y a
> > > > patch added to the stable-rc branch subsequent to the announcement.=
 The
> > > > test report would be misleading in that case.
> > > >=20
> > > > I noticed that you do add a couple of X-KernelTest-* headers to your
> > > > announcement emails, so I'm wondering if perhaps it was possible fo=
r you
> > > > to add another one that contains the exact SHA1 that corresponds to=
 the
> > > > snapshot that's the release candidate. That would allow everyone to
> > > > uniquely associate test results with a specific release candidate.
> > > >=20
> > > > That said, perhaps I've just got this all wrong and there's already=
 a
> > > > way to connect all the dots that I'm not aware of. Or maybe I'm bei=
ng
> > > > too pedantic here?
> > >=20
> > > You aren't being pedantic, I think you are missing exactly what the
> > > linux-stable-rc tree is for and how it is created.
> > >=20
> > > Granted, it's not really documented anywhere so it's not your fault :)
> > >=20
> > > The linux-stable-rc tree is there ONLY for people who want to test the
> > > -rc kernels and can not, or do not want to, use the quilt tree of
> > > patches in the stable-queue.git tree on kernel.org.  I generate the
> > > branches there from a script that throws away the current -rc branch =
and
> > > rebuilds it "from scratch" by applying the patches that are in the
> > > stable-quilt tree and then adds the -rc patch as well.  This tree is
> > > generated multiple times when I am working on the queues and then whe=
n I
> > > want to do a "real" -rc release.
> > >=20
> > > The branches are constantly rebased, so you can not rely on 'git pull'
> > > doing the right thing (unless you add --rebase to it), and are there =
for
> > > testing only.
> > >=20
> > > Yes, you will see different results of a "-rc1" release in the tree
> > > depending on the time of day/week when I created the tree, and someti=
mes
> > > I generate them multiple times a day just to have some of the
> > > auto-builders give me results quickly (Linaro does pull from it and
> > > sends me results within the hour usually).
> > >=20
> > > So does that help?  Ideally everyone would just use the quilt trees f=
rom
> > > stable-queue.git, but no everyone likes that, so the -rc git tree is
> > > there to make automated testing "easier".  If that works with your
> > > workflow, wonderful, feel free to use it.  If not, then go with the
> > > stable-quilt.git tree, or the tarballs on kernel.org.
> >=20
> > I'll have to look into that, to see if that'd work. I have to admit that
> > having a git tree to point scripts at is rather convenient for
> > automation.
> >=20
> > > And as for the SHA1 being in the emails, that doesn't make all that m=
uch
> > > sense as that SHA1 doesn't live very long.  When I create the trees
> > > locally, I instantly delete them after pushing them to kernel.org so I
> > > can't regenerate them or do anything with them.
> >=20
> > Fair enough. I suppose the worst thing that could happen is that we may
> > fail to test a couple of commits occasionally. In the rare case where
> > this actually matters we'll likely end up reporting the failure for the
> > stable release, in which case it can be fixed in the next one.
> >=20
> > > DOes that help explain things better?
> >=20
> > Yes, makes a lot more sense now. Thanks for taking the time to explain
> > it. Do you want me to snapshot this and submit it as documentation
> > somewhere for later reference?
>=20
> It probably should go somewhere, but as the number of people that do
> "test stable kernels in an automated way" is very low, so far I've been
> doing ok with a one-by-one explaination.  I guess if it's more obvious,
> more people would test, so sure, this should be cleaned up...

How about something like the below. It applies to the stable-queue.git
repository.

Thierry

--- >8 ---
=46rom 4083add6ccb4a1c23edeba650170470bcc5d5205 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Mon, 12 Aug 2019 10:58:35 +0200
Subject: [PATCH] Describe the stable-queue release process

Add a README file that describes how release candidates for stable
kernels are created and how users are expected to use them. This is
reworded from Greg's reply here:

	https://lore.kernel.org/stable/20190809085253.GA25046@kroah.com/
---
 README | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 README

diff --git a/README b/README
new file mode 100644
index 000000000000..868469a73f68
--- /dev/null
+++ b/README
@@ -0,0 +1,31 @@
+This repository is the canonical source for patches that make up the stable
+kernel releases. It consists of a set of directories for each of the stable
+kernels, as well as a directory that contains a snapshot of the patches for
+each stable release.
+
+The patches for each release can be found along with a complete tarball of
+a release in the following location:
+
+	https://kernel.org/pub/linux/kernel/vX.Y/
+
+For each stable release candidate, a patch representing the diff of all the
+patches in the stable queue is uploaded here:
+
+	https://kernel.org/pub/linux/kernel/vX.Y/stable-review/
+
+As a convenience for people that want to test release candidates of stable
+releases, a branch of the kernel git tree is created containing all of the
+patches in the given stable queue. These branches are available in the
+following repository:
+
+	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
+
+A branch exists for each of the stable releases. Note, though, that these
+branches are recreated from scratch by applying the queued stable patches
+on top of the prior release. As a consequence, the branches are not fast-
+forward and can change after a release candidate has been announced. The
+contents of the branch may therefore not match exactly what was released
+as the release candidate, depending on when you fetch it. No tags are
+created to track individual release candidates. If you're interested in
+exact reproducibility of a stable release candidate, please use the patches
+from the location mentioned above.
--=20
2.22.0


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RK+4ACgkQ3SOs138+
s6FpxQ//TaRLum2ntnZkBbmc8jSsCjUZCnQ6rt7ZRLckqrE9IoKkuSqMl7Ee0m4B
YjIu8BkiHSTTdr8cnAaYuSyXutt+5XHbFtajsgd7vGwv4gPdtKB6Fnn3gYuQ8d22
vaJXjauAxElq0D3m2IiDpo19AuEqD36VK9TAHH129Eh13BfzL0Gu9AmP9Q83IA9r
JykIBte/q8jk0fxmEx5HKV97f1Efvf91Y8J+q2hNMIF/yNXMCZWBA7DHIcPda4CB
Bv2CNqj/HRYnCVdDNuPCFE6T1xJFLM4WTwXcmRQWvWDI6Jt736gDyhDbdgwAQf+k
Y7S4FW9uLOOmuaUnZmaoAL7K6TjG7cFX3ONukJRhbtWMpcIF7O8v/FhCGNaw44EL
SfJRthoTO4W8WwjlFNvggM0PTYdsJETeoIHOVZqAsYRWXTfLkKN4rmEYgR/ONFA1
K3y9dMzbK4RPT1vqce7Aj2e1TX41wUjsh0AME+kkHIRsg0u3fA9zuFVuRdM4b8N/
a9stT7bWfX1Y1G7HhjrTgz/Ztwa0v8XrM6s+azcq0uh4MWnlmOGoeCFqkcN8+EsC
1adAEvrUI8fHVt/AcNjZfubf3cJ7n7++Oy5Bcw5QnDyKmlqfJq0Nwa7U3UHAVC09
HOBm7jXfR7BZTbJiuiGhAo6QoIDf+gyASvMe4ZSDca0WMl3BRgY=
=WLrv
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--

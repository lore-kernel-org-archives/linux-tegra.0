From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 1/10] mailbox: Add Tegra HSP driver
Date: Mon, 21 Nov 2016 09:17:52 +0100
Message-ID: <20161121081752.GC25171@ulmo.ba.sec>
References: <20161118161719.24153-1-thierry.reding@gmail.com>
 <20161119022742.GK2543@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1717167254662658692=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161119022742.GK2543@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Jon Hunter <jonathanh@nvidia.com>, arm@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1717167254662658692==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 06:27:42PM -0800, Olof Johansson wrote:
> Hi,
>=20
> On Fri, Nov 18, 2016 at 05:17:10PM +0100, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 1001354ca34179f3db924eb66672442a1731=
47dc:
> >=20
> >   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.10-mailbox
> >=20
> > for you to fetch changes up to 68050eb6c611527232fe5574c7306e97e47499ef:
> >=20
> >   mailbox: tegra-hsp: Use after free in tegra_hsp_remove_doorbells() (2=
016-11-18 14:32:13 +0100)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > mailbox: Add Tegra HSP driver
> >=20
> > This contains the device tree bindings and a driver for the Tegra HSP, a
> > hardware block that provides hardware synchronization primitives and is
> > the foundation for inter-processor communication between CPU and BPMP.
> >=20
> > ----------------------------------------------------------------
> > Dan Carpenter (1):
> >       mailbox: tegra-hsp: Use after free in tegra_hsp_remove_doorbells()
> >=20
> > Joseph Lo (2):
> >       soc/tegra: Add Tegra186 support
>=20
> I don't think you really needed to merge this in here, since all you need=
 it
> for is to fulfill the kconfig dependency and enable the driver, right? Th=
at'd
> happen when the driver and soc branch is merged at the toplevel anyway.

The reason I did this is that I wanted each branch to be buildable as a
way to confirm that the dependencies are correct. In order to do that I
need the Kconfig symbol to enable the driver.

I suppose there are other ways I could've done that, though. Maybe in
the future new SoC Kconfig symbols should just be introduced way ahead
of time, so that they're already in a release or two before actual code
starts to emerge.

> Anyhow, no damage done, I've merged this in. I would say that it'd be a l=
ittle
> more logical to send the SoC branch before the driver branch given this
> dependency though.

The reason that the SoC branch was sent after is because only the first
commit in that branch was pulled into the mailbox branch.

In retrospect, I think perhaps a better approach would've been to have a
separate branch with only the Kconfig symbol addition and pull that in
where needed.

Thanks,
Thierry

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYMq2vAAoJEN0jrNd/PrOhSLQP/j+BUxdRDt391u6vsDr6YCuv
FI/l20iPQmSTmBg67wH6r/s5MnkdI7itF0T52DlIISIVoEMo+pQwJKnClMN7AX9/
1hLbIfEDQfNHmodqz7BHdEhRHjqUf5d+a/0phKfPaPp/PJn2CSmzmhpAbNiSYdAi
j5C6UdhhL0PH/vtTLbn0DUiUVC2WjCbUWcgDyiMwF6IXfxDtG8gaiQ7mHbt0VKsP
ETyxRSY0E7nm95PnPJgHxfQS7Xy3tTusBlNG9ZnhYXr61clQNDKOfCa1CS3PP0t2
mG3z3GTx3EdhB4ea5m3IW1ZJC7+tJT37lKcF+JB7y4Mt7zZbriwvAk8F5fVjSvqr
K9SELl9YoPsbMFeiUG1eHCQuWAW88AQLSS1Z+11drZhHQ5Bqo25pHX5M4C5HIB3L
qPhbk846gy06If9nlNMJbGypFI+hVc1K8DRDVlz3GhFK+6rdrwbX8mwEiXXE4lCR
tcBJD57e/nKEYbQzSXRqKV3otXTyJPYwKjVs/TdTd7dkxAteMMGB528gMOxoSIG4
OL1wsX7Rf5Y2UCIPnnFvplv/A2Q/CDs3zwg0oMki13Ra0kJMZQNC1oyUWUJ5reAI
BShl01IGmiuJK7Soy8dow6jYzzMPZL18f+NPEJ3QCmWrSDY6vAb0ZvusJ0kHBH11
Euzwl1lSMjYzla7TJG4D
=vQ1I
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--


--===============1717167254662658692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1717167254662658692==--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v4.19-rc1
Date: Fri, 3 Aug 2018 12:43:18 +0200
Message-ID: <20180803104318.GA28546@ulmo>
References: <20180712154128.22705-1-thierry.reding@gmail.com>
 <20180712154128.22705-6-thierry.reding@gmail.com>
 <20180714212210.at4b2gcpopsznyxx@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5398948574797738893=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180714212210.at4b2gcpopsznyxx@localhost>
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
Cc: linux-tegra@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============5398948574797738893==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 14, 2018 at 02:22:10PM -0700, Olof Johansson wrote:
> On Thu, Jul 12, 2018 at 05:41:28PM +0200, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56=
ab40:
> >=20
> >   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.19-arm64-dt
> >=20
> > for you to fetch changes up to 7780a03495e13cd2bef704bcbf8c727de9f65232:
> >=20
> >   arm64: tegra: Add CPU nodes to Tegra194 device tree (2018-07-02 15:57=
:39 +0200)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > arm64: tegra: Device tree changes for v4.19-rc1
> >=20
> > These changes enable the GPIO controllers on Tegra194 SoCs, which in
> > turn allows the SD card detection and ethernet controllers to be enabled
> > as well. The Tegra194 device tree is also extended with the list of CPUs
> > and a PSCI node to inform the kernel about the presence of PSCI capable
> > firmware.
>=20
> Merged, thanks. Are you planning on supporting 194 better than 186? That =
never
> really made it to a useful level upstream I think? :(

I think we have pretty decent upstream support for Tegra186 at this
point. It took a little time because Tegra186 was a little work than
many previous chips because the changes were less incremental than
before.

Generally our goal is to provide at least feature parity with prior
chips for each new chip. Usually we manage to incrementally add new
features, too.

Perhaps the reason why it seems that Tegra186 is not well supported
upstream is because a lot of things have moved into BPMP firmware,
which deals with a lot of the nitty gritty details that prior chips
needed a driver for.

That said, I may be missing something. Do you have any specific features
in mind that aren't working upstream on Tegra186?

Tegra194 uses the same firmware as Tegra186 (well, a binary compatible
interface to the firmware, I should say), so we've been able to
bootstrap it much quicker than prior chips. That said, there are a slew
of new features in Tegra194, not all of which are easy to upstream. But
we're still aiming for at least feature parity with prior chips and get
as much of the new hardware supported as we can.

Thierry

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltkMcMACgkQ3SOs138+
s6G6hhAAgmD4vClbLlQ+e1aW8ppPQ0Ba5cw0d/Rh/1F91uixNS8XEP/+XuZqV/uR
KoRFdce3T5/AflMN1oCY6rlSJ3aDkhmLptNZ/BZGKlGCHiwyyOO51hKZODVboqqe
Z2HYPTQFfNzuAgfhbxOh5+FVwxjiqWsQcaabQiRiy9fpDGGDnpNUjHDOZJq+RWbb
rWx2Ckn/LysrrUXxgtoCWjZTEjTyE/z3gtjXvnoO+4J/xsOtxhiA63zQOyLOCL+O
c0TR8TWHNeynY8S0vfsCdZFprzxenkW+KnmbVvNkxiDMMLVqKkxC+fibDP/lL/BZ
QF8mFwAV2FYChbleFYGVhnf0ARJPMO/DFAZIwUev/oq+QgLhgadEAKz7CBCh+HEq
QN02YCSs7PYLZjHH3R08tnsF4honS9PKULH+zzVg7D21whHdGesGmU+3dokQ+7Mm
CsS2qg+pcuTVSEZfr64fPEROybg9GGoWWxSxeLbo3n0C2HiDY8vSjxn98/gqEecV
0+5xHrqSgaw3JS7hBRV6ritx/66EpLB0CU9wULFZ8Ye1kikktiQNJPddDuLqwUI9
1rBsQ4acoSXdSrI0SnuodnBlK7CfNu8EuwqHCkK7sa7fshWo8rfe+irh4aMtow4C
ODGASaTH/6J0lr7x+wWi7Yhvj4v25DDTze0XYdHxP5AH+KVGs1A=
=dVYu
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--


--===============5398948574797738893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5398948574797738893==--

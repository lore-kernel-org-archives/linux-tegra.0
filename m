From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 2/5] memory: tegra: Changes for v4.18-rc1
Date: Fri, 18 May 2018 22:43:51 +0200
Message-ID: <20180518204351.GA26800@ulmo>
References: <20180518142245.20242-1-thierry.reding@gmail.com>
 <20180518142245.20242-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5922537039576453074=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180518142245.20242-2-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============5922537039576453074==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 04:22:42PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 60cc43fc888428bb2f18f08997432d426a2433=
38:
>=20
>   Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-4.18-memory
>=20
> for you to fetch changes up to bef89a8d81ca97aca864778746b110cf52847868:
>=20
>   memory: tegra: Remove Tegra114 SATA and AFI reset definitions (2018-05-=
18 12:33:02 +0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> memory: tegra: Changes for v4.18-rc1
>=20
> This contains some cleanup of the memory controller driver as well as
> unification work to share more code between Tegra20 and later SoC
> generations. Also included are an implementation for the hot resets
> functionality by the memory controller which is required to properly
> reset busy hardware.
>=20
> ----------------------------------------------------------------
> Dmitry Osipenko (14):
>       dt-bindings: memory: tegra: Add hot resets definitions
>       memory: tegra: Do not handle spurious interrupts
>       memory: tegra: Setup interrupts mask before requesting IRQ
>       memory: tegra: Apply interrupts mask per SoC
>       memory: tegra: Remove unused headers inclusions
>       memory: tegra: Squash tegra20-mc into common tegra-mc driver
>       memory: tegra: Introduce memory client hot reset
>       memory: tegra: Add Tegra20 memory controller hot resets
>       memory: tegra: Add Tegra30 memory controller hot resets
>       memory: tegra: Add Tegra114 memory controller hot resets
>       memory: tegra: Add Tegra124 memory controller hot resets
>       memory: tegra: Register SMMU after MC driver became ready
>       dt-bindings: memory: tegra: Remove Tegra114 SATA and AFI reset defi=
nitions
>       memory: tegra: Remove Tegra114 SATA and AFI reset definitions

Please don't pull this just yet. Dmitry just pointed out to me that the
final two patches here break bisectibility. I'll reorder them and will
send out a new pull request.

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr/OwIACgkQ3SOs138+
s6EjDxAAv44n2gi56t1ZX4Er1K6PqIoNGxpMHa6WE/fQWLati5P+k16sT8c6KnXd
hYUR30lBT63eneVoYvPmZ/AkDHOqPMXjBw1gbxvqgG93J1Pco2EDAcogvEirEpdf
ihbDFD+jkmC5co6RQhBLwPZHbvN1eammJcmW1ZQKQ0egBeFlxz8Bu5ekefVhZF/U
MqMLXdIWJ3swXi1ITDjGBJUg5eQJJMhyIuXuizAv/lhLuNGqDURZEOYVKsJkFkib
1YaZ/JPTn2yjZcPw5A/PiRghWz+XiZehSnoBZUshdlMRYcyqm76K3VL9RdL5Cpxk
iioOt68RdSwrsOEAwZmv6zeJS1rCnRvIRbHrBvE/AxWmqtgeBR0sfULlUF5FNo78
4KvdjZ4ni2pt7MmufqAyeTIldiAtXvJ9CxML4hQbdjCmf7v6qRUgtGnRAcfg7zBd
F9TXqNg8Df9Tpwm5RngstWGRkKyM1OTSYh1GSSVQo03seG+oZFl4DsLk5HE7Ozly
hfwlV/30SzTScxNAVwQSmw2O8tZ3CJuxwxbixYSaOVMaQmguHByo9SkExGaoXCQn
tKl5x0ojQ9A5d69TFl/kWioc4gJ9FOfonUTiXVI76F0XR+Ya2fIWZZ+8uvt3XEgc
4pCnkCH1hgayZ6s4SEcRm3jVHpHIXcd2PFchbns0Vgs3hC90eIE=
=v1Gy
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--


--===============5922537039576453074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5922537039576453074==--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: dts: tegra: replace legacy *,wakeup property with
 wakeup-source
Date: Tue, 16 Feb 2016 11:37:57 +0100
Message-ID: <20160216103757.GA9979@ulmo>
References: <1454968543-12035-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0178094862920477298=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1454968543-12035-1-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============0178094862920477298==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2016 at 09:55:43PM +0000, Sudeep Holla wrote:
> Though the keyboard and other driver will continue to support the legacy
> "gpio-key,wakeup", "nvidia,wakeup-source" boolean property to enable the
> wakeup source, "wakeup-source" is the new standard binding.
>=20
> This patch replaces all the legacy wakeup properties with the unified
> "wakeup-source" property in order to avoid any further copy-paste
> duplication.
>=20
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts         | 2 +-
>  arch/arm/boot/dts/tegra114-roth.dts            | 2 +-
>  arch/arm/boot/dts/tegra114-tn7.dts             | 2 +-
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts      | 2 +-
>  arch/arm/boot/dts/tegra124-nyan.dtsi           | 4 ++--
>  arch/arm/boot/dts/tegra124-venice2.dts         | 2 +-
>  arch/arm/boot/dts/tegra20-harmony.dts          | 2 +-
>  arch/arm/boot/dts/tegra20-paz00.dts            | 2 +-
>  arch/arm/boot/dts/tegra20-seaboard.dts         | 4 ++--
>  arch/arm/boot/dts/tegra20-trimslice.dts        | 2 +-
>  arch/arm/boot/dts/tegra20-ventana.dts          | 2 +-
>  arch/arm/boot/dts/tegra20-whistler.dts         | 2 +-
>  arch/arm/boot/dts/tegra30-apalis-eval.dts      | 2 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi          | 2 +-
>  arch/arm/boot/dts/tegra30-colibri-eval-v3.dts  | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 4 ++--
>  16 files changed, 19 insertions(+), 19 deletions(-)

I've applied this for 4.6, though I took the liberty of splitting this
up into ARM and arm64 patches, since the ARM SoC maintainers prefer it
that way.

Thanks,
Thierry

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWwvwDAAoJEN0jrNd/PrOhfbAP/30upmYWeAV+/lB8fPx/FMX+
9fDRqUykb0vsgPYh08VQUa0cUuc3eSqgHDbp3HjytZs2Lz+ApeAdbsMxc1mu9CxX
RttKNV1j4QrRtbIXQWgElQVLWjgKJccK+B/t6WyYTOegZdnnxKK/MS1QI03E5HRy
X8J/dSDtPc4qawI6HIqj4HLo0tIUF3doUck2dPB2dl9hAFSGQcpDmhZtgZ6CK6PG
besh3oinb2/IxIg9P+QlaZg27JT4F9UsWEAMq+dF77mP8p8rj7KIPsbUgX07uYXo
k2FKG5kK6JN4x1xMuwov04gv073LANc19ayrhXrZfrXDph69jQvMc6FebDoOjG2z
VZk8E7eLRK5rEz3pFenqzx67xoMMjwY2CPs8907yO4/Ihayd4qXoSTIGiA9wAEis
ll2lwMSQHgSIXeBat5EChxJbXky/UI1NEvc6odWLSbzquViPuelCWp/uXH86HECj
zff5VW9PRnBx5/1peVRfcKkKNQ/cXh9XHfJtdFjy0Lj+rg9OTwb+d7Ugn9MbRPfg
MvKVngMut8eh1KoWHRmeACfGeGqhq9CuJUD1ALNhMZ1UioNH9JnTXRxCpt3ORjbT
lkvrIg3IYzw0TlGhU0pVFYiyVVWAJ1Cjhyi7hg+pk3T15Q0Mz5XCPvHRAcEeUBE1
KyZdRzOX9hxoAuZUv+ug
=VFwQ
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--


--===============0178094862920477298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0178094862920477298==--

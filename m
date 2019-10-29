From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v10 00/15] memory: tegra: Introduce Tegra30 EMC driver
Date: Tue, 29 Oct 2019 14:51:52 +0100
Message-ID: <20191029135152.GJ508460@ulmo>
References: <20190811210043.20122-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8tZVdKiiYitVG083"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190811210043.20122-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--8tZVdKiiYitVG083
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2019 at 12:00:28AM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This series introduces driver for the External Memory Controller (EMC)
> found on Tegra30 chips, it controls the external DRAM on the board. The
> purpose of this driver is to program memory timing for external memory on
> the EMC clock rate change. The driver was tested using the ACTMON devfreq
> driver that performs memory frequency scaling based on memory-usage load.
>=20
> Changelog:
>=20
> v10: - Addressed review comments that were made by Rob Herring to v9 by
>        dropping unnecessary reg descriptions, specifying valid ranges and
>        using boolean type where appropriate in the device-tree patches.
>=20
> v9: - Fixed memory corruption bug that was uncovered after introducing
>       some extra optimizations to the devfreq driver that allows CPU
>       to stay longer in the LP2 cpuidle state. The corruption is caused by
>       a very late AUTO-REFRESH re-enabling due to a possible schedule on
>       waiting for clk-change completion, the re-enabling is now a part of
>       "EMC exec-after-clkchange" hardware sequence.
>=20
>     - Added "type: object" to T124 MC YAML, that was missed in v8 by acci=
dent.
>=20
> v8: - Added two new patches:
>=20
>         memory: tegra20-emc: Increase handshake timeout
>         memory: tegra20-emc: wait_for_completion_timeout() doesn't return=
 error
>=20
>       Turned out that memory-clk handshake may take much more time under
>       some circumstances. The second patch is a minor cleanup. The same
>       changes are also applied to the Terga30 EMC driver addition-patch.
>=20
>       The pattern-properties of YAML bindings gained "type: object", for
>       consistency.
>=20
> v7: - Addressed review comments that were made by Rob Herring to v6 by
>       removing old Terga30 Memory Controller binding once it's converted
>       to YAML, by using explicit patterns for the sub-nodes and specifying
>       min/max clock rates in the YAML.
>=20
>     - Two patches that were added in v6 are removed from the series:
>=20
>         clk: tegra20: emc: Add tegra20_clk_emc_on_pllp()
>         ARM: tegra30: cpuidle: Don't enter LP2 on CPU0 when EMC runs off =
PLLP
>=20
>       Because the problem with the PLLP is resolved now, turned out it was
>       a bug in the CPU-suspend code.
>=20
>     - The "Introduce Tegra30 EMC driver" patch got a fix for the "Same Fr=
eq"
>       bit typo, it's a bit 27 and not 16.
>=20
> v6: - Tegra124 Memory Controller binding factored out into standalone
>       binding because it requires to specify MC_EMEM_ARB_MISC1 for EMEM
>       programming, which is not required for Tegra30. This makes the
>       upstream MC registers specification to match downstream exactly,
>       easing porting of boards memory timings configuration to upstream.
>=20
>     - Tegra30/124 Memory Controller binding converted to YAML.
>=20
>     - Tegra30 External Memory Controller binding now is in YAML format.
>=20
>     - Added workaround for hanging during LP2 when EMC runs off PLLP on
>       Tegra30 in this new patches:
>=20
>         clk: tegra20: emc: Add tegra20_clk_emc_on_pllp()
>         ARM: tegra30: cpuidle: Don't enter LP2 on CPU0 when EMC runs off =
PLLP
>=20
>     - Added info message to the Tegra20/30 EMC drivers, telling about
>       RAM code and a number of available timings:
>=20
>         memory: tegra20-emc: Print a brief info message about the timings
>=20
> v5: - Addressed review comments that were made by Thierry Reding to v4 by
>       adding appropriate copyrights to the source code headers and making
>       Tegra30 EMC driver to use common Tegra20 CLK API directly instead
>       of having a dummy-proxy functions specifically for Tegra30.
>=20
>     - Addressed review comments that were made by Stephen Boyd to v4 by
>       rewording commit message of the "Add custom EMC clock implementatio=
n"
>       patch and adding clarifying comment (to that patch as well) which
>       tells why EMC is a critical clock.
>=20
>     - Added suspend-resume to Tegra30 EMC driver to error out if EMC driv=
er
>       is in a "bad state" as it will likely cause a hang on entering susp=
end.
>=20
>     - Dropped patch "tegra20-emc: Replace clk_get_sys with devm_clk_get"
>       because the replaced clocks are actually should be removed altogeth=
er
>       in the "Drop setting EMC rate to max on probe" patch and that was
>       missed by an accident.
>=20
>     - Added "tegra20-emc: Pre-configure debug register" patch which ensur=
es
>       that inappropriate HW debug features are disabled at a probe time.
>       The same change is also made in the "Introduce Tegra30 EMC driver"
>       patch.
>=20
>     - Added ACKs to the patches from Peter De Schrijver that he gave to v4
>       since all of the v5 changes are actually very minor.
>=20
> v4: - Addressed review comments that were made by Peter De Schrijver to v3
>       by adding fence_udelay() after writes in the "Add custom EMC clock
>       implementation" patch.
>=20
>     - Added two new minor patches:
>=20
>         memory: tegra: Ensure timing control debug features are disabled
>         memory: tegra: Consolidate registers definition into one place
>=20
>       The first one is needed to ensure that EMC driver will work
>       properly regardless of hardware configuration left after boot.
>       The second patch is just a minor code cleanup.
>=20
>     - The "Introduce Tegra30 EMC driver" got also few very minor changes.
>       Now every possible error case is handled, nothing is ignored.
>       The EMC_DBG register is explicitly initialized during probe to be
>       on the safe side.
>=20
> v3: - Addressed review comments that were made by Stephen Boyd to v2 by
>       adding explicit typing for the callback variable, by including
>       "clk-provider.h" directly in the code and by dropping __clk_lookup
>       usage where possible.
>=20
>     - Added more patches into this series:
>=20
>         memory: tegra20-emc: Drop setting EMC rate to max on probe
>         memory: tegra20-emc: Adapt for clock driver changes
>         memory: tegra20-emc: Include io.h instead of iopoll.h
>         memory: tegra20-emc: Replace clk_get_sys with devm_clk_get
>=20
>       Initially I was going to include these patches into other patchset,
>       but changed my mind after rearranging things a tad. The "Adapt for
>       clock driver changes" patch is directly related to the clock changes
>       done in the first patch of this series, the rest are minor cleanups
>       that are fine to include here as well.
>=20
>     - Added some more words to the commit message of "Add binding for NVI=
DIA
>       Tegra30 External Memory Controller" patch, clarifying why common DDR
>       timing device-tree form isn't suitable for Tegra30.
>=20
>     - The Tegra30 EMC driver now explicitly selects the registers access
>       mode (EMC_DBG mux), not relying on the setting left from bootloader.
>=20
> v2: - Added support for changing MC clock diver configuration based on
>       Memory Controller (MC) configuration which is part of the memory
>       timing.
>=20
>     - Merged the "Add custom EMC clock implementation" patch into this
>       series because the "Introduce Tegra30 EMC driver" patch directly
>       depends on it. Please note that Tegra20 EMC driver will need to be
>       adapted for the clock changes as well, I'll send out the Tegra20
>       patches after this series will be applied because of some other
>       dependencies (devfreq) and because the temporary breakage won't
>       be critical (driver will just error out on probe).
>=20
>     - EMC driver now performs MC configuration validation by checking
>       that the number of MC / EMC timings matches and that the timings
>       rate is the same.
>=20
>     - EMC driver now supports timings that want to change the MC clock
>       configuration.
>=20
>     - Other minor prettifying changes of the code.
>=20
> Dmitry Osipenko (15):
>   clk: tegra20/30: Add custom EMC clock implementation
>   memory: tegra20-emc: Drop setting EMC rate to max on probe
>   memory: tegra20-emc: Adapt for clock driver changes
>   memory: tegra20-emc: Include io.h instead of iopoll.h
>   memory: tegra20-emc: Pre-configure debug register
>   memory: tegra20-emc: Print a brief info message about the timings
>   memory: tegra20-emc: Increase handshake timeout
>   memory: tegra20-emc: wait_for_completion_timeout() doesn't return
>     error
>   dt-bindings: memory: tegra30: Convert to Tegra124 YAML
>   dt-bindings: memory: Add binding for NVIDIA Tegra30 Memory Controller
>   dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory
>     Controller
>   memory: tegra: Introduce Tegra30 EMC driver
>   memory: tegra: Ensure timing control debug features are disabled
>   memory: tegra: Consolidate registers definition into common header
>   ARM: dts: tegra30: Add External Memory Controller node

Applied these to for-5.5/clk, for-5.5/dt-bindings, for-5.5/memory and
for-5.5/arm/dt, thanks.

Thierry

--8tZVdKiiYitVG083
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24Q/YACgkQ3SOs138+
s6FSng/9GvNX2ESlUyo+ZW9xuN96/Lggg7Wh/rONstjJj8PeURp4Wyg9R+m01i9S
OKJaGKFDEcOOFC/cChD/plozuId2HBEXoVnwjExRF0MWabOWfNmFc2qp87Gq8Ucu
KGZOhHcXluq+bffxPAlKlHb0DbuPEPLDf6KXhRa77FC+8N3SwCZ/KMMtkLVqLW4F
X6t86MyVU35CoidXfzx+Y9tPbenuOJBEREFkFE/0AsveLJUd1Q1j287zR/wGdupZ
WKzH2PScDnjHSS+XRv+25mij0RN4nbHjT+1oUW6XAyf2L/PzaatT5qibcFpm1KAn
hZDQbBwt5b+wwuy7O1nSBxkAH2yv6kkq4Ll0K+potQeI7GqBtXD2wmNoXTMiklzM
SsxJpDS9orJmdH5BZDwX+g1DUHhm3WWunYR0bafrRCvxPRjGuOQ8T9SzH9rL6vuR
7Dty/TzBURBktNoVxdIzVWqmiIj9QVSH9Aze9ghGrHMaPVI3+P5jVRjSPJPlSHpX
cXEqLla2Xh+BhXjc+yNVYmpQvOTv1U0XcBUSWmEZycV1v4PYj6UAPqCYAw2xAKCz
UPeHl6MVG+cAVtWuDkPpHYccyGx99fR83okiqOGhlGkCjW4xX0YoOVMal4DqYrxx
wMKew82EmDMHh/7J1wJ81SojwUCYB0OC941Y3FlBCsIsTCGQoV8=
=zmek
-----END PGP SIGNATURE-----

--8tZVdKiiYitVG083--

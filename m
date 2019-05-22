From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 00/12] LP0 entry and exit support for Tegra210
Date: Wed, 22 May 2019 15:33:52 +0200
Message-ID: <20190522133352.GO30938@ulmo>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B3NBd8mrXZtPJEYR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--B3NBd8mrXZtPJEYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 04:31:11PM -0700, Sowjanya Komatineni wrote:
> This patch series includes Tegra210 deepsleep or LP0 support with
> deep sleep exit through RTC alarm wake and power button wake events.

There doesn't seem to be support for waking up from a power button
press. Is that in a patch that you didn't send out yet, or are you still
working on that?

The recipient list on this is very trimmed. I'm not sure if this was on
purpose. I'm fine if you want to keep it that way until things settle
down a bit, but eventually the subsystem maintainers will need to see
these, so make sure to Cc them when you think the patches are ready.

Thierry

>=20
> This series also includes save and restore of PLLs, clocks, OSC contexts
> for basic LP0 exit.
>=20
> This patch series is doesn't support for 100% suspend/resume to fully
> functional state and we are working on some more drivers suspend and
> resume implementations.
>=20
> Sowjanya Komatineni (12):
>   irqchip: tegra: do not disable COP IRQ during suspend
>   pinctrl: tegra: add suspend and resume support
>   clk: tegra: save and restore PLLs state for system
>   clk: tegra: add support for peripheral clock suspend and resume
>   clk: tegra: add support for OSC clock resume
>   clk: tegra: add suspend resume support for DFLL clock
>   clk: tegra: support for Tegra210 clocks suspend-resume
>   soc/tegra: pmc: allow support for more tegra wake models
>   soc/tegra: pmc: add pmc wake support for tegra210
>   gpio: tegra: implement wake event support for Tegra210 and prior GPIO
>   soc/tegra: pmc: configure tegra deep sleep control settings
>   arm64: tegra: enable wake from deep sleep on RTC alarm.
>=20
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   7 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi       |   5 +-
>  drivers/clk/tegra/clk-dfll.c                   |  82 ++++++
>  drivers/clk/tegra/clk-dfll.h                   |   2 +
>  drivers/clk/tegra/clk-divider.c                |  19 ++
>  drivers/clk/tegra/clk-pll-out.c                |  25 ++
>  drivers/clk/tegra/clk-pll.c                    | 220 ++++++++++++--
>  drivers/clk/tegra/clk-tegra-fixed.c            |  15 +
>  drivers/clk/tegra/clk-tegra210.c               | 382 +++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk.c                        |  74 ++++-
>  drivers/clk/tegra/clk.h                        |  18 ++
>  drivers/gpio/gpio-tegra.c                      | 109 ++++++-
>  drivers/irqchip/irq-tegra.c                    |  10 +-
>  drivers/pinctrl/tegra/pinctrl-tegra.c          |  68 ++++-
>  drivers/pinctrl/tegra/pinctrl-tegra.h          |   3 +
>  drivers/pinctrl/tegra/pinctrl-tegra114.c       |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra124.c       |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra20.c        |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra210.c       |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra30.c        |   1 +
>  drivers/soc/tegra/pmc.c                        | 159 +++++++++-
>  21 files changed, 1167 insertions(+), 36 deletions(-)
>=20
> --=20
> 2.7.4
>=20

--B3NBd8mrXZtPJEYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlT8AACgkQ3SOs138+
s6E/gxAAu98wY6tGYvONnepzK4edJe84108hoTkQo81y8IT5p0twCMrJCLSK3kbl
Pw1K9ixrGK1cqV2mvTfaZAiF/Dt+ueZCIWrpqKSvyPRuGIYF6lVUEZ+PXak7J8t1
uVHA8+M6/TvDOytvb4cjWwVv8bWoMkgbUU2AdYObEfvMjSrl54ZhCjk1TyuuOfFY
Cg84ygIRe+EXFhrmahxWs3EgupHziiFDXMaZrctTgenmgGLWKV1F3wIWehDQ/HP/
wPtxI4Vez7uX+JhArAtkXEVUusFce3e8j0plsWeXLhx1LVNNlpEEuBown/qaU4oA
2neByqV3oTO30r2wtqjv3snwN2Eosu/66EZGkpDO0zKbQcf8LTqadnqja6zmzMQB
TLFArTqpmH3oi6hmAhMNE/rYx4W4uMKKYaPfaugGrXn5a92byJ9kJEC1U+bh7dpH
976Sm9ksAlVFfYH+YaChyrwIWOfhWiSZ8TgoqlJ7iSp6SpHGnNsGvR1ZOecg53YF
s+VUjwfT/s+s9ykWyNHA/Swf+GsGey1L1glvbEcCBqCL0dp5PkI5A4DFigvEVnUK
KaND7VQe7zfBC5v/+Nc5GjWBgt7SaOKs83kn/zzyWmsMjNRyY8CeplykBdCrHD+b
Sik2p0It26u3IfQPEKHfTk9Jrt/BRiL+c6TeWwJGVz5zl/TBd+o=
=3vyI
-----END PGP SIGNATURE-----

--B3NBd8mrXZtPJEYR--

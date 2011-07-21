From: Mike Rapoport <mike.rapoport@gmail.com>
Subject: Re: [PATCH v2] ARM: Tegra: Trimslice: Tri-state DAP3 pinmux
Date: Thu, 21 Jul 2011 10:10:37 +0300
Message-ID: <CABpLfohE+PmssbicDjS3p13i=T4X5dZ=P-KhXmytvPX2An62=w@mail.gmail.com>
References: <1310596967-19996-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1310596967-19996-1-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Erik Gilling <konkers@android.com>, linux-tegra@vger.kernel.org, Konstantin Sinyuk <kostyas@compulab.co.il>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,
Sorry for the delay, I was mostly offline these days.

On Thu, Jul 14, 2011 at 1:42 AM, Stephen Warren <swarren@nvidia.com> wrote:
> DAP3 is used for a bunch of GPIOs. Not tri-stating the pins means audio
> signals get sent out there, and this ends up resetting USB and breaking
> SDHCI too.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v2: s/DAP2/DAP3/ in patch subject/description.
>
> I've not verified that this patch is both necessary and sufficient on
> TrimSlice hardware.

Setting DAP3 pins to tristate is necessary but not sufficient :) I
don't know why, but if we don't tristate DAP2 and DAP4 as well USB and
SDIO are broken.
If you can amend your patch with tristating also DAP2 and DAP4 feel
free to add my

Acked-by: Mike Rapoport <mike@compulab.co.il>

> =A0arch/arm/mach-tegra/board-trimslice-pinmux.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-trimslice-pinmux.c b/arch/arm/mach=
-tegra/board-trimslice-pinmux.c
> index 82646a4..47c596c 100644
> --- a/arch/arm/mach-tegra/board-trimslice-pinmux.c
> +++ b/arch/arm/mach-tegra/board-trimslice-pinmux.c
> @@ -35,7 +35,7 @@ static __initdata struct tegra_pingroup_config trimslic=
e_pinmux[] =3D {
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_CSUS, =A0TEGRA_MUX_VI_SENSOR_CLK, TEGRA_PU=
PD_PULL_DOWN, =A0 TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DAP1, =A0TEGRA_MUX_DAP1, =A0 =A0 =A0 =A0 =
=A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DAP2, =A0TEGRA_MUX_DAP2, =A0 =A0 =A0 =A0 =
=A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_DAP3, =A0TEGRA_MUX_DAP3, =A0 =A0 =A0 =A0 =
=A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DAP3, =A0TEGRA_MUX_DAP3, =A0 =A0 =A0 =A0 =
=A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DAP4, =A0TEGRA_MUX_DAP4, =A0 =A0 =A0 =A0 =
=A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DDC, =A0 TEGRA_MUX_I2C2, =A0 =A0 =A0 =A0 =
=A0TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DTA, =A0 TEGRA_MUX_VI, =A0 =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> --
> 1.7.0.4
>
>



-- =

Sincerely Yours,
Mike.

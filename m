From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V2 4/5] ARM: dt: tegra30.dtsi: Add
	audio-related nodes
Date: Tue, 10 Apr 2012 21:27:08 -0700
Message-ID: <CAOesGMhDDenRK_GeR=jWJbcoacRMUPnjFu5w4DCyUWC=CadnbA@mail.gmail.com>
References: <1334099980-19527-1-git-send-email-swarren@wwwdotorg.org>
	<1334099980-19527-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1334099980-19527-4-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Colin Cross <ccross@android.com>, linux-tegra@vger.kernel.org, Liam Girdwood <lrg@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Nits/questions below.

On Tue, Apr 10, 2012 at 4:19 PM, Stephen Warren <swarren@wwwdotorg.org> wro=
te:
> From: Stephen Warren <swarren@nvidia.com>
>
> Add nodes for the Tegra30 AHUB and I2S controllers.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v2:
> * Move I2S nodes inside AHUB node, since it's the bus that contains them.
> * Correct APBIF reg size
> * Add nvidia,ahub-cif-ids to I2S nodes
> ---
> =A0arch/arm/boot/dts/tegra30.dtsi | =A0 41 ++++++++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 41 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.d=
tsi
> index 62a7b39..98c29d1 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -183,4 +183,45 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D < 0x70000868 0xd0 =A0 =A0 /* Pad c=
ontrol registers */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x70003000 0x3e0 >; /* Mux=
 registers */
> =A0 =A0 =A0 =A0};
> +
> + =A0 =A0 =A0 ahub@70080000 {

No need for unit address here since there's only one node with this
name -- "ahub {"  is sufficient.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra30-ahub";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x70080000 0x200 0x70080200 0x100>;

Why not just use 0x70080000 0x300?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 0 103 0x04 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,dma-request-selector =3D <&apbdma 1>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tegra_i2s0: i2s@70080300 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegr=
a30-i2s";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x70080300 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,ahub-cif-ids =3D <4 =
4>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tegra_i2s1: i2s@70080400 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegr=
a30-i2s";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x70080400 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,ahub-cif-ids =3D <5 =
5>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tegra_i2s2: i2s@70080500 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegr=
a30-i2s";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x70080500 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,ahub-cif-ids =3D <6 =
6>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tegra_i2s3: i2s@70080600 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegr=
a30-i2s";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x70080600 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,ahub-cif-ids =3D <7 =
7>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tegra_i2s4: i2s@70080700 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegr=
a30-i2s";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x70080700 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,ahub-cif-ids =3D <8 =
8>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> =A0};
> --
> 1.7.0.4
>

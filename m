From: Marvin <marvin24@gmx.de>
Subject: Re: [PATCH 2/3] ARM: tegra: harmony: initialize the TPS65862 PMIC
Date: Wed, 9 Mar 2011 12:14:26 +0100
Message-ID: <201103091214.26718.marvin24@gmx.de>
References: <cover.1299588456.git.mike@compulab.co.il>
	<201103082312.06911.marvin24@gmx.de>
	<4D771CE3.6020606@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4D771CE3.6020606@compulab.co.il>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Rapoport <mike@compulab.co.il>
Cc: linux-tegra@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Erik Gilling <konkers@android.com>, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

> On 03/09/11 00:12, Marc Dietrich wrote:
> > Am Dienstag 08 M=E4rz 2011, um 13:58:58 schrieb Mike Rapoport:
> >>
> >> diff --git a/arch/arm/mach-tegra/board-harmony-power.c b/arch/arm/mach=
-tegra/board-harmony-power.c
> >> new file mode 100644
> >> index 0000000..ca43d7a
> >> --- /dev/null
> >> +++ b/arch/arm/mach-tegra/board-harmony-power.c
> > ...
> >> +static struct i2c_board_info __initdata harmony_regulators[] =3D {
> >> +	{
> >> +		I2C_BOARD_INFO("tps6586x", 0x34),
> >> +		.irq		=3D INT_EXTERNAL_PMU,
> >> +		.platform_data	=3D &tps_platform,
> >> +	},
> >> +};
> >> +
> >> +int __init harmony_regulator_init(void)
> >> +{
> >> +	i2c_register_board_info(3, harmony_regulators, 1);
> > =

> > I don't know harmony well, but are you sure this is 3, not 4, as on all=
 other boards?
> =

> In the mainline version of i2c-tegra the adapter (and therefore bus) numb=
er
> equals the platform device id, and in case of DVC adapter it's 3.

Thanks for clarification. I guess this saved me from some headaches.

Marc

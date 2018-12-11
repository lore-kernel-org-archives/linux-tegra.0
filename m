From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 01/19] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
Date: Tue, 11 Dec 2018 11:16:41 +0200
Message-ID: <20181211091641.GB29064@pdeschrijver-desktop.Nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-2-josephl@nvidia.com>
 <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
 <46b5eafa-00a0-1d91-1f4d-97ab119fcf21@nvidia.com>
 <e61b1da8-78cd-c3d4-9878-c25fd9c89ba3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <e61b1da8-78cd-c3d4-9878-c25fd9c89ba3@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 10, 2018 at 08:59:10AM +0000, Jon Hunter wrote:
> =

> On 10/12/2018 08:49, Joseph Lo wrote:
> > Hi Jon,
> > =

> > Thanks for reviewing this series.
> > =

> > On 12/7/18 9:41 PM, Jon Hunter wrote:
> >>
> >> On 04/12/2018 09:25, Joseph Lo wrote:
> >>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> >>>
> >>> Add new properties to configure the DFLL PWM regulator support. Also
> >>> add an example and make the I2C clock only required when I2C support =
is
> >>> used.
> >>>
> >>> Cc: devicetree@vger.kernel.org
> >>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> >>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> >>> ---
> >>> =A0 .../bindings/clock/nvidia,tegra124-dfll.txt=A0=A0 | 73 ++++++++++=
++++++++-
> >>> =A0 1 file changed, 71 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> >>> b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> >>> index dff236f524a7..8c97600d2bad 100644
> >>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> >>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> >>> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running
> >>> voltage controlled
> >>> =A0 oscillator connected to the CPU voltage rail (VDD_CPU), and a
> >>> closed loop
> >>> =A0 control module that will automatically adjust the VDD_CPU voltage=
 by
> >>> =A0 communicating with an off-chip PMIC either via an I2C bus or via
> >>> PWM signals.
> >>> -Currently only the I2C mode is supported by these bindings.
> >>> =A0 =A0 Required properties:
> >>> =A0 - compatible : should be "nvidia,tegra124-dfll"
> >>> @@ -45,10 +44,28 @@ Required properties for the control loop paramete=
rs:
> >>> =A0 Optional properties for the control loop parameters:
> >>> =A0 - nvidia,cg-scale: Boolean value, see the field
> >>> DFLL_PARAMS_CG_SCALE in the TRM.
> >>> =A0 +Optional properties for mode selection:
> >>> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
> >>> +
> >>> =A0 Required properties for I2C mode:
> >>> =A0 - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
> >>> =A0 -Example:
> >>> +Required properties for PWM mode:
> >>> +- nvidia,pwm-period: period of PWM square wave in microseconds.
> >>> +- nvidia,init-uv: Regulator voltage in micro volts when PWM control
> >>> is disabled.
> >>
> >> Maybe consider 'pwm-inactive-voltage-microvolt'.
> > Ah, I think I need to refine the description here. It should be
> > something like below.
> > =A0- nvidia,pwm-init-microvolt : Regulator voltage in micro volts when =
PWM
> > control is initialized
> > =

> > This is the initial voltage that when we just initialize the DFLL
> > hardware for PWM output. And before we switch the CPU clock from PLLX to
> > DFLL, we will enable DFLL hardware in closed loop mode which will aplly
> > the DVFS table that was calculated from CVB table.
> > =

> > The original description maybe make you think that it's the working
> > voltage when it's under open-loop mode. But it's not. Sorry.
> > =

> > When we working on open-loop mode which will switch to low voltage range
> > which also follows the DVFS table. Not this one.
> =

> OK, but I am still not sure what this voltage is. I mean that I
> understand it is the initial voltage, but how exactly do we define this
> number? Where does it come from, how is this determined?
> =


It is set by a resistive divider on the board iirc.

> >>
> >>> +- nvidia,align-offset-uv: Regulator voltage in micro volts when PWM
> >>> control is
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enabled and PWM output is lo=
w.
> >>
> >> Would this be considered the minimum pwm active voltage?
> > This would be used for minimum voltage for LUT table, which is the table
> > that PMIC can output. The real minimum voltage in PWM mode still depends
> > on the CVB table.
> > =

> > So maybe change this one to 'nvidia,pwm-offset-uv'.
> =

> So is this the min supported by the PMIC? Maybe the name should reflect
> that because the above name does not reflect this. Furthermore, if this
> is a min then maybe the name should use 'min' as opposed to 'offset'.
> for example, 'nvidia,pwm-pmic-min-microvolts'.
> =

> Does this need to be described in DT, can it not be queried from the PMIC?
> =


There is no interface to query anything from the OVR regulator.

Peter.

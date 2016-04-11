From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add DT binding for Tegra186 GPIO controllers
Date: Mon, 11 Apr 2016 14:31:56 -0500
Message-ID: <20160411193156.GA10323@rob-hp-laptop>
References: <1460156668-27339-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460156668-27339-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 08, 2016 at 05:04:28PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tegra186 contains two separate but mostly similar GPIO controllers.
> Register layout differs significantly from previous Tegra generations, and
> so a new binding is required to describe them in device tree. This patch
> adds that binding.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/gpio/nvidia,tegra186-gpio.txt         | 157 +++++++++++++++++++++
>  include/dt-bindings/gpio/tegra186-gpio.h           |  56 ++++++++
>  2 files changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
>  create mode 100644 include/dt-bindings/gpio/tegra186-gpio.h
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> new file mode 100644
> index 000000000000..41d12cb79f8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> @@ -0,0 +1,157 @@
> +NVIDIA Tegra186 GPIO controllers
> +
> +Tegra186 contains two GPIO controllers; a main controller and an "AON"
> +controller. This binding document applies to both controllers. The register
> +layouts for the controllers share many similarities, but also some significant
> +differences. Hence, this document describes closely related but different
> +bindings and compatible values.
> +
> +The Tegra186 GPIO controller allows software to set the IO direction of, and
> +read/write the value of, numerous GPIO signals. Routing of GPIO signals to
> +package balls is under the control of a separate pin controller HW block. Two
> +major sets of registers exist:
> +
> +a) Security registers, which allow configuration of allowed access to the GPIO
> +register set. These registers exist in a single contguous block of physical
> +address space. The size of this block, and the security features available,
> +varies between the different GPIO controllers.
> +
> +Access to this set of registers is not necessary in all circumstances. Code
> +that wishes to configure access to the GPIO registers needs access to these
> +registers to do so. Code which simply wishes to read or write GPIO data does not
> +need access to these registers.
> +
> +b) GPIO registers, which allow manipulation of the GPIO signals. In some GPIO
> +controllers, these registers are exposed via multiple "physical aliases" in
> +address space, each of which access the same underlying state. See the hardware
> +documentation for rationale. Any particular GPIO client is expected to access
> +just one of these physical aliases.
> +
> +Tegra HW documentation describes a unified naming convention for all GPIOs
> +implemented by the SoC. Each GPIO is assigned to a port, and a port may control
> +a number of GPIOs. Thus, each GPIO is named according to an alphabetical port
> +name and an integer GPIO name within the port. For example, GPIO_PA0, GPIO_PN6,
> +or GPIO_PCC3.
> +
> +The number of ports implemented by each GPIO controller varies. The number of
> +implemented GPIOs within each port varies. GPIO registers within a controller
> +are grouped and laid out according to the port they affect.
> +
> +The mapping from port name to the GPIO controller that implements that port, and
> +the mapping from port name to register offset within a controller, are both
> +extremely non-linear. The header file <dt-bindings/gpio/tegra186-gpio.h>
> +describes the port-level mapping. In that file, the naming convention for ports
> +matches the HW documentation. The values chosen for the names are alphabetically
> +sorted within a particular controller. Drivers need to map between the DT GPIO
> +IDs and HW register offsets using a lookup table.
> +
> +Each GPIO controller can generate a number of interrupt signals. Each signal
> +represents the aggregate status for all GPIOs within a set of ports. Thus, the
> +number of interrupt signals generated by a controller varies as a rough function
> +of the number of ports it implements. Note that the HW documentation refers to
> +both the overall controller HW module and the sets-of-ports as "controllers".
> +
> +Each GPIO controller in fact generates multiple interrupts signals for each set
> +of ports. Each GPIO may be configured to feed into a specific one of the
> +interrupt signals generated by a set-of-ports. The intent is for each generated
> +signal to be routed to a different CPU, thus allowing different CPUs to each
> +handle subsets of the interrupts within a port. The status of each of these
> +per-port-set signals is reported via a separate register. Thus, a driver needs
> +to know which status register to observe. This binding currently defines no
> +configuration mechanism for this. By default, drivers should use register
> +GPIO_${port}_INTERRUPT_STATUS_G1_0. Future revisions to the binding could
> +define a property to configure this.
> +
> +Required properties:
> +- compatible
> +  Array of strings.
> +  One of:
> +  - "nvidia,tegra186-gpio".
> +  - "nvidia,tegra186-gpio-aon".

Perhaps another level of indentation so the properties stick out.

Otherwise,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +- reg-names
> +  Array of strings.
> +  Contains a list of names for the register spaces described by the reg
> +  property. May contain the following entries, in any order:
> +  - "gpio": Mandatory. GPIO control registers. This may cover either:
> +    a) The single physical alias that this OS should use.
> +    b) All physical aliases that exist in the controller. This is appropriate
> +       when the OS is responsible for managing assignment of the physical
> +       aliass.
> +  - "security": Optional. Security configuration registers.

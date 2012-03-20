From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH V2 2/6] dt: pinctrl: Document device tree binding
Date: Tue, 20 Mar 2012 12:50:11 -0700
Message-ID: <CAPnjgZ3FFEZr9y=4CnH_-1YGRKAoDKa03PUEGM27ioVTy_KTKg@mail.gmail.com>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org>
	<1332265479-1260-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1332265479-1260-2-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, linus.walleij@stericsson.com, B29396@freescale.com, s.hauer@pengutronix.de, dongas86@gmail.com, shawn.guo@linaro.org, thomas.abraham@linaro.org, tony@atomide.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 20, 2012 at 10:44 AM, Stephen Warren <swarren@wwwdotorg.org=
> wrote:
> The core pin controller bindings define:
> * The fact that pin controllers expose pin configurations as nodes in
> =A0device tree.
> * That the bindings for those pin configuration nodes is defined by t=
he
> =A0individual pin controller drivers.
> * A standardized set of properties for client devices to define numbe=
red
> =A0or named pin configuration states, each referring to some number o=
f the
> =A0afore-mentioned pin configuration nodes.
> * That the bindings for the client devices determines the set of numb=
ered
> =A0or named states that must exist.
>
> Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
> Acked-by: Shawn Guo <shawn.guo@linaro.org>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Simon Glass <sjg@chromium.org>

> ---
> v2: Fix a couple of grammar-os per Randy Dunlap. Add example of a cli=
ent
> device that references no pin configuration nodes per Dong Aisheng.
> ---
> =A0.../bindings/pinctrl/pinctrl-bindings.txt =A0 =A0 =A0 =A0 =A0| =A0=
128 ++++++++++++++++++++
> =A01 files changed, 128 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/pinctrl/pinct=
rl-bindings.txt
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindin=
gs.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> new file mode 100644
> index 0000000..c95ea82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -0,0 +1,128 @@
> +=3D=3D Introduction =3D=3D
> +
> +Hardware modules that control pin multiplexing or configuration para=
meters
> +such as pull-up/down, tri-state, drive-strength etc are designated a=
s pin
> +controllers. Each pin controller must be represented as a node in de=
vice tree,
> +just like any other hardware module.
> +
> +Hardware modules whose signals are affected by pin configuration are
> +designated client devices. Again, each client device must be represe=
nted as a
> +node in device tree, just like any other hardware module.
> +
> +For a client device to operate correctly, certain pin controllers mu=
st
> +set up certain specific pin configurations. Some client devices need=
 a
> +single static pin configuration, e.g. set up during initialization. =
Others
> +need to reconfigure pins at run-time, for example to tri-state pins =
when the
> +device is inactive. Hence, each client device can define a set of na=
med
> +states. The number and names of those states is defined by the clien=
t device's
> +own binding.
> +
> +The common pinctrl bindings defined in this file provide an infrastr=
ucture
> +for client device device tree nodes to map those state names to the =
pin
> +configuration used by those states.
> +
> +Note that pin controllers themselves may also be client devices of t=
hemselves.
> +For example, a pin controller may set up its own "active" state when=
 the
> +driver loads. This would allow representing a board's static pin con=
figuration
> +in a single place, rather than splitting it across multiple client d=
evice
> +nodes. The decision to do this or not somewhat rests with the author=
 of
> +individual board device tree files, and any requirements imposed by =
the
> +bindings for the individual client devices in use by that board, i.e=
=2E whether
> +they require certain specific named states for dynamic pin configura=
tion.
> +
> +=3D=3D Pinctrl client devices =3D=3D
> +
> +For each client device individually, every pin state is assigned an =
integer
> +ID. These numbers start at 0, and are contiguous. For each state ID,=
 a unique
> +property exists to define the pin configuration. Each state may also=
 be
> +assigned a name. When names are used, another property exists to map=
 from
> +those names to the integer IDs.
> +
> +Each client device's own binding determines the set of states the mu=
st be
> +defined in its device tree node, and whether to define the set of st=
ate
> +IDs that must be provided, or whether to define the set of state nam=
es that
> +must be provided.
> +
> +Required properties:
> +pinctrl-0: =A0 =A0 List of phandles, each pointing at a pin configur=
ation
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 node. These referenced pin configuratio=
n nodes must be child
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nodes of the pin controller that they c=
onfigure. Multiple
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 entries may exist in this list so that =
multiple pin
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 controllers may be configured, or so th=
at a state may be built
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 from multiple nodes for a single pin co=
ntroller, each
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 contributing part of the overall config=
uration. See the next
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 section of this document for details of=
 the format of these
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pin configuration nodes.
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 In some cases, it may be useful to defi=
ne a state, but for it
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 to be empty. This may be required when =
a common IP block is
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 used in an SoC either without a pin con=
troller, or where the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pin controller does not affect the HW m=
odule in question. If
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 the binding for that IP block requires =
certain pin states to
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exist, they must still be defined, but =
may be left empty.
> +
> +Optional properties:
> +pinctrl-1: =A0 =A0 List of phandles, each pointing at a pin configur=
ation
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 node within a pin controller.
> +...
> +pinctrl-n: =A0 =A0 List of phandles, each pointing at a pin configur=
ation
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 node within a pin controller.
> +pinctrl-names: The list of names to assign states. List entry 0 defi=
nes the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 name for integer state ID 0, list entry=
 1 for state ID 1, and
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 so on.
> +
> +For example:
> +
> + =A0 =A0 =A0 /* For a client device requiring named states */
> + =A0 =A0 =A0 device {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-names =3D "active", "idle";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-0 =3D <&state_0_node_a>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-1 =3D <&state_1_node_a &state_1=
_node_b>;
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 /* For the same device if using state IDs */
> + =A0 =A0 =A0 device {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-0 =3D <&state_0_node_a>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-1 =3D <&state_1_node_a &state_1=
_node_b>;
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* For an IP block whose binding supports pin configu=
ration,
> + =A0 =A0 =A0 =A0* but in use on an SoC that doesn't have any pin con=
trol hardware
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 device {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-names =3D "active", "idle";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-0 =3D <>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl-1 =3D <>;
> + =A0 =A0 =A0 };
> +
> +=3D=3D Pin controller devices =3D=3D
> +
> +Pin controller devices should contain the pin configuration nodes th=
at client
> +devices reference.
> +
> +For example:
> +
> + =A0 =A0 =A0 pincontroller {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ... /* Standard DT properties for the d=
evice itself elided */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 state_0_node_a {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ...
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 state_1_node_a {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ...
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 state_1_node_b {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ...
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 }
> +
> +The contents of each of those pin configuration child nodes is defin=
ed
> +entirely by the binding for the individual pin controller device. Th=
ere
> +exists no common standard for this content.
> +
> +The pin configuration nodes need not be direct children of the pin c=
ontroller
> +device; they may be grandchildren, for example. Whether this is lega=
l, and
> +whether there is any interaction between the child and intermediate =
parent
> +nodes, is again defined entirely by the binding for the individual p=
in
> +controller device.
> --
> 1.7.0.4
>

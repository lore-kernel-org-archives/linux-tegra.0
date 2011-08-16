From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v2 06/13] docs/dt: Document nvidia,tegra20-pinmux binding
Date: Tue, 16 Aug 2011 15:51:31 +0200
Message-ID: <201108161551.31389.arnd@arndb.de>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com> <1313440100-17131-7-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1313440100-17131-7-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 15 August 2011, Stephen Warren wrote:
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/pinmux/pinmux_nvidia.txt   |  294 ++++++++++++++++++++
>  1 files changed, 294 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt b/Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt
> new file mode 100644
> index 0000000..744e1b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt
> @@ -0,0 +1,294 @@
> +NVIDIA Tegra 2 pinmux controller
> +
> +Required properties:
> +- compatible : "nvidia,tegra20-pinmux"

Hmm, I think it would be much better in general if we could define
pinmux bindings in a way that is less specific to just one soc.
The contents of this file seem to be specific to even just one
version of the tegra chip, and might be completely different for
tegra30 and later, right?

Maybe Linus W can comment on this and say whether he thinks it can
be generalized enough to apply to other pinmux drivers.

> +Optional sub-nodes:
> +- nvidia,mux-groups : Mux group settings; see below.
> +- nvidia,drive-groups : Drive group settings; see below.
> +
> +nvidia,mux-groups sub-node:

These concepts seem general enough to me that they can apply to
other chips, and I would consequently drop the nvidia, prefix.

> +Each mux pin group is represented as a sub-node of the nvidia,mux-groups node.
> +The name of the sub-node should be the name of the mux pingroup. The following
> +names are valid:
> +
> +	ata
> +	atb
> +	atc
> +	atd
> +	ate
> +	cdev1
> +	cdev2
> ...

I noticed that each board you define has a complete list of these. Would
it be possible to move a generic list into a tegra20-pinmux.dtsi file and
just override the pins in the per-board .dts file that require some special
setup?


> +
> +optional subnode-properties:
> +- nvidia,pull-up : Boolean, apply Tegra's internal pull-up to the pin.
> +- nvidia,pull-down : Boolean, apply Tegra's internal pull-down to the pin.
> +- nvidia,tristate : Boolean, tristate the pin. Otherwise, drive it.
> +
> +If both nvidia,pull-up and nvidia,pull-down are specified, nvidia,pull-up
> +takes precedence.

These again seem generic enough to go into a general pinmux binding, without
the nvidia, prefix.

	Arnd

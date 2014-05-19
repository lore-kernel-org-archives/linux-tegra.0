From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/5] ARM: tegra: of: add GK20A device tree binding
Date: Mon, 19 May 2014 15:14:56 -0600
Message-ID: <537A7450.5030904@wwwdotorg.org>
References: <1400491450-19223-1-git-send-email-acourbot@nvidia.com>
 <1400491450-19223-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400491450-19223-3-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, gnurou@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 05/19/2014 03:24 AM, Alexandre Courbot wrote:
> Add the device tree binding documentation for the GK20A GPU used in
> Tegra K1 SoCs.

A few minor nits, but otherwise,
Acked-by: Stephen Warren <swarren@nvidia.com>

> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt

> +Required properties:
> +- compatible: "nvidia,<chip>-<gpu>"
> +  Currently recognized values:
> +  - nvidia,tegra124-gk20a
> +- reg: Physical base address and length of the controller's registers.
> +  Must contain two entries:
> +  - first entry for bar0
> +  - second entry for bar1
> +- interrupts: The interrupt outputs from the controller.

To be consistent with the clocks and resets properties, it'd be nice to
reword that as:

interrupts: Must contain an entry for each entry in interrupt-names.

> +- interrupt-names: Must include the following entries:

... and add the following here:

See ../interrupt-controller/interrupts.txt

> +/ {

No need to wrap a root node around this in the example.

> +	gpu@0,57000000 {
...
> +	};
> +

Extra blank line here.

> +};

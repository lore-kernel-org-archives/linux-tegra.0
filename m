From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/4] of: Add NVIDIA Tegra Legacy Interrupt Controller
 binding
Date: Tue, 1 Jul 2014 14:10:41 +0100
Message-ID: <20140701131041.GC6064@leverpostej>
References: <1403917351-13215-1-git-send-email-thierry.reding@gmail.com>
 <20140630174334.GF28740@leverpostej>
 <53B1AE95.3000602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53B1AE95.3000602-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 30, 2014 at 07:38:13PM +0100, Stephen Warren wrote:
> On 06/30/2014 11:43 AM, Mark Rutland wrote:
> > On Sat, Jun 28, 2014 at 02:02:28AM +0100, Thierry Reding wrote:
> >> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> The Legacy Interrupt Controller found on NVIDIA Tegra SoCs is used by
> >> the AVP coprocessor and can also serve as a backup for the ARM Cortex
> >> CPU's local interrupt controller (GIC).
> >>
> >> The LIC is subdivided into multiple identical units, each handling 32
> >> possible interrupt sources.
> >>
> >> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >> Changes in v2:
> >> - new patch
> >>
> >>  .../interrupt-controller/nvidia,tegra20-ictlr.txt     | 19 +++++++++++++++++++
> >>  1 file changed, 19 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
> >> new file mode 100644
> >> index 000000000000..c695ec713740
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
> >> @@ -0,0 +1,19 @@
> >> +NVIDIA Tegra Legacy Interrupt Controller
> >> +
> >> +The legacy interrupt controller is divided into units that serve 32 interrupts
> >> +each. Tegra20 implements four units, whereas Tegra30 and later implement five.
> >> +
> >> +Required properties:
> >> +- compatible: "nvidia,tegra<chip>-ictlr"
> > 
> > And valid <chip> values are?
> 
> Do you really want us to edit every single binding every time a new chip
> comes out? Surely just relying NVIDIA's published chip names is fine?
> 

While I am not a fan of wildcards in documentation, if you feel this is
clear as is then feel free to leave it as-is. The example is probably
sufficient.

Mark.

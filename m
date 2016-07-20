From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 01/10] Documentation: dt-bindings: mailbox: tegra: Add
 binding for HSP mailbox
Date: Tue, 19 Jul 2016 20:17:45 -0500
Message-ID: <20160720011745.GA7578@rob-hp-laptop>
References: <20160719091723.30919-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160719091723.30919-1-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 19, 2016 at 05:17:22PM +0800, Joseph Lo wrote:
> Add DT binding for the Hardware Synchronization Primitives (HSP). The
> HSP is designed for the processors to share resources and communicate
> together. It provides a set of hardware synchronization primitives for
> interprocessor communication. So the interprocessor communication (IPC)
> protocols can use hardware synchronization primitive, when operating
> between two processors not in an SMP relationship.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Sorry. Please allow me just update the binding patches of this series.
> Want to make sure the binding is acceptable first.
> Thanks.
> 
> Changes in V3:
> - use two cells for mboxes property
> Changes in V2:
> - revise the compatible string, interrupt-names, interrupts, and #mbox-cells
>   properties
> - remove "nvidia,hsp-function" property
> - fix the header file name
> - the binding supports the concept of multiple HSP sub-modules on one HSP HW
>   block now.
> ---
>  .../bindings/mailbox/nvidia,tegra186-hsp.txt       | 52 ++++++++++++++++++++++
>  include/dt-bindings/mailbox/tegra186-hsp.h         | 20 +++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
>  create mode 100644 include/dt-bindings/mailbox/tegra186-hsp.h

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

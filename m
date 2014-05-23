From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: tegra: of: add GK20A device tree
	binding
Date: Fri, 23 May 2014 16:13:47 +0900
Message-ID: <CAAVeFuK_DbvukzvnNrDLOLPAYThEoy-TMgU65COa1xUHyChFUQ@mail.gmail.com>
References: <1400491450-19223-1-git-send-email-acourbot@nvidia.com>
 <1400491450-19223-3-git-send-email-acourbot@nvidia.com>
 <537A7450.5030904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <537A7450.5030904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 20, 2014 at 6:14 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/19/2014 03:24 AM, Alexandre Courbot wrote:
>> Add the device tree binding documentation for the GK20A GPU used in
>> Tegra K1 SoCs.
>
> A few minor nits, but otherwise,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
>> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
>
>> +Required properties:
>> +- compatible: "nvidia,<chip>-<gpu>"
>> +  Currently recognized values:
>> +  - nvidia,tegra124-gk20a
>> +- reg: Physical base address and length of the controller's registers.
>> +  Must contain two entries:
>> +  - first entry for bar0
>> +  - second entry for bar1
>> +- interrupts: The interrupt outputs from the controller.
>
> To be consistent with the clocks and resets properties, it'd be nice to
> reword that as:
>
> interrupts: Must contain an entry for each entry in interrupt-names.
>
>> +- interrupt-names: Must include the following entries:
>
> ... and add the following here:
>
> See ../interrupt-controller/interrupts.txt
>
>> +/ {
>
> No need to wrap a root node around this in the example.
>
>> +     gpu@0,57000000 {
> ...
>> +     };
>> +
>
> Extra blank line here.
>
>> +};
>

All fixed and acked-by added to the commit log.

Thanks,
Alex.

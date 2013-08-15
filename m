From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 1/5] ARM: add basic Trusted Foundations support
Date: Thu, 15 Aug 2013 16:02:52 -0600
Message-ID: <520D500C.5070901@wwwdotorg.org>
References: <1376360992-1508-1-git-send-email-acourbot@nvidia.com> <1376360992-1508-2-git-send-email-acourbot@nvidia.com> <20130815115227.GC2562@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130815115227.GC2562-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/15/2013 05:52 AM, Dave Martin wrote:
> On Tue, Aug 13, 2013 at 11:29:48AM +0900, Alexandre Courbot wrote:
>> Trusted Foundations is a TrustZone-based secure monitor for ARM that
>> can be invoked  using a consistent smc-based API on all supported
>> platforms. This patch adds initial basic support for Trusted
>> Foundations using the ARM firmware API. Current features are limited
>> to the ability to boot secondary processors.

>> diff --git a/Documentation/devicetree/bindings/arm/firmware/tl,trusted-foundations.txt b/Documentation/devicetree/bindings/arm/firmware/tl,trusted-foundations.txt

>> +Required properties:
>> +- compatible : "tl,trusted-foundations"
>> +- version : Must contain the version number string of the Trusted Foundation
>> +	firmware.
> 
> Are you sure there is no low-level way to probe vendor and version info?
> If there is, then the DT should describe nothing except the fact that
> the probe interface exists.
> 
> I also worry that two integrations on different SoCs might have the
> same version number, yet still be different due to vendor-specific
> features and options.

I would expect HW-specific compatible values also to be present in a DT.
For example, perhaps:

compatible = "tl,trusted-foundations-nvidia-shield",
"tl,trusted-foundations";

(nvidia vendor, shield board/implementation)

This would allow matching on the specific value
"tl,trusted-foundations-nvidia-shield" in the future if some quirking
was needed, but if this wasn't needed, drivers could just bind to the
generic "tl,trusted-foundations".

>> +- version : Must contain the version number string of the Trusted Foundation
>> +	firmware.
> 
> Are you sure there is no low-level way to probe vendor and version info?
> If there is, then the DT should describe nothing except the fact that
> the probe interface exists.
> 
> I also worry that two integrations on different SoCs might have the
> same version number, yet still be different due to vendor-specific
> features and options.

Talking of the version - if we do need to represent this in the DT, how
about 2 separate cells for major/minor version rather than encoding it
into a string? Then, no parsing would be required.

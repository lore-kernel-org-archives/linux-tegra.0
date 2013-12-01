From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 02/31] ARM: tegra: document reset properties in DT bindings
Date: Sun, 01 Dec 2013 12:06:49 -0700
Message-ID: <529B88C9.60804@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-3-git-send-email-swarren@wwwdotorg.org> <20131129122348.GO22771@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131129122348.GO22771-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/29/2013 05:23 AM, Thierry Reding wrote:
> On Fri, Nov 15, 2013 at 01:53:57PM -0700, Stephen Warren wrote: 
> [...]
>> diff --git
>> a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
>> b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
>
>> 
[...]
>> +  - resets : Must contain an entry for each entry in
>> reset-names. +    See ../reset/reset.txt for details. +  -
>> reset-names : Must include the following entries: +    - dc
> 
> For consistency with this, the clock-names entry for the first
> clock in this node should then be "dc" as well.

The dc driver gets the clock by name, so this isn't a requirement.

>> diff --git
>> a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
>> b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
>
>> 
[...]
>> -  - spdif_in +  - spdif
> 
> Why is this renamed?

There are two separate clocks for the SPDIF input and output modules,
but just a single reset.

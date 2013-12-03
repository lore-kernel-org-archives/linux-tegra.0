From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 03/31] ARM: tegra: document use of standard DMA DT bindings
Date: Tue, 03 Dec 2013 11:52:23 -0700
Message-ID: <529E2867.6090209@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-4-git-send-email-swarren@wwwdotorg.org> <20131129122907.GP22771@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131129122907.GP22771-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/29/2013 05:29 AM, Thierry Reding wrote:
> On Fri, Nov 15, 2013 at 01:53:58PM -0700, Stephen Warren wrote:

>> diff --git
>> a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
>> b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt

>>
>> 
- ranges : The bus address mapping for the configlink register bus.
>> +- dmas : Must contain an entry for each entry in clock-names. +
>> See ../dma/dma.txt for details. +- dma-names : Must include the
>> following entries: +  - rx0 .. rx<n> +  - tx0 .. tx<n> +  ...
>> where n is: +  Tegra30: 3 +  Tegra114, Tegra124: 9 Can be empty
>> since the mapping is 1:1.
> 
> I think this line belongs to the description of the "ranges"
> property.

Yes, I've fixed that up locally simply by moving the inserted lines 1
line lower. I assume you don't want a repost for that?

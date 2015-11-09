From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4] Tegra: DT: add device tree binding doc for QSPI
Date: Mon, 9 Nov 2015 08:17:38 -0700
Message-ID: <5640B912.3070207@wwwdotorg.org>
References: <1445898140-3561-1-git-send-email-twarren@nvidia.com>
 <562EB11D.5040706@wwwdotorg.org> <20151109124545.GD23941@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151109124545.GD23941-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2015 05:45 AM, Thierry Reding wrote:
> On Mon, Oct 26, 2015 at 05:02:53PM -0600, Stephen Warren wrote:
>> On 10/26/2015 04:22 PM, Tom Warren wrote:
>>> This patch adds the device tree binding doc for the Tegra
>>> QSPI controller on Tegra210.
>>
>> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> (I assume if others approve the binding, Thierry will take it through the
>> Tegra tree)
>
> Do we have a kernel driver and hardware where this can be tested? I'm
> slightly reluctant to merge a binding through the Tegra tree without a
> driver that implements it.

AFAIK, the only HW this can be tested on is a one-off modified version 
of p2571. The standard boards don't have this. I don't believe there's 
an (upstream at least) kernel driver for this. I'm sure downstream has a 
driver.

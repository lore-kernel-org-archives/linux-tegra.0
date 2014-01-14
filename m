From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/tegra: Obtain head number from DT
Date: Tue, 14 Jan 2014 09:54:10 -0700
Message-ID: <52D56BB2.9020901@wwwdotorg.org>
References: <1389622894-9574-1-git-send-email-treding@nvidia.com> <1389622894-9574-3-git-send-email-treding@nvidia.com> <52D42685.1040603@wwwdotorg.org> <20140114141416.GE10936@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140114141416.GE10936-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/14/2014 07:14 AM, Thierry Reding wrote:
> On Mon, Jan 13, 2014 at 10:46:45AM -0700, Stephen Warren wrote:
>> On 01/13/2014 07:21 AM, Thierry Reding wrote:
>>> The head number of a given display controller is fixed in hardware and
>>> required to program outputs appropriately. Relying on the driver probe
>>> order to determine this number will not work, since that could yield a
>>> situation where the second head was probed first and would be assigned
>>> head number 0 instead of 1.
>>
>> This change makes the new properties mandatory, yet they aren't part of
>> the DT files yet. So, won't this patch break all display on Tegra?
> 
> I don't think it'll make anything worse than it currently is, since both
> display controllers can't run at the same time with the current code.

Sure it will; it will prevent any dc device from probing at all:

> +static int tegra_dc_parse_dt(struct tegra_dc *dc)
...
> +	err = of_property_read_u32(dc->dev->of_node, "nvidia,head", &value);
> +	if (err < 0)
 +		return err;
                ^^^^^^^^^^^
...
> @@ -1207,6 +1219,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
...
> +	err = tegra_dc_parse_dt(dc);
> +	if (err < 0)
> +		return err;
                ^^^^^^^^^^^

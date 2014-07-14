From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/8] of: Add Tegra124 EMC bindings
Date: Mon, 14 Jul 2014 13:54:36 +0300
Message-ID: <53C3B6EC.9090904@nvidia.com>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com> <1405088313-20048-6-git-send-email-mperttunen@nvidia.com> <20140711145146.GA6523@ulmo> <53C00A57.5070102@kapsi.fi> <53C38D07.4030402@nvidia.com> <20140714081524.GI2081@ulmo> <53C39D98.9040802@nvidia.com> <20140714093136.GB9755@ulmo> <53C3A986.9050602@nvidia.com> <20140714102954.GD9870@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140714102954.GD9870@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14/07/14 13:29, Thierry Reding wrote:
> * PGP Signed by an unknown key
 > ...
>> Yes, this sounds sensible. I'll make such a patch. I suppose having another
>> timings table in the MC node with just the rate and mc-burst-data would
>> separate the concerns best. It occurs to me that we could also write the
>> regs in the pre-rate change notifier, but this would turn the dependency
>> around and would mean that the regs are not written when entering backup
>> rates. The latter shouldn't be a problem but the reversed dependency would,
>> so I guess a custom function is the way to go, and we need to add at least
>> one anyway.
>
> It sounds like maybe moving enough code and data into the MC driver to
> handle frequency changes would be a good move. From the above it sounds
> like all the MC driver needs to know is that a frequency change is about
> to happen and what the new frequency is.
>
> In addition to exposing things like number of DRAM banks, etc.
>

Yes, so there are two ways to do this:
1) EMC calls tegra_mc_emem_update(freq) at the correct time
2) MC has an optional clock phandle to the EMC clock and registers a 
pre-change notifier.

Both work, but the dependency is reversed. In both cases, the other 
driver is also optional. In the first case, the EMC driver can give a 
warning if the call fails. (As mentioned, if the MC_EMEM updates don't 
happen, things still work but potentially with a hefty perf loss.)
TBH, I haven't yet decided which one is better. If you have an opinion,
I'll go with it.

>> The downstream kernel also overwrites most LA registers during EMC rate
>> change without regard for the driver-set values, and we might have to read
>> those values from the device tree too. Upstream can do this in rate change
>> notifiers if needed. I'll look into this a bit more.
>
> As I understand it, the latency allowance should be specified in terms
> of the maximum amount of time that requests are delayed, so that the
> proper values for the LA registers can be recomputed on an EMC rate
> change.

That's how I understand it too, but in downstream, the LA register 
values are hardcoded into EMC tables in platform data/DTS that are just 
written into the LA registers as-is during rate change.

>
> Thierry
>
> * Unknown Key
> * 0x7F3EB3A1
>

From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 2/4] regulator: tps62360: add dt support
Date: Fri, 11 May 2012 21:05:01 +0530
Message-ID: <4FAD31A5.7090006@nvidia.com>
References: <1336718325-8372-1-git-send-email-ldewangan@nvidia.com> <1336718325-8372-3-git-send-email-ldewangan@nvidia.com> <20120511145833.GG3960@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120511145833.GG3960-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 11 May 2012 08:28 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, May 11, 2012 at 12:08:43PM +0530, Laxman Dewangan wrote:
>
> This looks good overall but I do have a few things with the binding.
>
>> +Optional properties:
>> +- ti,enable-force-pwm: Enable force PWM mode. This is boolean value.
> Hrm, this is fairly generic - it's REGULATOR_MODE_ACTIVE.  But I'm a bit
> unsure about how generic exposing it is in bindings since it's often
> dynamic in the running system, we've really not got any mainline
> examples of something setting a mode.  With modern regulators the mode
> detection stuff in the hardware is generally good enough that there's no
> benefit from doing this, it's suprising to actually see systems that
> benefit.
>

Yaah, I think this flag can map directly to REGULATOR_MODE_FAST. If I 
understand PWM mode properly then this is used when high current load is 
require or fast switching on  load current is require. By enabling force 
PWM enable, hw will not switch to PFM mode based on load current.

I think if we map the regulator mode to FAST as the force PWM enable and 
NORMAL as force PWM =0 then it will be generic.
Client can pass the initial mode when they fill constraint at the time 
of registration and it can also give the opportunity to change mode by 
calling regulator_set_mode().
If this is fine then I can create patch for removing this flag from 
platform data and add set_mode/get_mode function.

>> +- ti,enable-vout-discharge: Enable output discharge. This is boolean value.
> This I think we should definitely add a framework feature for this and
> make into a generic property, it's a very standard feature and more
> normally set unconditionally.
>

I think this is not require to enable always otherwise there may be 
power dissipation from this path always, just when we off the rail 
(disable rail or when go to shutdown so that the voltage output can go 
down faster).
Should we add "unsigned en_discharge:1" in regulator init data but did 
not get how core driver can use this flag specially when shutdown?

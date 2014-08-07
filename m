From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/4] host1x: mipi: Include clock lanes in mipi calibrate
Date: Thu, 7 Aug 2014 13:14:33 -0400
Message-ID: <CAOw6vbJPtzCesuMVjv06Abe-2PpdhmdJ75EHYU1N+TCfUVssNQ@mail.gmail.com>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
 <1407391907-19488-4-git-send-email-seanpaul@chromium.org> <20140807083429.GA13315@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140807083429.GA13315-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 7, 2014 at 4:34 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Aug 07, 2014 at 02:11:46AM -0400, Sean Paul wrote:
>> When calibrating the mipi phy, also include the clock lanes
>> in the calibration.
>>
>> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  drivers/gpu/host1x/mipi.c | 70 +++++++++++++++++++++++++++++++++++++----------
>>  1 file changed, 56 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>> index 0af2892..80578dc 100644
>> --- a/drivers/gpu/host1x/mipi.c
>> +++ b/drivers/gpu/host1x/mipi.c
>> @@ -49,10 +49,18 @@
>>  #define MIPI_CAL_CONFIG_DSIC         0x10
>>  #define MIPI_CAL_CONFIG_DSID         0x11
>>
>> +#define MIPI_CAL_CONFIG_DSIAB_CLK    0x19
>> +#define MIPI_CAL_CONFIG_DSICD_CLK    0x1a
>> +#define MIPI_CAL_CONFIG_CSIAB_CLK    0x1b
>> +#define MIPI_CAL_CONFIG_CSICD_CLK    0x1c
>> +#define MIPI_CAL_CONFIG_CSIE_CLK     0x1d
>> +
>
> These registers don't seem to exist on Tegra114 and earlier. It also
> seems like MIPI_CAL_CONFIG_DSIC and MIPI_CAL_CONFIG_DSID no longer exist
> on Tegra124 and later. And CSIC and CSID seem to be shared with DSIB
> (channel A and B) now.
>
> So I think we'll need something more elaborate than this. It should be
> differentiating between SoC revisions to allow checking for valid pad
> selection when calibrating.
>

Yeah, definitely now that you point that out, we'll need something
better. I've altered the patch so the regs available depends on
compatible value. I'll wait on the following before re-posting.

> I'll see if I can find out what's up with the change between Tegra114
> and Tegra124 regarding the DSIC and DSID pads. It looks to me like they
> were merged to match the DSIA and DSIB controllers, whereas before DSIA
> and DSIB were used for controller DSIA and DSIC and DSID were used for
> controller DSIB.
>

Thanks for checking in on this. It would be useful to know which clock
lanes need to be configured for which pads. The documentation isn't
particularly good on this, so it's possible that my mapping between
data lane/clock lane in the modules array is incorrect.

Sean

> Thierry

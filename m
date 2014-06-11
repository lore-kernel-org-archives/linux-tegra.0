From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 5/7] mfd: cros_ec: Sync to the latest
 cros_ec_commands.h from EC sources
Date: Wed, 11 Jun 2014 08:11:44 -0700
Message-ID: <CAD=FV=XL9tnEqza8Zx8mt_Z7-bj8TCzdeyHMhnpewKp_1CR-ig@mail.gmail.com>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
	<1398879850-9111-6-git-send-email-dianders@chromium.org>
	<20140520084602.GF24991@lee--X1>
	<1402483068.3798.82.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402483068.3798.82.camel@x220>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Paul,

On Wed, Jun 11, 2014 at 3:37 AM, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> wrote:
> On Tue, 2014-05-20 at 09:46 +0100, Lee Jones wrote:
>> On Wed, 30 Apr 2014, Doug Anderson wrote:
>> > From: Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> >
>> > This just updates include/linux/mfd/cros_ec_commands.h to match the
>> > latest EC version (which is the One True Source for such things).  See
>> > <https://chromium.googlesource.com/chromiumos/platform/ec>

I believe most of your questions are answered by checking out the git
tree referenced above.  ...but see below for details.  This header is
a common interface between the kernel and the EC.


>> > [dianders: took today's ToT version from the Chromium OS EC; deleted
>> > references to cros_ec_dev and cros_ec_lpc since those aren't upstream
>> > yet]
>> >
>> > Signed-off-by: Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > Tested-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> > ---
>> > Changes in v3: None
>> > Changes in v2: None
>> >
>> >  drivers/mfd/cros_ec.c                |    2 +-
>> >  include/linux/mfd/cros_ec.h          |    4 +-
>> >  include/linux/mfd/cros_ec_commands.h | 1128 +++++++++++++++++++++++++++++++---
>> >  3 files changed, 1059 insertions(+), 75 deletions(-)
>>
>> Applied, thanks.
>
> This patch is included in linux-next since next-20140521. I'm not sure
> why I waited three weeks before sending this question...
>
>> > [...]
>> > diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
>> > index 86fd069..7853a64 100644
>> > --- a/include/linux/mfd/cros_ec_commands.h
>> > +++ b/include/linux/mfd/cros_ec_commands.h
>>> [...]
>> > @@ -1206,14 +1865,231 @@ struct ec_params_force_idle {
>> > [...]
>> > +/*
>> > + * Known param numbers are defined here. Ranges are reserved for board-specific
>> > + * params, which are handled by the particular implementations.
>> > + */
>> > +enum charge_state_params {
>> > +   CS_PARAM_CHG_VOLTAGE,         /* charger voltage limit */
>> > +   CS_PARAM_CHG_CURRENT,         /* charger current limit */
>> > +   CS_PARAM_CHG_INPUT_CURRENT,   /* charger input current limit */
>> > +   CS_PARAM_CHG_STATUS,          /* charger-specific status */
>> > +   CS_PARAM_CHG_OPTION,          /* charger-specific options */
>> > +   /* How many so far? */
>> > +   CS_NUM_BASE_PARAMS,
>> > +
>> > +   /* Range for CONFIG_CHARGER_PROFILE_OVERRIDE params */
>
> CONFIG_CHARGER_PROFILE_OVERRIDE doesn't match anything in linux-next. Is
> a Kconfig symbol CHARGER_PROFILE_OVERRIDE perhaps queued somewhere?

This is a config option on the ChromeOS EC
<https://chromium.googlesource.com/chromiumos/platform/ec>.  Doing a
grep there:

board/samus/board.h:#define CONFIG_CHARGER_PROFILE_OVERRIDE
common/charge_state_v2.c:#ifdef CONFIG_CHARGER_PROFILE_OVERRIDE
common/charge_state_v2.c:#ifdef CONFIG_CHARGER_PROFILE_OVERRIDE
common/charge_state_v2.c:#ifdef CONFIG_CHARGER_PROFILE_OVERRIDE
driver/battery/samus.c:#ifdef CONFIG_CHARGER_PROFILE_OVERRIDE
driver/battery/samus.c:#endif   /* CONFIG_CHARGER_PROFILE_OVERRIDE */
include/config.h:#undef CONFIG_CHARGER_PROFILE_OVERRIDE
include/ec_commands.h:  /* Range for CONFIG_CHARGER_PROFILE_OVERRIDE params */
test/test_config.h:#define CONFIG_CHARGER_PROFILE_OVERRIDE


>> > +   CS_PARAM_CUSTOM_PROFILE_MIN = 0x10000,
>> > +   CS_PARAM_CUSTOM_PROFILE_MAX = 0x1ffff,
>> > +
>
> I guess so, because these two constants aren't used anywhere.

A grep from the EC sources:

common/charge_state_v2.c:               if (in->get_param.param >=
CS_PARAM_CUSTOM_PROFILE_MIN &&
common/charge_state_v2.c:               if (in->set_param.param >=
CS_PARAM_CUSTOM_PROFILE_MIN &&
driver/battery/samus.c:#define PARAM_FASTCHARGE
(CS_PARAM_CUSTOM_PROFILE_MIN + 0)
include/ec_commands.h:  CS_PARAM_CUSTOM_PROFILE_MIN = 0x10000,
test/sbs_charging_v2.c: if (param == CS_PARAM_CUSTOM_PROFILE_MIN) {
test/sbs_charging_v2.c: if (param == CS_PARAM_CUSTOM_PROFILE_MIN) {
test/sbs_charging_v2.c: params.get_param.param = CS_PARAM_CUSTOM_PROFILE_MIN;
test/sbs_charging_v2.c: params.set_param.param = CS_PARAM_CUSTOM_PROFILE_MIN;
util/ectool.c:          printf("  0x%x - 0x%x\n", CS_PARAM_CUSTOM_PROFILE_MIN,

-Doug

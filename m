From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 5/7] mfd: cros_ec: Sync to the latest
 cros_ec_commands.h from EC sources
Date: Fri, 13 Jun 2014 08:22:09 -0700
Message-ID: <CAD=FV=XcK5R1sdNwoJkFPapwWQ9vqxvmQi_L3BqTSt8EKRTNHw@mail.gmail.com>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
	<1398879850-9111-6-git-send-email-dianders@chromium.org>
	<20140520084602.GF24991@lee--X1>
	<1402483068.3798.82.camel@x220>
	<CAD=FV=XL9tnEqza8Zx8mt_Z7-bj8TCzdeyHMhnpewKp_1CR-ig@mail.gmail.com>
	<1402646902.28881.15.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402646902.28881.15.camel@x220>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Paul,

On Fri, Jun 13, 2014 at 1:08 AM, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> wrote:
> Doug,
>
> On Wed, 2014-06-11 at 08:11 -0700, Doug Anderson wrote:
>> On Wed, Jun 11, 2014 at 3:37 AM, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> wrote:
>> > On Tue, 2014-05-20 at 09:46 +0100, Lee Jones wrote:
>> >> On Wed, 30 Apr 2014, Doug Anderson wrote:
>> >> > From: Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> >> >
>> >> > This just updates include/linux/mfd/cros_ec_commands.h to match the
>> >> > latest EC version (which is the One True Source for such things).  See
>> >> > <https://chromium.googlesource.com/chromiumos/platform/ec>
>>
>> I believe most of your questions are answered by checking out the git
>> tree referenced above.  ...but see below for details.  This header is
>> a common interface between the kernel and the EC.
>
> I didn't realize that this was a link to a tree.
>
>> > CONFIG_CHARGER_PROFILE_OVERRIDE doesn't match anything in linux-next. Is
>> > a Kconfig symbol CHARGER_PROFILE_OVERRIDE perhaps queued somewhere?
>>
>> This is a config option on the ChromeOS EC
>> <https://chromium.googlesource.com/chromiumos/platform/ec>.  Doing a
>> grep there:
>>
>> board/samus/board.h:#define CONFIG_CHARGER_PROFILE_OVERRIDE
>> common/charge_state_v2.c:#ifdef CONFIG_CHARGER_PROFILE_OVERRIDE
>> common/charge_state_v2.c:#ifdef CONFIG_CHARGER_PROFILE_OVERRIDE
>> common/charge_state_v2.c:#ifdef CONFIG_CHARGER_PROFILE_OVERRIDE
>> driver/battery/samus.c:#ifdef CONFIG_CHARGER_PROFILE_OVERRIDE
>> driver/battery/samus.c:#endif   /* CONFIG_CHARGER_PROFILE_OVERRIDE */
>> include/config.h:#undef CONFIG_CHARGER_PROFILE_OVERRIDE
>> include/ec_commands.h:  /* Range for CONFIG_CHARGER_PROFILE_OVERRIDE params */
>> test/test_config.h:#define CONFIG_CHARGER_PROFILE_OVERRIDE
>
> I see. So this is not a Kconfig macro but a general macro with a CONFIG_
> prefix. There are quite a bit of those in the tree already, but still,
> would another prefix also do?

Given that it's an entirely separate project and this is a valid
CONFIG option in that project, it seems a lot to ask them not to use
the CONFIG_ prefix.  Also: the part you are objecting to is only a
comment, right?

We could certainly add extra wording in the comment to make it obvious
that this is a CONFIG option for the EC and not the kernel.  Would
that be enough?  ...or are you trying to use some scripts to
automatically process files to look for CONFIG options?

-Doug

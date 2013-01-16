From: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: constify edid handling functions
Date: Wed, 16 Jan 2013 19:04:22 +0200
Message-ID: <87fw21qctl.fsf@intel.com>
References: <1358347002-10999-1-git-send-email-dev@lynxeye.de> <20130116152355.GA965@avionic-0098.adnet.avionic-design.de> <1358352210.3157.8.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358352210.3157.8.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 16 Jan 2013, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:
> Am Mittwoch, den 16.01.2013, 16:23 +0100 schrieb Thierry Reding:
>> On Wed, Jan 16, 2013 at 03:36:41PM +0100, Lucas Stach wrote:
>> [...]
>> > @@ -705,7 +705,7 @@ static int standard_timing_level(struct edid *edid)
>> >   * monitors fill with ascii space (0x20) instead.
>> >   */
>> >  static int
>> > -bad_std_timing(u8 a, u8 b)
>> > +bad_std_timing(const u8 a, const u8 b)
>> >  {
>> >  	return (a == 0x00 && b == 0x00) ||
>> >  	       (a == 0x01 && b == 0x01) ||
>> 
>> Was this intended to go in here?

[...]

> Yes, probably I should have been a bit more elaborate in the commit
> message. Both hunks are intentional, as I looked at how those functions
> in the environment of the edid handling funcs are used and added const
> where appropriate, not just strictly to the struct edid pointer.

Please, let's not start constifying non-pointer parameters and local
variables.

BR,
Jani.

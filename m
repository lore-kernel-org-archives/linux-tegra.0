From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-cbootimage-configs] Add Toradex Colibri T20 configurations
Date: Mon, 01 Jul 2013 09:25:57 -0600
Message-ID: <51D19F85.3080702@wwwdotorg.org>
References: <1372451264-13049-1-git-send-email-dev@lynxeye.de>  <51CE0D43.2020508@wwwdotorg.org> <1372493796.1610.8.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372493796.1610.8.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/29/2013 02:16 AM, Lucas Stach wrote:
> Hi Stephen,
> 
> Am Freitag, den 28.06.2013, 16:25 -0600 schrieb Stephen Warren:
>> On 06/28/2013 02:27 PM, Lucas Stach wrote:
>>> The Colibri T20 COM comes in two different versions, which can both
>>> boot from NAND or SD-Card.
>>>
>>> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>>> ---
>>> Submission is done with the consent of Toradex.
>>
>> Lucas, is it possible to have someone from Toradex reply with a
>> Signed-off-by line, in order to indicate their authorization to license
>> the *.bct.cfg files (which are copyright Toradex in this patch) under
>> the specified license? Thanks.
> 
> Ok, I'm forwarding this to Toradex, but depending on the workload of the
> relevant people it may take some time until there is a reply.
> 
> On the other hand the submitted .bct.cfg files are not extracted from
> some binary BCTs, but I explicitly received them from Toradex with the
> appropriate licence header on top. So according to the Linux developer
> certificate of origin [1] my singed-off-by should be enough to clear up
> the legal things.

It's great to hear the Toradex released this information. From my
perspective, I'd simply like something in the commit log to record the
fact that Toradex contributed the files that are marked as (c) Toradex,
and that something would be the s-o-b line. Best practice would be if
they had provided it along with the files they sent to you.

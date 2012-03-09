From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: export tegra_gpio_{en,dis}able
Date: Fri, 09 Mar 2012 10:09:57 -0700
Message-ID: <4F5A3965.5040300@wwwdotorg.org>
References: <1330630010-11241-2-git-send-email-alan@signal11.us> <1330727544-11617-1-git-send-email-alan@signal11.us> <4F5A3726.8030505@signal11.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F5A3726.8030505-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/09/2012 10:00 AM, Alan Ott wrote:
> On 03/02/2012 05:32 PM, Alan Ott wrote:
>> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>
>> These two functions are used in drivers that can be
>> modules, so they need to be exported.
>>
>> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
...
> Did this patch ever get picked up into someone's tree?

It looks like Grant ack'd it which implies the thought Olof was going to
take it through the Tegra tree perhaps? But Olof did the same, so is
probably waiting for Grant to take it...

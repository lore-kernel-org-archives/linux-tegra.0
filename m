From: Timur <timur.mehrvarz-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: ehci-tegra issue with deep sleep
Date: Thu, 03 Jan 2013 12:52:17 +0100
Message-ID: <50E570F1.4030706@riseup.net>
References: <50C7B250.7020409@riseup.net> <50C8C47A.1080809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C8C47A.1080809-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12.12.2012 18:52, Stephen Warren wrote:
> On 12/11/2012 03:23 PM, Timur wrote:
>> Hi. I discovered a problem with USB host mode on a Nexus 7 running
>> Android 4.2.x:
>
> Timur,
>
> This mailing list is intended for discussion of the mainline Linux
> kernel, rather than NVIDIA's modified (and older) downstream kernel, as
> used on shipping Android devices.
>
> Your best bet for support is to report the issue to
> linux-tegra-bugs-DDmLM1+adcqXj1p+fO2waQ@public.gmane.org It may help if you've tried the Ubuntu/L4T
> install described at:
>
> https://wiki.ubuntu.com/Nexus7
>
> ... and reproduced the issue there too; at least some people working on
> the downstream kernel do have access to Nexus 7s with that software setup.

Hi Stephen,

maybe you remember this brief conversation in December. I found the root 
cause of the reported issue (tegra specific) and I can provide a patch. 
The outcome is stable, externally powered USB host mode for Nexus 7.

Do you happen to know anyone responsible for the Ubuntu Nexus7 kernel? I 
would like to contribute the fix, as I think it would be beneficial to 
that implementation.

Thank you.
Timur

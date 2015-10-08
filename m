From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH] Add man pages
Date: Thu, 8 Oct 2015 12:28:24 -0600
Message-ID: <5616B5C8.3090806@wwwdotorg.org>
References: <1444257480-24964-1-git-send-email-amartin@nvidia.com>
 <5616B0D2.5080709@wwwdotorg.org> <20151008181918.GA32353@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151008181918.GA32353-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2015 12:19 PM, Allen Martin wrote:
> On Thu, Oct 08, 2015 at 12:07:14PM -0600, Stephen Warren wrote:
>> On 10/07/2015 04:38 PM, Allen Martin wrote:
>>> Add man pages for cbootimge(1) and bct_dump(1)
>>> +.SH AUTHOR
>>> +Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> I don't recall; is the man page author tag supposed to reflect the
>> author of the tool or the author of the man page?
>>
>
> Good question, from "man 7 man-pages":
>
> AUTHORS       lists authors of the documentation or program.
>         Use of an AUTHORS section is strongly discouraged...
>
> Sounds like I should just remove it

OK, that sounds fine to me. Since you said "I", are you sending a V2?

From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-uboot-scripts] Use full U-Boot command names in all
 cases
Date: Thu, 6 Oct 2016 11:27:04 -0600
Message-ID: <82a8c848-5bc8-de94-60a9-77ae1e5afcba@wwwdotorg.org>
References: <20161006171844.23031-1-swarren@wwwdotorg.org>
 <d5295600-935b-a1cb-6c44-1b80be06d8ce@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d5295600-935b-a1cb-6c44-1b80be06d8ce-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/06/2016 11:23 AM, Aaron Plattner wrote:
> On 10/06/2016 10:18 AM, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The generated U-Boot script currently invokes "set" as a U-Boot command.
>> This is intended to be an abbreviation for "setenv". This works fine when
>> there are no other commands named "set*", but fails when there are. Use
>> the full command name to avoid issues.
>>
>> Reported-by: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Note that I haven't tested this; if you could that'd be great.
>
> This is identical to what I applied locally, so
> Reviewed-by: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks. Applied.

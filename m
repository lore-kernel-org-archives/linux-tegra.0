From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH] Implement --soc command-line option
Date: Wed, 28 Aug 2013 08:54:43 -0600
Message-ID: <521E0F33.3060003@wwwdotorg.org>
References: <1377628344-24984-1-git-send-email-swarren@wwwdotorg.org> <20130828063519.GA5141@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130828063519.GA5141@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/28/2013 12:35 AM, Thierry Reding wrote:
> On Tue, Aug 27, 2013 at 12:32:24PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Implement command-line option "-s tegra20" and "--soc tegra20". These
>> mirror the existing -t/--tegra option, but require the full chip name
>> (tegra20) rather than an abbreviated name (-t20). This is more consistent
>> with just about everything else upstream.
...
> Other than that:
> 
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied and pushed.

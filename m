From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 1/1] Add Tegra124 support
Date: Tue, 27 Aug 2013 10:03:48 -0600
Message-ID: <521CCDE4.1060708@wwwdotorg.org>
References: <1377229591-21235-1-git-send-email-pchiu@nvidia.com> <5217B267.3030205@wwwdotorg.org> <20130826074700.GA31726@ulmo> <521B89F0.2000704@wwwdotorg.org> <20130827071448.GB8686@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130827071448.GB8686@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/27/2013 01:14 AM, Thierry Reding wrote:
> On Mon, Aug 26, 2013 at 11:01:36AM -0600, Stephen Warren wrote:
>> On 08/26/2013 01:47 AM, Thierry Reding wrote:
>>> On Fri, Aug 23, 2013 at 01:05:11PM -0600, Stephen Warren
>>> wrote:
>>>> On 08/22/2013 09:46 PM, Penny Chiu wrote:
>>>>> Add the Tegra124 chip support to cbootimage. User can use
>>>>> "-t124" as option to parse .cfg and generate BCT/image for
>>>>> Tegra124.
...
>>> Perhaps in the long run it would be better to turn this into
>>> something like:
>>> 
>>> printf("    -t, --target SOC      Select target device. Must be
>>> one of:\n"); printf("                          20, 30, 114, 124
>>> (default: 20)\n");
>> 
>> I don't like the idea of "--target 20", since "20" isn't an SoC
>> name; it's "tegra20" or just perhaps "t20".
> 
> I'd really like to get some kind of consistency. We've been using
> the tegra20/tegra30/tegra114 variants pretty consistently within
> the kernel and U-Boot, but other tools use the abbreviated form
> (t20/t30/t114). Actually I think this is the only one that uses the
> abbreviation, so...
> 
>> I'd be fine with a patch that allowed "-SOC" or "--target SOC",
>> with SOC being "t20", "t30", ...
> 
> ... perhaps introducing a --target
> {tegra20,tegra30,tegra114,tegra124} option that deprecates
> -t20/-t30/-t114/-t124 would be a good option. I for one sometimes
> get confused and can't remember the correct form to use for
> cbootimage. It's mostly scripted these days, so that issue is not
> that important, but using one variant only will also help to make 
> the various scripts consistent and easier to maintain.

Yes, true. To bikeshed a bit, perhaps "--soc tegra20" would be
slightly less typing. I was going to suggest the simpler "--tegra20",
but then we run the risk of strange names appearing in the future and
not being able to control pollution of the option naming space.

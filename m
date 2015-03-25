From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 0/3] Add support for Tegra210
Date: Wed, 25 Mar 2015 08:23:54 -0600
Message-ID: <5512C4FA.6030201@wwwdotorg.org>
References: <1426897221-20307-1-git-send-email-jimmzhang@nvidia.com> <20150325083259.GA3794@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150325083259.GA3794-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/25/2015 02:33 AM, Thierry Reding wrote:
> On Fri, Mar 20, 2015 at 05:20:18PM -0700, Jimmy Zhang wrote:
>> Four t210 specific supporting files are added under src/t210 diretory.
>> Comparing T210 bct to T132 bct, the main changes include the size increased
>> to 10240 from 8704. The number of boot devices that can be specified in bct
>> is reduced from 4 to 1. And many new fileds are added to nvboot_sdram_params.
>
> Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks. I've applied the series and pushed, along with the v1.5 tag.

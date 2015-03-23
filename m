From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 0/3] Add support for Tegra210
Date: Mon, 23 Mar 2015 14:26:10 -0600
Message-ID: <551076E2.9000408@wwwdotorg.org>
References: <1426897221-20307-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426897221-20307-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2015 06:20 PM, Jimmy Zhang wrote:
> Four t210 specific supporting files are added under src/t210 diretory.
> Comparing T210 bct to T132 bct, the main changes include the size increased
> to 10240 from 8704. The number of boot devices that can be specified in bct
> is reduced from 4 to 1. And many new fileds are added to nvboot_sdram_params.
>
> v1: Initial changes
> v2: Fix some minor issues found in v1
>      Removed files src/t210/nvboot_config.h and src/t210/sdram_param.h
>              that were added unintentionally in v1.
> v3: Remove "deprecated" from help -t option help text.

I think this version looks fine. Barring any objections, I'll apply it 
Tue my time sometime.
